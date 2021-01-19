Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF552FB65B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:30:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9D6B3C30D5
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:30:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 80AFE3C307F
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:30:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C55F9600350
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:30:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F900ABDA;
 Tue, 19 Jan 2021 13:30:19 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:31:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YAbfKSZhZ35peObS@yuki.lan>
References: <20210118161308.30771-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118161308.30771-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  #include <sys/personality.h>
>  #include <sys/utsname.h>
> +#include <limits.h>
> +
>  #include "test.h"
>  #include "tst_kernel.h"
> +#include "old_safe_stdio.h"
>  
>  static int get_kernel_bits_from_uname(struct utsname *buf)
>  {
> @@ -81,20 +85,79 @@ int tst_kernel_bits(void)
>  	return kernel_bits;
>  }
>  
> -int tst_check_driver(const char *name)
> +#ifndef __ANDROID__
> +# define MODULES_DIR "/lib/modules"
> +#else
> +# define MODULES_DIR "/system/lib/modules"
> +#endif
> +
> +
> +int tst_search_driver(const char *driver, const char *file)
>  {
> +	struct stat st;
> +	char *path = NULL;
> +	char buf[PATH_MAX], module[PATH_MAX], search[PATH_MAX] = "/";
> +	FILE *f;
> +
>  #ifndef __ANDROID__
> -	const char * const argv[] = { "modprobe", "-n", name, NULL };
> -	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
> -			       TST_CMD_PASS_RETVAL);
> +	struct utsname uts;
>  
> -	/* 255 - it looks like modprobe not available */
> -	return (res == 255) ? 0 : res;
> +	if (uname(&uts)) {
> +		tst_brkm(TBROK | TERRNO, NULL, "uname() failed");
> +		return -1;
> +	}
> +	SAFE_ASPRINTF(NULL, &path, "%s/%s/%s", MODULES_DIR, uts.release, file);
>  #else
> -	/* Android modprobe may not have '-n', or properly installed
> -	 * module.*.bin files to determine built-in drivers. Assume
> -	 * all drivers are available.
> +	SAFE_ASPRINTF(NULL, &path, "%s/%s", MODULES_DIR, file);
> +#endif
> +
> +	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
> +#ifndef __ANDROID__
> +		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
> +#endif
> +		return -1;
> +	}
> +
> +	if (access(path, R_OK)) {
> +#ifndef __ANDROID__
> +		tst_resm(TWARN, "file %s cannot be read", path);
> +#endif
> +		return -1;
> +	}
> +
> +	strcat(search, driver);
> +	strcat(search, ".ko");

Why not just snprintf() or SAFE_ASPRINTF() here as well?

> +	f = SAFE_FOPEN(NULL, path, "r");
> +
> +	while (fgets(buf, sizeof(buf), f)) {
> +		if (sscanf(buf, "%s", module) != 1)
> +			continue;
> +
> +		if (strstr(module, search) != NULL) {

And I'm not sure that this is safe either, what about the case that one
module name is a substring of another.

E.g. if we look for "foo.ko" and the file contains "this_is_not_foo.ko"
it will still match here.


Also this seems to be rather distruptive change, so I guess it would be
safer to apply after the release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
