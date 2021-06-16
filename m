Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED63A9647
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E2A43C65EF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10DDE3C2DD3
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:13 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F15831A01134
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:11 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G4g1z74Xrz6yG0
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 17:32:07 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:07 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:06 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 16 Jun 2021 17:36:06 +0800
Message-ID: <20210616093606.214856-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093606.214856-1-xieziyao@huawei.com>
References: <20210616093606.214856-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/getrusage: Convert getrusage01 to the
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

Convert getrusage01 to the new API.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/getrusage/getrusage01.c   | 132 +++---------------
 1 file changed, 23 insertions(+), 109 deletions(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage01.c b/testcases/kernel/syscalls/getrusage/getrusage01.c
index ef8df586d..628726907 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage01.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage01.c
@@ -1,120 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: getrusage01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for getrusage(2)
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the getrusage(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  if return code == 0
- *		Test Passed
- *	  else
- *		Test Failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  getrusage01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f]
- * 			     [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
- *
- ****************************************************************/
-
-#include <errno.h>
-#include <sched.h>
-#include <sys/resource.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();

-char *TCID = "getrusage01";
-int who[2] = { RUSAGE_SELF, RUSAGE_CHILDREN };
-
-int TST_TOTAL = 2;
-
-int main(int ac, char **av)
-{
-
-	int lc, i;
-	struct rusage usage;
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
-			TEST(getrusage(who[i], &usage));
+/*\
+ * [Description]
+ *
+ * Test that getrusage() with RUSAGE_SELF and RUSAGE_CHILDREN succeeds.
+ */

-			if (TEST_RETURN == 0)
-				tst_resm(TPASS, "getrusage passed");
-			else
-				tst_resm(TFAIL | TTERRNO, "getrusage failed");
-		}
-	}
+#include "tst_test.h"

-	cleanup();
-	tst_exit();
+struct rusage usage;

-}
+struct test_case_t {
+	int who;
+	char *desc;
+} tc[] = {
+	{RUSAGE_SELF, "RUSAGE_SELF"},
+	{RUSAGE_CHILDREN, "RUSAGE_CHILDREN"},
+};

-void setup(void)
+static void run(unsigned int i)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
+	TST_EXP_PASS(getrusage(tc[i].who, &usage), "getrusage(%s, &usage)", tc[i].desc);
 }

-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
