Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BF3A27E3
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 11:11:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D8523C31CC
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 11:11:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 128323C1C6B
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 11:11:26 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 10917201026
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 11:11:24 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AupnkzazelwFuqG+SpcS0KrPwEL1zdoMgy1kn?=
 =?us-ascii?q?xilNoH1uA6ilfqWV8cjzuiWbtN9vYhsdcLy7WZVoIkmskKKdg7NhXotKNTOO0A?=
 =?us-ascii?q?SVxepZnOnfKlPbexHWx6p00KdMV+xEAsTsMF4St63HyTj9P9E+4NTvysyVuds?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.83,263,1616428800"; d="scan'208";a="109455676"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2021 17:11:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8A9EA4D0BA6A
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 17:11:20 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Jun 2021 17:11:10 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 10 Jun 2021 17:10:49 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 10 Jun 2021 17:10:43 +0800
Message-ID: <20210610091043.900863-2-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610091043.900863-1-ruansy.fnst@fujitsu.com>
References: <20210610091043.900863-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8A9EA4D0BA6A.A0BB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/read04: Convert to new API
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
 testcases/kernel/syscalls/read/read04.c | 157 +++++-------------------
 1 file changed, 34 insertions(+), 123 deletions(-)

diff --git a/testcases/kernel/syscalls/read/read04.c b/testcases/kernel/syscalls/read/read04.c
index 11469ad29..6a9ed218b 100644
--- a/testcases/kernel/syscalls/read/read04.c
+++ b/testcases/kernel/syscalls/read/read04.c
@@ -1,150 +1,61 @@
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
- *	read04.c
- *
- * DESCRIPTION
- *	Testcase to check if read returns the number of bytes read correctly.
- *
- * ALGORITHM
- *	Create a file and write some bytes out to it.
- *	Attempt to read more than written.
- *	Check the return count, and the read buffer. The read buffer should be
- *	same as the write buffer.
- *
- * USAGE:  <for command-line>
- *  read04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+/*\
+ * [DESCRIPTION]
  *
- * RESTRICTIONS
- *	None
+ * Testcase to check if read() returns the number of bytes read correctly.
  */
+
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <stdio.h>
 #include <fcntl.h>
-#include <errno.h>
-#include "test.h"
-#include "safe_macros.h"
-
-void cleanup(void);
-void setup(void);
-
-char *TCID = "read04";
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
 #define TST_SIZE	27	/* could also do strlen(palfa) */
-char fname[255];
-char palfa[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
-int fild;
+static char fname[255];
+static char palfa[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 
-int main(int ac, char **av)
+static void verify_read(void)
 {
-	int lc;
-
-	int rfild;
+	int fd;
 	char prbuf[BUFSIZ];
 
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup for test */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;	/* reset tst_count while looping */
-
-		if ((rfild = open(fname, O_RDONLY)) == -1) {
-			tst_brkm(TBROK, cleanup, "can't open for reading");
-		}
-		TEST(read(rfild, prbuf, BUFSIZ));
+	fd = SAFE_OPEN(fname, O_RDONLY);
+	TEST(read(fd, prbuf, BUFSIZ));
 
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "call failed unexpectedly");
-			continue;
-		}
-
-		if (TEST_RETURN != TST_SIZE) {
-			tst_resm(TFAIL, "Bad read count - got %ld - "
-				 "expected %d", TEST_RETURN, TST_SIZE);
-			continue;
-		}
-		if (memcmp(palfa, prbuf, TST_SIZE) != 0) {
-			tst_resm(TFAIL, "read buffer not equal "
-				 "to write buffer");
-			continue;
-		}
-		tst_resm(TPASS, "functionality of read() is correct");
-
-		SAFE_CLOSE(cleanup, rfild);
+	if (TST_RET != TST_SIZE) {
+		tst_res(TFAIL, "Bad read count - got %ld - expected %d",
+				TST_RET, TST_SIZE);
+		goto out;
+	}
+	if (memcmp(palfa, prbuf, TST_SIZE)) {
+		tst_res(TFAIL, "read buffer not equal to write buffer");
+		goto out;
 	}
+	tst_res(TPASS, "functionality of read() is correct");
 
-	cleanup();
-	tst_exit();
+out:
+	SAFE_CLOSE(fd);
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	int fd;
 
 	umask(0);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	sprintf(fname, "tfile_%d", getpid());
 
-	if ((fild = creat(fname, 0777)) == -1) {
-		tst_brkm(TBROK, cleanup, "creat(%s, 0777) Failed, errno = %d"
-			 " : %s", fname, errno, strerror(errno));
-	}
-	if (write(fild, palfa, TST_SIZE) != TST_SIZE) {
-		tst_brkm(TBROK, cleanup, "can't write to Xread");
-	}
-	close(fild);
+	fd = SAFE_CREAT(fname, 0777);
+	SAFE_WRITE(1, fd, palfa, TST_SIZE);
+	SAFE_CLOSE(fd);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at completion or
- *	       premature exit.
- */
-void cleanup(void)
-{
-
-	unlink(fname);
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test_all = verify_read,
+};
-- 
2.31.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
