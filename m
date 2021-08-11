Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 539663E909E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:23:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A70753C700C
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:23:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90C553C6F25
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:23:12 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 66456600792
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:23:10 +0200 (CEST)
X-QQ-mid: bizesmtp54t1628684586t2zbpjen
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 20:23:00 +0800 (CST)
X-QQ-SSF: 0140000000200020B000000B0000000
X-QQ-FEAT: f0dVAzX4zgkW0uO2zFAeXpODBlrhzBkMqHHiN7LznLbX5/AI5ZbeE9ThpU+uY
 l5LmG46AWHSeFBHI9Q8Em8nRZBeIR0uLINnGmNOHUrGxnIXawR3wuIgbAtJtQM5h3mYtCWF
 6MoKVNIGH6B0RB0h2SRUXZgKAlB8rZWGedfQYFWVVEYA9usnhek19fUFBFPUmMBcAteFkzY
 2ZQTKAbxWWRZ0D4YSitQBJ/re86Amm4FavqriAs4I/ugq0CXaEf/JPpFZIYT/P3YypxHfHY
 L30HUWCBehvZhoDfsVPnFdNHlCcyC8i3IevDWSRtPGXxgCHuS0cMp+ZBDcID5V138kZEc72
 ucQmdGHomUMJ8Gfy/VUEHgUNA3xYw==
X-QQ-GoodBg: 2
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 20:22:59 +0800
Message-Id: <20210811122259.1881-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [v2,6/6] syscalls/sysfs: remove sysfs06
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

sysfs06 is nearly the same as sysfs05, the only test that is missing in
sysfs05 is fs index out of bounds.  Add that test to sysfs05 and remove sysfs06.

Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/sysfs/.gitignore |   1 -
 testcases/kernel/syscalls/sysfs/sysfs06.c  | 162 ---------------------
 3 files changed, 164 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/sysfs/sysfs06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9af5aa5c0..3f44b8084 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1537,7 +1537,6 @@ sysfs02 sysfs02
 sysfs03 sysfs03
 sysfs04 sysfs04
 sysfs05 sysfs05
-sysfs06 sysfs06

 sysinfo01 sysinfo01
 sysinfo02 sysinfo02
diff --git a/testcases/kernel/syscalls/sysfs/.gitignore b/testcases/kernel/syscalls/sysfs/.gitignore
index d38a4336d..acca41170 100644
--- a/testcases/kernel/syscalls/sysfs/.gitignore
+++ b/testcases/kernel/syscalls/sysfs/.gitignore
@@ -3,4 +3,3 @@
 /sysfs03
 /sysfs04
 /sysfs05
-/sysfs06
diff --git a/testcases/kernel/syscalls/sysfs/sysfs06.c b/testcases/kernel/syscalls/sysfs/sysfs06.c
deleted file mode 100644
index d9a8cd51c..000000000
--- a/testcases/kernel/syscalls/sysfs/sysfs06.c
+++ /dev/null
@@ -1,162 +0,0 @@
-/*
- * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
- */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: sysfs(2)
- *
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Test checking for basic error conditions
- *				 for sysfs(2)
- *
- *    TEST CASE TOTAL	: 3
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- *	Uses SIGUSR1 to pause before test if option set.
- *	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This test case checks whether sysfs(2) system call returns
- *	appropriate error number for invalid
- *	option and for invalid filesystem index and when
- *	buffer is out of address space
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *	  Loop if the proper options are given.
- *	  Execute system call with invaid option parameter and for
- *	  invalid filesystem index
- *	  Check return code, if system call fails with errno == expected errno
- *		Issue syscall passed with expected errno
- *	  Otherwise,
- *	  Issue syscall failed to produce expected errno
- *
- *	Cleanup:
- *	  Do cleanup for the test.
- *
- * USAGE:  <for command-line>
- *  sysfs06 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *  where:
- *	-c n : Run n copies simultaneously
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
- *
- *RESTRICTIONS:
- *There is no libc or glibc support
- *****************************************************************************/
-
-#include <errno.h>
-#include <sys/syscall.h>
-#include <sys/mman.h>
-#include "test.h"
-#include "lapi/syscalls.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sysfs06";
-static int option[3] = { 2, 4, 2 };	/* valid and invalid option */
-static int fsindex[3] = { 10000, 0, 1 };	/*invalid and valid fsindex */
-
-static struct test_case_t {
-	char *err_desc;		/*error description */
-	int exp_errno;		/* expected error number */
-	char *exp_errval;	/*Expected errorvalue string */
-} testcase[] = {
-	{
-	"Invalid option", EINVAL, "EINVAL"}, {
-	"fs_index is out of bounds", EINVAL, "EINVAL"}, {
-	"buf is outside your accessible address space", EFAULT, "EFAULT"}
-};
-
-int TST_TOTAL = ARRAY_SIZE(testcase);
-
-char *bad_addr = 0;
-
-int main(int ac, char **av)
-{
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			tst_count = 0;
-			TEST(ltp_syscall
-			     (__NR_sysfs, option[i], fsindex[i], bad_addr));
-
-			/* check return code */
-			if ((TEST_RETURN == -1)
-			    && (TEST_ERRNO == testcase[i].exp_errno)) {
-				tst_resm(TPASS,
-					 "sysfs(2) expected failure;"
-					 " Got errno - %s : %s",
-					 testcase[i].exp_errval,
-					 testcase[i].err_desc);
-			} else {
-				tst_resm(TFAIL, "sysfs(2) failed to produce"
-					 " expected error; %d, errno"
-					 ": %s and got %d",
-					 testcase[i].exp_errno,
-					 testcase[i].exp_errval, TEST_ERRNO);
-			}
-		}		/*End of TEST LOOPS */
-	}
-
-	/*Clean up and exit */
-	cleanup();
-
-	tst_exit();
-}				/*End of main */
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	bad_addr =
-	    mmap(0, 1, PROT_NONE, MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0,
-		 0);
-	if (bad_addr == MAP_FAILED)
-		tst_brkm(TBROK, cleanup, "mmap failed");
-}
-
-/*
-* cleanup() - Performs one time cleanup for this test at
-* completion or premature exit
-*/
-void cleanup(void)
-{
-
-}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
