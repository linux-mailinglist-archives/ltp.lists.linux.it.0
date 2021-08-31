Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E84763FC756
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:35:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4B8A3C939E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:35:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 520D93C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:35:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD2061000DD8
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:35:15 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2C50122230
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630413315;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPVHdcfDLNuOh6xLgbKRgdjP07mxs1y3dCvaPfk9v6Y=;
 b=jT5htpDCXfmYEO3cpR0/SKryyddug2igU2KgdhkH4JxiYWAfZAOJUMPMDcRUK2GD2tRfO4
 3jCLuy3890R6KQCXUSFiGYKmzdV1Axq7xImBqr8ZqpP1cO90asM1ScoezmO5NZkl4jSEoc
 TAZnpsvGuNwSBjsG6Ft15d8fJ7xEOFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630413315;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPVHdcfDLNuOh6xLgbKRgdjP07mxs1y3dCvaPfk9v6Y=;
 b=sOQLXPOp36qmqUVpOQ0DDDgilyNLf6oqGQ3CGWI/P52skNH/aOFNWJi/nIlu2RKXOjGy2F
 Dww1tfspYfbxKBDw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EB7EAA3BB2;
 Tue, 31 Aug 2021 12:35:14 +0000 (UTC)
References: <20210831121250.17557-1-pvorel@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20210831121250.17557-1-pvorel@suse.cz>
Date: Tue, 31 Aug 2021 13:35:09 +0100
Message-ID: <875yvllrlu.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib/tests: Remove tst_fuzzy_sync02
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

Petr Vorel <pvorel@suse.cz> writes:

> tst_fuzzy_sync02 is not stable enough [1]:
>
> ../../include/tst_fuzzy_sync.h:346: TINFO: loop = 10001, delay_bias = 3960
> ../../include/tst_fuzzy_sync.h:335: TINFO: start_a - start_b: { avg = -8859ns, avg_dev =    66ns, dev_ratio = 0.01 }
> ../../include/tst_fuzzy_sync.h:335: TINFO: end_a - start_a  : { avg = 17160ns, avg_dev =    85ns, dev_ratio = 0.00 }
> ../../include/tst_fuzzy_sync.h:335: TINFO: end_b - start_b  : { avg = 18474ns, avg_dev =    55ns, dev_ratio = 0.00 }
> ../../include/tst_fuzzy_sync.h:335: TINFO: end_a - end_b    : { avg = -10173ns, avg_dev =   124ns, dev_ratio = 0.01 }
> ../../include/tst_fuzzy_sync.h:335: TINFO: spins            : { avg =  2751  , avg_dev =    31  , dev_ratio = 0.01 }
> ../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
> tst_fuzzy_sync02.c:169: TFAIL: 2| =:48
> ...
> runtest TINFO: === C TEST RESULTS ===
> ...
> runtest TINFO: 1x TFAIL: tst_fuzzy_sync02
>
> Both tst_fuzzy_sync0{1,2} occasionally fails (restart helps). But
> tst_fuzzy_sync03 is stable thus we have at least smoke test for fuzzy
> sync.

Yes, there is probably some work to do on the algorithm itself. At least
to make it stable in this kind of environment.

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
