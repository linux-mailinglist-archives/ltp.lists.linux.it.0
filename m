Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A03E2E86
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8799F3C5361
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CAEE3CA3C2
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:04 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DACF71A006FC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:03 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id p38so19223017lfa.0
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rsu3oRev0tIqFRB1PsfB2h0CzqPmb+QAOltH4pnY7a8=;
 b=SjJ1pZO4lbxlgSeOp8lQROWcY59e7n96UDbtHledu4vYLgClNfZfHOcrwVYyYYo3gQ
 x8PLusojZ/b6rFOVBZMh0iaQ0yKz41BXcFe2SpGinvgLfF148ks7GULu0C2IYGdNn1Uj
 cOMjdHH61/T2PLJERu48hMxwMbBaPvQTwejFaNrrXZvPJ4B1AmSUHE6IMP7xfxRU1XNV
 VX1Ag8eeNOxR7duFv7VEhFisR9zBROtRIymy73I8PILlRjDjr086GSRX7fJ6fL3Jazik
 0vAzm1cuYhqXHfdg4s7s8uafMqEJGX9AzWHlHVp7PhRiaL8VFOg753tfgFfzbJ2ecbAs
 UxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rsu3oRev0tIqFRB1PsfB2h0CzqPmb+QAOltH4pnY7a8=;
 b=eMMWOWPBsXHir1icodq37dtFfGseUvBpZpi2fXvFJ5dkbbhySoLVzhT1yyFP3j+F24
 2iBaUd1x4Ae5m5cWG/gQppE+ZmOvk9UI/M2Fe2alj0DeRt3EG3IKxv9XjeeF4R73q6pe
 kk4YgygboWadhC5S2JMDZ4SxWgVGKPFvpowXX2Cj0eLaW3HTSvRCZuPOUaLnlQUTnU9i
 lZU1+f6dBPVUBGP2ddSBUmJLgOnCndBTZsd2v0MqWS7tjyOik+q6F9q14Wl+aXcWYlsm
 MRerMX/oNGFhd7qv8975VahKNOBHYQZkeWfqqQXu7Y15YKAlbEDfnEiC02gUO8/YYBfx
 ydzA==
X-Gm-Message-State: AOAM530TCUJiZVduUaX0tFppdfF2fmvE2B2kCbaEVtRTdHl8kjdFZ9+W
 3pSnXssYdlB0giaqhxKjJ7pq8ikMPZFq
X-Google-Smtp-Source: ABdhPJwFyby4rZ/AKNsUv1vkMnAmnpayqNImLKWJJQhEKZu11re/ZA3L2yMrNoLcrdRsD6SswFfSTg==
X-Received: by 2002:a19:5f0f:: with SMTP id t15mr8266248lfb.467.1628268483161; 
 Fri, 06 Aug 2021 09:48:03 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:02 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:18 +0300
Message-Id: <20210806164730.51040-5-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 04/16] syscalls/sched_setparam01: convert to new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 .../sched_setparam/sched_setparam01.c         | 140 ++++--------------
 1 file changed, 27 insertions(+), 113 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
index a2272eb18..f8519c062 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
@@ -1,128 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * AUTHOR: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_setparam01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for sched_setparam(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the sched_setparam(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sched_setparam01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Basic test for sched_setparam(2)
  *
- ****************************************************************/
-
-#include <errno.h>
-#include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
+ * Call sched_setparam(2) with pid=0 so that it will
+ * set the scheduling parameters for the calling process
+ */
 
-char *TCID = "sched_setparam01";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "tst_sched.h"
 
-static struct sched_param param;
+static struct sched_variants variants[] = {
+	{ .sched_setparam = libc_sched_setparam, .desc = "libc" },
+	{ .sched_setparam = sys_sched_setparam, .desc = "syscall" },
+};
 
-int main(int ac, char **av)
+static void run(void)
 {
+	struct sched_variants *tv = &variants[tst_variant];
+	struct sched_param p = { .sched_priority = 0 };
 
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call sched_setparam(2) with pid=0 sothat it will
-		 * set the scheduling parameters for the calling process
-		 */
-		TEST(sched_setparam(0, &param));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "sched_setparam() returned %ld",
-				 TEST_RETURN);
-		} else {
-			tst_resm(TFAIL | TTERRNO,
-				 "Test Failed, sched_setparam()" "returned %ld",
-				 TEST_RETURN);
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	TST_EXP_PASS(tv->sched_setparam(0, &p), "sched_setparam(0, 0)");
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	param.sched_priority = 0;
-
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
