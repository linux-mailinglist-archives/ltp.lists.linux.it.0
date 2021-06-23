Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEF3B1C09
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:08:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CFA53C6FE4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:08:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 043CC3C6FD1
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 16:08:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3AB1B200D44
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 16:07:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94EF021961;
 Wed, 23 Jun 2021 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624457278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvf6KuxMLN/HJoKfV/eVNAwQ1aBJItxnhEO2r8oMWVE=;
 b=Z3QMpHRKyk2uK8Nx/d4mgEmD1bGNpX+KTqB6C4zfLXQ4hd0cufnLfs4CdZcBJSVgHV145F
 QY1CPfdX7joALrO4GZ9U+THJONM6SVkqGi69naMMUVuXSmxkw5gfWHTduqvLLRARxJ4CmG
 ledyCJ4Tg7CNKQrElQUttBYbcA+wCbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624457278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvf6KuxMLN/HJoKfV/eVNAwQ1aBJItxnhEO2r8oMWVE=;
 b=XICI2yjQZjF5vRTANdEghsFYG2vt6xfK1ahAIC/xLukM2M6YIEcYqehVORCe+uWmz0p4jH
 EZD7Ex+vxc1FHqBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7654F11A97;
 Wed, 23 Jun 2021 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624457278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvf6KuxMLN/HJoKfV/eVNAwQ1aBJItxnhEO2r8oMWVE=;
 b=Z3QMpHRKyk2uK8Nx/d4mgEmD1bGNpX+KTqB6C4zfLXQ4hd0cufnLfs4CdZcBJSVgHV145F
 QY1CPfdX7joALrO4GZ9U+THJONM6SVkqGi69naMMUVuXSmxkw5gfWHTduqvLLRARxJ4CmG
 ledyCJ4Tg7CNKQrElQUttBYbcA+wCbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624457278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvf6KuxMLN/HJoKfV/eVNAwQ1aBJItxnhEO2r8oMWVE=;
 b=XICI2yjQZjF5vRTANdEghsFYG2vt6xfK1ahAIC/xLukM2M6YIEcYqehVORCe+uWmz0p4jH
 EZD7Ex+vxc1FHqBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Ao9QGz5A02CBUgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 14:07:58 +0000
Date: Wed, 23 Jun 2021 15:42:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alessio Balsini <balsini@android.com>
Message-ID: <YNM6QGFYt/bpaPDS@yuki>
References: <20210623134041.366838-1-balsini@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623134041.366838-1-balsini@android.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrlimit/getrlimit03: fix unavailable
 __NR_getrlimit for arm
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> __NR_getrlimit has been deprecated from arm EABI, and is only available
> if the OABI_COMPAT config option is defined.
> This causes failures with the current test as it assumes that
> __NR_getrlimit exists if __NR_ugetrlimit is defined, while this
> assumption does not hold anymore.
> 
> Catch this exception by testing if __NR_getrlimit is defined and the
> target is arm.

I suppose that this a proper fix for:

https://github.com/linux-test-project/ltp/issues/819

> Signed-off-by: Alessio Balsini <balsini@android.com>
> ---
>  testcases/kernel/syscalls/getrlimit/getrlimit03.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> index 319bc494a..e46a25f7b 100644
> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> @@ -45,6 +45,14 @@
>  #define __NR_getrlimit_ulong_str	"__NR_getrlimit"
>  #endif
>  
> +/**
> + * __NR_getrlimit has been deprecated from arm EABI and moved to OABI_COMPAT,
> + * so the syscall may or may not be available.
> + */
> +#if defined(__arm__) && __NR_getrlimit == __LTP__NR_INVALID_SYSCALL
> +#define DEPRECATED_GETRLIMIT
> +#endif
> +
>  #ifndef HAVE_STRUCT_RLIMIT64
>  struct rlimit64 {
>  	uint64_t rlim_cur;
> @@ -167,7 +175,7 @@ static void run(unsigned int resource)
>  	tst_res(TPASS, "__NR_prlimit64(%d) and %s(%d) gave consistent results",
>  		resource, __NR_getrlimit_ulong_str, resource);
>  
> -#if SIGNED_GETRLIMIT
> +#if SIGNED_GETRLIMIT && !defined(DEPRECATED_GETRLIMIT)
>  	errno = 0;
>  	ret_l = getrlimit_long(resource, &rlim_l);
>  	errno_l = errno;

I guess that this generates a few unused function warnings, can we fix
all the places with #if SIGNED_GETRLIMIT in the source code please?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
