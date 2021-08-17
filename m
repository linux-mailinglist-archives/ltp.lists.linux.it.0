Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194D3EE1FD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 03:14:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E80FC3C59E9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 03:14:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C8593C19F3
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 03:14:55 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C461C1400BC8
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 03:14:52 +0200 (CEST)
X-QQ-mid: bizesmtp44t1629162878tmmr32e7
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 17 Aug 2021 09:14:33 +0800 (CST)
X-QQ-SSF: 0140000000200020B000B00A0000000
X-QQ-FEAT: 8xd5gS3i22r0s5Zmb5qtBAQ0X3wnNbbqwcw81OQUp4EEqkicxqDoB+cDh2o5z
 kkWgvBPpfNbH+ArV2lLHSolGvgQSqc9Bk2IONflOs5ZQy+GfZUTYeTbECGw+CTma+dHpWZ1
 xk0s8lNx8kRDc6QUL853UjJKOnknUqapiQOQdwfdvbN+7RHaWO540UelR+ZHaJPmxoI7i7H
 PlAXP4qlvhsYM9JLLNMrIbR7wpEX0BXGYgAqoRxoHa5NZCY92aw3ZUV0F8b1GEVaJSUAiF8
 D1W+2dnUzktVbZ1cCG5XENaqqa4PZzTTkJu7qjxTn9E2euELouhdatYLATVF99nXxEPA==
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 17 Aug 2021 09:14:31 +0800
Message-Id: <20210817011431.10648-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/sync_file_range01: Convert to new API
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
Cc: sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
---
 .../sync_file_range/sync_file_range01.c       | 250 ++++--------------
 1 file changed, 47 insertions(+), 203 deletions(-)

diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
index 3a9718376..24a0ba104 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range01.c
@@ -1,250 +1,94 @@
-/******************************************************************************
- *				sync_file_range01.c
- *	    Copyright (c) International Business Machines  Corp., 2008
- *			    Email: bnpoorni@in.ibm.com
- *****************************************************************************/
-
-/******************************************************************************/
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
-
-/*****************************************************************************
- *    TEST IDENTIFIER  		: sync_file_range01			  $
- *									  $
- *    EXECUTED BY	       : anyone				    $
- *
- *    TEST TITLE		: Checks for Errors from sync_file_range()
- *
- *    TEST CASE TOTAL  		: 5
- *
- *    CPU ARCHITECTURES		: All
- *
- *    AUTHOR		    : B N Poornima
- *
- *    DATE STARTED	     : 21/07/2008
- *
- *    TEST CASES
- *    (Tests sync_file_range() for different test cases as reported in the man
- *      page)
- *
- *     INPUT SPECIFICATIONS
- *	     No input needs to be specified
- *	       sync_file_data() in-puts are specified through test_data
- *
- *     OUTPUT SPECIFICATIONS
- *	     sync_file_data() error message matches with the expected error
- *		message.
- *
- *     ENVIRONMENTAL NEEDS
- *		Kernel version 2.6.17 and above
- *	      Kernel version 2.6.22 and above in case of PPC and PPC64
- *
- *     SPECIAL PROCEDURAL REQUIREMENTS
- *	     None
- *
- *     DETAILED DESCRIPTION
- *	     This is a test case for sync_file_range() system call.
- *	     This test suite tests various error messages from the system call
- *	     If the error message received matches with the expected
- *	     test is considered passed else test fails
- *
- *	     Total 5 Test Cases :-
- *	     Various error messages from the man page
- *
- *     Setup:
- *	     Setup files on which sync_file_range is to be called
- *
- *     Test:
- *	     Loop if the proper options are given.
- *	     Execute system call
- *	       Check return code.
- *	     If error obtained matches with the expected error
- *	     PASS the test, otherwise TEST FAILS
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines  Corp., 2008
+ * Email: bnpoorni@in.ibm.com
+ */
+
+/*\
+ * [Description]
  *
- *     Cleanup:
- *	     Cleanup the temporary folder
+ * This is a test case for sync_file_range() system call.
+ * This test suite tests various error messages from the system call
+ * If the error message received matches with the expected
+ * test is considered passed else test fails
  *
- ******************************************************************************/
+ */
 #define _GNU_SOURCE

 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/utsname.h>
 #include <endian.h>
-#include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <unistd.h>

-#include "test.h"
+#include "tst_test.h"
 #include "lapi/sync_file_range.h"
 #include "check_sync_file_range.h"

 #ifndef SYNC_FILE_RANGE_WAIT_BEFORE
 #define SYNC_FILE_RANGE_WAIT_BEFORE 1
-#define SYNC_FILE_RANGE_WRITE 2	//DUMMY VALUES
+#define SYNC_FILE_RANGE_WRITE 2
 #define SYNC_FILE_RANGE_WAIT_AFTER 4
 #endif

 #define SYNC_FILE_RANGE_INVALID 8

-char *TCID = "sync_file_range01";
-char filename[255];		/* file used for testing */
-char spl_file[] = "/dev/null";
-int filed, sfd;			/* normal and special fds */
-int bfd = -1;			/* Bad file descriptor */
+static char filename[255];
+static const char spl_file[] = "/dev/null";
+static int filed, sfd;
+static int bfd = -1;

-struct test_data_t {
+struct test_case {
 	int *fd;
 	off64_t offset;
 	off64_t nbytes;
 	unsigned int flags;
 	int error;
-} test_data[] = {
-	{
-	&bfd, 0, 1, SYNC_FILE_RANGE_WRITE, EBADF}, {
-	&sfd, 0, 1, SYNC_FILE_RANGE_WAIT_AFTER, ESPIPE}, {
-	&filed, -1, 1, SYNC_FILE_RANGE_WAIT_BEFORE, EINVAL}, {
-	&filed, 0, -1, SYNC_FILE_RANGE_WRITE, EINVAL}, {
-	&filed, 0, 1, SYNC_FILE_RANGE_INVALID, EINVAL}
+} tcases[] = {
+	{&bfd, 0, 1, SYNC_FILE_RANGE_WRITE, EBADF},
+	{&sfd, 0, 1, SYNC_FILE_RANGE_WAIT_AFTER, ESPIPE},
+	{&filed, -1, 1, SYNC_FILE_RANGE_WAIT_BEFORE, EINVAL},
+	{&filed, 0, -1, SYNC_FILE_RANGE_WRITE, EINVAL},
+	{&filed, 0, 1, SYNC_FILE_RANGE_INVALID, EINVAL}
 };

-int TST_TOTAL = sizeof(test_data) / sizeof(test_data[0]);
-
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
+static void cleanup(void)
 {

-	/* close the file we have open */
-	if (close(filed) == -1) {
-		tst_resm(TWARN | TERRNO, "close(%s) failed", filename);
-	}
+	SAFE_CLOSE(filed);

-	tst_rmdir();
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
-/*	      On success - returns 0.				       */
-/*									    */
-/******************************************************************************/
-void setup(void)
+static void setup(void)
 {

-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	if (!check_sync_file_range())
+		tst_brk(TCONF, "sync_file_range() not supported");

-	TEST_PAUSE;
+	sprintf(filename, "tmpfile_%d", getpid());

-	tst_tmpdir();
+	filed = SAFE_OPEN(filename, O_RDWR | O_CREAT, 0700);

-	sprintf(filename, "tmpfile_%d", getpid());
-	if ((filed = open(filename, O_RDWR | O_CREAT, 0700)) == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT,0700) failed", filename);
-	}
+	sfd = SAFE_OPEN(spl_file, O_RDWR | O_CREAT, 0700);

-	sfd = open(spl_file, O_RDWR | O_CREAT, 0700);
 }

-/******************************************************************************/
-/*									    */
-/* Function:    main							  */
-/*									    */
-/* Description: Entry point to this test-case. It parses all the command line */
-/*	      inputs, calls the global setup and executes the test. It logs */
-/*	      the test status and results appropriately using the LTP API's */
-/*	      On successful completion or premature failure, cleanup() func */
-/*	      is called and test exits with an appropriate return code.     */
-/*									    */
-/* Input:       Describe input arguments to this test-case		    */
-/*	       -l - Number of iteration				     */
-/*	       -v - Prints verbose output				   */
-/*	       -V - Prints the version number			       */
-/*									    */
-/* Exit:       On failure - Exits by calling cleanup().		       */
-/*	     On success - exits with 0 exit value.			  */
-/*									    */
-/******************************************************************************/
-int main(int ac, char **av)
+static void run_test(unsigned int nr)
 {
+	struct test_case *tc = &tcases[nr];

-	int test_index = 0;
+	TST_EXP_FAIL(tst_syscall(__NR_sync_file_range, *(tc->fd),
+				tc->offset, tc->nbytes, tc->flags), tc->error);

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	if (!check_sync_file_range())
-		tst_brkm(TCONF, NULL, "sync_file_range() not supported");
-
-	setup();
-
-	for (test_index = 0; test_index < TST_TOTAL; test_index++) {
-		TEST(sync_file_range
-		     (*(test_data[test_index].fd),
-		      test_data[test_index].offset,
-		      test_data[test_index].nbytes,
-		      test_data[test_index].flags));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL,
-				 "call succeeded unexpectedly (%ld != -1)",
-				 TEST_RETURN);
-			continue;
-		}
-
-		if (TEST_ERRNO == test_data[test_index].error) {
-			tst_resm(TPASS | TTERRNO, "got expected error");
-		} else {
-			tst_resm(TFAIL | TTERRNO, "got unexpected error; "
-				 "expected %d", test_data[test_index].error);
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run_test,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
+
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
