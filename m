Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DA219B7E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 10:53:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F7093C53E5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 10:53:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 698FA3C296A
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 10:52:47 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E06D96013A9
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 10:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594284764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+XjNlVOa3BZdWwRkqoD1Rrj84NNkaJRDdbZiXQ0sZg=;
 b=TzP4UeltyEZTJaWRf8v533Ai0LkjYtDkKuS9VvctyGutyF8tz/UkirYhmIv+wUy5PFIx86
 bvwd5uXjHZBnTpfDt2pJ2p0IMNC9qiay6QQbdATp+rBxyoO/uZGu4Qwr/RUtSV5OgFGtl2
 wOSM4s/Q47PETMuGHYF6Cw6U+u0T9UY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-X3SpOXAuMTSrkz13-RHGbQ-1; Thu, 09 Jul 2020 04:52:43 -0400
X-MC-Unique: X3SpOXAuMTSrkz13-RHGbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55E8A2FD1F
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 08:52:42 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0498A5D9C9;
 Thu,  9 Jul 2020 08:52:40 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  9 Jul 2020 16:52:37 +0800
Message-Id: <20200709085237.10158-2-liwang@redhat.com>
In-Reply-To: <20200709085237.10158-1-liwang@redhat.com>
References: <20200709085237.10158-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] ioperm: Convert to new API
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

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Erico Nunes <ernunes@redhat.com>
---
 testcases/kernel/syscalls/ioperm/ioperm01.c | 167 +++---------
 testcases/kernel/syscalls/ioperm/ioperm02.c | 273 +++++---------------
 testcases/kernel/syscalls/iopl/iopl02.c     |   2 +-
 3 files changed, 105 insertions(+), 337 deletions(-)

diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
index e8bd18dd7..4fe803cb2 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm01.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
@@ -1,77 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
+ *  Copyright (c) Linux Test Project, 2020
+ *  Copyright (c) Wipro Technologies Ltd, 2002
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: ioperm01
- *
- *    EXECUTED BY	: superuser
- *
- *    TEST TITLE	: Basic test for ioperm(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Subhab Biswas <subhabrata.biswas@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the ioperm(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Test caller is superuser
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *        Check return code, if system call failed (return=-1)
- *              Issue FAIL message with errno.
- *        Otherwise, Issue PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * ioperm01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
-char *TCID = "ioperm01";
 
-#if defined __i386__ || defined(__x86_64__)
+/*
+ * This is a basic test for ioperm(2) system call.
+ * It is intended to provide a limited exposure of the system call.
+ *
+ * Author: Subhab Biswas <subhabrata.biswas@wipro.com>
+ */
 
 #include <errno.h>
 #include <unistd.h>
 #include <sys/io.h>
 
-#include "test.h"
+#include "tst_test.h"
+
+#if defined __i386__ || defined(__x86_64__)
 
 unsigned long io_addr;		/*kernel version dependant io start address */
 #define NUM_BYTES 3		/* number of bytes from start address */
@@ -81,53 +27,23 @@ unsigned long io_addr;		/*kernel version dependant io start address */
 #define IO_BITMAP_BITS 1024
 #endif
 
-static void setup();
-static void cleanup();
-
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void verify_ioperm(void)
 {
+	TEST(ioperm(io_addr, NUM_BYTES, TURN_ON));
 
-	int lc;
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
-		 * Test the system call.
-		 */
-		TEST(ioperm(io_addr, NUM_BYTES, TURN_ON));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "ioperm() failed for port address "
-				 "%lu,  errno=%d : %s", io_addr,
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TPASS, "ioperm() passed for port "
-				 "address %lu, returned %lu",
-				 io_addr, TEST_RETURN);
-		}
+	if (TST_RET == -1) {
+		tst_res(TFAIL, "ioperm() failed for port address "
+				"%lu,  errno=%d : %s", io_addr,
+				TST_ERR, tst_strerrno(TFAIL | TTERRNO));
+	} else {
+		tst_res(TPASS, "ioperm() passed for port "
+				"address %lu, returned %lu",
+				io_addr, TST_RET);
 	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
-
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits ioperm
@@ -141,38 +57,25 @@ void setup(void)
 		/*get ioperm on 65533, 65534, 65535 */
 		io_addr = IO_BITMAP_BITS - NUM_BYTES;
 	}
-
-	TEST_PAUSE;
-
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-
 	/*
 	 * Reset I/O privileges for the specified port.
 	 */
-	if ((ioperm(io_addr, NUM_BYTES, TURN_OFF)) == -1) {
-		tst_brkm(TBROK, NULL, "ioperm() cleanup failed");
-	}
+	if ((ioperm(io_addr, NUM_BYTES, TURN_OFF)) == -1)
+		tst_brk(TBROK, "ioperm() cleanup failed");
 
 }
 
-#else /* __i386__ */
-
-#include "test.h"
-
-int TST_TOTAL = 0;
-
-int main(void)
-{
-	tst_resm(TPASS,
-		 "LSB v1.3 does not specify ioperm() for this architecture.");
-	tst_exit();
-}
+static struct tst_test test = {
+	.test_all = verify_ioperm,
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+};
 
-#endif /* __i386__ */
+#else /* __i386__, __x86_64__*/
+TST_TEST_TCONF("LSB v1.3 does not specify ioperm() for this architecture. (only for i386 or x86_64)");
+#endif /* __i386_, __x86_64__*/
diff --git a/testcases/kernel/syscalls/ioperm/ioperm02.c b/testcases/kernel/syscalls/ioperm/ioperm02.c
index 3d9b1445f..80806313b 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm02.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
@@ -1,83 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
+ *  Copyright (c) Linux Test Project, 2020
+ *  Copyright (c) Wipro Technologies Ltd, 2002
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: ioperm02
- *
- *    EXECUTED BY	: superuser
- *
- *    TEST TITLE	: Tests for error conditions
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Subhab Biwas <subhabrata.biswas@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that
- *	1) ioperm(2) returns -1 and sets errno to EINVAL for I/O port
- *	   address greater than 0x3ff.
- *	2) ioperm(2) returns -1 and sets errno to EPERM if the current
- *	   user is not the super-user.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Set expected errnos for logging
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code and error number, if matching,
- *		     Issue PASS message
- *	  Otherwise,
- *		     Issue FAIL message
- *	  Perform testcase specific cleanup (if needed)
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*
+ * This is an error test for ioperm(2) system call.
  *
- * USAGE:  <for command-line>
- * ioperm02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Verify that
+ * 1) ioperm(2) returns -1 and sets errno to EINVAL for I/O port
+ *    address greater than 0x3ff.
+ * 2) ioperm(2) returns -1 and sets errno to EPERM if the current
+ *    user is not the super-user.
  *
- ****************************************************************/
-
-char *TCID = "ioperm02";
-
-#if defined __i386__ || defined(__x86_64__)
+ * Author: Subhab Biswas <subhabrata.biswas@wipro.com>
+ */
 
+#include <stdlib.h>
 #include <errno.h>
 #include <unistd.h>
 #include <sys/io.h>
 #include <pwd.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+#if defined __i386__ || defined(__x86_64__)
 
 #define NUM_BYTES 3
 #define TURN_ON 1
@@ -88,163 +35,81 @@ char *TCID = "ioperm02";
 #define IO_BITMAP_BITS_16 65536
 #endif
 
-static void setup();
-static int setup1(void);
-static void cleanup1();
-static void cleanup();
-
-static char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-struct test_cases_t {
-	long from;		/* starting port address */
-	long num;		/* no. of bytes from starting address */
+static struct tcase_t {
+	long from;	/* starting port address */
+	long num;	/* no. of bytes from starting address */
 	int turn_on;
-	char *desc;		/* test case description */
-	int exp_errno;		/* expected error number */
+	char *desc;	/* test case description */
+	int exp_errno;	/* expected error number */
+} tcases[] = {
+	{0, NUM_BYTES, TURN_ON, "Invalid I/O address", EINVAL},
+	{0, NUM_BYTES, TURN_ON, "Non super-user", EPERM},
 };
 
-int TST_TOTAL = 2;
-struct test_cases_t *test_cases;
-
-int main(int ac, char **av)
+static void setup(void)
 {
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
-		for (i = 0; i < TST_TOTAL; ++i) {
-
-			if (i == 1) {
-				/* setup Non super-user for second test */
-				if (setup1()) {
-					/* setup1() failed, skip this test */
-					continue;
-				}
-			}
-
-			/* Test the system call */
-
-			TEST(ioperm(test_cases[i].from,
-				    test_cases[i].num, test_cases[i].turn_on));
-
-			if ((TEST_RETURN == EXP_RET_VAL) &&
-			    (TEST_ERRNO == test_cases[i].exp_errno)) {
-				tst_resm(TPASS, "Expected failure for %s, "
-					 "errno: %d", test_cases[i].desc,
-					 TEST_ERRNO);
-			} else {
-				tst_resm(TFAIL, "Unexpected results for %s ; "
-					 "returned %ld (expected %d), errno %d "
-					 "(expected errno  %d)",
-					 test_cases[i].desc,
-					 TEST_RETURN, EXP_RET_VAL,
-					 TEST_ERRNO, test_cases[i].exp_errno);
-			}
-
-			if (i == 1) {
-				/* revert back to super user */
-				cleanup1();
-			} else {
-			}
-		}
-
-	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-
-}
-
-/* setup1() - set up non-super user for second test case */
-int setup1(void)
-{
-	/* switch to "nobody" user */
-	if (seteuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TWARN, "Failed to set effective"
-			 "uid to %d", ltpuser->pw_uid);
-		return 1;
-	}
-	return 0;
-}
-
-/* cleanup1() - reset to super user for second test case */
-void cleanup1(void)
-{
-	/* reset user as root */
-	SAFE_SETEUID(NULL, 0);
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Check if "nobody" user id exists */
-	if ((ltpuser = getpwnam(nobody_uid)) == NULL) {
-		tst_brkm(TBROK, NULL, "\"nobody\" user id doesn't exist");
-	}
-
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits (65536) ioperm
 	 *
 	 * Ricky Ng-Adam, rngadam@yahoo.com
-	 * */
-	test_cases = malloc(sizeof(struct test_cases_t) * 2);
-	test_cases[0].num = NUM_BYTES;
-	test_cases[0].turn_on = TURN_ON;
-	test_cases[0].desc = "Invalid I/O address";
-	test_cases[0].exp_errno = EINVAL;
-	test_cases[1].num = NUM_BYTES;
-	test_cases[1].turn_on = TURN_ON;
-	test_cases[1].desc = "Non super-user";
-	test_cases[1].exp_errno = EPERM;
+	 */
 	if ((tst_kvercmp(2, 6, 8) < 0) || (tst_kvercmp(2, 6, 9) == 0)) {
 		/*try invalid ioperm on 1022, 1023, 1024 */
-		test_cases[0].from = (IO_BITMAP_BITS - NUM_BYTES) + 1;
+		tcases[0].from = (IO_BITMAP_BITS - NUM_BYTES) + 1;
 
 		/*try get valid ioperm on 1021, 1022, 1023 */
-		test_cases[1].from = IO_BITMAP_BITS - NUM_BYTES;
+		tcases[1].from = IO_BITMAP_BITS - NUM_BYTES;
 	} else {
 		/*try invalid ioperm on 65534, 65535, 65536 */
-		test_cases[0].from = (IO_BITMAP_BITS_16 - NUM_BYTES) + 1;
+		tcases[0].from = (IO_BITMAP_BITS_16 - NUM_BYTES) + 1;
 
 		/*try valid ioperm on 65533, 65534, 65535 */
-		test_cases[1].from = IO_BITMAP_BITS_16 - NUM_BYTES;
+		tcases[1].from = IO_BITMAP_BITS_16 - NUM_BYTES;
 	}
 
-	TEST_PAUSE;
-
 }
 
-void cleanup(void)
+static void verify_ioperm(unsigned int i)
 {
+	if (i == 1) {
+		/* set Non super-user for second test */
+		struct passwd *pw;
+		pw = SAFE_GETPWNAM("nobody");
+		if (seteuid(pw->pw_uid) == -1) {
+			tst_res(TWARN, "Failed to set effective"
+					"uid to %d", pw->pw_uid);
+			return;
+		}
+	}
 
-}
-
-#else /* __i386__ */
-
-#include "test.h"
-#include "safe_macros.h"
+	TEST(ioperm(tcases[i].from, tcases[i].num, tcases[i].turn_on));
 
-int TST_TOTAL = 0;
+	if ((TST_RET == EXP_RET_VAL) && (TST_ERR == tcases[i].exp_errno)) {
+		tst_res(TPASS, "Expected failure for %s, "
+				"errno: %d", tcases[i].desc, TST_ERR);
+	} else {
+		tst_res(TFAIL, "Unexpected results for %s ; "
+				"returned %ld (expected %d), errno %d "
+				"(expected errno  %d)",
+				tcases[i].desc,
+				TST_RET, EXP_RET_VAL,
+				TST_ERR, tcases[i].exp_errno);
+	}
 
-int main(void)
-{
-	tst_resm(TPASS,
-		 "LSB v1.3 does not specify ioperm() for this architecture.");
-	tst_exit();
+	if (i == 1) {
+		/* revert back to super user */
+		SAFE_SETEUID(0);
+	}
 }
 
-#endif /* __i386__ */
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ioperm,
+	.needs_root = 1,
+	.setup = setup,
+};
+
+#else /* __i386__, __x86_64__*/
+TST_TEST_TCONF("LSB v1.3 does not specify ioperm() for this architecture. (only for i386 or x86_64)");
+#endif /* __i386_, __x86_64__*/
diff --git a/testcases/kernel/syscalls/iopl/iopl02.c b/testcases/kernel/syscalls/iopl/iopl02.c
index 747a1ca56..f8a76e757 100644
--- a/testcases/kernel/syscalls/iopl/iopl02.c
+++ b/testcases/kernel/syscalls/iopl/iopl02.c
@@ -40,7 +40,7 @@ static struct tcase {
 static void verify_iopl(unsigned int i)
 {
 	if (i == 1) {
-		/* setup Non super-user for second test */
+		/* set Non super-user for second test */
 		struct passwd *pw;
 		pw = SAFE_GETPWNAM("nobody");
 		if (seteuid(pw->pw_uid) == -1) {
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
