Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 629933CFAA6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2814C3C6CBF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D01493C6CDA
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:10 +0200 (CEST)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 379621A00CAD
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id t20so15321406ljd.2
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09mmlejcnQGweMTVet8lck1dEkw3HX15QBOU7/dsCxE=;
 b=yiRFU+KQtZDQsWo4DDQK4+DE/dW0KojNclDfUeNWA3YfKKxr+Ux0MZIVJj8pZnSH5t
 ZzbvZZrzBa5g9EyurU+bwRMbjXCK/G+7E7wmpNzWyE1PG5PzTRsp85XNNDtE0QZEhs7X
 jhuoyE+6IXWGqBBsWfFCOBBqJGdh7YOGBYOIDrM617lCffvZGJQYyAsqJ/jTdkc7jsPL
 1e+/MB8nkr85gd34mLvt7Wwntg0Hw9FtSfhb0cbLzxBlpP87GyS/QkPZUh7cBR/7cHOc
 QzHz/aE1Ldjgmumk4GHMNJsjwDWeDeC5ni85AjJ6lNw0stZJroLSZuoiTppO6yrsJtoT
 eDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09mmlejcnQGweMTVet8lck1dEkw3HX15QBOU7/dsCxE=;
 b=TUwQhGA8HOv/1eDD1Jl3rPahIT8szDPkr9xcGQpBtqnYf9FMTwGrg/l0v7F2Ji/IiL
 pSUPup61P19NtlXVrEdfzhBDuOhr9CmSAdnj7KfDit7wyz3QhcgvdmSgjaLmG9rr0TWf
 rPU6mWyZj7AESx0pn1In2Ml4FG/fJlb9mhaX/J9+/kGEe6uGKK4WJH50sVia0a4ivNWP
 VoSdhavmXeFKuNhHLjdBWNgRwfqiNPwzZTFveKbogyVFqLu3A4+QKSEmt4VljXCk0N0F
 dJqnobLq8avj+PmhEjJjer03G1Nk3zEC+3LeDCWXjLxtNiX1dYzdI52t4rjLVXUYgAZi
 pAhw==
X-Gm-Message-State: AOAM532sa+CLqeYPme7+S75L5pKbiJkC3OsE/xxid+tHuHglzFbWdDL3
 8giN2PE7ufj8XkJycXI2TXKPLEK1yOLk
X-Google-Smtp-Source: ABdhPJyCDlQaA+GLneYVJc2zfDMTtQOGLJGUPF129HmmBzRa4+oOaUv2sZ3itSDR+xnfsF9SMJ/k7A==
X-Received: by 2002:a2e:bd08:: with SMTP id n8mr26467206ljq.379.1626788049482; 
 Tue, 20 Jul 2021 06:34:09 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:09 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:13 +0300
Message-Id: <20210720133324.21752-6-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 05/16] syscalls/sched_setparam02: convert to new API
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
 .../sched_setparam/sched_setparam02.c         | 195 ++++--------------
 1 file changed, 35 insertions(+), 160 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
index 132cc9d6c..de7ec208e 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
@@ -1,184 +1,59 @@
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
+ * AUTHOR: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_setparam02
- *
- *    EXECUTED BY	: root / superuser
- *
- *    TEST TITLE	: Checks functionality for sched_setparam(2)
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
- *	This test changes the scheduling priority for current process
- *	and verifies it by calling sched_getparam().
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  Change scheduling policy to SCHED_FIFO
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  If scheduling priority is set properly,
- *		TEST passed
- *	  else
- *		TEST failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sched_setparam02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Checks functionality for sched_setparam(2)
  *
- ****************************************************************/
+ * This test changes the scheduling priority for current process
+ * and verifies it by calling sched_getparam().
+ */
 
-#include <errno.h>
-#include <sched.h>
-#include "test.h"
+#include "tst_test.h"
+#include "tst_sched.h"
 
 #define FIFO_OR_RR_PRIO 5
 #define OTHER_PRIO 0
 
-static void setup();
-static void cleanup();
-static int verify_priority(int);
-
-char *TCID = "sched_setparam02";
-
-static struct sched_param param;
-static struct sched_param param1 = { 1 };
-
 static struct test_cases_t {
 	char *desc;
 	int policy;
 	int priority;
-} testcases[] = {
+	int param;
+} tcases[] = {
 	{
-	"Test with policy SCHED_FIFO", SCHED_FIFO, FIFO_OR_RR_PRIO}, {
-	"Test with policy SCHED_RR", SCHED_RR, FIFO_OR_RR_PRIO}, {
-	"Test with SCHED_OTHER", SCHED_OTHER, OTHER_PRIO}
+	"Test with policy SCHED_FIFO", SCHED_FIFO, FIFO_OR_RR_PRIO, 1}, {
+	"Test with policy SCHED_RR", SCHED_RR, FIFO_OR_RR_PRIO, 1}, {
+	"Test with SCHED_OTHER", SCHED_OTHER, OTHER_PRIO, 0}
 };
 
-int TST_TOTAL = sizeof(testcases) / sizeof(testcases[0]);
-
-int main(int ac, char **av)
-{
-
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-
-			if (i == 2) {
-				param1.sched_priority = 0;
-			} else {
-				param1.sched_priority = 1;
-			}
-			if ((sched_setscheduler(0, testcases[i].policy,
-						&param1)) == -1) {
-				tst_brkm(TBROK, cleanup, "sched_setscheduler()"
-					 "  failed");
-			}
-			param.sched_priority = testcases[i].priority;
-			/*
-			 * Call sched_setparam(2) with pid=0 sothat it will
-			 * set the scheduling parameters for the calling process
-			 */
-			TEST(sched_setparam(0, &param));
-
-			if ((TEST_RETURN == 0) && (verify_priority(i))) {
-				tst_resm(TPASS, "%s Passed", testcases[i].desc);
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "%s Failed. sched_setparam()"
-					 " returned %ld", testcases[i].desc,
-					 TEST_RETURN);
-			}
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void run(unsigned int n)
 {
-	tst_require_root();
+	struct test_cases_t *tc = &tcases[n];
+	struct sched_param p = { .sched_priority = tc->param };
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	TST_EXP_PASS_SILENT(tst_sched_setscheduler(0, tc->policy, &p));
 
-	TEST_PAUSE;
+	p.sched_priority = tc->priority;
+	TST_EXP_PASS_SILENT(tst_sched_setparam(0, &p));
 
-}
+	p.sched_priority = -1;
+	TST_EXP_PASS_SILENT(tst_sched_getparam(0, &p));
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
+	if (p.sched_priority == tc->priority)
+		tst_res(TPASS, "got expected priority %d", p.sched_priority);
+	else
+		tst_res(TFAIL, "unexpected priority value %d, expected %d",
+			p.sched_priority, tc->priority);
 }
 
-/*
- * verify_priority() -  This function checks whether the priority is
- *			set correctly
- */
-int verify_priority(int i)
-{
-	struct sched_param p;
-
-	if ((sched_getparam(0, &p)) == 0) {
-		if (p.sched_priority == testcases[i].priority) {
-			return 1;
-		} else {
-			tst_resm(TWARN, "sched_getparam() returned priority"
-				 " value as %d", p.sched_priority);
-			return 0;
-		}
-	}
-
-	tst_resm(TWARN, "sched_getparam() failed");
-	return 0;
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
