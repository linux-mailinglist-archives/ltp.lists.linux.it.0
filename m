Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0DD3B7942
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 22:22:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD9643C93A0
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 22:22:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 255FB3C1A2B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:22:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2ABED1A003D1
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 22:22:26 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2AF231FDC9;
 Tue, 29 Jun 2021 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624998146;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vqagCd4OFc+hyCw7KngEqE5gSg/+wWM94IWvuxnKnQw=;
 b=Iz0B+tDEVkw1hPorWeGjSzMHRRUHVG15i3EOgzOUNMsjc9iKtPdCdFyFdOc63fO5+T59wU
 v5ZKMrW3iDwHNAsmxQ9s5zYnn4h+is19m9jN13E5GFR4fIjUmVVyIdHzPzFNzaPr3z/fAr
 jpejgAh/T9LUX5r1b49Eyo2S2P2NxWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624998146;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vqagCd4OFc+hyCw7KngEqE5gSg/+wWM94IWvuxnKnQw=;
 b=C1OrJcZTWlVe0wqMknBEsVyTkESb6jdsA/8fgFGx/XPHXOTNvIi7SAY+eZPICMXSWbBE5x
 sl4qJy7GQR2L7CAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CED2111906;
 Tue, 29 Jun 2021 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624998146;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vqagCd4OFc+hyCw7KngEqE5gSg/+wWM94IWvuxnKnQw=;
 b=Iz0B+tDEVkw1hPorWeGjSzMHRRUHVG15i3EOgzOUNMsjc9iKtPdCdFyFdOc63fO5+T59wU
 v5ZKMrW3iDwHNAsmxQ9s5zYnn4h+is19m9jN13E5GFR4fIjUmVVyIdHzPzFNzaPr3z/fAr
 jpejgAh/T9LUX5r1b49Eyo2S2P2NxWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624998146;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vqagCd4OFc+hyCw7KngEqE5gSg/+wWM94IWvuxnKnQw=;
 b=C1OrJcZTWlVe0wqMknBEsVyTkESb6jdsA/8fgFGx/XPHXOTNvIi7SAY+eZPICMXSWbBE5x
 sl4qJy7GQR2L7CAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 5dCkLwGB22DBJwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 20:22:25 +0000
Date: Tue, 29 Jun 2021 22:22:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YNuA/0J20mjiV+NC@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] ee
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

sporadically tst_fuzzy_sync01 fails. I wonder if we can relax it somehow.
I found it while working on enabling API tests in CI, I'll have to disable this
one to avoid false positives.

Kind regards,
Petr

./tst_fuzzy_sync01
tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
tst_fuzzy_sync01.c:224: TPASS: acs:0  act:0  art:0  | =:101  -:148  +:65  
tst_fuzzy_sync01.c:224: TPASS: acs:0  act:1  art:0  | =:101  -:0    +:0   
tst_fuzzy_sync01.c:224: TPASS: acs:1  act:1  art:1  | =:101  -:0    +:0   
tst_fuzzy_sync01.c:224: TPASS: acs:3  act:1  art:1  | =:101  -:5    +:1   
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -17ns, avg_dev =     4ns, dev_ratio = 0.25 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20773ns, avg_dev =  4714ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 20849ns, avg_dev =  4710ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   -94ns, avg_dev =    24ns, dev_ratio = 0.26 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    54  , avg_dev =    17  , dev_ratio = 0.31 }
../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:3  act:1  art:1  | =:0    -:1    +:2999999
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -18ns, avg_dev =     8ns, dev_ratio = 0.46 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 21475ns, avg_dev =  4558ns, dev_ratio = 0.21 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 19960ns, avg_dev =  4702ns, dev_ratio = 0.24 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =  1497ns, avg_dev =  1956ns, dev_ratio = 1.31 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    43  , avg_dev =    17  , dev_ratio = 0.39 }
../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:3  | =:3    -:2999996 +:1   
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =  1529ns, avg_dev =  1930ns, dev_ratio = 1.26 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 18630ns, avg_dev =  4565ns, dev_ratio = 0.25 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  8430ns, avg_dev =  4163ns, dev_ratio = 0.49 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 11729ns, avg_dev =  2725ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6115  , avg_dev =    33  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:684: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:3  act:1  art:1  | =:1    -:1    +:2999998
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =  -126ns, avg_dev =   256ns, dev_ratio = 2.03 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 19028ns, avg_dev =  4655ns, dev_ratio = 0.24 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  5548ns, avg_dev =  1172ns, dev_ratio = 0.21 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 13354ns, avg_dev =  4411ns, dev_ratio = 0.33 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6070  , avg_dev =   157  , dev_ratio = 0.03 }
tst_fuzzy_sync01.c:224: TPASS: acs:1  act:1  art:3  | =:101  -:69713 +:82  
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =    -1ns, avg_dev =    35ns, dev_ratio = 41.69 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =  5178ns, avg_dev =   496ns, dev_ratio = 0.10 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 20746ns, avg_dev =  4711ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = -15569ns, avg_dev =  4639ns, dev_ratio = 0.30 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6127  , avg_dev =    48  , dev_ratio = 0.01 }
tst_fuzzy_sync01.c:224: TPASS: acs:2  act:1  art:1  | =:101  -:67   +:103496
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =  -174ns, avg_dev =   515ns, dev_ratio = 2.95 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =  5382ns, avg_dev =  1036ns, dev_ratio = 0.19 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 19221ns, avg_dev =  4722ns, dev_ratio = 0.25 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = -14014ns, avg_dev =  4570ns, dev_ratio = 0.33 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6141  , avg_dev =    57  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:2  | =:6    -:2311522 +:7   
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -16ns, avg_dev =     3ns, dev_ratio = 0.20 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20317ns, avg_dev =  4728ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 20374ns, avg_dev =  4707ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   -73ns, avg_dev =    31ns, dev_ratio = 0.42 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    58  , avg_dev =    18  , dev_ratio = 0.31 }
../../include/tst_fuzzy_sync.h:532: TINFO: Reached deviation ratios < 0.10, introducing randomness
../../include/tst_fuzzy_sync.h:535: TINFO: Delay range is [-14037, 8587]
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 663327, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -43ns, avg_dev =     3ns, dev_ratio = 0.08 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 17713ns, avg_dev =    59ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 28954ns, avg_dev =    31ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = -11283ns, avg_dev =    43ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  5471  , avg_dev =    38  , dev_ratio = 0.01 }
tst_fuzzy_sync01.c:224: TPASS: acs:3  act:1  art:0  | =:101  -:186  +:666740
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -12ns, avg_dev =     6ns, dev_ratio = 0.47 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20287ns, avg_dev =  4717ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 20310ns, avg_dev =  4685ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   -35ns, avg_dev =    41ns, dev_ratio = 1.18 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =    18  , avg_dev =    14  , dev_ratio = 0.77 }
../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:0  act:1  art:3  | =:3    -:837016 +:1   
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -30ns, avg_dev =     8ns, dev_ratio = 0.28 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20287ns, avg_dev =  4703ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  4954ns, avg_dev =  1134ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 15303ns, avg_dev =  4468ns, dev_ratio = 0.29 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6042  , avg_dev =    34  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:532: TINFO: Reached deviation ratios < 0.10, introducing randomness
../../include/tst_fuzzy_sync.h:535: TINFO: Delay range is [-2861, 8786]
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 402095, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   -18ns, avg_dev =     2ns, dev_ratio = 0.09 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 14168ns, avg_dev =   585ns, dev_ratio = 0.04 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  4615ns, avg_dev =    10ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =  9535ns, avg_dev =   587ns, dev_ratio = 0.06 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  5913  , avg_dev =   157  , dev_ratio = 0.03 }
tst_fuzzy_sync01.c:224: TPASS: acs:3  act:1  art:0  | =:101  -:95   +:403404
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =    -8ns, avg_dev =     0ns, dev_ratio = 0.06 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 20354ns, avg_dev =  4775ns, dev_ratio = 0.23 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =  4607ns, avg_dev =     8ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 15739ns, avg_dev =  4783ns, dev_ratio = 0.30 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6109  , avg_dev =    66  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:0  act:1  art:3  | =:31   -:210089 +:83  
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =    -1ns, avg_dev =     6ns, dev_ratio = 5.49 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =  4594ns, avg_dev =   185ns, dev_ratio = 0.04 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 18613ns, avg_dev =  4594ns, dev_ratio = 0.25 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = -14020ns, avg_dev =  4509ns, dev_ratio = 0.32 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  6192  , avg_dev =    44  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:2  act:1  art:0  | =:7    -:0    +:142178
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   314ns, avg_dev =   251ns, dev_ratio = 0.80 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =  4606ns, avg_dev =    27ns, dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg = 14040ns, avg_dev =    44ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = -9119ns, avg_dev =   234ns, dev_ratio = 0.03 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  5928  , avg_dev =   146  , dev_ratio = 0.02 }
../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
tst_fuzzy_sync01.c:224: TFAIL: acs:0  act:1  art:2  | =:0    -:47266 +:0   
../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../include/tst_fuzzy_sync.h:345: TINFO: loop = 10000, delay_bias = 0
../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =    -7ns, avg_dev =     7ns, dev_ratio = 0.98 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg = 19278ns, avg_dev =  4713ns, dev_ratio = 0.24 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =   646ns, avg_dev =    82ns, dev_ratio = 0.13 }
../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg = 18625ns, avg_dev =  4725ns, dev_ratio = 0.25 }
../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =  8988  , avg_dev =    20  , dev_ratio = 0.00 }
Test timeouted, sending SIGKILL!
tst_test.c:1357: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1359: TBROK: Test killed! (timeout?)

Summary:
passed   8
failed   8
broken   1
skipped  0
warnings 0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
