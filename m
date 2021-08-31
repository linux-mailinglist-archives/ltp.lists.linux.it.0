Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7663FC6F1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:13:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5DCF3C9A55
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:13:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 17C343C03AB
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:13:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F6D51000DDC
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:13:03 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 366B722228;
 Tue, 31 Aug 2021 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630411983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=K5gSYLOEJJpQ5qyA1tPz53hvKT9A2KcIND7NH2Q0msM=;
 b=Hoo94phFRU6HTfSTnW8n3MCQpPfnLMsTXmlw71et6IdeNsXCxai4SX+hNIJ6jyB7gN7kBe
 qOf3wqx2FORPj0fjv8CFpIqkvOQfD6DrEsYg9uyEc51reDrq9CUvrVGRBx4U54fiv3NtPP
 oVs9pN2DgCO9yIc++j0QJjfgwlXSn7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630411983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=K5gSYLOEJJpQ5qyA1tPz53hvKT9A2KcIND7NH2Q0msM=;
 b=+ZdvJwUg7k7RNIdeqpw0QNJeOPOVuRFGckWkWbSGATpBybnWEneA+UJIeRGPHVPGwMoxt1
 HD5O6McQStD4lHAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5018B13A92;
 Tue, 31 Aug 2021 12:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 5jQ/Es4cLmGbFwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 12:13:02 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 14:12:50 +0200
Message-Id: <20210831121250.17557-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib/tests: Remove tst_fuzzy_sync02
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tst_fuzzy_sync02 is not stable enough [1]:

../../include/tst_fuzzy_sync.h:346: TINFO: loop = 10001, delay_bias = 3960
../../include/tst_fuzzy_sync.h:335: TINFO: start_a - start_b: { avg = -8859ns, avg_dev =    66ns, dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:335: TINFO: end_a - start_a  : { avg = 17160ns, avg_dev =    85ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:335: TINFO: end_b - start_b  : { avg = 18474ns, avg_dev =    55ns, dev_ratio = 0.00 }
../../include/tst_fuzzy_sync.h:335: TINFO: end_a - end_b    : { avg = -10173ns, avg_dev =   124ns, dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:335: TINFO: spins            : { avg =  2751  , avg_dev =    31  , dev_ratio = 0.01 }
../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync02.c:169: TFAIL: 2| =:48
...
runtest TINFO: === C TEST RESULTS ===
...
runtest TINFO: 1x TFAIL: tst_fuzzy_sync02

Both tst_fuzzy_sync0{1,2} occasionally fails (restart helps). But
tst_fuzzy_sync03 is stable thus we have at least smoke test for fuzzy
sync.

[1] https://github.com/linux-test-project/ltp/runs/3471271675

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/runtest.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
index 70fbffb6c..05c76228b 100755
--- a/lib/newlib_tests/runtest.sh
+++ b/lib/newlib_tests/runtest.sh
@@ -2,8 +2,8 @@
 # Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 
 LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test18
-tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02
-tst_fuzzy_sync03 test_zero_hugepage.sh}"
+tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync03
+test_zero_hugepage.sh}"
 
 LTP_SHELL_API_TESTS="${LTP_SHELL_API_TESTS:-shell/tst_check_driver.sh shell/net/*.sh}"
 
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
