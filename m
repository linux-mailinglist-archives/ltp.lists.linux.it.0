Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B232CA25
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 02:44:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D4B03C5A78
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 02:44:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D58FC3C5685
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 02:44:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 357981000D8F
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 02:44:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,221,1610380800"; d="scan'208";a="105126164"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 09:44:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7329C4CE9141
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 09:44:48 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 09:44:48 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 4 Mar 2021 09:44:48 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 4 Mar 2021 09:44:44 +0800
Message-ID: <20210304014444.1123439-1-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7329C4CE9141.AE14D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/chdir04: Convert to the new API
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

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/chdir/chdir04.c | 168 +++-------------------
 1 file changed, 22 insertions(+), 146 deletions(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir04.c b/testcases/kernel/syscalls/chdir/chdir04.c
index f0420e4c9..d7e6210c3 100644
--- a/testcases/kernel/syscalls/chdir/chdir04.c
+++ b/testcases/kernel/syscalls/chdir/chdir04.c
@@ -1,162 +1,38 @@
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
  */
 
-/*
- * NAME
- * 	chdir04.c
- *
- * DESCRIPTION
- *	Testcase to test whether chdir(2) sets errno correctly.
- *
- * ALGORITHM
- *	1.	Test for ENAMETOOLONG:
- *		Create a bad directory name with length more than
- *
- *		VFS_MAXNAMELEN (Linux kernel variable), and attempt to
- *		chdir(2) to it.
- *
- *	2.	Test for ENOENT:
- *		Attempt to chdir(2) on a non-existent directory
- *
- *	3.	Test for EFAULT:
- *		Pass an address which lies outside the address space of the
- *		process, and expect an EFAULT.
- *
- * USAGE:  <for command-line>
- * chdir04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+/*\
+ * [DESCRIPTION]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	NONE
- */
+ * Testcase to test whether chdir(2) sets errno correctly.
+\*/
 
-#include <stdio.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "test.h"
-
-char *TCID = "chdir04";
+#include "tst_test.h"
 
 char bad_dir[] =
     "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
-
 char noexist_dir[] = "/tmp/noexistdir";
-
-struct test_case_t {
-	char *dname;
-	int error;
-} TC[] = {
-	/*
-	 * to test whether chdir() is setting ENAMETOOLONG if the
-	 * directory is more than VFS_MAXNAMELEN
-	 */
-	{
-	bad_dir, ENAMETOOLONG},
-	    /*
-	     * to test whether chdir() is setting ENOENT if the
-	     * directory is not existing.
-	     */
-	{
-	noexist_dir, ENOENT},
-	    /*
-	     * to test whether chdir() is setting EFAULT if the
-	     * directory is an invalid address.
-	     */
-	{
-	(void *)-1, EFAULT}
-};
-
-int TST_TOTAL = ARRAY_SIZE(TC);
-
-int flag;
-#define	FAILED	1
-
-void setup(void);
-void cleanup(void);
-
 char *bad_addr = 0;
 
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(chdir(TC[i].dname));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error)
-				tst_resm(TPASS | TTERRNO, "failed as expected");
-			else {
-				tst_resm(TFAIL | TTERRNO,
-					 "didn't fail as expected (expected %d)",
-					 TC[i].error);
-			}
-		}
-	}
-	cleanup();
-
-	tst_exit();
-
-}
+static struct tcase {
+	char *dir;
+	int exp_errno;
+} tcases [] = {
+	{bad_dir, ENAMETOOLONG},
+	{noexist_dir, ENOENT},
+	{(void *)-1, EFAULT}
+};
 
-void setup(void)
+static void verify_chdir(unsigned int i)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-#ifdef UCLINUX
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED)
-		tst_brkm(TBROK | TERRNO, cleanup, "mmap() failed");
-	TC[2].dname = bad_addr;
-#endif
+	TST_EXP_FAIL(chdir(tcases[i].dir), tcases[i].exp_errno);
 }
 
-void cleanup(void)
-{
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test = verify_chdir,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.30.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
