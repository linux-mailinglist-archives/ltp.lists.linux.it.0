Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4E1B4085
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:46:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2022B3C2979
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:46:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F03CC3C2965
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:46 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 84C221A00E34
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:46:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; d="scan'208";a="89476276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 18:45:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A3CF54BCC88E
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 18:34:40 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 18:45:15 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 18:45:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 22 Apr 2020 18:45:27 +0800
Message-ID: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A3CF54BCC88E.A1CEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] syscalls/pipe2_01: convert into new API
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
Content-Type: multipart/mixed; boundary="===============1913587017=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1913587017==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Merged pipe2_02.c into pipe2_01.c.

Also, add O_DIRECT flag test. This flag was introduced since
commit 9883035ae7ed ("pipes: add a "packetized pipe" mode for writing").

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/fcntl.h                       |   4 +
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/pipe2/.gitignore |   1 -
 testcases/kernel/syscalls/pipe2/pipe2_01.c | 234 ++++++---------------
 testcases/kernel/syscalls/pipe2/pipe2_02.c | 175 ---------------
 5 files changed, 65 insertions(+), 350 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c

diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
index 24aa46e1f..576a18daf 100644
--- a/include/lapi/fcntl.h
+++ b/include/lapi/fcntl.h
@@ -9,6 +9,10 @@
 #include <fcntl.h>
 #include <sys/socket.h>
 
+#ifndef O_DIRECT
+# define O_DIRECT 040000
+#endif
+
 #ifndef O_CLOEXEC
 # define O_CLOEXEC 02000000
 #endif
diff --git a/runtest/syscalls b/runtest/syscalls
index 9bb72beb2..6c240d375 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -915,7 +915,6 @@ pipe12 pipe12
 pipe13 pipe13
 
 pipe2_01 pipe2_01
-pipe2_02 pipe2_02
 pipe2_04 pipe2_04
 
 pivot_root01 pivot_root01
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 773450a48..14866e393 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,3 +1,2 @@
 /pipe2_01
-/pipe2_02
 /pipe2_04
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_01.c b/testcases/kernel/syscalls/pipe2/pipe2_01.c
index 5f3ad8f0f..038072127 100644
--- a/testcases/kernel/syscalls/pipe2/pipe2_01.c
+++ b/testcases/kernel/syscalls/pipe2/pipe2_01.c
@@ -1,186 +1,74 @@
-/******************************************************************************/
-/*                                                                            */
-/* Copyright (c) Ulrich Drepper <drepper@redhat.com>                          */
-/* Copyright (c) International Business Machines  Corp., 2009                 */
-/*                                                                            */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or          */
-/* (at your option) any later version.                                        */
-/*                                                                            */
-/* This program is distributed in the hope that it will be useful,            */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
-/* the GNU General Public License for more details.                           */
-/*                                                                            */
-/* You should have received a copy of the GNU General Public License          */
-/* along with this program;  if not, write to the Free Software               */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
-/*                                                                            */
-/******************************************************************************/
-/******************************************************************************/
-/*                                                                            */
-/* File:        pipe2_01.c                                                    */
-/*                                                                            */
-/* Description: This Program tests the new system call introduced in 2.6.27.  */
-/*              Ulrich´s comment as in:                                       */
-/* http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=ed8cae8ba01348bfd83333f4648dd807b04d7f08 */
-/*              says:                                                         */
-/* This patch introduces the new syscall pipe2 which is like pipe but it also */
-/* takes an additional parameter which takes a flag value.  This patch        */
-/* implements the handling of O_CLOEXEC for the flag.  I did not add support  */
-/* for the new syscall for the architectures which have a special sys_pipe    */
-/* implementation.  I think the maintainers of those archs have the chance to */
-/* go with the unified implementation but that's up to them.                  */
-/*                                                                            */
-/* The implementation introduces do_pipe_flags.  I did that instead of        */
-/* changing all callers of do_pipe because some of the callers are written in */
-/* assembler. I would probably screw up changing the assembly code.  To avoid */
-/* breaking code do_pipe is now a small wrapper around do_pipe_flags.  Once   */
-/* all callers are changed over to do_pipe_flags the old do_pipe function can */
-/* be removed.                                                                */
-/* The following test must be adjusted for architectures other than x86 and   */
-/* x86-64 and in case the syscall numbers changed.                            */
-/*                                                                            */
-/* Usage:  <for command-line>                                                 */
-/* pipe2_01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                              */
-/*      where,  -c n : Run n copies concurrently.                             */
-/*              -e   : Turn on errno logging.                                 */
-/*              -i n : Execute test n times.                                  */
-/*              -I x : Execute test for x seconds.                            */
-/*              -P x : Pause for x seconds between iterations.                */
-/*              -t   : Turn on syscall timing.                                */
-/*                                                                            */
-/* Total Tests: 1                                                             */
-/*                                                                            */
-/* Test Name:   pipe2_01                                                      */
-/*                                                                            */
-/* Author:      Ulrich Drepper <drepper@redhat.com>                           */
-/*                                                                            */
-/* History:     Created - Jan 13 2009 - Ulrich Drepper <drepper@redhat.com>   */
-/*              Ported to LTP                                                 */
-/*                      - Jan 13 2009 - Subrata <subrata@linux.vnet.ibm.com>  */
-/******************************************************************************/
-#include <fcntl.h>
+// SPDX-License-Identifier: GPL-2.0-or-late
+/*
+ * Copyright (c) Ulrich Drepper <drepper@redhat.com>
+ * Copyright (c) International Business Machines  Corp., 2009
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ *
+ * Author: Ulrich Drepper <drepper@redhat.com>
+ *
+ * History:
+ * Created - Jan 13 2009 - Ulrich Drepper <drepper@redhat.com>
+ * Ported to LTP - Jan 13 2009 - Subrata <subrata@linux.vnet.ibm.com>
+ * Converted into new api - Apri 15 2020 - Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <unistd.h>
-#include <sys/syscall.h>
-#include <errno.h>
-
-#include "test.h"
 #include "lapi/fcntl.h"
-#include "lapi/syscalls.h"
-
-char *TCID = "pipe2_01";
-int testno;
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
-/* Extern Global Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    cleanup                                                       */
-/*                                                                            */
-/* Description: Performs all one time clean up for this test on successful    */
-/*              completion,  premature exit or  failure. Closes all temporary */
-/*              files, removes all temporary directories exits the test with  */
-/*              appropriate return code by calling tst_exit() function.       */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
-/*              On success - Exits calling tst_exit(). With '0' return code.  */
-/*                                                                            */
-/******************************************************************************/
-void cleanup(void)
-{
+static int fds[2];
 
-	tst_rmdir();
-
-}
+static struct tcase {
+	int flags;
+	int cmd;
+	int check_read_end;
+	char *message;
+} tcases[] = {
+	{0, F_GETFD, 1, "Test pipe2 with 0 flag"},
+	{O_CLOEXEC, F_GETFD, 1, "Test pipe2 using O_CLOEXEC flag"},
+	/*
+	 * It may get EINVAL error on older kernel because this flag was
+	 * introduced since kernel 3.4. We only test flag in write end
+	 * because this flag was used to make pipe buffer marked with the
+	 * PIPE_BUF_FLAG_PACKET flag. In read end, kernel also checks buffer
+	 * flag instead of O_DIRECT. So it make no sense to check this flag
+	 * in fds[0].
+	 */
+	{O_DIRECT, F_GETFL, 0, "Test pipe2 using O_DIRECT flag"},
+	{O_NONBLOCK, F_GETFL, 1, "Test pipe2 using O_NONBLOCK flag"},
+};
 
-/* Local  Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    setup                                                         */
-/*                                                                            */
-/* Description: Performs all one time setup for this test. This function is   */
-/*              typically used to capture signals, create temporary dirs      */
-/*              and temporary files that may be used in the course of this    */
-/*              test.                                                         */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits by calling cleanup().                      */
-/*              On success - returns 0.                                       */
-/*                                                                            */
-/******************************************************************************/
-void setup(void)
+static void cleanup(void)
 {
-	/* Capture signals if any */
-	/* Create temporary directories */
-	TEST_PAUSE;
-	tst_tmpdir();
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+	if (fds[1] > 1)
+		SAFE_CLOSE(fds[1]);
 }
 
-int main(int argc, char *argv[])
+static void verify_pipe2(unsigned int n)
 {
-	int fd[2], i, coe;
-	int lc;
+	struct tcase *tc = &tcases[n];
+	int get_flag = 0, i = 0;
 
-	tst_parse_opts(argc, argv, NULL, NULL);
-	if ((tst_kvercmp(2, 6, 27)) < 0) {
-		tst_brkm(TCONF,
-			 NULL,
-			 "This test can only run on kernels that are 2.6.27 and higher");
+	tst_res(TINFO, "%s ", tc->message);
+	SAFE_PIPE2(fds, tc->flags);
+	for (i = 0; i < 2; i++) {
+		if (i == 0 && !tc->check_read_end)
+			continue;
+		get_flag = SAFE_FCNTL(fds[i], tc->cmd);
+		if ((get_flag && tc->flags) || (tc->flags == get_flag))
+			tst_res(TPASS, "pipe2 fds[%d] gets expected flag(%d)", i, tc->flags);
+		else
+			tst_res(TFAIL, "pipe2 fds[%d] doesn't get expected flag(%d), get flag(%d)",
+					i, tc->flags, get_flag);
 	}
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		for (testno = 0; testno < TST_TOTAL; ++testno) {
-			if (ltp_syscall(__NR_pipe2, fd, 0) != 0) {
-				tst_brkm(TFAIL, cleanup, "pipe2(0) failed");
-			}
-			for (i = 0; i < 2; ++i) {
-				coe = fcntl(fd[i], F_GETFD);
-				if (coe == -1) {
-					tst_brkm(TBROK, cleanup,
-						 "fcntl failed");
-				}
-				if (coe & FD_CLOEXEC) {
-					tst_brkm(TFAIL,
-						 cleanup, "pipe2(0) set close-on-exit for fd[%d]",
-						 i);
-				}
-			}
-			close(fd[0]);
-			close(fd[1]);
-
-			if (ltp_syscall(__NR_pipe2, fd, O_CLOEXEC) != 0) {
-				tst_brkm(TFAIL, cleanup,
-					 "pipe2(O_CLOEXEC) failed");
-			}
-			for (i = 0; i < 2; ++i) {
-				coe = fcntl(fd[i], F_GETFD);
-				if (coe == -1) {
-					tst_brkm(TBROK, cleanup,
-						 "fcntl failed");
-				}
-				if ((coe & FD_CLOEXEC) == 0) {
-					tst_brkm(TFAIL,
-						 cleanup, "pipe2(O_CLOEXEC) does not set close-on-exit for fd[%d]",
-						 i);
-				}
-			}
-			close(fd[0]);
-			close(fd[1]);
-			tst_resm(TPASS, "pipe2(O_CLOEXEC) PASSED");
-			cleanup();
-		}
-	}
-	tst_exit();
+	cleanup();
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_pipe2,
+	.cleanup = cleanup,
+};
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c b/testcases/kernel/syscalls/pipe2/pipe2_02.c
deleted file mode 100644
index 39f02ff8c..000000000
--- a/testcases/kernel/syscalls/pipe2/pipe2_02.c
+++ /dev/null
@@ -1,175 +0,0 @@
-/******************************************************************************/
-/*                                                                            */
-/* Copyright (c) Ulrich Drepper <drepper@redhat.com>                          */
-/* Copyright (c) International Business Machines  Corp., 2009                 */
-/*                                                                            */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or          */
-/* (at your option) any later version.                                        */
-/*                                                                            */
-/* This program is distributed in the hope that it will be useful,            */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
-/* the GNU General Public License for more details.                           */
-/*                                                                            */
-/* You should have received a copy of the GNU General Public License          */
-/* along with this program;  if not, write to the Free Software               */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
-/*                                                                            */
-/******************************************************************************/
-/******************************************************************************/
-/*                                                                            */
-/* File:        pipe2_02.c                                                    */
-/*                                                                            */
-/* Description: This Program tests the new system call introduced in 2.6.27.  */
-/*              Ulrich´s comment as in:                                       */
-/* http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=be61a86d7237dd80510615f38ae21d6e1e98660c */
-/* which says:                                                                */
-/* This patch adds O_NONBLOCK support to pipe2.  It is minimally more involved*/
-/* than the patches for eventfd et.al but still trivial.  The interfaces of   */
-/* the create_write_pipe and create_read_pipe helper functions were changed   */
-/* and the one other caller as well.                                          */
-/* The following test must be adjusted for architectures other than x86 and   */
-/* x86-64 and in case the syscall numbers changed.                            */
-/*                                                                            */
-/* Usage:  <for command-line>                                                 */
-/* pipe2_02 [-c n] [-e][-i n] [-I x] [-p x] [-t]                              */
-/*      where,  -c n : Run n copies concurrently.                             */
-/*              -e   : Turn on errno logging.                                 */
-/*              -i n : Execute test n times.                                  */
-/*              -I x : Execute test for x seconds.                            */
-/*              -P x : Pause for x seconds between iterations.                */
-/*              -t   : Turn on syscall timing.                                */
-/*                                                                            */
-/* Total Tests: 1                                                             */
-/*                                                                            */
-/* Test Name:   pipe2_02                                                      */
-/*                                                                            */
-/* Author:      Ulrich Drepper <drepper@redhat.com>                           */
-/*                                                                            */
-/* History:     Created - Jan 13 2009 - Ulrich Drepper <drepper@redhat.com>   */
-/*              Ported to LTP                                                 */
-/*                      - Jan 13 2009 - Subrata <subrata@linux.vnet.ibm.com>  */
-/******************************************************************************/
-#include <fcntl.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/syscall.h>
-#include <errno.h>
-
-#include "test.h"
-#include "lapi/fcntl.h"
-#include "lapi/syscalls.h"
-
-char *TCID = "pipe2_02";
-int testno;
-int TST_TOTAL = 1;
-
-/* Extern Global Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    cleanup                                                       */
-/*                                                                            */
-/* Description: Performs all one time clean up for this test on successful    */
-/*              completion,  premature exit or  failure. Closes all temporary */
-/*              files, removes all temporary directories exits the test with  */
-/*              appropriate return code by calling tst_exit() function.       */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
-/*              On success - Exits calling tst_exit(). With '0' return code.  */
-/*                                                                            */
-/******************************************************************************/
-void cleanup(void)
-{
-
-	tst_rmdir();
-
-}
-
-/* Local  Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    setup                                                         */
-/*                                                                            */
-/* Description: Performs all one time setup for this test. This function is   */
-/*              typically used to capture signals, create temporary dirs      */
-/*              and temporary files that may be used in the course of this    */
-/*              test.                                                         */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits by calling cleanup().                      */
-/*              On success - returns 0.                                       */
-/*                                                                            */
-/******************************************************************************/
-void setup(void)
-{
-	/* Capture signals if any */
-	/* Create temporary directories */
-	TEST_PAUSE;
-	tst_tmpdir();
-}
-
-int main(int argc, char *argv[])
-{
-	int fds[2], fl, i;
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-	if ((tst_kvercmp(2, 6, 27)) < 0) {
-		tst_brkm(TCONF,
-			 NULL,
-			 "This test can only run on kernels that are 2.6.27 and higher");
-	}
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		for (testno = 0; testno < TST_TOTAL; ++testno) {
-			if (ltp_syscall(__NR_pipe2, fds, 0) == -1) {
-				tst_brkm(TFAIL, cleanup, "pipe2(0) failed");
-			}
-			for (i = 0; i < 2; ++i) {
-				fl = fcntl(fds[i], F_GETFL);
-				if (fl == -1) {
-					tst_brkm(TBROK, cleanup,
-						 "fcntl failed");
-				}
-				if (fl & O_NONBLOCK) {
-					tst_brkm(TFAIL,
-						 cleanup, "pipe2(0) set non-blocking mode for fds[%d]",
-						 i);
-				}
-				close(fds[i]);
-			}
-
-			if (ltp_syscall(__NR_pipe2, fds, O_NONBLOCK) == -1) {
-				tst_brkm(TFAIL, cleanup,
-					 "pipe2(O_NONBLOCK) failed");
-			}
-			for (i = 0; i < 2; ++i) {
-				fl = fcntl(fds[i], F_GETFL);
-				if (fl == -1) {
-					tst_brkm(TBROK, cleanup,
-						 "fcntl failed");
-				}
-				if ((fl & O_NONBLOCK) == 0) {
-					tst_brkm(TFAIL,
-						 cleanup, "pipe2(O_NONBLOCK) does not set non-blocking mode for fds[%d]\n",
-						 i);
-				}
-				close(fds[i]);
-			}
-			tst_resm(TPASS, "pipe2(O_NONBLOCK) PASSED");
-			cleanup();
-		}
-	}
-	tst_exit();
-}
-- 
2.23.0




--===============1913587017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1913587017==--
