Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BD32608B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 10:53:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA9AE3C5854
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 10:53:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 686A83C4DF2
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 10:53:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9AAEE2010F7
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 10:53:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 036FFAF37;
 Fri, 26 Feb 2021 09:53:26 +0000 (UTC)
Date: Fri, 26 Feb 2021 10:54:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YDjFbG0In5oQjLKN@yuki.lan>
References: <20210226090615.231970-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226090615.231970-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
> index 00ede549d..696b6731e 100644
> --- a/lib/tst_supported_fs_types.c
> +++ b/lib/tst_supported_fs_types.c
> @@ -22,6 +22,7 @@ static const char *const fs_type_whitelist[] = {
>  	"vfat",
>  	"exfat",
>  	"ntfs",
> +	"tmpfs",
>  	NULL
>  };
> 
> @@ -34,6 +35,10 @@ static int has_mkfs(const char *fs_type)
> 
>  	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);
> 
> +	if (strstr(buf, "mkfs.tmpfs")) {
> +		return 1;
> +	}
> +
>  	ret = tst_system(buf);
> 
>  	if (WEXITSTATUS(ret) == 127) {
> @@ -55,8 +60,8 @@ static int has_kernel_support(const char *fs_type, int flags)
>  	if (!tmpdir)
>  		tmpdir = "/tmp";
> 
> -	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> -	if (errno != ENODEV) {
> +	ret = mount("/dev/zero", tmpdir, fs_type, 0, NULL);

The manual page explicitly says that errno is set to ENODEV if
filesystem is not supported by kernel. So the check for errno should
stay, since the statement above will fail to mount any real filesystem
since we pass "/dev/zero" instead of valid filesystem image there.

I.e. if we pass a real filesystem there it will either fail with EINVAL
(since /dev/zero does not have a valid superblock) or ENODEV if there is
no kernel driver for the filesystem.

> +	if (!ret) {

I guess that tmpfs succeeds to mount there. So I guess that we should
change the condition to:

	if ((ret && errno != ENODEV) || !ret) {
		if (!ret)
			tst_umount(tmpdir);

		tst_res(TINFO, "Kernel supports %s", fs_type);
		return 1;
	}


But there is another problem there, since the code still mounts tmpfs on
tmpdir for a short while, which is temporary directory used by all LTP
tests, which may potentially break tests that runs in parallel.

So we will have to prepare a temporary directory with mkdtemp() under
the tmpdir as well and pass that to the mount() syscall instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
