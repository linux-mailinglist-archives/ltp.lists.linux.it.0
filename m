Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E41013E50C7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 03:53:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8595B3C719C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 03:53:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6725F3C7182
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 03:53:10 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6715B1000464
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 03:53:09 +0200 (CEST)
X-QQ-mid: bizesmtp38t1628560384tm296imb
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 09:52:55 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000A0000000
X-QQ-FEAT: uPLuWhYJ8bgiBdF4V4Xov1lUEOQkfOdYGHyYUACC65txBGPjRPsWLltrNgCdz
 K5eNlIaiME726DbIJS4/BVSNudk0SEgKVVdau/ZC4ViYHtHQcGak3dZjI5y9j0D8yUpCF8t
 85MmppXnRKya7oBmoGTsK5TKryUZxPGr4JK9iM9wjVFCC1CQQPqMQfckqtrBxdK5OhwBu2j
 alZ9GvYM3k/F1yErnxDEXlmw7eY5dJePaxgQxZwuVTYReRJ0mz2Z3c+8py/m9oBiADnA2O6
 Uxmb4DWrVu21Yg9qHy+KqRrRR/6PyydVs0+MPIRfb2pzLRvhglyoe1QnFv9vHWdMQEEwk1y
 QOBS1rOpKOMcPd4CKY=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 10 Aug 2021 09:52:50 +0800
Message-Id: <20210810015250.21315-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/chmod03: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/chroot/chroot03.c b/testcases/kernel/syscalls/chroot/chroot03.c
index b904e4ac9..0e509f415 100644
--- a/testcases/kernel/syscalls/chroot/chroot03.c
+++ b/testcases/kernel/syscalls/chroot/chroot03.c
@@ -1,168 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *   Copyright (c) International Business Machines  Corp., 2001
  *
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
+ *	 07/2001 Ported by Wayne Boyer
  */

-/*
- *	Testcase to test whether chroot(2) sets errno correctly.
- *
- *	1.	Test for ENAMETOOLONG:
- *		Create a bad directory name with length more than
- *		VFS_MAXNAMELEN (Linux kernel variable), and pass it as the
- *		path to chroot(2).
- *
- *	2.	Test for ENOENT:
- *		Attempt to chroot(2) on a non-existent directory
- *
- *	3.	Test for ENOTDIR:
- *		Attempt to chdir(2) on a file.
- *
- *	4.	Test for EFAULT:
- *		The pathname parameter to chroot() points to an invalid address,
- *		chroot(2) fails with EPERM.
+/*\
+ * [Description]
  *
- *	5.	Test for ELOOP:
- *		Too many symbolic links were encountered When resolving the
- *		pathname parameter.
- *
- *	07/2001 Ported by Wayne Boyer
+ * Testcase to test whether chroot(2) sets errno correctly.
+ *
+ * - to test whether chroot() is setting ENAMETOOLONG if the
+ *   pathname is more than VFS_MAXNAMELEN.
+ * - to test whether chroot() is setting ENOTDIR if the argument
+ *   is not a directory.
+ * - to test whether chroot() is setting ENOENT if the directory
+ *   does not exist.
+ * - attempt to chroot to a path pointing to an invalid address
+ *   and expect EFAULT as errno.
+ * - to test whether chroot() is setting ELOOP if the two
+ *   symbolic directory who point to each other.
  */

 #include <stdio.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "test.h"
-#include <fcntl.h>
-#include "safe_macros.h"
-
-char *TCID = "chroot03";
+#include "tst_test.h"

-static int fd;
 static char fname[255];
 static char nonexistent_dir[100] = "testdir";
 static char bad_dir[] = "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
 static char symbolic_dir[] = "sym_dir1";

-struct test_case_t {
+static struct tcase {
 	char *dir;
 	int error;
-} TC[] = {
-	/*
-	 * to test whether chroot() is setting ENAMETOOLONG if the
-	 * pathname is more than VFS_MAXNAMELEN
-	 */
-	{
-	bad_dir, ENAMETOOLONG},
-	    /*
-	     * to test whether chroot() is setting ENOTDIR if the argument
-	     * is not a directory.
-	     */
-	{
-	fname, ENOTDIR},
-	    /*
-	     * to test whether chroot() is setting ENOENT if the directory
-	     * does not exist.
-	     */
-	{
-	nonexistent_dir, ENOENT},
-#if !defined(UCLINUX)
-	    /*
-	     * attempt to chroot to a path pointing to an invalid address
-	     * and expect EFAULT as errno
-	     */
-	{
-	(char *)-1, EFAULT},
-#endif
-	{symbolic_dir, ELOOP}
+	char *desc;
+} tcases[] = {
+	{bad_dir, ENAMETOOLONG, "chroot(pathname more than VFS_MAXNAMELEN)"},
+	{fname, ENOTDIR, "chroot(not a directory)"},
+	{nonexistent_dir, ENOENT, "chroot(path does not exists)"},
+	{(char *)-1, EFAULT, "chroot(a path pointing to an invalid address)"},
+	{symbolic_dir, ELOOP, "chroot(two symbolic directory who point to each other)"}
 };

-int TST_TOTAL = ARRAY_SIZE(TC);
-
-static char *bad_addr;
-
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_chroot(unsigned int n)
 {
-	int lc;
-	int i;
+	struct tcase *tc = &tcases[n];

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(chroot(TC[i].dir));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS | TTERRNO, "failed as expected");
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "didn't fail as expected (expected errno "
-					 "= %d : %s)",
-					 TC[i].error, strerror(TC[i].error));
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	TST_EXP_FAIL(chroot(tc->dir), tc->error, "%s", tc->desc);
 }

 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
-	tst_tmpdir();
+	unsigned int i;

-	/*
-	 * create a file and use it to test whether chroot() is setting
-	 * ENOTDIR if the argument is not a directory.
-	 */
 	(void)sprintf(fname, "tfile_%d", getpid());
-	fd = SAFE_CREAT(cleanup, fname, 0777);
+	SAFE_TOUCH(fname, 0666, NULL);

-#if !defined(UCLINUX)
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED)
-		tst_brkm(TBROK, cleanup, "mmap failed");
-
-	TC[3].dir = bad_addr;
-#endif
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (tcases[i].error == EFAULT)
+			tcases[3].dir = tst_get_bad_addr(NULL);
+	}
+
 	/*
 	 * create two symbolic directory who point to each other to
 	 * test ELOOP.
 	 */
-	SAFE_SYMLINK(cleanup, "sym_dir1/", "sym_dir2");
-	SAFE_SYMLINK(cleanup, "sym_dir2/", "sym_dir1");
+	SAFE_SYMLINK("sym_dir1/", "sym_dir2");
+	SAFE_SYMLINK("sym_dir2/", "sym_dir1");
 }

-static void cleanup(void)
-{
-	close(fd);
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_chroot,
+	.needs_tmpdir = 1,
+};
--
2.20.1





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
