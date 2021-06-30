Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A73B7DE0
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 09:11:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 351543C8CFE
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 09:11:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 32CAA3C5573
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 09:11:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 28A1B1000D0E
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 09:11:49 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 636182045A;
 Wed, 30 Jun 2021 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625037109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uajqij9G9MEgNnNMFI/4JxnwKslrg2dplKOdoK9qttU=;
 b=NAfIgiX/WA8N0CcOmiLt8Zd8I3lOMZpXGg1k+WgvxTG5VIf4vUbcWegDOF7AB7Y5qzyPHT
 KJq4Pig2lnCDbPd0Jkl0pHAEPP5W/3QsO0OenroO6xqMNEDbTN/KvlrcD4JCKgmKPWTEhr
 yWd4kvTOJkFP22OQQfXTaTbHCpwXn7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625037109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uajqij9G9MEgNnNMFI/4JxnwKslrg2dplKOdoK9qttU=;
 b=UlbOlH29xq+hTVYpEdVzl/fZ4lx6BmLxZdnZVZTWThnAQUnvayFrcf5yw49F+DoY6inh0S
 FzY7VQ48AXvL7ODw==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0A4D9A3B85;
 Wed, 30 Jun 2021 07:11:48 +0000 (UTC)
References: <YNuA/0J20mjiV+NC@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YNuA/0J20mjiV+NC@pevik>
Date: Wed, 30 Jun 2021 08:11:47 +0100
Message-ID: <87tulf3jyk.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] ee
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
Cc: ltp@lists.linux.it, Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
> sporadically tst_fuzzy_sync01 fails. I wonder if we can relax it somehow.
> I found it while working on enabling API tests in CI, I'll have to disable this
> one to avoid false positives.
>
> Kind regards,
> Petr
>
> ./tst_fuzzy_sync01
> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
> tst_fuzzy_sync01.c:224: TPASS: acs:0  act:0  art:0  | =:101  -:148  +:65  
> tst_fuzzy_sync01.c:224: TPASS: acs:0  act:1  art:0  | =:101  -:0    +:0   
> tst_fuzzy_sync01.c:224: TPASS: acs:1  act:1  art:1  | =:101  -:0    +:0   
> tst_fuzzy_sync01.c:224: TPASS: acs:3  act:1  art:1  | =:101  -:5    +:1   
> ../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
> ../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
> ../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -17ns, avg_dev =     4ns, dev_ratio = 0.25 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20773ns, avg_dev =  4714ns, dev_ratio = 0.23 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 20849ns, avg_dev =  4710ns, dev_ratio = 0.23 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   -94ns, avg_dev =    24ns, dev_ratio = 0.26 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    54  , avg_dev =    17  , dev_ratio = 0.31 }
> ../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
> tst_fuzzy_sync01.c:224: TFAIL: acs:3  act:1  art:1  | =:0    -:1    +:2999999
> ../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
> ../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
> ../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -18ns, avg_dev =     8ns, dev_ratio = 0.46 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 21475ns, avg_dev =  4558ns, dev_ratio = 0.21 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 19960ns, avg_dev =  4702ns, dev_ratio = 0.24 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =  1497ns, avg_dev =  1956ns, dev_ratio = 1.31 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    43  , avg_dev =    17  , dev_ratio = 0.39 }
> ../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
> tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:3  | =:3    -:2999996 +:1   
> ../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
> ../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
> ../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =  1529ns, avg_dev =  1930ns, dev_ratio = 1.26 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 18630ns, avg_dev =  4565ns, dev_ratio = 0.25 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  8430ns, avg_dev =  4163ns, dev_ratio = 0.49 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 11729ns, avg_dev =  2725ns, dev_ratio = 0.23 }
> ../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6115  , avg_dev =    33  , dev_ratio = 0.01 }
> ../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
> ...

It looks like the CI machines are too noisy/contended. The avg_dev is
very high. Probably we could relax the dev_ratio threshold to 0.2 or
0.3. Although we would still get failures occassionally. As this is a
probabalistic test.

Could you change the script so that it passes so long as the test
returns TPASS or TFAIL?

We don't want TBROK, TCONF or no result.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
