Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD203E2E87
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41ACD3CA3BC
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7737C3CA3ED
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:05 +0200 (CEST)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D7E0F60080F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:04 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id x8so19162103lfe.3
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBJbH5jfACkLbijRnOsHtMT6CezRoGzQgqtUhVxzVdE=;
 b=nIlG9CcbLfdLsqUe5a7fJTva4n3PvWaYl2OvUB0DIBm6O+igM7sw04+tjRELo3hAqf
 dF6JAZE6IpIfADwBpvekbi7gOOWneaNL3V84MgAdDPmskxIzGuB+8ijQz8yfwH/ipw1Q
 nnxJMH4bpaavVmuh4YVjzQOmyQaZmoBhIDlDQOaUaZA/aDgH1MpHq4edAgkrNoP5VQ3N
 D4YpJYHvzv7zVNNGPUnLQon1XtsOWNR6cvkA9mz3SQ5mqOu0xwdlKnYqs6CiYflInKM3
 fBewbYDzQIf6NyKS8jdo5y6Ez29mSQG+5MqSZ/sVQiF2nIgqcQbLrjT8NnXYQu2gInSL
 50Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBJbH5jfACkLbijRnOsHtMT6CezRoGzQgqtUhVxzVdE=;
 b=ozcXV9emc+Ol0h0WBoEWwmagadABw0Mc4AqlCpCn4mtDAtQjkX5saOWQm9FcfMPUEZ
 VoT2qWqaybWZ5kFudMHbSP2QFZmUKhU4DhVzy7uxvsin0HlnseB7e/+fSCnU4rUBj6V1
 go2/Jhc5s6knam37E+bbzVs99OlKRbMxBqm3AUrbiT35W/dMM/EeU0JKykmfc51FwJYN
 6mJetdwvsWAL5OBhIRStRqQG4Xz1pu1U1opWce48ZrDiDX0CDcGGP4wkj+gHHBhUePtL
 k/6Zz7IDsmA7aso/77FV9BcJ9tjNunORxleUmzTkw+8MKOnuAqpCfkWV1KxtlUNOQ07O
 sv3Q==
X-Gm-Message-State: AOAM533aJ6zuTBARmNWRRHKjVW6WhQ4kNOU5OimCOHdRcFYdqfhZqc/U
 cnUc7T8GI43bvVHOrhuNAWqhScprylj0
X-Google-Smtp-Source: ABdhPJyZBi4VcAvc41XUQiwiBBP7y+Gp+m5oKLGuL0/jeNFWCYwf9ycMBSMaS0Ug+NcRuXrT3aS7Mw==
X-Received: by 2002:a19:6449:: with SMTP id b9mr8455815lfj.660.1628268484113; 
 Fri, 06 Aug 2021 09:48:04 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:03 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:19 +0300
Message-Id: <20210806164730.51040-6-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 05/16] syscalls/sched_setparam02: convert to new API
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
 .../sched_setparam/sched_setparam02.c         | 207 +++++-------------
 1 file changed, 52 insertions(+), 155 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
index 132cc9d6c..7ee6d393a 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam02.c
@@ -1,184 +1,81 @@
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
+static struct sched_variants variants[] = {
+	{ .sched_setparam = libc_sched_setparam,
+	  .sched_getparam = libc_sched_getparam,
+	  .sched_setscheduler = libc_sched_setscheduler,
+	  .desc = "libc"
+	},
+	{ .sched_setparam = sys_sched_setparam,
+	  .sched_getparam = sys_sched_getparam,
+	  .sched_setscheduler = sys_sched_setscheduler,
+	  .desc = "syscall"
+	},
+};
 
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
+static void run(unsigned int n)
 {
+	struct test_cases_t *tc = &tcases[n];
+	struct sched_variants *tv = &variants[tst_variant];
+	struct sched_param p = { .sched_priority = tc->param };
 
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, tc->policy, &p));
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	p.sched_priority = tc->priority;
+	TST_EXP_PASS_SILENT(tv->sched_setparam(0, &p));
 
-		tst_count = 0;
+	p.sched_priority = -1;
+	TST_EXP_PASS_SILENT(tv->sched_getparam(0, &p));
 
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
+	if (p.sched_priority == tc->priority) {
+		tst_res(TPASS, "got expected priority %d", p.sched_priority);
+	} else {
+		tst_res(TFAIL, "unexpected priority value %d, expected %d",
+			p.sched_priority, tc->priority);
 	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
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
-
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
+	.setup = setup,
+	.test = run,
+	.test_variants = ARRAY_SIZE(variants),
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
