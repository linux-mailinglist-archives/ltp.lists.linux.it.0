Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BD3E2E88
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D23A3CABC6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE7823CA3D3
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E33191A006FC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:05 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id bq29so19176554lfb.5
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOmvIzKGJi485fK97S+wBQKDY+sSoNXg1trV5qOqYCk=;
 b=MI65ZveEjYh0y2qEbVoEH4zwlQa8049355LvQhQg9C+CUKv9ZDssQcDneBTFPLaTVc
 GrRKZMMKqqVFZT6QYxlAIRgDjJWjMyWqmVrgx1o3POnsHFTjcD4aGy6wgqYk+EEJfvVb
 vPHyX++1BQwaDCBDx+pxPExpYwkAH3PPsWZfrQJcKTLc8y7xqBRnWt9UJWGjNxioXsPh
 8wmqKMOv0ILWAofIwDsFXwuOambs8KJizgSkC8zXCO1fnJtHb7O3xXTTzBL7X03ZQ4HQ
 bqrKV0RBrjyAwN5NGBAOPf46feuKy3XEvK8RxlsbS2rhbaBZH+h4x7dPbLIz4pnl1kvP
 FYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOmvIzKGJi485fK97S+wBQKDY+sSoNXg1trV5qOqYCk=;
 b=m9x68dcgRgVL8SDOnPCuvvYMiKoQLkcWhGhUoCbJXrhBs6s603skKyNYu7zPSBFFVh
 OwXMQs9JfSprTrga1bHoHRw6lH9j6EudmfWB8IFsglvDR2c7DLtT5IIgrrl/Iwipotiv
 T+ksYqt37jxv0fOgUYuC2zXgw+nchDU2WOmME+iVprA9xw7/1uCGZS7Gl+qSamaCZ/No
 Nw8gqhR597hJwSmySAkO95Lwy8/2MtvUrrk+b74nyuWairNL2bBs+3WwmRVZrFkOLbL4
 C3kks8rXKO9G/ZZmH0dQtR76okD7GrftzVnWOdFJqZG4KhvJEisfS7qRWDIJVY9EgtM/
 crdg==
X-Gm-Message-State: AOAM532Unzzu443Z/u2UF5ua1ksl/Q+MQWV4TGNYA/ogcHUZI9WZlacu
 Bm7DFSiZKEasWzMdUvWiEA6ReKGbW8WC
X-Google-Smtp-Source: ABdhPJxQdp0FRAhMpcOhCIidGfqfVJvaSgdK9xD14kEiXYXfTVPgdBTroUSC+XYYk1LsGN1bvj/c+A==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr8272467lfm.631.1628268485061; 
 Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:04 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:21 +0300
Message-Id: <20210806164730.51040-8-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/16] syscalls/sched_setparam04: convert to new API
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
 .../sched_setparam/sched_setparam04.c         | 167 ++++--------------
 1 file changed, 36 insertions(+), 131 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam04.c
index f6e017d3d..1c00f5eb6 100644
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
@@ -41,129 +21,54 @@
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
-
-static void cleanup(void);
-static void setup(void);
+ */
 
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
+static struct sched_variants variants[] = {
+	{ .sched_setparam = libc_sched_setparam, .desc = "libc" },
+	{ .sched_setparam = sys_sched_setparam,  .desc = "syscall" },
+};
+
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
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 
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
+	struct sched_variants *tv = &variants[tst_variant];
+	struct test_cases_t *tc = &tcases[n];
 
+	TST_EXP_FAIL(tv->sched_setparam(*tc->pid, tc->p), tc->exp_errno, "%s", tc->desc);
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
+	.test_variants = ARRAY_SIZE(variants),
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
