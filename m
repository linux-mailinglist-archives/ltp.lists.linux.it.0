Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B63E224C
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A229A3C7F36
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 708933C1882
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:45 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 064991A00922
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:43 +0200 (CEST)
X-QQ-mid: bizesmtp53t1628222438te6lcmp6
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 12:00:34 +0800 (CST)
X-QQ-SSF: 0140000000200030B000000C0000000
X-QQ-FEAT: 6sAC5CvpU1ioHDlhEHAo/rfpab3po/UBx+fIJRMvIm8Sz3l+/TDr57X43J96Y
 TFq+1bvGzE93Cj3pdoL95ANMxnPBhiZ7cePuY0faRBsyOJF+Qp6kHN1T5HqxcQp1ZmFPl8M
 nLlmmd89+bClOHxsch/Q9wSnIbQCl6dx8GtivXny7E38w518MmcPa3SsA0YxWY3FtJg7VIn
 dt2nOxJFDWsv1zRboLyl154A5fhsKJzgKAd182Xh8TqaPq1c0Dg5+7F036dEiY2ZzdNCjjn
 RJ//OUx4l5reNpiAbcgQoy/nqclQQ0Dhv7MH8FiIvqVzXA7T75C73dkof6e0OfsRMYvC0gl
 ZbIBnCVB9PG30hp7+E=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 12:00:33 +0800
Message-Id: <20210806040033.18653-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [3/4] syscalls/chroot03: Convert to new API
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
index b904e4ac9..ae691576d 100644
--- a/testcases/kernel/syscalls/chroot/chroot03.c
+++ b/testcases/kernel/syscalls/chroot/chroot03.c
@@ -1,168 +1,91 @@
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
+/*\
+ * [DESCRIPTION]
  *
- *	4.	Test for EFAULT:
- *		The pathname parameter to chroot() points to an invalid address,
- *		chroot(2) fails with EPERM.
- *
- *	5.	Test for ELOOP:
- *		Too many symbolic links were encountered When resolving the
- *		pathname parameter.
- *
- *	07/2001 Ported by Wayne Boyer
+ *	Testcase to test whether chroot(2) sets errno correctly.
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

 static int fd;
 static char fname[255];
 static char nonexistent_dir[100] = "testdir";
 static char bad_dir[] = "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
 static char symbolic_dir[] = "sym_dir1";
+static char *bad_addr;

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
+} tcases[] = {
+		/*
+		* to test whether chroot() is setting ENAMETOOLONG if the
+		* pathname is more than VFS_MAXNAMELEN
+		*/
+	{bad_dir, ENAMETOOLONG},
 	    /*
 	     * to test whether chroot() is setting ENOTDIR if the argument
 	     * is not a directory.
 	     */
-	{
-	fname, ENOTDIR},
+	{fname, ENOTDIR},
 	    /*
 	     * to test whether chroot() is setting ENOENT if the directory
 	     * does not exist.
 	     */
-	{
-	nonexistent_dir, ENOENT},
-#if !defined(UCLINUX)
+	{nonexistent_dir, ENOENT},
 	    /*
 	     * attempt to chroot to a path pointing to an invalid address
 	     * and expect EFAULT as errno
 	     */
-	{
-	(char *)-1, EFAULT},
-#endif
+	{(char *)-1, EFAULT},
 	{symbolic_dir, ELOOP}
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
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
+	struct tcase *tc = &tcases[n];

-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(chroot(TC[i].dir));
+	TST_EXP_FAIL(chroot(tc->dir), tc->error,
+			"didn't fail as expected (expected errno "
+			"= %d : %s)", tc->error, strerror(tc->error));

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
 }

 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
-	tst_tmpdir();
-
 	/*
 	 * create a file and use it to test whether chroot() is setting
 	 * ENOTDIR if the argument is not a directory.
 	 */
 	(void)sprintf(fname, "tfile_%d", getpid());
-	fd = SAFE_CREAT(cleanup, fname, 0777);
+	fd = SAFE_CREAT(fname, 0777);

-#if !defined(UCLINUX)
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED)
-		tst_brkm(TBROK, cleanup, "mmap failed");
-
-	TC[3].dir = bad_addr;
-#endif
+	bad_addr = tst_get_bad_addr(NULL);
+	tcases[3].dir = bad_addr;
 	/*
 	 * create two symbolic directory who point to each other to
 	 * test ELOOP.
 	 */
-	SAFE_SYMLINK(cleanup, "sym_dir1/", "sym_dir2");
-	SAFE_SYMLINK(cleanup, "sym_dir2/", "sym_dir1");
+	SAFE_SYMLINK("sym_dir1/", "sym_dir2");
+	SAFE_SYMLINK("sym_dir2/", "sym_dir1");
 }

 static void cleanup(void)
 {
-	close(fd);
-	tst_rmdir();
+	SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_chroot,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
