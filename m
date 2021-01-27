Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F319305529
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:02:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B10433C79E7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:02:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 407503C0194
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:02:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AAEAD200B80
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:01:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,378,1602518400"; d="scan'208";a="103890312"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Jan 2021 16:01:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id ACC794CE6781
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 16:01:53 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 Jan 2021 16:01:53 +0800
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 Jan 2021 16:01:52 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 27 Jan 2021 16:01:52 +0800
From: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 27 Jan 2021 16:01:47 +0800
Message-ID: <20210127080147.1265100-2-ruansy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127080147.1265100-1-ruansy.fnst@cn.fujitsu.com>
References: <20210127080147.1265100-1-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: ACC794CE6781.AAB76
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/time02: Convert to new API
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

Signed-off-by: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
---
 testcases/kernel/syscalls/time/time02.c | 165 ++++--------------------
 1 file changed, 28 insertions(+), 137 deletions(-)

diff --git a/testcases/kernel/syscalls/time/time02.c b/testcases/kernel/syscalls/time/time02.c
index 137a3fda4..b7f3e03fe 100644
--- a/testcases/kernel/syscalls/time/time02.c
+++ b/testcases/kernel/syscalls/time/time02.c
@@ -1,147 +1,38 @@
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
+ * Copyright (c) International Business Machines Corp., 2001
  */
 
-/*
- * Test Name: time02
- *
- * Test Description:
- *  Verify that time(2) returns the value of time in seconds since
- *  the Epoch and stores this value in the memory pointed to by the parameter.
- *
- * Expected Result:
- *  time() should return the time (seconds) since the Epoch and this value
- *  should be equal to the value stored in the specified parameter.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *	Verify the Functionality of system call
- *      if successful,
- *		Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *
- * Usage:  <for command-line>
- *  time02 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-f   : Turn off functionality Testing.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- * History
- *	07/2001 John George
- *		-Ported
- *
- * Restrictions:
- *  None.
- *
- */
+/*\
+ * [DESCRIPTION]
+ * Verify that time(2) returns the value of time in seconds since the Epoch and
+ * stores this value in the memory pointed to by the parameter.
+\*/
 
-#include <stdio.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
 #include <time.h>
-#include <sys/types.h>
-#include <stdint.h>
-
-#include "test.h"
-
-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
-
-char *TCID = "time02";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
-{
-	int lc;
-	time_t tloc;		/* time_t variables for time(2) */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call time() to get the time in seconds$
-		 * since Epoch.
-		 */
-		TEST(time(&tloc));
-
-		/* Check return code from time(2) */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "time(0) Failed, errno=%d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			if (tloc == TEST_RETURN) {
-				tst_resm(TPASS, "time() returned value "
-					 "%ld, stored value %jd are same",
-					 TEST_RETURN, (intmax_t) tloc);
-			} else {
-				tst_resm(TFAIL, "time() returned value "
-					 "%ld, stored value %jd are "
-					 "different", TEST_RETURN,
-					 (intmax_t) tloc);
-			}
-
-		}
-		tst_count++;	/* incr. TEST_LOOP counter */
-	}
+#include <errno.h>
 
-	cleanup();
-	tst_exit();
-}
+#include "tst_test.h"
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void verify_time(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	time_t tloc;
+
+	TEST(time(&tloc));
+
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "time(&tloc)");
+	else
+		if (tloc == TST_RET)
+			tst_res(TPASS, "time(&tloc) returned value %ld, "
+				       "stored value %jd are same",
+				       TST_RET, (intmax_t) tloc);
+		else
+			tst_res(TFAIL, "time(&tloc) returned value %ld, "
+				       "stored value %jd are different",
+				       TST_RET, (intmax_t) tloc);
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
+	.test_all = verify_time,
+};
-- 
2.30.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
