Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC251307325
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:52:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58AEC3C5BB2
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:52:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 978DF3C4FB1
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:52:09 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CD9BD1A01011
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:52:07 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="103937728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 17:52:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2E2F248990D2
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 17:52:00 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 17:52:00 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 28 Jan 2021 17:52:00 +0800
From: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 28 Jan 2021 17:51:54 +0800
Message-ID: <20210128095154.1348230-1-ruansy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2E2F248990D2.A9719
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/time{01,
 02}: Convert to new API and merge them
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

Merge the two cases because each of them is very simple.

Signed-off-by: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
---
 runtest/syscalls                          |   1 -
 testcases/kernel/syscalls/time/.gitignore |   1 -
 testcases/kernel/syscalls/time/time01.c   | 191 ++++------------------
 testcases/kernel/syscalls/time/time02.c   | 147 -----------------
 4 files changed, 33 insertions(+), 307 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/time/time02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 576eacf83..a5d224c82 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1539,7 +1539,6 @@ tgkill02 tgkill02
 tgkill03 tgkill03
 
 time01 time01
-time02 time02
 
 times01 times01
 times03 times03
diff --git a/testcases/kernel/syscalls/time/.gitignore b/testcases/kernel/syscalls/time/.gitignore
index 01da407ae..e422fac77 100644
--- a/testcases/kernel/syscalls/time/.gitignore
+++ b/testcases/kernel/syscalls/time/.gitignore
@@ -1,2 +1 @@
 /time01
-/time02
diff --git a/testcases/kernel/syscalls/time/time01.c b/testcases/kernel/syscalls/time/time01.c
index 616a21fa8..11aa90afa 100644
--- a/testcases/kernel/syscalls/time/time01.c
+++ b/testcases/kernel/syscalls/time/time01.c
@@ -1,173 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- *
  */
-/* $Id: time01.c,v 1.6 2009/11/02 13:57:19 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: time01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for time(2)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 1
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: William Roske
- *
- *    CO-PILOT		: Dave Fenner
- *
- *    DATE STARTED	: 03/30/92
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- *	1.) time(2) returns...(See Description)
- *
- *    INPUT SPECIFICATIONS
- *	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *
- *    DURATION
- *	Terminates - with frequency and infinite modes.
- *
- *    SIGNALS
- *	Uses SIGUSR1 to pause before test if option set.
- *	(See the parse_opts(3) man page).
- *
- *    RESOURCES
- *	None
- *
- *    ENVIRONMENTAL NEEDS
- *      No run-time environmental needs.
- *
- *    SPECIAL PROCEDURAL REQUIREMENTS
- *	None
- *
- *    INTERCASE DEPENDENCIES
- *	None
- *
- *    DETAILED DESCRIPTION
- *	This is a Phase I test for the time(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	time(2).
- *
- *	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- *	Test:
- *	 Loop if the proper options are given.
- *	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given
- *
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
 
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
+/*\
+ * [DESCRIPTION]
+ * - Basic test for the time(2) system call. It is intended to provide a
+ * limited exposure of the system call.
+ * - Verify that time(2) returns the value of time in seconds since the Epoch
+ * and stores this value in the memory pointed to by the parameter.
+\*/
+
 #include <time.h>
-#include "test.h"
+#include <errno.h>
 
-void setup();
-void cleanup();
+#include "tst_test.h"
 
-char *TCID = "time01";
-int TST_TOTAL = 1;
+time_t tlocal;
+time_t *targs[] = {
+	NULL, &tlocal,
+};
 
-int main(int ac, char **av)
+static void verify_time(unsigned int i)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
+	time_t *tloc = targs[i];
 
-		/*
-		 * Call time(2)
-		 */
-		TEST(time(0));
+	TEST(time(tloc));
 
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "time(0) Failed, errno=%d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TPASS, "time(0) returned %ld",
-				 TEST_RETURN);
-		}
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "time()");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
+	if (!tloc)
+		tst_res(TPASS, "time() returned value %ld", TST_RET);
+	else if (*tloc == TST_RET)
+		tst_res(TPASS, "time() returned value %ld, stored value %jd "
+			       "are same", TST_RET, (intmax_t) *tloc);
+	else
+		tst_res(TFAIL, "time() returned value %ld, stored value %jd "
+			       "are different", TST_RET, (intmax_t) *tloc);
 }
 
-/***************************************************************
- * setup() - performs all ONE TIME setup for this test.
- ***************************************************************/
-void setup(void)
-{
-	void trapper();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/***************************************************************
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- ***************************************************************/
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test = verify_time,
+	.tcnt = ARRAY_SIZE(targs),
+};
diff --git a/testcases/kernel/syscalls/time/time02.c b/testcases/kernel/syscalls/time/time02.c
deleted file mode 100644
index 137a3fda4..000000000
--- a/testcases/kernel/syscalls/time/time02.c
+++ /dev/null
@@ -1,147 +0,0 @@
-/*
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
- */
-
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
-
-#include <stdio.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <time.h>
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
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
-- 
2.30.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
