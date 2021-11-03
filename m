Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9C444BD5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 00:57:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E2723C7283
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 00:57:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7C893C7276
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 00:56:51 +0100 (CET)
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 261B7600735
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 00:56:46 +0100 (CET)
X-QQ-mid: bizesmtp44t1635983801tj03nz1a
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 04 Nov 2021 07:56:39 +0800 (CST)
X-QQ-SSF: 0140000000200040C000000A0000000
X-QQ-FEAT: EV8Lu6TF5XThr1NqHBSvWj/dwiCWC6OhV6BOmahOHkjfUZ/la0ddj9OYku034
 0/W8jKMTPwNeByFgGNbeLrNiDiyCokJINUt0Ck76ZBHBmCh6WVHWBRpVzW3j+0z3Z8Hshyc
 3VM4WdblpFe65sbPtnwZ3QJshUxBXisxjC8RJDNF9s/t9p9MEWXnXVFvhBmLXC84hQp+jff
 T3Wn0T+4qBgJ1gSziGNxGfRx2lFmtIukggAzkrwY09NdAP0xx1w++yiXIUVPjbLD0wzzy/7
 8KgvxjjFS65FN3XkvpVjzxO3Tog3TVR911XeO64wktiQF4fKQtRSL30pmUCRor9BtRtrY+h
 cnhAP7yfdJvspit0izYFDZTy6R1gfsa3zh/ZQpz
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  4 Nov 2021 07:56:31 +0800
Message-Id: <20211103235631.9709-2-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211103235631.9709-1-tangmeng@uniontech.com>
References: <20211103235631.9709-1-tangmeng@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] getrlimit/getrlimit02: Convert to new API
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
Cc: tangmeng <tangmeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 .../kernel/syscalls/getrlimit/getrlimit02.c   | 154 ++++--------------
 1 file changed, 29 insertions(+), 125 deletions(-)

diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit02.c b/testcases/kernel/syscalls/getrlimit/getrlimit02.c
index f477e209e..3cf7ebf6a 100644
--- a/testcases/kernel/syscalls/getrlimit/getrlimit02.c
+++ b/testcases/kernel/syscalls/getrlimit/getrlimit02.c
@@ -1,93 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
  *   Copyright (c) Wipro Technologies, 2002. All Rights Reserved.
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
+ *    AUTHOR		: Suresh Babu V. <suresh.babu@wipro.com>
  */

-/****************************************************************************
- *
- *    TEST IDENTIFIER	: getrlimit02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: test for checking error conditions for getrlimit(2)
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Suresh Babu V. <suresh.babu@wipro.com>
- *
- *    SIGNALS
- *      Uses SIGUSR1 to pause before test if option set.
- *      (See the parse_opts(3) man page).
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *      Verify that,
+ * Test for checking error conditions for getrlimit(2)
  *   1) getrlimit(2) returns -1 and sets errno to EFAULT if an invalid
  *	address is given for address parameter.
  *   2) getrlimit(2) returns -1 and sets errno to EINVAL if an invalid
  *	resource type (RLIM_NLIMITS is a out of range resource type) is
  *	passed.
- *
- * Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed and errno set == expected errno
- *		Issue sys call fails with expected return value and errno.
- *      Otherwise,
- *		Issue sys call failed to produce expected error.
- *
- *   Cleanup:
- *	Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  getrlimit02 [-c n] [-e] [-i n] [-I x] [-P x] [-p] [-t] [-h]
- *     where,  -c n  : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-p   : Pause for SIGUSR1 before startingt
- *		-t   : Turn on syscall timing.
- *		-h   : Display usage information.
- *
- ***************************************************************************/
-#include <stdio.h>
-#include <errno.h>
+ */
+
 #include <sys/resource.h>
-#include "test.h"
+#include "tst_test.h"

 #define RLIMIT_TOO_HIGH 1000

-char *TCID = "getrlimit02";
-
-static void cleanup(void);
-static void setup(void);
-
 static struct rlimit rlim;
-static struct test_case_t {
+static struct tcase {
 	int exp_errno;		/* Expected error no            */
 	char *exp_errval;	/* Expected error value string  */
 	struct rlimit *rlim;	/* rlimit structure             */
 	int res_type;		/* resource type                */

-} testcases[] = {
+} tcases[] = {
 #ifndef UCLINUX
 	/* Skip since uClinux does not implement memory protection */
 	{
@@ -97,63 +37,27 @@ static struct test_case_t {
 	EINVAL, "EINVAL", &rlim, RLIMIT_TOO_HIGH}
 };

-int TST_TOTAL = ARRAY_SIZE(testcases);

-int main(int ac, char **av)
+static void verify_getrlimit(unsigned int i)
 {
-	int i;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	/* Do initial setup */
-	setup();
-
-	/* check for looping state if -i option is given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-
-			/*
-			 * Test the system call.
-			 */
-			TEST(getrlimit(testcases[i].res_type,
-				       testcases[i].rlim));
-
-			if ((TEST_RETURN == -1) &&
-			    (TEST_ERRNO == testcases[i].exp_errno)) {
-				tst_resm(TPASS, "expected failure; got %s",
-					 testcases[i].exp_errval);
-			} else {
-				tst_resm(TFAIL, "call failed to produce "
-					 "expected error;  errno: %d : %s",
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			}
-		}
+	struct tcase *tc = &tcases[i];
+	/*
+	 * Test the system call.
+	 */
+	TEST(getrlimit(tc->res_type, tc->rlim));
+
+	if ((TST_RET == -1) &&
+	    (TST_ERR == tc->exp_errno)) {
+		tst_res(TPASS, "expected failure; got %s",
+			 tc->exp_errval);
+	} else {
+		tst_res(TFAIL, "call failed to produce "
+			 "expected error;  errno: %d : %s",
+			 TST_ERR, strerror(TST_ERR));
 	}
-	/* do cleanup and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/*
- * setup() - performs all one time setup for this test.
- */
-void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Pause if the option was specified */
-	TEST_PAUSE;
 }

-/*
- * cleanup()  - performs all one time cleanup for this test
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_getrlimit,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
