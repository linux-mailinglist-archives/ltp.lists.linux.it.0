Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D63E2E96
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 220DF3CAE3F
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A45F3CAA87
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:11 +0200 (CEST)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 682A310005FA
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id h17so1439678ljh.13
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRZu8cUOI2NMkieckLdO+GThYffCcmNC0uDtDET9Ppc=;
 b=OvEbOuWUkEr13lp1EF1dNQt1BMITiorsWqcRncq4muuX7xQyYJCNbcpoWYQYTubcKS
 cnpeF+hFNR2Nq0fOJ/I6w555y49emvFvEfUYUKlnvF7ytFZ/mcMShrzbVAgJr3bueGIN
 jA30LbjESfHa4+BeO+tKpcrdZUzNxMQOKgVKWmmFib1ZUoKOYB+yDtqqoBtdq5YQe0xT
 qBKl4XzvXIUZhRkYe5QJZY59YMS+zfCwkJPBn6I6HyU30QkNwb7ZE0fgSX6FtTxaLGC6
 26iXMUuUqU2C+vzG4AoexihkJ57he0RbfSGnNxR63T2D/FyMy0nk1sVUtXTeQCChI8yP
 ixVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRZu8cUOI2NMkieckLdO+GThYffCcmNC0uDtDET9Ppc=;
 b=kGqWP+4vq24CYuOXNavEDK/sAbNzmGQJzOIyKFsRJuy1nYuo6B+3bfC+m2DKuTjXgA
 BK3E+crv+EdjC5+k4Ti0yR4WWNoUYOpoaP3MnTpDxUf2j2hJjsy/KloucycOwgpqIuTl
 ms/y6/F530eLh4FqcIAahpWMnxUqgjFeKK6uGJ9Kdu7wsC5uC1zHiWOJroO76zKowpT5
 9Q5RnF4YQDgVRyhTCe8uU40SfW879btiljWep4DkMIfOy5y5WTA9Exh2lCLD4sr6vk+h
 ZiFaUxPfCwLvPH7oG9aOAqZ0s5cSlFPommYPgvpBwgU5msHXG/dMCBANNwJ0u8DCL+Uw
 MeHw==
X-Gm-Message-State: AOAM530aDaYho3NyoWdrJakndLDVXVMLhbCf+7laOUedgw0AYXgsg5Tg
 gOzaPJcmNeJNpkH18rCafWje0hh1NWOO
X-Google-Smtp-Source: ABdhPJwbPpW354NkCchPHvD1ipj9yxxZKufeeKl9+DGXU0U370EGUoF7fa1fWjWWqK6o1e9vGgmNQw==
X-Received: by 2002:a2e:b8c9:: with SMTP id s9mr7112615ljp.339.1628268489676; 
 Fri, 06 Aug 2021 09:48:09 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:09 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:29 +0300
Message-Id: <20210806164730.51040-16-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 15/16] syscalls/sched_getscheduler01: convert to
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
 .../sched_getscheduler/sched_getscheduler01.c | 154 ++++++------------
 1 file changed, 50 insertions(+), 104 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
index f6bdf1a1b..ebef6c3a5 100644
--- a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
+++ b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler01.c
@@ -1,129 +1,75 @@
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
+
+static struct sched_variants variants[] = {
+	{ .sched_setscheduler = libc_sched_setscheduler,
+	  .sched_getscheduler = libc_sched_getscheduler,
+	  .desc = "libc"
+	},
+	{ .sched_setscheduler = sys_sched_setscheduler,
+	  .sched_getscheduler = sys_sched_getscheduler,
+	  .desc = "syscall"
+	},
+};
 
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
+	struct sched_variants *tv = &variants[tst_variant];
+	struct test_cases_t *tc = &tcases[n];
+	struct sched_param p = { .sched_priority = tc->priority };
 
-		for (i = 0; i < TST_TOTAL; i++) {
+	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, tc->policy, &p));
 
-			param.sched_priority = TC[i].prio;
-
-			if (sched_setscheduler(0, TC[i].policy, &param) == -1)
-				tst_brkm(TBROK, cleanup,
-					 "sched_setscheduler failed");
-
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
-	}
-
-	cleanup();
-	tst_exit();
+	TEST(tv->sched_getscheduler(0));
+	if (TST_RET == tc->policy)
+		tst_res(TPASS, "got expected policy %d", tc->policy);
+	else
+		tst_res(TFAIL | TERRNO, "got policy %ld, expected %d", TST_RET, tc->policy);
 }
 
-void setup(void)
+static void setup(void)
 {
-
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 }
 
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
