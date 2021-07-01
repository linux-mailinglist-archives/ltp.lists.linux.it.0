Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD943B8D80
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:50:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25FC93C8D54
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B21433C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:50:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A4DF1200D09
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:50:29 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E9DB91FF64;
 Thu,  1 Jul 2021 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625118628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZurE/rX/leTzeVfZ8XjkjsiajMIrnVzNxjBSg80/w8=;
 b=uGLLCd6ouFxKP3rMJ7hIAaK3BLNcIFC3vn+Wzramg41eOlcCi2Md7bngfsBTXgW8gpsibC
 BPXx1gOFUamxzgwVD6tOjOADtRtc8JciInL4Gdk6UpbAKaB/pmNqEMrxdIq2zPeNFW4Uov
 HDTnupZF7LP27w7iM8e0MFB6s3JO+YE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625118628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZurE/rX/leTzeVfZ8XjkjsiajMIrnVzNxjBSg80/w8=;
 b=KsPOM0ucCBoqT/lgfP0ETdxwBTX9LOPR+EnE0r7xuVKEsC4Aeo5oma0LsJl7/GihrVFJ2/
 pfXbGI7sYr2fmWAw==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7CD92A3B83;
 Thu,  1 Jul 2021 05:50:28 +0000 (UTC)
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <20210701050314.1005067-2-petr.vorel@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <petr.vorel@gmail.com>
In-reply-to: <20210701050314.1005067-2-petr.vorel@gmail.com>
Date: Thu, 01 Jul 2021 06:50:27 +0100
Message-ID: <87lf6q37mk.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tests: Rename test tst_print_result.c
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,
Petr Vorel <petr.vorel@gmail.com> writes:

> From: Petr Vorel <pvorel@suse.cz>
>
> Also:
> * remove copy pasted test description
> * fix author in the copyright
>
> Fixes: cecbd0cb3 ("Fix buffer overflow in print_result() function")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

> ---
>  lib/newlib_tests/.gitignore                       |  2 +-
>  lib/newlib_tests/{test17.c => tst_print_result.c} | 10 ++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
>  rename lib/newlib_tests/{test17.c => tst_print_result.c} (80%)
>
> diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
> index 83a240223..9f53bbb99 100644
> --- a/lib/newlib_tests/.gitignore
> +++ b/lib/newlib_tests/.gitignore
> @@ -22,7 +22,7 @@ tst_device
>  tst_safe_fileops
>  tst_res_hexd
>  tst_strstatus
> -test17
> +tst_print_result
>  test18
>  test19
>  test20
> diff --git a/lib/newlib_tests/test17.c b/lib/newlib_tests/tst_print_result.c
> similarity index 80%
> rename from lib/newlib_tests/test17.c
> rename to lib/newlib_tests/tst_print_result.c
> index c0fc0bc30..0a2ca5af1 100644
> --- a/lib/newlib_tests/test17.c
> +++ b/lib/newlib_tests/tst_print_result.c
> @@ -1,12 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) 2017 Richard Palethorpe <rpalethorpe@suse.com>
> + * Copyright (c) 2017 Veronika Kabatova <vkabatov@redhat.com>
>   */
> -/* Basic functionality test for tst_fuzzy_sync.h similar to the atomic tests
> - * (test15.c). One thread writes to the odd indexes of an array while the
> - * other writes to the even. If the threads are not synchronised then they
> - * will probably write to the wrong indexes as they share an index variable
> - * which they should take it in turns to update.
> +
> +/*
> + * Test for cecbd0cb3 ("Fix buffer overflow in print_result() function")
>   */
>  
>  #include <stdlib.h>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
