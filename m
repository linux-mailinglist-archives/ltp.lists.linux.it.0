Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9D3078D3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:58:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 019B43C7938
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:58:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D1C333C7901
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:58:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5CDD81400451
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:58:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B337DAE3C
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 14:58:46 +0000 (UTC)
Date: Thu, 28 Jan 2021 15:59:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YBLRadSFcxAWN57a@yuki.lan>
References: <20210128144649.6012-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128144649.6012-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Fix fs support detection for non-root
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
> grep /proc/filesystems to find kernel support.
> But consider only 0 (filesystem found) or 1 (not found),
> ignore other results (e.g. 2: /proc/filesystems not available or
> no permissions) and fallback to old solution (calling mount()).

Why is this needed?

Also this breaks FUSE detection.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/tst_supported_fs_types.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
> index 00ede549d..66307e09e 100644
> --- a/lib/tst_supported_fs_types.c
> +++ b/lib/tst_supported_fs_types.c
> @@ -52,10 +52,29 @@ static int has_kernel_support(const char *fs_type, int flags)
>  	char buf[128];
>  	int ret;
>  
> +	const char * const argv[] = { "grep", "-q", "-F", "-w", fs_type, "/proc/filesystems", NULL };
> +	ret = tst_cmd_(NULL, argv, "/dev/null", "/dev/null", TST_CMD_PASS_RETVAL);

Can't we just open the file and use fgets() in a loop?

Why do we have to execute a grep binary for something like this?

> +	if (ret == 0) {
> +		tst_res(TINFO, "Kernel supports %s", fs_type);
> +		return 1;
> +	}
> +
> +	if (ret == 1) {
> +		tst_res(TINFO, "Filesystem %s is not supported", fs_type);
> +		return 0;
> +	}
> +
>  	if (!tmpdir)
>  		tmpdir = "/tmp";
>  
>  	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
> +
> +	if (errno == EPERM) {
> +		tst_res(TWARN, "No permission to detect support for %s", fs_type);
> +		return 1;

Maybe we can try to read /proc/filesystems here as a fallback?

Again why do we need this at all?

> +	}
> +
>  	if (errno != ENODEV) {
>  		tst_res(TINFO, "Kernel supports %s", fs_type);
>  		return 1;
> -- 
> 2.30.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
