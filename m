Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 010323BB87E
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 09:58:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 784543C8A73
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 09:58:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFF163C4FE9
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 09:58:20 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8680A60064B
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 09:58:19 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GJHyy4KSSz7853
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 15:54:50 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 15:58:13 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 15:58:12 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 5 Jul 2021 15:59:02 +0800
Message-ID: <20210705075903.98692-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705075903.98692-1-xieziyao@huawei.com>
References: <20210705075903.98692-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2 v2] fork07: Rewrite the test to a proper
 synchronization
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
Reply-To: 20210701032931.132468-2-xieziyao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rewrite fork07 to a proper synchronization with the new API.

Fixes: #774
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Write a new test as follows,
* Parent writes N bytes (for example 'a') to a file in setup()
* Parent opens a file descriptor for reading pointing to that file
* Parent forks N children
  - each child reads a byte from the file checks that the byte is 'a' then exits
* Parent waits the all the children
* Parent checks that the end of file is reached

 testcases/kernel/syscalls/fork/fork07.c | 236 +++++-------------------
 1 file changed, 45 insertions(+), 191 deletions(-)

diff --git a/testcases/kernel/syscalls/fork/fork07.c b/testcases/kernel/syscalls/fork/fork07.c
index e596867c3..31d8579bc 100644
--- a/testcases/kernel/syscalls/fork/fork07.c
+++ b/testcases/kernel/syscalls/fork/fork07.c
@@ -1,212 +1,66 @@
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
- *
- * NAME
- *	fork07.c
- *
- * DESCRIPTION
- *	Check that all children inherit parent's file descriptor
- *
- * ALGORITHM
- *	Parent opens a file, writes to it; forks Nforks children.
- *	Each child attempts to read the file then returns.
- *	Parent reports PASS if all children succeed.
- *
- * USAGE
- *	fork07
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	07/2002 Limited forking and split "infinite forks" test case to
- *	        fork12.c by Nate Straz
- *
- * RESTRICTIONS
- *	None
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * 07/2002 Limited forking and split "infinite forks" testcase to fork12.c by
+ * Nate Straz
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-#include <stdio.h>
-#include <errno.h>
-#include <string.h>
-#include <sys/wait.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include "test.h"
-
-char *TCID = "fork07";
-int TST_TOTAL = 1;
+/*\
+ * [Description]
+ *
+ * Check that all children inherit parent's file descriptor.
+ */

-static void help(void);
-static void setup(void);
-static void cleanup(void);
+#include <stdlib.h>

-static char pbuf[10];
-static char fnamebuf[40];
+#include "tst_test.h"

-static char *Nforkarg;
-static int Nflag;
-static int Nforks;
-static int vflag;
+#define NFORKS 100
+#define TESTFILE "testfile_fork07"

-static option_t options[] = {
-	{"N:", &Nflag, &Nforkarg},
-	{"v", &vflag, NULL},
-	{NULL, NULL, NULL}
-};
+static int fd;
+static char buf;

-int main(int ac, char **av)
+static void run(void)
 {
-	int status, forks, pid1;
-	int ch_r_stat;
-	FILE *rea, *writ;
-	int c_pass, c_fail;
-
-	int lc;
-
-	rea = NULL;
-	writ = NULL;
-
-	tst_parse_opts(ac, av, options, &help);
-
-	if (Nflag) {
-		if (sscanf(Nforkarg, "%i", &Nforks) != 1)
-			tst_brkm(TBROK, cleanup,
-				 "--N option arg is not a number");
-	} else
-		Nforks = 100;
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		writ = fopen(fnamebuf, "w");
-		if (writ == NULL)
-			tst_resm(TFAIL | TERRNO, "fopen(.. \"w\") failed");
-		rea = fopen(fnamebuf, "r");
-		if (rea == NULL)
-			tst_resm(TFAIL | TERRNO, "fopen(.. \"r\") failed");
-
-		fprintf(writ, "abcdefghijklmnopqrstuv");
-		fflush(writ);
-		sleep(1);
-
-		if ((getc(rea)) != 'a')
-			tst_resm(TFAIL, "getc from read side was confused");
-
-		/* fork off the children */
-		tst_resm(TINFO, "Forking %d children", Nforks);
-		tst_old_flush();
-		for (forks = 0; forks < Nforks; forks++) {
-			pid1 = fork();
-			if (pid1 == 0) {
-				ch_r_stat = getc(rea);
-#ifdef DEBUG
-				tst_resm(TINFO, "Child got char: %c",
-					 ch_r_stat);
-				tst_resm(TINFO,
-					 "integer value of getc in child "
-					 "expected %d got %d", 'b', ch_r_stat);
-#endif
-				if (ch_r_stat == 'b') {
-					if (vflag) {
-						tst_resm(TINFO,
-							 "%6d: read correct character",
-							 getpid());
-					}
-					exit(0);
-				} else {
-					if (vflag) {
-						tst_resm(TINFO,
-							 "%6d: read '%c' instead of 'b'",
-							 getpid(),
-							 (char)ch_r_stat);
-					}
-					exit(1);
-				}
-			} else if (pid1 == -1)
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "fork failed");
-		}
-		tst_resm(TINFO, "Forked all %d children, now collecting",
-			 Nforks);
-
-		/* Collect all the kids and see how they did */
-
-		c_pass = c_fail = 0;
-		while (wait(&status) > 0) {
-			if (WIFEXITED(status) && WEXITSTATUS(status) == 0)
-				c_pass++;
-			else
-				c_fail++;
-			--forks;
+	int ret, i;
+
+	fd = SAFE_OPEN(TESTFILE, O_RDONLY);
+	for (i = 0; i < NFORKS; ++i) {
+		if (!SAFE_FORK()) {
+			SAFE_READ(1, fd, &buf, 1);
+			if (buf != 'a')
+				tst_res(TFAIL, "%6d: read '%c' instead of 'a'",
+					getpid(), buf);
+			exit(0);
 		}
-		if (forks == 0) {
-			tst_resm(TINFO, "Collected all %d children", Nforks);
-			if (c_fail > 0)
-				tst_resm(TFAIL,
-					 "%d/%d children didn't read correctly from an inheritted fd",
-					 c_fail, Nforks);
-			else
-				tst_resm(TPASS,
-					 "%d/%d children read correctly from an inheritted fd",
-					 c_pass, Nforks);
-		} else if (forks > 0)
-			tst_brkm(TBROK, cleanup,
-				 "There should be %d more children to collect!",
-				 forks);
-		else
-
-			tst_brkm(TBROK, cleanup,
-				 "Collected %d more children then I should have!",
-				 abs(forks));
 	}
-	fclose(writ);
-	fclose(rea);
-	cleanup();
+	tst_reap_children();

-	tst_exit();
-}
-
-static void help(void)
-{
-	printf("  -N n    Create n children each iteration\n");
-	printf("  -v      Verbose mode\n");
+	ret = read(fd, &buf, 1);
+	if (ret == 0)
+		tst_res(TPASS, "read the end of file correctly");
+	else
+		tst_res(TFAIL, "read() returns %d, expected 0", ret);
 }

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	umask(0);
-	TEST_PAUSE;
-	tst_tmpdir();
-
-	strcpy(fnamebuf, "fork07.");
-	sprintf(pbuf, "%d", getpid());
-	strcat(fnamebuf, pbuf);
+	tst_fill_file(TESTFILE, 'a', NFORKS, 1);
 }

 static void cleanup(void)
 {
-	int waitstatus;
-
-	/* collect our zombies */
-	while (wait(&waitstatus) > 0) ;
-
-	unlink(fnamebuf);
-	tst_rmdir();
+	if (fd > 0)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
