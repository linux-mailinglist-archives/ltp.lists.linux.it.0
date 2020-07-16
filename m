Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362A221C67
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 08:11:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDB3F3C2958
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 08:11:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C2163C136A
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 08:11:09 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3264A14017DA
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 08:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594879866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FkjphxkMkaqqi35Zdb38VkN/XeiSd/q4t5VX+23tZwY=;
 b=aQVDWmpjV8NVGxZ1IqhiakTNgo/8seeji6n7lDa5vNrCTQu8AUO8vwmJqCXIG5jnGjTqhT
 eulGvucKLA/4l+rMODAo6ZOvXduEw9qjepk36+g6K1MuiyB8+sr+ecENFbOR31MWW8VtGQ
 73A1j7ErqzaTOPvwwdidilfo4iLdPE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-HYjQTpkoOuWQnSxFs4hcqw-1; Thu, 16 Jul 2020 02:11:04 -0400
X-MC-Unique: HYjQTpkoOuWQnSxFs4hcqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D175A80183C;
 Thu, 16 Jul 2020 06:11:02 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 434131001B07;
 Thu, 16 Jul 2020 06:11:00 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 16 Jul 2020 14:10:58 +0800
Message-Id: <20200716061059.30525-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] iopl: convert to new API
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
 testcases/kernel/syscalls/iopl/iopl01.c | 172 ++++-------------
 testcases/kernel/syscalls/iopl/iopl02.c | 247 +++++-------------------
 2 files changed, 86 insertions(+), 333 deletions(-)

diff --git a/testcases/kernel/syscalls/iopl/iopl01.c b/testcases/kernel/syscalls/iopl/iopl01.c
index 0b1952668..e0f9d7b5f 100644
--- a/testcases/kernel/syscalls/iopl/iopl01.c
+++ b/testcases/kernel/syscalls/iopl/iopl01.c
@@ -1,162 +1,62 @@
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
- *    TEST IDENTIFIER	: iopl01
- *
- *    EXECUTED BY	: superuser
- *
- *    TEST TITLE	: Basic test for iopl(2)
- *
- *    TEST CASE TOTAL	: 4
- *
- *    AUTHOR		: Subhab Biswas <subhabrata.biswas@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the iopl(2) system call.
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
+
+/*
+ * This is a basic test for iopl(2) system call.
  *
- * USAGE:  <for command-line>
- * iopl01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Test the system call for possible privelege levels.
+ * As the privelge level for a normal process is 0, start by
+ * setting/changing the level to 0.
  *
- ****************************************************************/
-
-char *TCID = "iopl01";
-
-#if defined __i386__ || defined(__x86_64__)
+ * Author: Subhab Biswas <subhabrata.biswas@wipro.com>
+ */
 
 #include <errno.h>
 #include <unistd.h>
 #include <sys/io.h>
 
-#include "test.h"
-
-static void setup();
-static void cleanup();
+#include "tst_test.h"
 
-int TST_TOTAL = 4;
-
-int level;			/* I/O privilege level of the process */
+#if defined __i386__ || defined(__x86_64__)
 
-int main(int ac, char **av)
+static void verify_iopl(void)
 {
+	int total_level = 4;
+	int level;
 
-	int lc;
+	for (level = 0; level < total_level; ++level) {
 
-	tst_parse_opts(ac, av, NULL, NULL);
+		TEST(iopl(level));
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Test the system call for possible privelege levels.
-		 * As the privelge level for a normal process is 0,
-		 * start by setting/changing the level to 0.
-		 */
-		for (level = 0; level < TST_TOTAL; ++level) {
-
-			TEST(iopl(level));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "iopl() failed for level %d, "
-					 "errno=%d : %s", level,
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TPASS, "iopl() passed for level %d, "
-					 "returned %ld", level, TEST_RETURN);
-			}
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "iopl() failed for level %d, "
+					"errno=%d : %s", level,
+					TST_ERR, tst_strerrno(TST_ERR));
+		} else {
+			tst_res(TPASS, "iopl() passed for level %d, "
+					"returned %ld", level, TST_RET);
 		}
 	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
-
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void cleanup(void)
 {
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-
 	/*
 	 * back to I/O privilege for normal process.
 	 */
-	if (iopl(0) == -1) {
-		tst_resm(TWARN, "iopl() cleanup failed");
-	}
-
+	if (iopl(0) == -1)
+		tst_res(TWARN, "iopl() cleanup failed");
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
-		 "LSB v1.3 does not specify iopl() for this architecture.");
-	tst_exit();
-}
+static struct tst_test test = {
+	.test_all = verify_iopl,
+	.needs_root = 1,
+	.cleanup = cleanup,
+};
 
-#endif /* __i386__ */
+#else
+TST_TEST_TCONF("LSB v1.3 does not specify iopl() for this architecture. (only for i386 or x86_64)");
+#endif /* __i386_, __x86_64__*/
diff --git a/testcases/kernel/syscalls/iopl/iopl02.c b/testcases/kernel/syscalls/iopl/iopl02.c
index 35d239268..dab6881f4 100644
--- a/testcases/kernel/syscalls/iopl/iopl02.c
+++ b/testcases/kernel/syscalls/iopl/iopl02.c
@@ -1,221 +1,74 @@
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
- *    TEST IDENTIFIER	: iopl02
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
- *	1) iopl(2) returns -1 and sets errno to EINVAL for privilege
- *	   level greater than 3.
- *	2) iopl(2) returns -1 and sets errno to EPERM if the current
- *	   user is not the super-user.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Test caller is superuser
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
+ * This is an error test for iopl(2) system call.
  *
- * USAGE:  <for command-line>
- * iopl02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
+ *  1) iopl(2) returns -1 and sets errno to EINVAL for privilege
+ *     level greater than 3.
+ *  2) iopl(2) returns -1 and sets errno to EPERM if the current
+ *     user is not the super-user.
  *
- ****************************************************************/
-
-char *TCID = "iopl02";
-
-#if defined __i386__ || defined(__x86_64__)
+ * Author: Subhab Biswas <subhabrata.biswas@wipro.com>
+ */
 
 #include <errno.h>
 #include <unistd.h>
 #include <sys/io.h>
 #include <pwd.h>
-#include "test.h"
-#include "safe_macros.h"
-
-#define INVALID_LEVEL 4		/* Invalid privilege level */
-#define EXP_RET_VAL -1
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 
-static void setup();
-static int setup1(void);
-static void cleanup1();
-static void cleanup();
-
-static char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+#if defined __i386__ || defined(__x86_64__)
 
-struct test_cases_t {
-	int level;		/* I/O privilege level */
-	char *desc;		/* test case description */
-	int exp_errno;		/* expected error number */
-} test_cases[] = {
-	{
-	INVALID_LEVEL, "Invalid privilege level", EINVAL}, {
-	1, "Non super-user", EPERM}
+static struct tcase {
+	int level;
+	char *desc;
+	int exp_errno;
+} tcases[] = {
+	{4, "Invalid privilege level", EINVAL},
+	{1, "Non super-user", EPERM}
 };
 
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+static void verify_iopl(unsigned int i)
 {
-
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
-			/*
-			 * Call iopl(2)
-			 */
-			TEST(iopl(test_cases[i].level));
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
-			}
-
-		}
+	TEST(iopl(tcases[i].level));
+
+	if ((TST_RET == -1) && (TST_ERR == tcases[i].exp_errno)) {
+		tst_res(TPASS | TTERRNO,
+			"Expected failure for %s, errno: %d",
+			tcases[i].desc, TST_ERR);
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			"%s returned %ld expected -1, expected %s got ",
+			tcases[i].desc, TST_RET, tst_strerrno(tcases[i].exp_errno));
 	}
-
-	/* cleanup and exit */
-	cleanup();
-
-	tst_exit();
-
 }
 
-/* setup1() - set up non-super user for second test case */
-int setup1(void)
+static void setup(void)
 {
-	/* switch to "nobody" user */
-	if (seteuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TWARN, "Failed to set effective"
-			 "uid to %d", ltpuser->pw_uid);
-		return 1;
-	}
-	return 0;
+	struct passwd *pw;
+	pw = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(pw->pw_uid);
 }
 
-/* cleanup1() - reset to super user for first test case */
-void cleanup1(void)
+static void cleanup(void)
 {
-	/* reset user as root */
-	SAFE_SETEUID(NULL, 0);
+	SAFE_SETEUID(0);
 }
 
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
-	TEST_PAUSE;
-
-}
-
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
-
-#else /* __i386__ */
-
-#include "test.h"
-#include "safe_macros.h"
-
-int TST_TOTAL = 0;
-
-int main(void)
-{
-	tst_resm(TPASS,
-		 "LSB v1.3 does not specify iopl() for this architecture.");
-	tst_exit();
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_iopl,
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+};
 
-#endif /* __i386__ */
+#else
+TST_TEST_TCONF("LSB v1.3 does not specify iopl() for this architecture. (only for i386 or x86_64)");
+#endif /* __i386_, __x86_64__*/
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
