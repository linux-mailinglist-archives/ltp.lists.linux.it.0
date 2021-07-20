Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819D3CFAAA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCBB33C986E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EB813C981A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 968921400DC8
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:11 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id y42so35830561lfa.3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c78qejh+gOT9Pfpv0jV9lSIrgm4wrQXr+wgQYVJXJVo=;
 b=K/rjn+5nYKksWVN6Jy2/v39QoUoY5IMJuBm0Kvy0aGVnyh6VDylmd2E7L4LFiwtbiB
 rUmwEZas/VYG8R4HVLVabIiL+RFBFAizpf3EzqRiUNRRJP67hSD5V85EW8wGf+F1NFpM
 OtWUEAAr0a1qa540NGbLE6BQ4Buo4698jJzSc2EAL7+4hmyGdSOiZIg9wpYGlpLB/uur
 Ol+oALdeNN+gJE65RdmE66OiPlhttSinh4OhpjTLz+Iuj+0Cp+dZcQtFN7IIe7EzVuuN
 PPMqIpe34BpF+zbIjS4S4cYneTmwApaPdEXoPHbrmfvf3JDCIcTYc0vspvbYZpEa1qV9
 XdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c78qejh+gOT9Pfpv0jV9lSIrgm4wrQXr+wgQYVJXJVo=;
 b=futZhkCFxi8W37bcnf7lzvYU3r+yWJco8TcYm/oh5o3+BNPwIWX2Z3Ezzh+LuGqskH
 0EqmRc+jYdKnj7nA0iRtprx2q972nO1mtUvkSuKLmOT7nVyDaaMNk0OzUDH7MfuA8jQn
 XurKO7V7VwGSW8JngyLguxLkgI6ccNFFLEFTg6QTcH+sdbeecVLCJRmJyVU7ghnWzQk3
 l+c1XW9J8gQfvUzEoOjgJaEmf9GP0MYyYEixQmD1+XnGNX2d4zbXUs3MNVUT4UB88bWO
 fIljvEXtr9PG5pII6lisk2J9kfsDLsFdmV9xYY8kREXVoZ/b85ZZduysnTpvl9y/CTZs
 6a0w==
X-Gm-Message-State: AOAM530xhnhFPSnxCa4+1n+yAUMZpG4dGQLUijXMYBG1MuNTX4wa0gKO
 kfOrH3QObBsZFy/iyAV76kPitoZKmrCn
X-Google-Smtp-Source: ABdhPJw3VHDpVm4hAGdrjwQ+ZSWC67YIk3fEdDJKaoMcsGk58lE3O2vAHxv5ZzYQy2ntNIh/8tdSZw==
X-Received: by 2002:ac2:57c5:: with SMTP id k5mr22419476lfo.72.1626788050859; 
 Tue, 20 Jul 2021 06:34:10 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:10 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:15 +0300
Message-Id: <20210720133324.21752-8-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 07/16] syscalls/sched_setparam04: convert to new API
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
 .../sched_setparam/sched_setparam04.c         | 161 ++++--------------
 1 file changed, 30 insertions(+), 131 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c
index f6e017d3d..d80fd0d2a 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c
@@ -1,34 +1,14 @@
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
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- *
+ * AUTHOR: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
- /*******************************************************************
- *
- *    TEST IDENTIFIER   : sched_setparam04
- *
- *    EXECUTED BY       : anyone
- *
- *    TEST TITLE        : testing error conditions for sched_setparam(2)
- *
- *    TEST CASE TOTAL   : 4
- *
- *    AUTHOR            : Saji Kumar.V.R <saji.kumar@wipro.com>
+
+/*\
+ * [Description]
  *
- *    SIGNALS
- *      Uses SIGUSR1 to pause before test if option set.
- *      (See the parse_opts(3) man page).
+ * Testing error conditions for sched_setparam(2)
  *
  * DESCRIPTION
  * 	Verify that,
@@ -41,129 +21,48 @@
  *   4) sched_setparam(2) returns -1 sets errno to EINVAL if the
  *	value for p.sched_priority is other than 0 for scheduling
  *	policy, SCHED_OTHER
- *
- * ALGORITHM
- * Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if (system call failed (return=-1)) &
- *			   (errno set == expected errno)
- *              Issue sys call fails with expected return value and errno.
- *   Otherwise,
- *      Issue sys call returns unexpected value.
- *
- *  Cleanup:
- *        Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  sched_setparam04 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *		where,  -c n : Run n copies concurrently.
- *			-e   : Turn on errno logging.
- *			-h   : Show help screen
- *			-f   : Turn off functional testing
- *			-i n : Execute test n times.
- *			-I x : Execute test for x seconds.
- *			-p   : Pause for SIGUSR1 before starting
- *			-P x : Pause for x seconds between iterations.
- *			-t   : Turn on syscall timing.
- *
- *********************************************************************/
-
-#include <errno.h>
-#include <sched.h>
-#include <pwd.h>
-#include "test.h"
+ */
 
-static void cleanup(void);
-static void setup(void);
+#include <stdlib.h>
 
-static struct sched_param param = { 0 };
-static struct sched_param param1 = { 1 };
+#include "tst_test.h"
+#include "tst_sched.h"
 
-char *TCID = "sched_setparam04";
+static struct sched_param p = { .sched_priority = 0 };
+static struct sched_param p1 = { .sched_priority = 1 };
 
 static pid_t unused_pid;
 static pid_t inval_pid = -1;
 static pid_t zero_pid;
 
-static struct test_case_t {
+static struct test_cases_t {
 	char *desc;
 	pid_t *pid;
 	struct sched_param *p;
 	int exp_errno;
-	char err_desc[10];
-} test_cases[] = {
+} tcases[] = {
 	{
-	"test with non-existing pid", &unused_pid, &param, ESRCH, "ESRCH"}, {
-	"test invalid pid value", &inval_pid, &param, EINVAL, "EINVAL"}, {
-	"test with invalid address for p", &zero_pid, NULL, EINVAL, "EINVAL"}, {
-	"test with invalid p.sched_priority", &zero_pid, &param1, EINVAL,
-		    "EINVAL"}
+	"test with non-existing pid", &unused_pid, &p, ESRCH}, {
+	"test invalid pid value", &inval_pid, &p, EINVAL,}, {
+	"test with invalid address for p", &zero_pid, NULL, EINVAL}, {
+	"test with invalid p.sched_priority", &zero_pid, &p1, EINVAL}
 };
 
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc, ind;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		for (ind = 0; ind < TST_TOTAL; ind++) {
-			/*
-			 * call the system call with the TEST() macro
-			 */
-			TEST(sched_setparam(*(test_cases[ind].pid),
-					    test_cases[ind].p));
-
-			if ((TEST_RETURN == -1) &&
-			    (TEST_ERRNO == test_cases[ind].exp_errno)) {
-				tst_resm(TPASS, "expected failure; Got %s",
-					 test_cases[ind].err_desc);
-			} else {
-				tst_resm(TFAIL, "Call failed to produce "
-					 "expected error;  Expected errno: %d "
-					 "Got : %d, %s",
-					 test_cases[ind].exp_errno,
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			}
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
+	unused_pid = tst_get_unused_pid();
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void run(unsigned int n)
 {
-	unused_pid = tst_get_unused_pid(cleanup);
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	struct test_cases_t *tc = &tcases[n];
 
+	TST_EXP_FAIL(tst_sched_setparam(*tc->pid, tc->p), tc->exp_errno,
+		     "%s", tc->desc);
 }
 
-/*
- * cleanup() -  performs all the ONE TIME cleanup for this test at completion
- *		or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
