Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C471251
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 09:08:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87BEF3C1CFA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 09:08:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 384EA3C1C7C
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 09:08:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1FC8E1000376
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 09:08:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EBABAE91
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 07:08:23 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue, 23 Jul 2019 09:08:15 +0200
Message-Id: <20190723070817.637-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] timers/timer_delete0{2,
 3}: Ported to new library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cleaned up and ported both timer_delete(2) tests to new library.

Signed-off-by: Christian Amann <camann@suse.com>
---
 .../kernel/timers/timer_delete/timer_delete02.c    | 188 +++++++--------------
 .../kernel/timers/timer_delete/timer_delete03.c    | 175 +++++--------------
 2 files changed, 102 insertions(+), 261 deletions(-)
 rewrite testcases/kernel/timers/timer_delete/timer_delete02.c (93%)
 rewrite testcases/kernel/timers/timer_delete/timer_delete03.c (93%)

diff --git a/testcases/kernel/timers/timer_delete/timer_delete02.c b/testcases/kernel/timers/timer_delete/timer_delete02.c
dissimilarity index 93%
index b9b9c7ffc..6380a34cf 100644
--- a/testcases/kernel/timers/timer_delete/timer_delete02.c
+++ b/testcases/kernel/timers/timer_delete/timer_delete02.c
@@ -1,125 +1,63 @@
-/*
- * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
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
- *    TEST IDENTIFIER	: timer_delete02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for timer_delete(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *     This is a Phase I test for the timer_delete(2) system call.
- *     It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 Create a POSIX timer
- *	 Execute system call
- *	 Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	 Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * timer_delete02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-p]
- * where:
- * 	-c n : Run n copies simultaneously.
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
- *
- *RESTRICTIONS:
- * None
- *****************************************************************************/
-
-#include <stdlib.h>
-#include <errno.h>
-#include <time.h>
-#include <signal.h>
-
-#include "test.h"
-#include "common_timers.h"
-
-void setup(void);
-
-char *TCID = "timer_delete02";	/* Test program identifier.    */
-int TST_TOTAL = 1;		/* Total number of test cases. */
-
-int main(int ac, char **av)
-{
-	int lc;
-	kernel_timer_t timer_id;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* Create a Posix timer */
-		if (ltp_syscall(__NR_timer_create, CLOCK_REALTIME, NULL,
-			&timer_id) < 0) {
-			tst_count = TST_TOTAL;
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "timer_delete can't be tested because "
-				 "timer_create failed");
-		}
-		TEST(ltp_syscall(__NR_timer_delete, timer_id));
-		tst_resm((TEST_RETURN == 0 ? TPASS : TFAIL | TTERRNO),
-			 "%s", (TEST_RETURN == 0 ? "passed" : "failed"));
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - Performs one time cleanup for this test at
- * completion or premature exit
- */
-void cleanup(void)
-{
-}
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
+ *
+ * Author:	Aniruddha Marathe <aniruddha.marathe@wipro.com>
+ *
+ * Ported to new library:
+ * 07/2019      Christian Amann <camann@suse.com>
+ */
+/*
+ * Basic test for timer_delete(2)
+ *
+ *	Creates a timer for each available clock and then tries
+ *	to delete them again.
+ */
+
+#include <errno.h>
+#include <time.h>
+#include "tst_test.h"
+#include "common_timers.h"
+
+static void run(void)
+{
+	unsigned int i;
+	kernel_timer_t timer_id;
+
+	for (i = 0; i < CLOCKS_DEFINED; ++i) {
+		clock_t clock = clock_list[i];
+
+		if (clock == CLOCK_PROCESS_CPUTIME_ID ||
+			clock == CLOCK_THREAD_CPUTIME_ID) {
+			if (!have_cputime_timers())
+				continue;
+		}
+
+		tst_res(TINFO, "Testing %s", get_clock_str(clock));
+
+		TEST(tst_syscall(__NR_timer_create, clock, NULL, &timer_id));
+		if (TST_RET != 0) {
+			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
+				tst_res(TPASS | TTERRNO,
+					"%s unsupported, failed as expected",
+					get_clock_str(clock));
+			} else {
+				tst_res(TBROK | TTERRNO,
+					"Aborting test - timer_create(%s) failed",
+					get_clock_str(clock));
+			}
+			continue;
+		}
+
+		TEST(tst_syscall(__NR_timer_delete, timer_id));
+		if (TST_RET == 0)
+			tst_res(TPASS, "Timer deleted successfully!");
+		else
+			tst_res(TFAIL | TTERRNO, "Timer deletion failed!");
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/timers/timer_delete/timer_delete03.c b/testcases/kernel/timers/timer_delete/timer_delete03.c
dissimilarity index 93%
index 02506fb90..748c23c0f 100644
--- a/testcases/kernel/timers/timer_delete/timer_delete03.c
+++ b/testcases/kernel/timers/timer_delete/timer_delete03.c
@@ -1,136 +1,39 @@
-/*
- * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
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
- *    TEST IDENTIFIER	: timer_delete03
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Test checking for basic error conditions for
- *    			  timer_delete(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *    	This test case check whether timer_delete(2) returns appropriate error
- *    	value for invalid parameter
- *
- * 	Setup:
- *	 Setup signal handling.
- *	 Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 Execute system call with invalid parameter.
- *	 Check return code, if system call fails with errno == expected errno
- * 	 	Issue syscall passed with expected errno
- *	 Otherwise, Issue syscall failed to produce expected errno
- *
- * 	Cleanup:
- * 	 Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * timer_delete03 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-p]
- * where:
- * 	-c n : run n copies simultaneously
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
- *
- * RESTRICTIONS:
- * None
- *****************************************************************************/
-
-#include <stdlib.h>
-#include <errno.h>
-#include <time.h>
-#include <signal.h>
-
-#include "test.h"
-#include "common_timers.h"
-
-#define INVALID_ID ((kernel_timer_t)-1)
-
-void setup(void);
-
-int testcase[] = {
-	EINVAL			/* Invalid timer ID */
-};
-
-char *TCID = "timer_delete03";
-int TST_TOTAL = ARRAY_SIZE(testcase);
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
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(ltp_syscall(__NR_timer_delete, INVALID_ID));
-
-			/* check return code */
-			if (TEST_RETURN == -1 && TEST_ERRNO == testcase[i]) {
-				tst_resm(TPASS | TTERRNO,
-					 "failed as expected failure");
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "didn't fail as expected [expected "
-					 "errno = %d (%s)]",
-					 testcase[i], strerror(testcase[i]));
-			}	/* end of else */
-
-		}		/* End of TEST CASE LOOPING */
-
-	}			/* End for TEST_LOOPING */
-
-	cleanup();
-	tst_exit();
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - Performs one time cleanup for this test at
- * completion or premature exit
- */
-void cleanup(void)
-{
-}
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
+ *
+ * Author: Aniruddha Marathe <aniruddha.marathe@wipro.com>
+ *
+ * Ported to new library:
+ * 07/2019      Christian Amann <camann@suse.com>
+ */
+/*
+ * Basic error handling test for timer_delete(2):
+ *
+ *	This test case checks whether timer_delete(2) returns an appropriate
+ *	error (EINVAL) for an invalid timerid parameter
+ */
+
+#include <errno.h>
+#include <time.h>
+#include "tst_test.h"
+#include "common_timers.h"
+
+#define INVALID_ID ((kernel_timer_t)-1)
+
+static void run(void)
+{
+	TEST(tst_syscall(__NR_timer_delete, INVALID_ID));
+
+	if (TST_RET == -1 && TST_ERR == EINVAL) {
+		tst_res(TPASS | TTERRNO,
+			 "Failed as expected");
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			 "Didn't fail with EINVAL as expected - got");
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
