Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFD7331301
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:10:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7B453C6557
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:10:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4BCF73C4CEA
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:10:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66D931A00A56
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:10:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B23B7AB8C;
 Mon,  8 Mar 2021 16:10:11 +0000 (UTC)
Date: Mon, 8 Mar 2021 17:11:51 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YEZMx0TF2FlipBiG@yuki.lan>
References: <20210304020838.259422-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304020838.259422-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
> @@ -34,6 +35,10 @@ static int has_mkfs(const char *fs_type)
> 
>  	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);
> 
> +	if (strstr(buf, "mkfs.tmpfs")) {
> +		return 1;
> +	}

The curly braces around single line statement are useless here.

Also it would be cleaner if we checked before the sprintf and against
the fs_type instead with if (!strcmp(fs_type, "tmpfs")).

We may also print a TINFO message something along the lines:

	tst_res(TINFO, "mkfs is not needed for tmpfs");

>  	ret = tst_system(buf);
> 
>  	if (WEXITSTATUS(ret) == 127) {
> @@ -50,17 +55,30 @@ static int has_kernel_support(const char *fs_type, int flags)
>  	static int fuse_supported = -1;
>  	const char *tmpdir = getenv("TMPDIR");
>  	char buf[128];
> +	char template[PATH_MAX];
>  	int ret;
> 
>  	if (!tmpdir)
>  		tmpdir = "/tmp";
> 
> -	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> -	if (errno != ENODEV) {
> +	sprintf(template, "%s/mountXXXXXX", tmpdir);

We should at least use snprintf() with sizeof(template) in order not to
overrun the buffer. Or we can use asprintf() instead and free the buffer
later on.

> +	if (mkdtemp(template) == NULL) {
> +		tst_res(TWARN | TERRNO , "%s: mkdtemp(%s) failed", __func__, template);
> +	}

I guess that we can tst_brk(TBROK, ""); here if mkdtemp() failed,
continuing here we would pass non-existing directory thte mount()
syscall below.

Also please do not include the __func__ in the message here.

> +	ret = mount("/dev/zero", template, fs_type, 0, NULL);
> +	if ((ret && errno != ENODEV) || !ret) {
> +		if (!ret)
> +			tst_umount(template);
>  		tst_res(TINFO, "Kernel supports %s", fs_type);
> +		if (rmdir(template) == -1)
> +			tst_res(TWARN | TERRNO, "rmdir %s failed", template);

We do have SAFE_RMDIR() please use that.

>  		return 1;
>  	}
> 
> +	if (rmdir(template) == -1)
> +		tst_res(TWARN | TERRNO, "rmdir %s failed", template);

Here as well.

>  	/* Is FUSE supported by kernel? */
>  	if (fuse_supported == -1) {
>  		ret = open("/dev/fuse", O_RDWR);
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
