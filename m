Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914A3CFAC1
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AFFA3C81AA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADDCD3C9806
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:17 +0200 (CEST)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 14F571400B6A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:17 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id f30so29247484lfv.10
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnChm5UJVlNzR3XaxFa38l+3WZx/806uiMkKjiJJAUc=;
 b=1Qwnqx85fZhriNrjvFxv+RypCMbvThtYd32ugA0sD2nDGL5IN7dJbWer2/fJvB/m70
 NY77JftLMbYEsvlWAFpaEA0BdVKDQqDLHds6pGhlG3+UBL7UdqCYdXzlM+lgwlZ6uFoI
 dWVDtGy3dcsQ1yv8N6I3e1R2MvnUQSev4ta4CkHtXdICcap+p2FXIIDpaQ93PGD+qXXP
 tbY07VuLUY45oyVDgJ6sq/bOyd60m05Go8WzejoCB/qHcXyjFfUDw79DMXC7JxSE+UVH
 elofMb7cii7kg6sG/yrnrL3S+MtTeE7RE77bztH4Tqw8mUIVHgjwmYxCltv3KzihBha0
 qJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnChm5UJVlNzR3XaxFa38l+3WZx/806uiMkKjiJJAUc=;
 b=alLJ6DDNwLK4mmLbgYVKMMnxI2ER3WI3RVMmUXj77VIv9aq+nt0Ne6W+PmMEMP4XiE
 bIxjGkNmwAl10myML2+6aur2KXxmkxlNpTWgobJhT/DV4Jw/FnTVj3Mb0YRaA+PEBme9
 r1MStIUkeFm1hkMFOlY37qEj+cv3udnxPYyHNi/z78uTHx/Zw0dEwztpjyb1dENUp2wd
 oOredMrz1pKx9SfJHHdGdsk27lZd5+gnIFsh7Yw1EKVg0OCF/0x+fbHBprJH3iYths/d
 da2gd37yuenfv6zVxCk797ruHGIPYgcMJTKbYRD20us9epAl1yex5Bqm8VI7yU03/3VA
 FeGQ==
X-Gm-Message-State: AOAM532kWqoI3kUxNuGedKMJxd/C3kY2QAxxl9hjGfnXRg2o/KqZTX6x
 +jCzStc8/W4g4lN4nRoplZ16UTxTI3EZ
X-Google-Smtp-Source: ABdhPJyMshvZHI3JqGZ70/uPmUOMDir0DHk56rmAdiFJ8j8u07gHMUXmdfqcQazY+BIcv+67/aG00Q==
X-Received: by 2002:ac2:4f92:: with SMTP id z18mr21267563lfs.343.1626788056325; 
 Tue, 20 Jul 2021 06:34:16 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:16 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:23 +0300
Message-Id: <20210720133324.21752-16-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 15/16] syscalls/sched_getscheduler01: convert to new
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
 .../sched_getscheduler/sched_getscheduler01.c | 141 +++++-------------
 1 file changed, 37 insertions(+), 104 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
index f6bdf1a1b..e0da0510d 100644
--- a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
+++ b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
@@ -1,129 +1,62 @@
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
- *	sched_getscheduler01.C
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	Testcase to check sched_getscheduler() returns correct return value
+ * Testcase to check sched_getscheduler() returns correct return value.
  *
- * ALGORTIHM
- *	Call sched_setcheduler() to set the scheduling policy of the current
- *	process. Then call sched_getscheduler() to ensure that this is same
- *	as what set by the previous call to sched_setscheduler().
+ * [Algorithm]
  *
- *	Use SCHED_RR, SCHED_FIFO, SCHED_OTHER as the scheduling policies for
- *	sched_setscheduler().
+ * Call sched_setcheduler() to set the scheduling policy of the current
+ * process. Then call sched_getscheduler() to ensure that this is same
+ * as what set by the previous call to sched_setscheduler().
  *
- * USAGE:  <for command-line>
- *  sched_getscheduler01 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Use SCHED_RR, SCHED_FIFO, SCHED_OTHER as the scheduling policies for
+ * sched_setscheduler().
  *
- * RESTRICTION
- *	Must run test as root.
  */
 
 #include <errno.h>
-#include <sched.h>
 #include <stdio.h>
-#include "test.h"
-
-char *TCID = "sched_getscheduler01";
-int TST_TOTAL = 3;
 
-void setup(void);
-void cleanup(void);
+#include "tst_test.h"
+#include "tst_sched.h"
 
-struct test_case_t {
-	int prio;
+struct test_cases_t {
+	int priority;
 	int policy;
-} TC[] = {
-	/* set scheduling policy to SCHED_RR */
-	{
-	1, SCHED_RR},
-	    /* set scheduling policy to SCHED_OTHER */
-	{
-	0, SCHED_OTHER},
-	    /* set scheduling policy to SCHED_FIFO */
-	{
-	1, SCHED_FIFO}
+} tcases[] = {
+	{1, SCHED_RR},
+	{0, SCHED_OTHER},
+	{1, SCHED_FIFO}
 };
 
-int main(int ac, char **av)
+static void run(unsigned int n)
 {
-	int lc;
-	int i;
-	struct sched_param param;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
+	struct test_cases_t *tc = &tcases[n];
+	struct sched_param p = { .sched_priority = tc->priority };
 
-			param.sched_priority = TC[i].prio;
+	TST_EXP_PASS_SILENT(tst_sched_setscheduler(0, tc->policy, &p));
 
-			if (sched_setscheduler(0, TC[i].policy, &param) == -1)
-				tst_brkm(TBROK, cleanup,
-					 "sched_setscheduler failed");
+	TEST(tst_sched_getscheduler(0));
 
-			TEST(sched_getscheduler(0));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "call failed unexpectedly");
-				continue;
-			}
-
-			if (TEST_RETURN != TC[i].policy)
-				tst_resm(TFAIL,
-					 "policy value returned is not "
-					 "correct");
-			else
-				tst_resm(TPASS,
-					 "policy value returned is correct");
-		}
+	if (TST_RET == -1) {
+		tst_res(TFAIL, "sched_getscheduler() failed unexpectedly");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
+	if (TST_RET == tc->policy)
+		tst_res(TPASS, "got expected policy %d", tc->policy);
+	else
+		tst_res(TFAIL, "got policy %ld, expected %d", TST_RET, tc->policy);
 }
 
-void setup(void)
-{
-
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
