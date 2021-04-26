Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C17036B38B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:53:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BEFF3C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:53:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AC203C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:53:30 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F04421A00930
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:53:28 +0200 (CEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FTPsS3dWKzkkXV
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 20:51:24 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 26 Apr 2021 20:53:15 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Apr 2021 20:52:23 +0800
Message-ID: <20210426125224.150268-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426125224.150268-1-xieziyao@huawei.com>
References: <20210426125224.150268-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3 v2] syscalls/close: Convert close02 to the new API
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

Cleanup and convert close02 to the new API.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
Cleanup with TST_EXP_FAIL() and remove setup() function.

 testcases/kernel/syscalls/close/close02.c | 122 +++-------------------
 1 file changed, 15 insertions(+), 107 deletions(-)

diff --git a/testcases/kernel/syscalls/close/close02.c b/testcases/kernel/syscalls/close/close02.c
index ddda5d9ec..50ca8006f 100644
--- a/testcases/kernel/syscalls/close/close02.c
+++ b/testcases/kernel/syscalls/close/close02.c
@@ -1,121 +1,29 @@
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
- * NAME
- * 	close02.c
- *
- * DESCRIPTION
- * 	Check that an invalid file descriptor returns EBADF
- *
- * ALGORITHM
- *	loop if that option is specified
- * 	   call close using the TEST macro and passing in an invalid fd
- *	   if the call succeedes
- *	      issue a FAIL message
- *	   else
- *	      log the errno
- *	      if the errno == EBADF
- *	         issue a PASS message
- *	      else
- *	         issue a FAIL message
- *	cleanup
- *
- * USAGE:  <for command-line>
- *  close02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+/*\
+ * [Description]
+ *
+ * Basic test for the close() syscall.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * [Algorithm]
  *
- * RESTRICTIONS
- * 	None
+ * Call close(-1) and expects it to return EBADF.
  */

 #include <stdio.h>
 #include <errno.h>
 #include <sys/stat.h>
-#include "test.h"
+#include "tst_test.h"

-void cleanup(void);
-void setup(void);
-
-char *TCID = "close02";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		TEST(close(-1));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "Closed a non existent fildes");
-		} else {
-			if (TEST_ERRNO != EBADF) {
-				tst_resm(TFAIL, "close() FAILED to set errno "
-					 "to EBADF on an invalid fd, got %d",
-					 errno);
-			} else {
-				tst_resm(TPASS, "call returned EBADF");
-			}
-		}
-	}
-	cleanup();
-
-	tst_exit();
-
+	TST_EXP_FAIL(close(-1), EBADF);
 }

-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	umask(0);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
