Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877936533E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:29:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B6A23C6C84
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:29:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 853F63C25D0
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:29:43 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 39CB81A0088C
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:29:42 +0200 (CEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FPZyF4ThKzrfhm
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:27:17 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 20 Apr 2021 15:29:31 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 20 Apr 2021 15:29:39 +0800
Message-ID: <20210420072939.202584-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419122246.7706-3-xieziyao@huawei.com>
References: <20210419122246.7706-3-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/unshare: Convert unshare02 to the new API
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

1. Convert unshare02 to the new API;
2. Check whether the returned value is correct in the child process
instead of the parent process;
3. Add a test case: use the CLONE_NEWNS parameter as a non-root user
and the expected return value is EPERM.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add setup() and cleanup() to set uid to "nobody" for EPERM tests;
2. Modify the incorrect code style.

 testcases/kernel/syscalls/unshare/unshare02.c | 236 ++++--------------
 1 file changed, 44 insertions(+), 192 deletions(-)

diff --git a/testcases/kernel/syscalls/unshare/unshare02.c b/testcases/kernel/syscalls/unshare/unshare02.c
index 18b8bf522..83cbdc599 100644
--- a/testcases/kernel/syscalls/unshare/unshare02.c
+++ b/testcases/kernel/syscalls/unshare/unshare02.c
@@ -1,218 +1,70 @@
-/******************************************************************************/
-/* Copyright (c) Crackerjack Project., 2007				   */
-/*									    */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or	  */
-/* (at your option) any later version.					*/
-/*									    */
-/* This program is distributed in the hope that it will be useful,	    */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of	    */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See		  */
-/* the GNU General Public License for more details.			   */
-/*									    */
-/* You should have received a copy of the GNU General Public License	  */
-/* along with this program;  if not, write to the Free Software	       */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
-/*									    */
-/******************************************************************************/
-/******************************************************************************/
-/*									    */
-/* File:	unshare02.c						   */
-/*									    */
-/* Description: This tests the unshare error() syscall			*/
-/*									    */
-/* Usage:  <for command-line>						 */
-/* unshare02 [-c n] [-e][-i n] [-I x] [-p x] [-t]			     */
-/*      where,  -c n : Run n copies concurrently.			     */
-/*	      -e   : Turn on errno logging.				 */
-/*	      -i n : Execute test n times.				  */
-/*	      -I x : Execute test for x seconds.			    */
-/*	      -P x : Pause for x seconds between iterations.		*/
-/*	      -t   : Turn on syscall timing.				*/
-/*									    */
-/* Total Tests: 2							     */
-/*									    */
-/* Test Name:   unshare02						     */
-/* History:     Porting from Crackerjack to LTP is done by		    */
-/*	      Manas Kumar Nayak maknayak@in.ibm.com>			*/
-/******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>
+ */
+
+/*
+ * [Description]
+ *
+ * Basic tests for the unshare error() syscall.
+ */

 #define _GNU_SOURCE

 #include <stdio.h>
 #include <sys/wait.h>
 #include <sys/types.h>
+#include <sys/param.h>
+#include <sys/syscall.h>
 #include <sched.h>
 #include <limits.h>
 #include <unistd.h>
-#include <sys/types.h>
-#include <sys/syscall.h>
-#include <errno.h>
 #include <pwd.h>
-#include <grp.h>
-#include <string.h>
-#include <sys/param.h>
-#include <stdio.h>

-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "config.h"

-char *TCID = "unshare02";
-int testno;
-int TST_TOTAL = 2;
-
 #ifdef HAVE_UNSHARE

-/* Extern Global Functions */
-/******************************************************************************/
-/*									    */
-/* Function:    cleanup						       */
-/*									    */
-/* Description: Performs all one time clean up for this test on successful    */
-/*	      completion,  premature exit or  failure. Closes all temporary */
-/*	      files, removes all temporary directories exits the test with  */
-/*	      appropriate TEST_RETURNurn code by calling tst_exit() function.       */
-/*									    */
-/* Input:       None.							 */
-/*									    */
-/* Output:      None.							 */
-/*									    */
-/* Return:      On failure - Exits calling tst_exit(). Non '0' TEST_RETURNurn code.   */
-/*	      On success - Exits calling tst_exit(). With '0' TEST_RETURNurn code.  */
-/*									    */
-/******************************************************************************/
-void cleanup(void)
-{
-
-	tst_rmdir();
-
-	/* Exit with appropriate TEST_RETURNurn code. */
+static struct test_case_t {
+	int mode;
+	int expected_error;
+	const char *desc;
+} tc[] = {
+	{-1, EINVAL, "-1"},
+	{CLONE_NEWNS, EPERM, "CLONE_NEWNS"}
+};

+static void run(unsigned int i)
+{
+	pid_t pid = SAFE_FORK();
+	if (pid == 0)
+		TST_EXP_FAIL(unshare(tc[i].mode), tc[i].expected_error,
+			     "unshare(%s)", tc[i].desc);
 }

-/* Local  Functions */
-/******************************************************************************/
-/*									    */
-/* Function:    setup							 */
-/*									    */
-/* Description: Performs all one time setup for this test. This function is   */
-/*	      typically used to capture signals, create temporary dirs      */
-/*	      and temporary files that may be used in the course of this    */
-/*	      test.							 */
-/*									    */
-/* Input:       None.							 */
-/*									    */
-/* Output:      None.							 */
-/*									    */
-/* Return:      On failure - Exits by calling cleanup().		      */
-/*	      On success - TEST_RETURNurns 0.				       */
-/*									    */
-/******************************************************************************/
-void setup(void)
+static void setup(void)
 {
-	/* Capture signals if any */
-	/* Create temporary directories */
-	TEST_PAUSE;
-	tst_tmpdir();
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
 }

-int main(int ac, char **av)
+static void cleanup(void)
 {
-	pid_t pid1;
-	int lc;
-	int rval;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		for (testno = 0; testno < TST_TOTAL; ++testno) {
-
-			TEST(pid1 = fork());	//call to fork()
-			if (TEST_RETURN == -1) {
-				tst_brkm(TFAIL | TTERRNO, cleanup,
-					 "fork() failed.");
-			} else if (TEST_RETURN == 0) {
-				TEST_RETURN = unshare(-1);
-				if (TEST_RETURN == 0) {
-					printf("Call unexpectedly succeeded\n");
-					rval = 1;
-				} else if (TEST_RETURN == -1) {
-					if (errno == EINVAL) {
-						printf("Got EINVAL\n");
-						rval = 0;
-					} else if (errno == ENOSYS) {
-						rval = 1;
-					} else {
-						perror("unshare failed");
-						rval = 2;
-					}
-				}
-				exit(rval);
-			} else {
-				SAFE_WAIT(cleanup, &rval);
-				if (rval != 0 && WIFEXITED(rval)) {
-					switch (WEXITSTATUS(rval)) {
-					case 1:
-						tst_brkm(TBROK, cleanup,
-							 "unshare call unsupported "
-							 "in kernel");
-						break;
-					case 2:
-						tst_brkm(TFAIL, cleanup,
-							 "unshare call failed");
-						break;
-					}
-				}
-			}
+	SAFE_SETEUID(0);
+}

-			TEST(pid1 = fork());	//call to fork()
-			if (pid1 == -1) {
-				tst_brkm(TFAIL | TTERRNO, cleanup,
-					 "fork() failed.");
-			} else if (TEST_RETURN == 0) {
-				TEST_RETURN = unshare(0);
-				if (TEST_RETURN == 0) {
-					tst_resm(TPASS, "Call succeeded");
-					rval = 0;
-				} else if (TEST_RETURN == -1) {
-					if (errno == ENOSYS)
-						rval = 1;
-					else {
-						perror("unshare failed");
-						rval = 2;
-					}
-				}
-				exit(rval);
-			} else {
-				SAFE_WAIT(cleanup, &rval);
-				if (rval != 0 && WIFEXITED(rval)) {
-					switch (WEXITSTATUS(rval)) {
-					case 1:
-						tst_brkm(TBROK, cleanup,
-							 "unshare call unsupported "
-							 "in kernel");
-						break;
-					case 2:
-						tst_brkm(TFAIL, cleanup,
-							 "unshare call failed");
-						break;
-					}
-				}
-			}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.cleanup = cleanup,
+	.setup = setup,
+	.test = run,
+};

-		}
-	}
-	cleanup();
-	tst_exit();
-}
 #else
-int main(void)
-{
-	tst_brkm(TCONF, NULL, "unshare is undefined.");
-}
+TST_TEST_TCONF("unshare is undefined.");
 #endif
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
