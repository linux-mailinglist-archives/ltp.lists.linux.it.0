Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 678BA3CFAA9
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D76FC3C6CBF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C28D93C81A7
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:11 +0200 (CEST)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 164D31400DB3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:11 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id u13so35777024lfs.11
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsrcqaTW8fK4GyLWda+HZMSa4Bo8YKqm6Izoh3j/TCE=;
 b=otqw5geZBgJheN/NqRmCXULgDe6yg7pZBO0qHfpeASpm1Lo0xRPvZdrJNz4ZU7os4T
 naJZSK/8/8IGxYPgLdrhG2ccATmDt/EmXV0Sy23n6e2OmTCCvRm8ESONnT9iu7l2rpjS
 N2s2uRQbWFnwrQCR+9iKnjDRexxyp4+eMEAwMF3dCjb5kamGlVzVvm6+BSakbLIiVukI
 2hvIFx6Qlwh7sa9GiEWkNHEsYI8vSTHmC/mZPQwdnkVzw1eBnltsypY5G/K7x7ElpJ73
 nRjxA1e5yW1AX4lCDOEzgUXCJEMRMQ7CT8EFU15TuvpQZUyDHmfg/GXqbeO0eEOEmQjc
 6BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsrcqaTW8fK4GyLWda+HZMSa4Bo8YKqm6Izoh3j/TCE=;
 b=hcxWhkiXXVEYL/hQR8z5Bt/ruqLeG2wihHGj+MV1Oe2b9/VUMtKw8Ty5Bym6R9+Unw
 bQ4Otoz8Of6q4AnKQ8eas+hOm30RQVsppF478ZXxhsaNBxSc64N3LKnQMtvR9XFMBjda
 Pw1uv+8AxrvRMyXcif1Q14P+pKZI29a6UT4+sqTlxYXlgKpUFjqSQfhU+zExAmgOM39N
 S0tyyjRhspmDJmBUtDoiY3cPGEUhLqu1oVT9jMoQXEEI3p4DEWJv1oBQKgTJnl/KapZe
 Jg/QpJC6uMl28Kb9cUgknIm0e/+Oll0saAVKkd7+zZr9/1E+ZbMLzLjDWz6opw2+I1h5
 KVaw==
X-Gm-Message-State: AOAM5322lSAAmz2cMah8e8inuwYAaqUXl9RBwyvD1Gqame5LMloNitym
 lGHq5Q7CI+bFqXG/HAIXfxI6/UlWMPSn
X-Google-Smtp-Source: ABdhPJzT1pU8FXT1p4woS8hypfuur1e45EZEFF81mDFgqoPkWEELJpt+fidgFDAKuVH8g6wiIDUd8Q==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr22117294lfi.56.1626788050148; 
 Tue, 20 Jul 2021 06:34:10 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:09 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:14 +0300
Message-Id: <20210720133324.21752-7-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 06/16] syscalls/sched_setparam03: convert to new API
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
 .../sched_setparam/sched_setparam03.c         | 215 ++++--------------
 1 file changed, 40 insertions(+), 175 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
index 252364e2e..e9571a9b1 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam03.c
@@ -1,196 +1,61 @@
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
+ * This test forks a child and changes its parent's scheduling priority.
+ */
 
-char *TCID = "sched_setparam03";
-int TST_TOTAL = 1;
+#include <stdlib.h>
 
-static struct sched_param param = { NEW_PRIORITY };
+#include "tst_test.h"
+#include "tst_sched.h"
 
-int main(int ac, char **av)
+static void run(void)
 {
-
-	int lc;
-	int status;
+	struct sched_param p5 = { .sched_priority = 5 };
+	struct sched_param p;
 	pid_t child_pid;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
+	child_pid = SAFE_FORK();
 
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
+		TST_EXP_PASS_SILENT(tst_sched_setparam(getppid(), &p5));
+		exit(0);
 	}
+	tst_reap_children();
+
+	TST_EXP_PASS_SILENT(tst_sched_getparam(0, &p));
 
-	cleanup();
-	tst_exit();
+	if (p.sched_priority == p5.sched_priority)
+		tst_res(TPASS, "got expected priority %d", p.sched_priority);
+	else
+		tst_res(TFAIL, "got priority %d, expected %d",
+			p.sched_priority, p5.sched_priority);
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
+	struct sched_param p = { .sched_priority = 1 };
 
+	TST_EXP_PASS_SILENT(tst_sched_setscheduler(0, SCHED_FIFO, &p));
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
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
