Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4063E2E8A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A00443CAA8D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF7433CA3FE
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8C93210011D3
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:05 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id x8so19162158lfe.3
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBzYpVANtnkPVA4JOJQRoi+CCS1oFZ+sZoD47wszYwY=;
 b=erMd4gfQzsapHgdb1YiwCRk69xPztGS5W00JE5WDRIQ8vhayjMKNMYGQohlh6Hr3IA
 lNV/MFdPXUnpe8Xa3a9S7aNQBJcq6PdwENUtLVKzcq/isf45/uif0sNNme0vO/ccHu/q
 Jurlj0+7BpI+b/hFZg3pLuHC6jV48M6pJCDUXTb3sMT5TzLEo5oCwSo1e6HFSDpRFrcw
 4fc5SqfFb+9x2QRe0UiIL/8595iaK4yUGDUh/1DvaKYndAiI+3AzevWfeqncA6+OXf5N
 m49WaC98JbWCQZd8EjxUOzMpG1JcO7hukq2fgz9ZJZUEBpEKv5LKSXTUg9OAbQJnWmTA
 gCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBzYpVANtnkPVA4JOJQRoi+CCS1oFZ+sZoD47wszYwY=;
 b=oCr2fzlA6r/luI/EZmzP0bmmpHklHCvcQaVHVYjQoZYaodXvxggyMTMloVuv0df8lE
 F5TbY/Tw4xtsDbYOutF+q5XTq43FpshPvVAJ/y2ZWnKe1J6/7CArncAgxK6Vj7B25r95
 sxOWsAPBw+BZamsIBKxSXDFHHdEIjhyryh8F60urcBI8/QosnF4xV7cDle7bQHInIjz9
 mpax9rJCmWrwjZDyvd2NtEq1m3yMaqh5VPxMuxhRKZMUlTKWFII3A/WWUWEROzfjSqmc
 aYyuZEZcz6x2Y6uj0ou8pFQHd1T2HAyUzZwWTpQ446DRngpycnV9HDtrJycT1CV8pbtt
 k5nw==
X-Gm-Message-State: AOAM533srLcZ1PoTqMk+EAb/chRKylsJTUVsSy8ZFib8y59s4hC2BpkO
 tO6dYBgQhmVrypKVjtqOfJnNw1OcTqt1
X-Google-Smtp-Source: ABdhPJz+QjKmv4OCiStr0FYcQPBBi7cC0m53rAFv/GE7ybHVvvcRLEgSM6JNgYwIQ94Ri5LNq1xWRw==
X-Received: by 2002:a19:ac01:: with SMTP id g1mr8577822lfc.301.1628268484731; 
 Fri, 06 Aug 2021 09:48:04 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:04 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:20 +0300
Message-Id: <20210806164730.51040-7-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 06/16] syscalls/sched_setparam03: convert to new API
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
 .../sched_setparam/sched_setparam03.c         | 235 +++++-------------
 1 file changed, 58 insertions(+), 177 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
index 252364e2e..8c8d1e8d5 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
@@ -1,196 +1,77 @@
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
- *    TEST IDENTIFIER	: sched_setparam03
- *
- *    EXECUTED BY	: root / superuser
- *
- *    TEST TITLE	: Checks functionality for sched_setparam(2) for pid!=0
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
- *	This test forks a child & changes its parent's scheduling priority
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  Change scheduling policy to SCHED_FIFO
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 Fork a child
- *
- *	 CHILD:
- *	  Changes scheduling priority for parent
- *
- *	 PARENT:
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
- *  sched_setparam03 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Checks functionality for sched_setparam(2) for pid != 0
  *
- ****************************************************************/
-
-#include <err.h>
-#include <errno.h>
-#include <sched.h>
-#include <sys/wait.h>
-#include "test.h"
-
-#define NEW_PRIORITY 5
-
-static void setup();
-static void cleanup();
-static int verify_priority();
-
-char *TCID = "sched_setparam03";
-int TST_TOTAL = 1;
-
-static struct sched_param param = { NEW_PRIORITY };
+ * This test forks a child and changes its parent's scheduling priority.
+ */
 
-int main(int ac, char **av)
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "tst_sched.h"
+
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
+
+static void run(void)
 {
-
-	int lc;
-	int status;
+	struct sched_variants *tv = &variants[tst_variant];
+	struct sched_param p5 = { .sched_priority = 5 };
+	struct sched_param p;
 	pid_t child_pid;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	child_pid = SAFE_FORK();
 
-		tst_count = 0;
-
-		switch (child_pid = FORK_OR_VFORK()) {
-
-		case -1:
-			/* fork() failed */
-			tst_resm(TFAIL, "fork() failed");
-			continue;
-
-		case 0:
-			/* Child */
-
-			/*
-			 * Call sched_setparam(2) with pid = getppid() so that
-			 * it will set the scheduling parameters for parent
-			 * process
-			 */
-			TEST(sched_setparam(getppid(), &param));
-
-			if (TEST_RETURN == -1) {
-				err(0, "sched_setparam returned %ld",
-				    TEST_RETURN);
-			}
-			exit(1);
-
-		default:
-			/* Parent */
-			if ((waitpid(child_pid, &status, 0)) < 0) {
-				tst_resm(TFAIL, "wait() failed");
-				continue;
-			}
-
-			/*
-			 * Verify that parent's scheduling priority has
-			 * changed.
-			 */
-			if ((WIFEXITED(status)) && (WEXITSTATUS(status)) &&
-			    (verify_priority())) {
-				tst_resm(TPASS, "Test Passed");
-			} else {
-				tst_resm(TFAIL, "Test Failed");
-			}
-		}
+	if (!child_pid) {
+		/*
+		 * Call sched_setparam(2) with pid = getppid() so that
+		 * it will set the scheduling parameters for parent
+		 * process
+		 */
+		TST_EXP_PASS_SILENT(tv->sched_setparam(getppid(), &p5));
+		exit(0);
 	}
+	tst_reap_children();
 
-	cleanup();
-	tst_exit();
+	TST_EXP_PASS_SILENT(tv->sched_getparam(0, &p));
+
+	if (p.sched_priority == p5.sched_priority)
+		tst_res(TPASS, "got expected priority %d", p.sched_priority);
+	else
+		tst_res(TFAIL, "got priority %d, expected 5", p.sched_priority);
 }
 
-/* setup() - performs all ONE TIME setup for this test */
 void setup(void)
 {
-	struct sched_param p = { 1 };
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* Change scheduling policy to SCHED_FIFO */
-	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
-	}
+	struct sched_variants *tv = &variants[tst_variant];
+	struct sched_param p = { .sched_priority = 1 };
 
+	tst_res(TINFO, "Testing %s variant", tv->desc);
+	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, SCHED_FIFO, &p));
 }
 
-/*
- *cleanup() -   performs all ONE TIME cleanup for this test at
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
-int verify_priority(void)
-{
-	struct sched_param p;
-
-	if ((sched_getparam(0, &p)) == 0) {
-		if (p.sched_priority == NEW_PRIORITY) {
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
+	.forks_child = 1,
+	.needs_root = 1,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
