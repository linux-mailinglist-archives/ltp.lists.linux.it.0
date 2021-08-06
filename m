Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3AB3E2E91
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A07A3CABD7
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F5463CA3EA
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:09 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9948E20005E
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:08 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id u3so19102610lff.9
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tvCuUBuBONmqeV+eG7zL0Gjavga0u5ckk6QGAml40Ko=;
 b=VNILxxmtZzcLlzurAiZUwqaaegrs1qG8fPnRR8Fd9tSyVrjgAjdqJ8grazTR0Cw/TO
 Za+Y8BycF1gkYG6QV/t76vkJ0VWZTh2kZPAQWgxGzhfCNPg8GPvAzAQpOOpHnqw2ziyR
 yAnA30oFdRtxCfNLwEyQmp88iVMFnIRByBLL9ny5AbC3iLVVucanITftAY5QZKCe1bWt
 H3zVi7fuoHQClKOB7X5y2ibSRU/TAw0VqbiNxx3wHjVOHgrBqoI8CD7BqCjlKHVIRfci
 Dra9NT8AotInknLjqCrGKckJiET4v8Y0F/xYvlmgwIM3DzICKVZPCaM+CM+NTHnJ3Xal
 Gdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvCuUBuBONmqeV+eG7zL0Gjavga0u5ckk6QGAml40Ko=;
 b=Zwg3ZTNQUg792A0o9HAT6C5n6jEBejjxt9WoxzD54mXwostYTNfGHNr104e6UWM4Ct
 DxU0YCW6mirKjPG+wLApqBx9RlS5N3+yXvMiZc4xNb5jFghE1shCGkIvEZLktum4WTrT
 jHvZm9whdJSh7KBIWxm/UGTNwfxQvOB9Cxth8gxbo6w/83tJrwcix53W2Dpo3kmt3jH1
 a3Ox2lBvMPp+p5LyR71pLZRlx6yiC5JvzCwEWApFvD9f/so4GFssm/SObtD01we0Bs+/
 /WESaqqpEjBQ5EJmWie2t6ojGdrJDlMosoAoUEroq45keZxXLZuM6rLriysF93hS+vHv
 5lvQ==
X-Gm-Message-State: AOAM532xEdv5bHbKxMYkXbADjZwWopHyhjyS1xib63Zznmkd+ea5nMcn
 clWoYCZvkrw0LSwcoZbAmzewkPgbY3Kr
X-Google-Smtp-Source: ABdhPJzZgC6RzOgH9F4Pyhus3weDhua6zGP8jzmr+JBOZIQrYpANUdxtKPVdHGtgJV2Mde4R772ooA==
X-Received: by 2002:a05:6512:3ca8:: with SMTP id
 h40mr8387627lfv.10.1628268487830; 
 Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:26 +0300
Message-Id: <20210806164730.51040-13-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 12/16] syscalls/sched_setscheduler01: convert to
 new API
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
 .../sched_setscheduler/sched_setscheduler01.c | 180 +++++-------------
 1 file changed, 52 insertions(+), 128 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
index 1cbce15d0..5c81a8899 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
@@ -1,160 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
+ * Copyright (c) International Business Machines  Corp., 2001
  */
 
-/*
- * NAME
- *	sched_setscheduler01.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	Testcase to test whether sched_setscheduler(2) sets the errnos
- *	correctly.
+ * Testcase to test whether sched_setscheduler(2) sets the errnos
+ * correctly.
  *
- * ALGORITHM
- *	1.	Call sched_setscheduler with an invalid pid, and expect
- *	ESRCH to be returned.
- *	2.	Call sched_setscheduler with an invalid scheduling policy,
- *	and expect EINVAL to be returned.
- *	3.	Call sched_setscheduler with an invalid "param" address,
- *	which lies outside the address space of the process, and expect
- *	EFAULT to be returned.
- *	4.	Call sched_setscheduler with an invalid priority value
- *	in "param" and expect EINVAL to be returned
+ * [Algorithm]
  *
- * USAGE:  <for command-line>
- *  sched_setscheduler01 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	None
+ * 1. Call sched_setscheduler with an invalid pid, and expect
+ * ESRCH to be returned.
+ * 2. Call sched_setscheduler with an invalid scheduling policy,
+ * and expect EINVAL to be returned.
+ * 3. Call sched_setscheduler with an invalid "param" address,
+ * which lies outside the address space of the process, and expect
+ * EFAULT to be returned.
+ * 4.Call sched_setscheduler with an invalid priority value
+ * in "param" and expect EINVAL to be returned
  */
+
 #include <stdio.h>
 #include <errno.h>
-#include <sched.h>
 #include <pwd.h>
-#include "test.h"
 
-#define SCHED_INVALID	99
+#include "tst_test.h"
+#include "tst_sched.h"
 
-char *TCID = "sched_setscheduler01";
-
-struct sched_param param;
-struct sched_param param1 = { 1 };
-
-void setup(void);
-void cleanup(void);
+#define SCHED_INVALID	99
 
+static struct sched_param p;
+static struct sched_param p1 = { .sched_priority = 1 };
 static pid_t unused_pid;
 static pid_t init_pid = 1;
 static pid_t zero_pid;
 
-struct test_case_t {
+static struct sched_variants variants[] = {
+	{ .sched_setscheduler = libc_sched_setscheduler, .desc = "libc" },
+	{ .sched_setscheduler = sys_sched_setscheduler, .desc = "syscall" },
+};
+
+struct test_cases_t {
 	pid_t *pid;
 	int policy;
 	struct sched_param *p;
 	int error;
-} TC[] = {
+} tcases[] = {
 	/* The pid is invalid - ESRCH */
-	{
-	&unused_pid, SCHED_OTHER, &param, ESRCH},
-	    /* The policy is invalid - EINVAL */
-	{
-	&init_pid, SCHED_INVALID, &param, EINVAL},
-#ifndef UCLINUX
-	    /* Skip since uClinux does not implement memory protection */
-	    /* The param address is invalid - EFAULT */
-	{
-	&init_pid, SCHED_OTHER, (struct sched_param *)-1, EFAULT},
-#endif
-	    /* The priority value in param invalid - EINVAL */
-	{
-	&zero_pid, SCHED_OTHER, &param1, EINVAL}
+	{&unused_pid, SCHED_OTHER, &p, ESRCH},
+	/* The policy is invalid - EINVAL */
+	{&init_pid, SCHED_INVALID, &p, EINVAL},
+	/* The param address is invalid - EFAULT */
+	{&init_pid, SCHED_OTHER, (struct sched_param *)-1, EFAULT},
+	/* The priority value in param invalid - EINVAL */
+	{&zero_pid, SCHED_OTHER, &p1, EINVAL}
 };
 
-int TST_TOTAL = ARRAY_SIZE(TC);
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		setup();
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(sched_setscheduler(*(TC[i].pid), TC[i].policy,
-						TC[i].p));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS, "expected failure - "
-					 "errno = %d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TFAIL, "unexpected error - %d : %s - "
-					 "expected %d", TEST_ERRNO,
-					 strerror(TEST_ERRNO), TC[i].error);
-			}
-		}
-	}
-	cleanup();
-
-	tst_exit();
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 
+	unused_pid = tst_get_unused_pid();
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void run(unsigned int n)
 {
-	unused_pid = tst_get_unused_pid(cleanup);
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	struct sched_variants *tv = &variants[tst_variant];
+	struct test_cases_t *tc = &tcases[n];
 
-	TEST_PAUSE;
+	TST_EXP_FAIL(tv->sched_setscheduler(*tc->pid, tc->policy, tc->p),
+		     tc->error, "sched_setscheduler(%d, %d, %p)",
+		     *tc->pid, tc->policy, tc->p);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
