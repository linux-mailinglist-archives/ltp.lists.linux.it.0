Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7E3B8CA3
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 05:29:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88D483CA478
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 05:29:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F196D3CA490
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 05:28:48 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A09A140115A
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 05:28:46 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GFk8q5mfrz70M7
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 11:24:27 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 11:28:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 11:28:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 1 Jul 2021 11:29:31 +0800
Message-ID: <20210701032931.132468-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210701032931.132468-1-xieziyao@huawei.com>
References: <20210701032931.132468-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] fork08: Rewrite the test to a proper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rewrite fork08 to a proper synchronization with the new API.

Fixes: #774
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fork/fork08.c | 198 ++++++------------------
 1 file changed, 50 insertions(+), 148 deletions(-)

diff --git a/testcases/kernel/syscalls/fork/fork08.c b/testcases/kernel/syscalls/fork/fork08.c
index 1123f7473..082803f47 100644
--- a/testcases/kernel/syscalls/fork/fork08.c
+++ b/testcases/kernel/syscalls/fork/fork08.c
@@ -1,172 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
- *	fork08.c
- *
- * DESCRIPTION
- *	Check if the parent's file descriptors are affected by
- *	actions in the child; they should not be.
- *
- * ALGORITHM
- *	Parent opens a file.
- *	Forks a child which closes a file.
- *	Parent forks a second child which attempts to read the (closed)
- *	file.
- *
- * USAGE
- *	fork08
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
+ */
+
+/*\
+ * [Description]
  *
- * RESTRICTIONS
- *	None
+ * Check that the parent's file descriptors will not be affected by actions
+ * in the child.
  */

-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/stat.h>
-#include <stdio.h>
-#include "test.h"
+#include <stdlib.h>

-char *TCID = "fork08";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "tst_safe_stdio.h"

-static void setup(void);
-static void cleanup(void);
+#define TESTFILE "testfile_fork08"

-static char pbuf[10];
-static char fnamebuf[40];
+static FILE *rea;

-int main(int ac, char **av)
+static void run(void)
 {
-	int status, count, forks, pid1;
 	int ch_r_stat;
-	FILE *rea, *writ;
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);

-	setup();
+	rea = SAFE_FOPEN(TESTFILE, "r");
+	if ((getc(rea)) != 'a')
+		tst_res(TFAIL, "getc from read side was confused");
+	tst_flush();

-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		writ = fopen(fnamebuf, "w");
-		if (writ == NULL)
-			tst_resm(TFAIL, "failed to fopen file for write");
-		rea = fopen(fnamebuf, "r");
-		if (rea == NULL)
-			tst_resm(TFAIL, "failed to fopen file for read");
-
-		fprintf(writ, "abcdefghijklmnopqrstuv");
-		fflush(writ);
-		sleep(1);
-
-		if ((getc(rea)) != 'a')
-			tst_resm(TFAIL, "getc from read side was confused");
-
-		forks = 0;
-
-forkone:
-		++forks;
-
-		pid1 = fork();
-		if (pid1 != 0) {
-			tst_resm(TINFO, "parent forksval: %d", forks);
-
-			if ((pid1 != (-1)) && (forks < 2))
-				goto forkone;
-			else if (pid1 < 0)
-				tst_resm(TINFO, "Fork failed");
-		} else {	/* child */
-			/*
-			 * If first child close the file descriptor for the
-			 * read stream
-			 */
-			if (forks == 1) {
-				if ((fclose(rea)) == -1) {
-					tst_resm(TFAIL, "error in first child"
-						 " closing fildes");
-				}
-				_exit(0);
-			}
-
-			/*
-			 * If second child attempt to read from the file
-			 */
-			else if (forks == 2) {
-				ch_r_stat = getc(rea);
-				tst_resm(TINFO, "second child got char: %c",
-					 ch_r_stat);
-				if (ch_r_stat == 'b') {
-					tst_resm(TPASS, "Test passed in child "
-						 "number %d", forks);
-					exit(0);
-				} else if (ch_r_stat == EOF) {
-					tst_resm(TFAIL, "Second child got "
-						 "EOF");
-					exit(-1);
-				} else {
-					tst_resm(TFAIL, "test failed in child "
-						 "no %d", forks);
-					exit(-1);
-				}
-			} else {	/* end of second child */
-				tst_resm(TINFO, "forksnumber: %d", forks);
-				exit(3);
-			}
-		}
+	if (!SAFE_FORK()) {
+		SAFE_FCLOSE(rea);
+		exit(0);
+	}
+	tst_reap_children();

-		for (count = 0; count <= forks; count++) {
-			wait(&status);
-			tst_resm(TINFO, "exit status of wait "
-				 " expected 0 got %d", status);
-			status >>= 8;
-			if (status == 0)
-				tst_resm(TPASS, "parent test PASSED");
-			else
-				tst_resm(TFAIL, "parent test FAILED");
+	if (!SAFE_FORK()) {
+		ch_r_stat = getc(rea);
+		if (ch_r_stat == 'b') {
+			tst_res(TPASS, "%6d: read correctly", getpid());
+			exit(0);
 		}

-		tst_resm(TINFO, "Number of processes forked is %d", forks);
-		fclose(rea);
-		fclose(writ);
+		if (ch_r_stat == EOF)
+			tst_res(TFAIL, "%6d: got EOF", getpid());
+		else
+			tst_res(TFAIL, "%6d: read '%c' instead of 'b'",
+				getpid(), (char)ch_r_stat);
+		exit(-1);
 	}
+	tst_reap_children();

-	cleanup();
-	tst_exit();
+	SAFE_FCLOSE(rea);
 }

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	umask(0);
-	TEST_PAUSE;
-	tst_tmpdir();
+	int fd;
+	char buf[27];

-	strcpy(fnamebuf, "fork07.");
-	sprintf(pbuf, "%d", getpid());
-	strcat(fnamebuf, pbuf);
+	fd = SAFE_CREAT(TESTFILE, 00700);
+	sprintf(buf, "abcdefghijklmnopqrstuvwxyz");
+	SAFE_WRITE(1, fd, buf, strlen(buf));
+	SAFE_CLOSE(fd);
 }

-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
