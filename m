Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BCC364197
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 14:23:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F1E63C1DEB
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 14:23:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 606403C12D1
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 14:23:00 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E869710007DE
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 14:22:58 +0200 (CEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FP5VP1MVDzpZVv
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 20:19:57 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 19 Apr 2021 20:22:47 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 19 Apr 2021 20:22:45 +0800
Message-ID: <20210419122246.7706-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419122246.7706-1-xieziyao@huawei.com>
References: <20210419122246.7706-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/unshare: convert unshare01 to the new API
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

1. Convert unshare01 to the new API;
2. Check whether the returned value of unshare() is correct in the
child process instead of the parent process.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/unshare/unshare01.c | 304 ++----------------
 1 file changed, 34 insertions(+), 270 deletions(-)

diff --git a/testcases/kernel/syscalls/unshare/unshare01.c b/testcases/kernel/syscalls/unshare/unshare01.c
index 52c774530..c5768afd3 100644
--- a/testcases/kernel/syscalls/unshare/unshare01.c
+++ b/testcases/kernel/syscalls/unshare/unshare01.c
@@ -1,291 +1,55 @@
-/*************************************************************************/
-/* Copyright (c) Crackerjack Project., 2007				 */
-/*									 */
-/* This program is free software;  you can redistribute it and/or modify */
-/* it under the terms of the GNU General Public License as published by  */
-/* the Free Software Foundation; either version 2 of the License, or	 */
-/* (at your option) any later version.					 */
-/*									 */
-/* This program is distributed in the hope that it will be useful,	 */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of	 */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See		 */
-/* the GNU General Public License for more details.			 */
-/*									 */
-/* You should have received a copy of the GNU General Public License	 */
-/* along with this program;  if not, write to the Free Software	       	 */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA*/
-/*									 */
-/*************************************************************************/
-/*************************************************************************/
-/*									 */
-/* File:	unshare01.c					   	 */
-/*									 */
-/* Description: This tests the unshare() syscall.		      	 */
-/*	     unshare() allows a process to disassociate parts of its	 */
-/*		execution context that are currently being shared with other 	*/
-/*		processes. Part of the execution context, such as the namespace	*/
-/*		,is shared implicitly when a new process is created using 	*/
-/*		fork(2) or vfork(2), while other parts, such as virtual memory	*/
-/*		, may be shared by explicit request when creating a process 	*/
-/*		using clone(2).							*/
-/*										*/
-/*		The main use of unshare() is to allow a process to control its	*/
-/*		shared execution context without creating a new process.	*/
-/*		 								*/
-/*										*/
-/*		The flags argument is a bit mask that specifies which parts of	*/
-/*		the execution context should be unshared. This argument is 	*/
-/*		specified by ORing together zero or more of the following cons-	*/
-/*		tants:								*/
-/*										*/
-/*		CLONE_FILES:							*/
-/*		    	Reverse the effect of the clone(2) CLONE_FILES flag. 	*/
-/*			Unshare	the file descriptor table, so that the calling 	*/
-/*			process no longer shares its file descriptors with any 	*/
-/*			other process.						*/
-/*		CLONE_FS:							*/
-/*			Reverse the effect of the clone(2) CLONE_FS flag.Unshare*/
-/*			file system attributes, so that the calling process no 	*/
-/*			longer shares its root directory, current directory, or	*/
-/*			umask attributes with any other process.		*/
-/*		CLONE_NEWNS:							*/
-/*		       This flag has the same effect as the clone(2) CLONE_NEWNS*/
-/*			flag. Unshare the namespace, so that the calling process*/
-/*			has a private copy of its namespacei which is not shared*/
-/*			with any other process. Specifying this flag automat-	*/
-/*			ically implies CLONE_FS as well. 			*/
-/*										*/
-/*		If flags is specified as zero, then unshare() is a no-op; no 	*/
-/*		changes are made to the calling process's execution context. 	*/
-/*									       	*/
-/* Usage:  <for command-line>						 	*/
-/* unshare01 [-c n] [-e][-i n] [-I x] [-p x] [-t]		     		*/
-/*      where,  -c n : Run n copies concurrently.			     	*/
-/*	      -e   : Turn on errno logging.				 	*/
-/*	      -i n : Execute test n times.				  	*/
-/*	      -I x : Execute test for x seconds.			    	*/
-/*	      -P x : Pause for x seconds between iterations.			*/
-/*	      -t   : Turn on syscall timing.					*/
-/*									    	*/
-/* Total Tests: 1							     	*/
-/*									    	*/
-/* Test Name:   unshare01					     		*/
-/* History:     Porting from Crackerjack to LTP is done by		    	*/
-/*	      Manas Kumar Nayak maknayak@in.ibm.com>				*/
-/********************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>
+ */
+
+/*
+ * [Description]
+ *
+ * Basic tests for the unshare() syscall.
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
-#include <pwd.h>
-#include <grp.h>
-#include <string.h>
-#include <sys/param.h>
-#include <stdio.h>

-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 #include "config.h"

-char *TCID = "unshare01";
-int testno;
-int TST_TOTAL = 1;
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
-/*	      appropriate return code by calling tst_exit() function.       */
-/*									    */
-/* Input:       None.							 */
-/*									    */
-/* Output:      None.							 */
-/*									    */
-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
-/*	      On success - Exits calling tst_exit(). With '0' return code.  */
-/*									    */
-/******************************************************************************/
-void cleanup(void)
-{
-
-	tst_rmdir();
-}
+static struct test_case_t {
+	int mode;
+	const char *desc;
+} TC[] = {
+	{CLONE_FILES,	"CLONE_FILES"},
+	{CLONE_FS,	"CLONE_FS"},
+	{CLONE_NEWNS,	"CLONE_NEWNS"},
+};

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
-/*	      On success - returns 0.				       */
-/*									    */
-/******************************************************************************/
-void setup(void)
+static void run(unsigned int i)
 {
-	tst_require_root();
-
-	/* Capture signals if any */
-	/* Create temporary directories */
-	TEST_PAUSE;
-	tst_tmpdir();
+	pid_t pid = SAFE_FORK();
+	if (pid == 0)
+		TST_EXP_PASS(unshare(TC[i].mode), "unshare(%s)", TC[i].desc);
 }

-int main(int ac, char **av)
-{
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
-			pid1 = fork();	//call to fork()
-			if (pid1 == -1) {
-				tst_brkm(TFAIL | TERRNO, cleanup,
-					 "fork failed");
-			} else if (pid1 == 0) {
-				switch (unshare(CLONE_FILES)) {
-				case 0:
-					printf("unshare with CLONE_FILES call "
-					       "succeeded\n");
-					rval = 0;
-					break;
-				case -1:
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
-						tst_brkm(TCONF, cleanup,
-							 "unshare not supported in "
-							 "kernel");
-						break;
-					default:
-						tst_brkm(TFAIL, cleanup,
-							 "unshare failed");
-					}
-				}
-			}
-
-			pid1 = fork();
-			if (pid1 == -1) {
-				tst_brkm(TFAIL | TERRNO, cleanup,
-					 "fork failed");
-			} else if (pid1 == 0) {
-				switch (unshare(CLONE_FS)) {
-				case 0:
-					printf("unshare with CLONE_FS call "
-					       "succeeded\n");
-					rval = 0;
-					break;
-				case -1:
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
-						tst_brkm(TCONF, cleanup,
-							 "unshare not supported in "
-							 "kernel");
-						break;
-					default:
-						tst_brkm(TFAIL, cleanup,
-							 "unshare failed");
-					}
-				}
-			}
-
-			pid1 = fork();
-			if (pid1 == -1) {
-				tst_brkm(TFAIL | TERRNO, cleanup,
-					 "fork() failed.");
-			} else if (pid1 == 0) {
-				switch (unshare(CLONE_NEWNS)) {
-				case 0:
-					printf("unshare call with CLONE_NEWNS "
-					       "succeeded\n");
-					rval = 0;
-					break;
-				case -1:
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
-						tst_brkm(TCONF, cleanup,
-							 "unshare not supported in "
-							 "kernel");
-						break;
-					default:
-						tst_brkm(TFAIL, cleanup,
-							 "unshare failed");
-					}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(TC),
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.test = run,
+};

-				}
-
-			}
-
-		}
-
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
