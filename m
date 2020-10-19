Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129B292F43
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 22:18:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B29AD3C5718
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 22:18:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 365783C245D
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 22:18:04 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8BBDC200243
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 22:18:03 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id s9so1132017wro.8
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 13:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=B4Glb9xDdLu5iWc2KsKtOEeByRwywRslCn4Cmf1IlBc=;
 b=vV4YxSaSXc2hYcXWTEFXQXo64kL4pNyV7RQUEM8HvWzUym0nnB5LMQJGOrfn0A0nnY
 WIbL4AAF2c1xMOsj3fE9UbnlHEPydXOA9IAy0VGSbEFxt9Lg0hk0U9tLnscus2FPzb00
 5XZG6Y+ahq1rhlXxheE3Vd0GcBBTVP3bWGn0JbsLCBwaNHIPRLLtb5on4v7L4Nqx0kWC
 GG1v9Jb+iv5/WTi94s9B7aFcSzEBhRgpkG/ZCwNoDg+zv8pSvRG5Oz5y+VWIDKMpuGTn
 zalT8JR/fNzqAe/Q3tf9CsHW2goXxVM/kRRk0xN/o+791a1o/uNvfFkqXj8aCm6KOnD6
 2WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=B4Glb9xDdLu5iWc2KsKtOEeByRwywRslCn4Cmf1IlBc=;
 b=KXOeadkIPMxRZINSgJKaDtVsO7CcO78Qg9EyRzqqirLdiwemKa9Y5E8vvn5ZgGms4Z
 dU2O3I+nLwByye+4jM9v/NfXKS8ns29/99IBna13cDDL7Fe4okxlS/XqWg4t/XzpRCnm
 KIBsRTVYmkEem15VGgsJN7aeIY/RQhrq+HOig64w0E69jgiHvTNFYQFtRqcUQPGLpD9u
 +1qxYakpqlNVPwNPTKs93dcpXWBSaAaPcimRcRwiOhro2+epBJt/6tnE3NDUFsdhhL+d
 OfbJBrvZzTObxV08ps6oJ8HPqi3XaSdjJEI3FRW5wiCa3zxGZ7Ktbry9e3LeEMtxjjcg
 ndRw==
X-Gm-Message-State: AOAM533sb9CTLb162iCLB65Ij7XQjgge4Q2Ue6hKboNHbo+rVRl40fpX
 /PZAeGfZaJ54UAeA87+BeKw=
X-Google-Smtp-Source: ABdhPJzWsX03jhU5LzIoDQ9d0hIVqAGiQ5sNlpM593xRhoerFThDhoKA6NUkj6SX3inVx7rtZY43jw==
X-Received: by 2002:adf:e741:: with SMTP id c1mr1120882wrn.16.1603138683079;
 Mon, 19 Oct 2020 13:18:03 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id y10sm1017998wrq.73.2020.10.19.13.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:18:02 -0700 (PDT)
Date: Mon, 19 Oct 2020 22:18:00 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20201019201800.GA12642@dell5510>
References: <20200529014448.3815022-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529014448.3815022-1-raj.khem@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] sigwaitinfo: Do not run invalid/undefined test
 cases
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Khem,

> These testcases run for eternity on musl

> test_bad_address* cases are passing invalid pointers to a function; that's always UB
> empty_set and timeout rely on the implementation-defined "may fail" for EINTR in sigtimedwait [1]

> normally "may fail" is an "unspecified" but here the impl
> is supposed to document it so it's "impl-defined"

> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.html

Sorry for the delay. Could you please verify, if test still fails in the current
master? If yes, would you please update the patch?

Now, I dropped it from the latest update:
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_1_ltp_update_to/77667273?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,77667273

Kind regards,
Petr


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Rich Felker <dalias@aerifal.cx>
> ---
> v2: Extend same fixes to include sigwaitinfo01

>  .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

> --- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> +++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> @@ -422,15 +422,10 @@ struct test_desc {
>  } tests[] = {
>  #ifdef TEST_RT_SIGTIMEDWAIT
>  	{
> -	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
> -	test_timeout, my_rt_sigtimedwait, 0},
> +	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
>  	    /* Special cases */
>  	    /* 1: sigwaitinfo does respond to ignored signal */
>  	{
> @@ -452,25 +447,17 @@ struct test_desc {
>  #endif
>  #if defined TEST_SIGWAITINFO
>  	{
> -	test_empty_set, my_sigwaitinfo, SIGUSR1}, {
>  	test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
>  	test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> -	test_bad_address, my_sigwaitinfo, SIGUSR1}, {
> -	test_bad_address2, my_sigwaitinfo, SIGUSR1},
> +	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
>  #endif
>  #if defined TEST_SIGTIMEDWAIT
>  	{
> -	test_empty_set, my_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
>  	test_masked_matching, my_sigtimedwait, SIGUSR1}, {
>  	test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> -	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address2, my_sigtimedwait, SIGUSR1}, {
> -	test_bad_address3, my_sigtimedwait, SIGUSR1}, {
> -	test_timeout, my_sigtimedwait, 0},
> +	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
>  #endif
>  };

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
