Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7D759233
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jul 2023 12:00:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF6C63CDCF2
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jul 2023 12:00:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE6DC3CDCF0
 for <ltp@lists.linux.it>; Wed, 19 Jul 2023 11:59:50 +0200 (CEST)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com
 [139.138.36.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0ECA16007A1
 for <ltp@lists.linux.it>; Wed, 19 Jul 2023 11:59:49 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="113314151"
X-IronPort-AV: E=Sophos;i="6.01,216,1684767600"; d="scan'208";a="113314151"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
 by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 18:59:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com
 [192.168.87.58])
 by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D8CFCA1E8
 for <ltp@lists.linux.it>; Wed, 19 Jul 2023 18:59:45 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com
 [192.51.207.12])
 by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 781FAD4F46
 for <ltp@lists.linux.it>; Wed, 19 Jul 2023 18:59:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.215.131])
 by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B71086F10;
 Wed, 19 Jul 2023 18:59:43 +0900 (JST)
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: ltp@lists.linux.it
Date: Wed, 19 Jul 2023 17:59:15 +0800
Message-Id: <1689760756-865-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689760756-865-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1689760756-865-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27760.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27760.006
X-TMASE-Result: 10--15.714200-10.000000
X-TMASE-MatchedRID: 7q1xkhOBgdehhjsqgSuNbxF4zyLyne+AVBDQSDMig9HEosIs7IJbkIh+
 mL+ciFCpbnRB47KLJ1QzLmfGY6iDkX5uUfhNvnKzOWUWxTQJdI8UZYubbUj2DLt4BAaULwAVJf5
 otvavOZf9vT5evMX4tJhCh8+WImJUkto8AKCDbo7X3j/lf1V8LDYvC/PFFfSAUoXFjv/N8aLovg
 fcZYFfbTyZ7dOmU5ZqQOYg55Cp68FujdbubeNfIzz6L+U/pejxtOtXYgbXjdfG5dXdQTj2OFRG1
 tpaU7lUOE2afT3WQTEj0rAExlIQHoq5N4VAmkR8/1dEgwtQ6NAyLlxWhS9T9jxzAG47ocHfhN0K
 b2jI1UnX1u63/F4Cq9EqY6Wu67POR+vpYbhOH1r2TS1YFaI5/79cAlQW5YprrblmM/aFaC+Trr+
 C1WNmxQy5Gps/SGlK8mkNXMJVLjbUsV22aJ5sTpiHtCNYjckMHJJXhOFmNVu6u7UV1z+eRqPFjJ
 EFr+olwXCBO/GKkVqOhzOa6g8KrVbd89uIAjmP+ZV1ZLNxZLSDD4oq9i1UL9aMsa7zGNmU83G01
 KOwa5I=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/setgroups02: Convert to new API
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/setgroups/setgroups02.c | 194 +++++-----------------
 1 file changed, 41 insertions(+), 153 deletions(-)

diff --git a/testcases/kernel/syscalls/setgroups/setgroups02.c b/testcases/kernel/syscalls/setgroups/setgroups02.c
index de23a4a..08bdc3c 100644
--- a/testcases/kernel/syscalls/setgroups/setgroups02.c
+++ b/testcases/kernel/syscalls/setgroups/setgroups02.c
@@ -1,180 +1,68 @@
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
+ * Copyright (c) International Business Machines  Corp., 2001
+ * Copyright (c) Linux Test Project, 2003-2023
+ * 07/2001 Ported by Wayne Boyer
  */
 
-/*
- * Test Name: setgroups02
- *
- * Test Description:
- *  Verify that, only root process can invoke setgroups() system call to
- *  set the supplementary group IDs of the process.
- *
- * Expected Result:
- *  The call succeeds in setting all the supplementary group IDs of the
- *  calling process. The new group should be set in the process  supplemental
- *  group list.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
+/*\
+ * [Description]
  *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *   	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *   	Verify the Functionality of system call
- *      if successful,
- *      	Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
+ * Check that only the root process can invoke setgroups()
+ * to set supplementary group IDs.
  *
- * Usage:  <for command-line>
- *  setgroups02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  This test should be run by 'super-user' (root) only.
+ * [Expected Result]
  *
+ * The call succeeds in setting all the supplementary group IDs
+ * of the calling process. The new group should be set in the
+ * process supplemental group list.
  */
-#include <sys/types.h>
-#include <unistd.h>
-#include <errno.h>
-#include <pwd.h>
-#include <grp.h>
-#include <sys/param.h>
 
-#include "test.h"
+#include <pwd.h>
 
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"
 
 #define TESTUSER	"nobody"
 
-TCID_DEFINE(setgroups02);
-int TST_TOTAL = 1;		/* Total number of test conditions */
-GID_T groups_list[NGROUPS];	/* Array to hold gids for getgroups() */
+static GID_T groups_get[NGROUPS];
+static GID_T groups_set[NGROUPS];
 
-struct passwd *user_info;	/* struct. to hold test user info */
-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
+static struct passwd *user_info;
 
-int main(int ac, char **av)
+static void verify_setgroups(void)
 {
-	int lc, i;
-	int gidsetsize = 1;	/* only one GID, the GID of TESTUSER */
-	int PASS_FLAG = 0;	/* used for checking group array */
+	int gidsetsize = 1;
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	TEST(SETGROUPS(gidsetsize, groups_set));
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call setgroups() to set supplimentary group IDs of
-		 * the calling super-user process to gid of TESTUSER.
-		 */
-		TEST(SETGROUPS(cleanup, gidsetsize, groups_list));
+	if (TST_RET < 0) {
+		tst_res(TFAIL, "setgroups(%d, groups_set) Failed, "
+			"errno=%d : %s", gidsetsize,
+			TST_ERR, strerror(TST_ERR));
+	}
 
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "setgroups(%d, groups_list) Failed, "
-				 "errno=%d : %s", gidsetsize, TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
-		}
+	GETGROUPS(gidsetsize, groups_get);
 
-		/*
-		 * Call getgroups(2) to verify that
-		 * setgroups(2) successfully set the
-		 * supp. gids of TESTUSER.
-		 */
-		groups_list[0] = '\0';
-		if (GETGROUPS(cleanup, gidsetsize, groups_list) < 0) {
-			tst_brkm(TFAIL, cleanup, "getgroups() Fails, "
-				 "error=%d", errno);
-		}
-		for (i = 0; i < NGROUPS; i++) {
-			if (groups_list[i] == user_info->pw_gid) {
-				tst_resm(TPASS,
-					 "Functionality of setgroups"
-					 "(%d, groups_list) successful",
-					 gidsetsize);
-				PASS_FLAG = 1;
-			}
-		}
-		if (PASS_FLAG == 0) {
-			tst_resm(TFAIL, "Supplimentary gid %d not set "
-				 "for the process", user_info->pw_gid);
-		}
+	if (groups_get[0] == groups_set[0]) {
+		tst_res(TPASS,
+			"Functionality of setgroups"
+			"(%d, groups_set) successful",
+			gidsetsize);
 	}
-
-	cleanup();
-	tst_exit();
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- *
- *  Make sure the test process uid is root.
- *  Get the supplimentrary group id of test user from /etc/passwd file.
- */
-void setup(void)
+static void setup(void)
 {
+	user_info = SAFE_GETPWNAM(TESTUSER);
 
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* Get the group id info. of TESTUSER from /etc/passwd */
-	if ((user_info = getpwnam(TESTUSER)) == NULL) {
-		tst_brkm(TFAIL, cleanup, "getpwnam(2) of %s Failed", TESTUSER);
-	}
+	GID16_CHECK(user_info->pw_gid, setgroups);
 
-	if (!GID_SIZE_CHECK(user_info->pw_gid)) {
-		tst_brkm(TBROK,
-			 cleanup,
-			 "gid returned from getpwnam is too large for testing setgroups16");
-	}
-
-	groups_list[0] = user_info->pw_gid;
+	groups_set[0] = user_info->pw_gid;
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
+	.test_all = verify_setgroups,
+	.setup = setup,
+	.needs_root = 1,
+};
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
