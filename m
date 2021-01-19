Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667A2FC071
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 20:56:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366C23C30CC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 20:56:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D3DFD3C2314
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 20:56:56 +0100 (CET)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4054560009C
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 20:56:56 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id kx7so611278pjb.2
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 11:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qQEd7NAefyrRDJR+KPQWZBUeP0jEDOEW00R39pJ88iE=;
 b=kRzJ8ZTRUNmj2zbfnwrwsvYGKdDoSwjhZPTuaHh/bnbuemR5kybGksJ/rXg6uQFjhw
 QyMIUE32PQrE4n/+87iDZffTnUTp/J1Zinehq72DXUKdLuD6WmAgj6ygSYTXqlo4pZrL
 DD1Ua+uvqL13gbTySm5icwdO8Dwfdx+qbsxOprvWHZrBC1fEONgi2fVyC/fLbwhq6ZqE
 Ezub3/HZNdGVW8dvNbvwWouIm0s//+yuCasQ3JcpZ1h/n+ul3fIlSHxtsMwHtcKa40H8
 Njy/YGy6yo2G1nRhnnbBG81wHf615pC86OZEVJosDzFsjbT1ELAGq+AINNlMMh9X1GMZ
 j0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQEd7NAefyrRDJR+KPQWZBUeP0jEDOEW00R39pJ88iE=;
 b=WMwm08kyOhcOm2/Yiv1jz8GFMH8mfPcOpF59JvKOwuS1HuhA4eFsgv1AVbv+D624jg
 sgikWDkX2b+TYDQ2tmZRX1tzOCz/A8SpvoFEv+WyFjrSCcW4BFGF2cMOb0diuVZPMNfi
 jZ/UtLvFvUdNHoVpDsgKNERCyKqNsIirCdneLgvabHAq8JZl40KCvHGZafUhSlbRV926
 EL5CP2uQPPIiHCHat+nDQ+jBi0zXzV9cMqcq2ThV4+Dj2z6WMuCyLHkvlqef3ZINjRLU
 k0m4fmcGw/gRoOAGEXczNgz6w9m1mQL4apJ3Or7xUTFe6Kbkfn2aGxnpvIG2HNdh05kE
 yP6A==
X-Gm-Message-State: AOAM5314oVNKar+Nm4BD/+nex8VsuHPXJPn/LIHaaC3ccXoudj569qkW
 20X/lrSDxWjuUDiz+HcNKYaa9Q==
X-Google-Smtp-Source: ABdhPJzTY3dEyges48+keepoRL13Mu0zSKz75smHLKvT61RoKlYQUIF/8ZmQDVQAeocmK3Ds3vHL7g==
X-Received: by 2002:a17:902:6947:b029:db:c7fd:9db3 with SMTP id
 k7-20020a1709026947b02900dbc7fd9db3mr6302787plt.56.1611086214461; 
 Tue, 19 Jan 2021 11:56:54 -0800 (PST)
Received: from google.com (c-73-170-36-70.hsd1.ca.comcast.net. [73.170.36.70])
 by smtp.gmail.com with ESMTPSA id
 k14sm3149138pfh.172.2021.01.19.11.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 11:56:53 -0800 (PST)
Date: Tue, 19 Jan 2021 11:56:52 -0800
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YAc5hMnHm0GIQJ96@google.com>
References: <20210119160316.4776-1-pvorel@suse.cz>
 <20210119160316.4776-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119160316.4776-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
From: Sandeep Patil via ltp <ltp@lists.linux.it>
Reply-To: Sandeep Patil <sspatil@android.com>
Cc: Steve Muckle <smuckle@google.com>, kernel-team@android.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jan 19, 2021 at 05:03:15PM +0100, Petr Vorel wrote:
> BusyBox modprobe implementation does not support -n switch.
> 
> It does support -D, which could be used, *but* unless is busybox binary
> configured with CONFIG_MODPROBE_SMALL=y (IMHO the default).
> 
> We could use modinfo and grep output for 'filename:', but we agreed on
> ML that having our own implementation will be the best as it also
> does not require modinfo as external dependency.
> 
> Implementation searches for for module presence in /lib/modules/$(uname
> -r)/modules.{dep,builtin}. On Android expect files in /system/lib/modules
> directory.
> 
> Also treat '-' and '_' in module name as the same (follow kmod implementation).
> 
> On Android still assume all drivers are available because modules.* files might
> not be available. We could search modules in /system/lib/modules, but to
> to determine built-in drivers we need modules.builtin (it's required
> also by Busybox mod{info,probe} implementation).
> 
> This fixes many tests on BusyBox, e.g. *all* network tests (tests using
> tst_net.sh) after 305a78e4c ("tst_net.sh: Require veth for netns").
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/tst_kernel.c | 99 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 87 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
> index 57fa4b2be..279c8936c 100644
> --- a/lib/tst_kernel.c
> +++ b/lib/tst_kernel.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
> + * Copyright (c) 2020-2021 Petr Vorel <pvorel@suse.cz>
>   *
>   * This program is free software: you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -17,8 +18,11 @@
>  
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

This is just the ramdisk location, the on-disk location is
/vendor/lib/modules/. I also think that the ramdisk one goes away after we
switch over 2nd stage init. Is there a test I can run that uses these
functions now to make sure this works?

Also, unfortunately (and sadly) we may have to do something Android specific
downstream as the /vendor/lib/modules and /lib/modules only started to appear
as of android 11 :(.

Once you share how I can test, I'm happy to test and add my Tested-by for
Android.

+cc: kernel-team@android.com
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
> +
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

the appropriate location would be /lib/modules OR /vendor/lib/modules.
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
> +
> +		if (!tst_check_driver_(driver2))
> +			return 0;
> +	}
> +
> +	return 1;
>  }
> -- 
> 2.30.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
