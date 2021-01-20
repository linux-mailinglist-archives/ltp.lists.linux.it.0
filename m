Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD82FD230
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:13:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 099063C640A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:13:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2423B3C5DBD
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:13:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 00FCE1400E67
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:13:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20313AAAE;
 Wed, 20 Jan 2021 14:13:22 +0000 (UTC)
Date: Wed, 20 Jan 2021 15:14:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YAg6wTVc6AB28smR@yuki.lan>
References: <20210119160316.4776-1-pvorel@suse.cz>
 <20210119160316.4776-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119160316.4776-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] lib: Fix kernel module detection on BusyBox
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
> @@ -81,20 +85,91 @@ int tst_kernel_bits(void)
>  	return kernel_bits;
>  }
>  
> -int tst_check_driver(const char *name)
> +int tst_search_driver(const char *driver, const char *file)
>  {
> -#ifndef __ANDROID__
> -	const char * const argv[] = { "modprobe", "-n", name, NULL };
> -	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
> -			       TST_CMD_PASS_RETVAL);
> -
> -	/* 255 - it looks like modprobe not available */
> -	return (res == 255) ? 0 : res;
> -#else
> -	/* Android modprobe may not have '-n', or properly installed
> -	 * module.*.bin files to determine built-in drivers. Assume
> -	 * all drivers are available.
> +	struct stat st;
> +	char *path = NULL, *search = NULL;
> +	char buf[PATH_MAX], module[PATH_MAX];
> +	FILE *f;
> +
> +	struct utsname uts;
> +
> +	if (uname(&uts)) {
> +		tst_brkm(TBROK | TERRNO, NULL, "uname() failed");
> +		return -1;
> +	}
> +	SAFE_ASPRINTF(NULL, &path, "/lib/modules/%s/%s", uts.release, file);
> +
> +	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
> +		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
> +		return -1;
> +	}
> +
> +	if (access(path, R_OK)) {
> +		tst_resm(TWARN, "file %s cannot be read", path);
> +		return -1;
> +	}
> +
> +	SAFE_ASPRINTF(NULL, &search, "/%s.ko", driver);
> +
> +	f = SAFE_FOPEN(NULL, path, "r");
> +
> +	while (fgets(buf, sizeof(buf), f)) {
> +		if (sscanf(buf, "%s", module) != 1)
> +			continue;

What is the point in the sscanf() here?

Why can't we just strstr(buf, search) here?

> +		if (strstr(module, search) != NULL) {
> +			SAFE_FCLOSE(NULL, f);
> +			return 0;
> +		}
> +	}
> +
> +	SAFE_FCLOSE(NULL, f);
> +
> +	return -1;
> +}
> +
> +int tst_check_driver_(const char *driver)
> +{
> +	if (!tst_search_driver(driver, "modules.dep") ||
> +		!tst_search_driver(driver, "modules.builtin"))
> +		return 0;
> +
> +	return 1;
> +}
> +
> +int tst_check_driver(const char *driver)
> +{
> +#ifdef __ANDROID__
> +	/*
> +	 * Android may not have properly installed modules.* files. We could
> +	 * search modules in /system/lib/modules, but to to determine built-in
> +	 * drivers we need modules.builtin. Therefore assume all drivers are
> +	 * available.
>  	 */
>  	return 0;
>  #endif
> +
> +	if (!tst_check_driver_(driver))
> +		return 0;
> +
> +	if (strrchr(driver, '-') || strrchr(driver, '_')) {
> +		char *driver2 = strdup(driver);
> +		char *ix = driver2;
> +		char find = '-', replace = '_';
> +
> +		if (strrchr(driver, '_')) {
> +			find = '_';
> +			replace = '-';
> +		}
> +
> +		while ((ix = strchr(ix, find)) != NULL) {
> +			*ix++ = replace;
> +		}

Just:
		while ((ix = strchr(ix, find))
			*ix++ = replace;

> +		if (!tst_check_driver_(driver2))

free(driver2) ?

> +			return 0;
> +	}
> +
> +	return 1;
>  }
> -- 
> 2.30.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
