Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF753CFABA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A24F3C9819
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BC7C3C9822
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:15 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2F151400DCF
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:14 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id i5so35835784lfe.2
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WKEgax0+5xOFxrjq6WFQPDlyaBMTRi8XFPxSveJsuc=;
 b=GN/pzb5KOU+pZ/Aa1qzbHV52zb2WY/kMirUhC0yAK+HQ3tK5ft4NTPKuGfHwPzZCNF
 69IOgFvVweRJ2Z3QGG17eTi0+oMnAqg0VrRPb5Gy21DCPV28o8tTGs6vm0kLH/iChacr
 PfkHS4WdHixjTQjHHw0VlPLJZpQldngGTVR76oPWhQF9H4y4Lx5kMcEj8lJvcRhEBCRi
 aNBwP7x7PwI6JmF3m/5iDYW1vV4yyDybfI+BKUNd3/o3moHxe3djTW862dysKnvzJnIT
 PdGeWuEvRfcCAifHsXyri7UCdXURlpMDiaFPSr3qlrdoMrtS+uNPHtwsvDS34NqeqH5Z
 yzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4WKEgax0+5xOFxrjq6WFQPDlyaBMTRi8XFPxSveJsuc=;
 b=ubB7AbbLgOMudZLMbM2fET/whZc/sqWAReTdQUMXpR1ldrQEkUDT/JZLkJ0wXuHyZP
 BbknkDodu1SU+8Dfv417OdCH2eqCkGqKmx7Rf50D2vNXwDbHo0I7qE8klWP3b2QJ4/Y0
 xNH7fVWJ3TnJO6n88/S8rxMQmdOhUxHEZobLn1S98AfJma7PkjuQ777uST0JIy/tIMKS
 YE3sDcgEwE93FBxlCeh5azsplbAflFDVbbczS3MB/GhtaO09+XgZwJygoK8i211cD8pi
 0iBMb9hlPVezBA+RIH4f/NxFhq77qX1Xkm2v0fQNflsAr9DQnCZk2h4TA/U34CFmnvcH
 RBUQ==
X-Gm-Message-State: AOAM531wjLc30H43MjWJtEZZLtVL9jLGj5XsezsWXT7rouIuIxo7gYSL
 r4DgohzGHMC5VxholRIk1vngcNgL/RqU
X-Google-Smtp-Source: ABdhPJxMNFXNVht0hs+iU3nY11gTbRPBgGwlfuCWKP+VHgDAGP9iV8LCt9U+otMl9WXAV7XiTAA/kg==
X-Received: by 2002:ac2:5d69:: with SMTP id h9mr21059941lft.603.1626788054075; 
 Tue, 20 Jul 2021 06:34:14 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:13 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:20 +0300
Message-Id: <20210720133324.21752-13-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 12/16] syscalls/sched_setscheduler01: convert to new
 API
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
 .../sched_setscheduler/sched_setscheduler01.c | 171 +++++-------------
 1 file changed, 42 insertions(+), 129 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
index 1cbce15d0..2feaa60d5 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler01.c
@@ -1,160 +1,73 @@
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
- *
- * DESCRIPTION
- *	Testcase to test whether sched_setscheduler(2) sets the errnos
- *	correctly.
+/*\
+ * [Description]
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
+ * Testcase to test whether sched_setscheduler(2) sets the errnos
+ * correctly.
  *
- * USAGE:  <for command-line>
- *  sched_setscheduler01 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * [Algorithm]
  *
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
-
-char *TCID = "sched_setscheduler01";
+#include "tst_test.h"
+#include "tst_sched.h"
 
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
-
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
+	struct test_cases_t *tc = &tcases[n];
 
-	TEST_PAUSE;
+	TST_EXP_FAIL(tst_sched_setscheduler(*tc->pid, tc->policy, tc->p), tc->error);
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
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
