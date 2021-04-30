Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C2436F81F
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:45:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 646E93C5EAF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:45:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95B313C60C3
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:45:11 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A7A060004C
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:45:10 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FWnTn45rxznTcr
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 17:42:37 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 30 Apr 2021 17:44:57 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 30 Apr 2021 17:45:13 +0800
Message-ID: <20210430094513.162499-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430094513.162499-1-xieziyao@huawei.com>
References: <20210430094513.162499-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3 v2] syscalls/chown: Rewrite chown/chown05.c with
 the new api
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

1. Rewrite chown/chown05.c with the new api;
2. Remove duplicate test points.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Cleanup and delete unnecessary logic.

 testcases/kernel/syscalls/chown/chown05.c | 195 +++++-----------------
 1 file changed, 39 insertions(+), 156 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown05.c b/testcases/kernel/syscalls/chown/chown05.c
index 47510ee9a..2de09d913 100644
--- a/testcases/kernel/syscalls/chown/chown05.c
+++ b/testcases/kernel/syscalls/chown/chown05.c
@@ -1,173 +1,56 @@
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
+ * 07/2001 Ported by Wayne Boyer
  */

-/*
- * Test Name: chown05
- *
- * Test Description:
- *  Verify that, chown(2) succeeds to change the owner and group of a file
- *  specified by path to any numeric owner(uid)/group(gid) values when invoked
- *  by super-user.
- *
- * Expected Result:
- *  chown(2) should return 0 and the ownership set on the file should match
- *  the numeric values contained in owner and group respectively.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
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
- *   Delete the temporary directory created.
- *
- * Usage:  <for command-line>
- *  chown05 [-c n] [-e] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
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
+ * Verify that, chown(2) succeeds to change the owner and group of a file
+ * specified by path to any numeric owner(uid)/group(gid) values when invoked
+ * by super-user.
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"
+#include "tst_safe_macros.h"

-#define FILE_MODE	(S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
-#define TESTFILE	"testfile"
-
-TCID_DEFINE(chown05);
+#define FILE_MODE (S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
+#define TESTFILE "testfile"

 struct test_case_t {
-	uid_t user_id;
-	gid_t group_id;
-} test_cases[] = {
-	{
-	700, 701}, {
-	702, -1}, {
-	703, 701}, {
-	-1, 704}, {
-703, 705},};
-
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
+	uid_t uid;
+	gid_t gid;
+} tc[] = {
+	{700, 701},
+	{702, 701},
+	{702, 703},
+	{704, 705}
+};
+
+static void run(unsigned int i)
 {
-	struct stat stat_buf;	/* stat(2) struct contents */
-	int lc;
-	int i;
-	uid_t user_id;		/* user id of the user set for testfile */
-	gid_t group_id;		/* group id of the user set for testfile */
+	struct stat stat_buf;
+	TST_EXP_PASS(CHOWN(TESTFILE, tc[i].uid, tc[i].gid));

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			user_id = test_cases[i].user_id;
-			group_id = test_cases[i].group_id;
-
-			TEST(CHOWN(cleanup, TESTFILE, user_id, group_id));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO, "chown failed");
-				continue;
-			}
-			if (stat(TESTFILE, &stat_buf) == -1)
-				tst_brkm(TFAIL, cleanup, "stat failed");
-			if ((int)user_id == -1)
-				user_id = test_cases[i - 1].user_id;
-			if ((int)group_id == -1)
-				group_id = test_cases[i - 1].group_id;
-
-			if (stat_buf.st_uid != user_id ||
-			    stat_buf.st_gid != group_id)
-				tst_resm(TFAIL, "%s: incorrect "
-					 "ownership set, Expected %d "
-					 "%d", TESTFILE, user_id,
-					 group_id);
-			else
-				tst_resm(TPASS, "chown succeeded");
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	SAFE_STAT(TESTFILE, &stat_buf);
+	if (stat_buf.st_uid != tc[i].uid || stat_buf.st_gid != tc[i].gid)
+		tst_res(TFAIL, "%s: incorrect ownership set, expected %d %d",
+			TESTFILE, tc[i].uid, tc[i].gid);
 }

-void setup(void)
+static void setup(void)
 {
 	int fd;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "opening %s failed",
-			 TESTFILE);
-	SAFE_CLOSE(cleanup, fd);
-
+	fd = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
+	SAFE_CLOSE(fd);
 }

-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
