Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0184197871
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44A433C315B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E22F73C3133
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D2D2310000EA
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 365F2AEC6
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:12:39 +0000 (UTC)
From: Jozef Pupava <jpupava@suse.com>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 12:12:21 +0200
Message-Id: <20200330101222.25371-2-jpupava@suse.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200330101222.25371-1-jpupava@suse.com>
References: <20200330101222.25371-1-jpupava@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Update syscalls/fsync02 to new API
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

Acked-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Jozef Pupava <jpupava@suse.com>
---
 testcases/kernel/syscalls/fsync/fsync02.c | 235 +++++++---------------
 1 file changed, 77 insertions(+), 158 deletions(-)

diff --git a/testcases/kernel/syscalls/fsync/fsync02.c b/testcases/kernel/syscalls/fsync/fsync02.c
index 1e5f9ee00..9506b4868 100644
--- a/testcases/kernel/syscalls/fsync/fsync02.c
+++ b/testcases/kernel/syscalls/fsync/fsync02.c
@@ -1,195 +1,114 @@
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
+ * Copyright (c) Wayne Boyer, International Business Machines  Corp., 2001
+ * Copyright (c) 2019 SUSE LLC, Jozef Pupava <jpupava@suse.com>
  */
 
 /*
- * NAME
- *	fsync02.c
- *
- * DESCRIPTION
- *	Create a sparse file, fsync it, and time the fsync
- *
- * ALGORITHM
- *	1. Create a file.
- *	2. Write to the file at equally spaced intervals up to a max block
- *	3. Check if the time limit was exceeded.
- *
- * USAGE:  <for command-line>
- *  fsync02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	None
+ * Test Description:
+ *  Test fsync() return value on test file
+ *  fsync() has to finish within TIME_LIMIT.
  */
 
 #include <stdio.h>
-#include <unistd.h>
+#include <stdlib.h>
 #include <sys/types.h>
 #include <sys/statvfs.h>
 #include <fcntl.h>
-#include <errno.h>
 #include <sys/resource.h>
-#include "test.h"
-#include "safe_macros.h"
 #include <time.h>
+#include "tst_test.h"
 
 #define BLOCKSIZE 8192
 #define MAXBLKS 262144
 #define TIME_LIMIT 120
 
-char *TCID = "fsync02";
-int TST_TOTAL = 1;
-
-void setup(void);
-void cleanup(void);
-
 char tempfile[40] = "";
-int fd, pid;
+char pbuf[BUFSIZ];
+int fd;
 off_t max_blks = MAXBLKS;
 
 struct statvfs stat_buf;
 
-int main(int ac, char **av)
-{
-	int lc;
-
-	off_t offsetret, offset;
-	char pbuf[BUFSIZ];
-	int ret, max_block = 0;
-	int i;
-	time_t time_start, time_end;
-	double time_delta;
-	int data_blocks = 0;
-	long int random_number;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		while (max_block <= data_blocks) {
-			random_number = random();
-			max_block = random_number % max_blks;
-			data_blocks = random_number % 1000 + 1;
-		}
-
-		for (i = 1; i <= data_blocks; i++) {
-			offset = i * ((BLOCKSIZE * max_block) / data_blocks);
-			offset -= BUFSIZ;
-			if ((offsetret = lseek(fd, offset, SEEK_SET)) != offset)
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "lseek failed: %ld, %ld", offsetret,
-					 offset);
-			if ((ret = write(fd, pbuf, BUFSIZ)) != BUFSIZ)
-				tst_brkm(TBROK, cleanup, "write failed");
-		}
-		if (time(&time_start) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "getting start time failed");
-
-		TEST(fsync(fd));
-
-		if (time(&time_end) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "getting end time failed");
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "fsync failed");
-			continue;
-		}
-
-		if (time_end < time_start)
-			tst_resm(TBROK,
-				 "timer broken end %ld < start %ld",
-				 time_end, time_start);
-
-		if ((time_delta =
-		     difftime(time_end, time_start)) > TIME_LIMIT)
-			tst_resm(TFAIL,
-				 "fsync took too long: %lf seconds; "
-				 "max_block: %d; data_blocks: %d",
-				 time_delta, max_block, data_blocks);
-		else
-			tst_resm(TPASS, "fsync succeeded in an "
-				 "acceptable amount of time");
-
-		SAFE_FTRUNCATE(cleanup, fd, 0);
-	}
-
-	sync();
-	cleanup();
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
-{
+static void setup(void) {
 	/* free blocks avail to non-superuser */
 	unsigned long f_bavail;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
+	fd = SAFE_OPEN("tempfile", O_RDWR | O_CREAT | O_TRUNC, 0777);
 
-	sprintf(tempfile, "%s.%d", TCID, pid = getpid());
-	srand48(pid);
-
-	if ((fd = open(tempfile, O_RDWR | O_CREAT | O_TRUNC, 0777)) == -1)
-		tst_brkm(TBROK, cleanup, "open failed");
-
-	if (fstatvfs(fd, &stat_buf) != 0)
-		tst_brkm(TBROK, cleanup, "fstatvfs failed");
+	if (fstatvfs(fd, &stat_buf) != 0) {
+		tst_brk(TBROK, "fstatvfs failed");
+	}
 
 	f_bavail = (stat_buf.f_bavail * stat_buf.f_frsize) / BLOCKSIZE;
-	if (f_bavail && (f_bavail < MAXBLKS))
+	if (f_bavail && (f_bavail < MAXBLKS)) {
 		max_blks = f_bavail;
+	}
 
 #ifdef LARGEFILE
-	if ((fcntl(fd, F_SETFL, O_LARGEFILE)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "fcntl(.., O_LARGEFILE) failed");
-
-	if (write(fd, pbuf, BUFSIZ) != BUFSIZ)
-		tst_brkm(TBROK | TERRNO, cleanup, "write(fd, pbuf, ..) failed");
+	SAFE_FCNTL(fd, F_SETFL, O_LARGEFILE);
+	SAFE_WRITE(1, fd, pbuf, BUFSIZ);
 #endif
 }
 
-void cleanup(void)
-{
-	if (close(fd) == -1)
-		tst_resm(TWARN | TERRNO, "close failed");
+static void run(void) {
+	off_t offset;
+	int i;
+	int max_block = 0;
+	int data_blocks = 0;
+	time_t time_start, time_end;
+	double time_delta;
+	long int random_number;
+
+	while (max_block <= data_blocks) {
+		random_number = rand();
+		max_block = random_number % max_blks;
+		data_blocks = random_number % 1000 + 1;
+	}
 
-	tst_rmdir();
+	for (i = 1; i <= data_blocks; i++) {
+		offset = i * ((BLOCKSIZE * max_block) / data_blocks);
+		offset -= BUFSIZ;
+		SAFE_LSEEK(fd, offset, SEEK_SET);
+		SAFE_WRITE(1, fd, pbuf, BUFSIZ);
+	}
+	time_start = time(0);
+
+	TEST(fsync(fd));
+
+	time_end = time(0);
+
+	if (time_end == -1) {
+		tst_res(TFAIL | TTERRNO, "getting end time failed");
+	} else if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "fsync failed");
+	} else if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+		"fsync failed with unexpected return value");
+	} else if (time_end < time_start) {
+		tst_res(TFAIL,
+		"timer broken end %ld < start %ld",
+		time_end, time_start);
+	} else if ((time_delta =
+		difftime(time_end, time_start)) > TIME_LIMIT) {
+		tst_res(TFAIL,
+		"fsync took too long: %lf seconds; "
+		"max_block: %d; data_blocks: %d",
+		time_delta, max_block, data_blocks);
+	} else {
+		tst_res(TPASS,
+		"fsync succeeded in an acceptable amount of time");
+	}
+	SAFE_FTRUNCATE(fd, 0);
+}
 
+static void cleanup(void) {
+	SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1
+};
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
