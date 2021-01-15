Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD22F72FC
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:42:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0D1E3C3122
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:42:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1CF623C2657
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:42:09 +0100 (CET)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6351C20006F
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:42:09 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id e15so267055wme.0
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=leBeITc+shhgHt7bnNKUZwfuZZWkfEospDlbRMwaaao=;
 b=j6odHQiFkhHordYiKaAzIarNmR5M9VaUX0+nsxSpmfgZx4ikUr8YZ3l/kIPvn1x4dU
 CcTj3vCZ9xz6H8DPJSCbSG5kJfZ6o1EI5v+WEM80o1J+xRggiPXL8ppDJ/jH+8SVt0xV
 X1zzLh1JhE08drpl03r7JTphd0y+O7fzv9fE993ZsBMKEzrBQXyBNem9G37az3FPrdQC
 jAjh2i5tTEVB4XjdgxoJ7LmEySB8OXvarNpb4/VKVsTrACqds1GUJQ5/87KLGczceT4C
 mGAzDevgf7dH944DkHnpek9PET1NRlby0QwoVWE4CJC0B4odWA0Awo1qScQeSVU5ouOq
 OQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=leBeITc+shhgHt7bnNKUZwfuZZWkfEospDlbRMwaaao=;
 b=sS4zHRxHAKSKjDvvlmn+7RrsIdgjMZDjKly+k65ftyFC04zeBrXhMe/9gIs0oMDKcc
 pkuEnTdf5mgz93VemvCmdhpLLvaK7ESrpJUtJysmoBMPKenT07atTxBfeqtFXNOKWvkE
 eDaqiYx9b5QNb/gaozCiJ8uRWyEBeOD80+eNrpNY0ubfFO1VKp6mxsjV7gHlJQrPGr0K
 sX162pHqfeLqo4zyf5WS4plMpJ7JwF3L1lAQt96wi/Q5/YweKqFck/vJVTcLhthJyhKw
 x0wydqnzA93FlZShZjfxgoPAZhA+akNeVGsc67Pn/xejVi1nLaqFjkRPrfkTMX0ZMCWy
 p0lQ==
X-Gm-Message-State: AOAM5332rOGArtcubNmsgD3kTyH2mEVhQnks+p4ZDhYasM7ywpFjF5fr
 Dtdw6/d9kbIefNPstdRSfKs=
X-Google-Smtp-Source: ABdhPJwolkj/i/e97B2OZVvAHWGHzEZTeH2ZoCnSffJz/8b39C8vL6hwRA5KsemdKA9kBGLmk7ATNQ==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr7090196wme.3.1610692928983;
 Thu, 14 Jan 2021 22:42:08 -0800 (PST)
Received: from pevik ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id f14sm13922666wre.69.2021.01.14.22.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 22:42:08 -0800 (PST)
Date: Fri, 15 Jan 2021 07:42:06 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <YAE5PnVdLD0nmN/H@pevik>
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
Cc: Rich Felker <dalias@aerifal.cx>, ltp@lists.linux.it
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

I tested sigtimedwait01.c, sigwaitinfo01.c and rt_sigtimedwait01.c on Alpine
3.12.3 on RPI on current LTP master.

rt_sigtimedwait01.c os PL am cam be left as it is.
sigtimedwait01.c and sigwaitinfo01.c is blocked just by first test:
{ test_empty_set, SIGUSR1}
removing it is enough to fix test.

$ strace ./sigwaitinfo01
getpid()                                = 27859
setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=300, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=0, tv_usec=0}}) = 0
rt_sigaction(SIGINT, {sa_handler=0x5570b661e8, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fa0385a6c}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigprocmask(SIG_BLOCK, ~[], [], 8)   = 0
clone(child_stack=NULL, flags=SIGCHLD)  = 27860
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=27860, si_uid=0} ---
setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=300, tv_usec=0}}, {it_interval={tv_sec=0, tv_usec=0}, it_value={tv_sec=299, tv_usec=989256}}) = 0
rt_sigreturn({mask=[]})                 = 0
wait4(27860,

I haven't look into musl implementation what could be wrong.

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
