Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29D439056
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 09:28:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 361363C645B
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 09:28:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C9D63C58B4
 for <ltp@lists.linux.it>; Fri, 22 Oct 2021 05:43:50 +0200 (CEST)
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 05742602129
 for <ltp@lists.linux.it>; Fri, 22 Oct 2021 05:43:48 +0200 (CEST)
X-QQ-mid: bizesmtp36t1634874221t09rnvh2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 22 Oct 2021 11:43:36 +0800 (CST)
X-QQ-SSF: 0140000000200010B000000A0000000
X-QQ-FEAT: j375Cqr75uiNhW9wDQOlG0CirC7qn1oi60t8HYNFuzkNynjUA2f4JryOVdgfE
 5oIR2oRuRL8edRXmoqLAeXHX/dhqscrzN/Vz8tgyqhQVgFWZ2YCRuRcoC6bvYFtwm092x/S
 3y4d2EIE9Y1ptNJ4TP8RAxLz9HCIARRITFVZch4yM4yIdQVFjwLBA1EZ0pvMQ56UyFsiWEH
 wYcZhfgbMmbOfortsI3falkre7hmR8Usp6ocHyDZAbiJb0zLJOOa2Ak8EBjsyX0gzP7dmUo
 5pyQfTHvj808KY2VXz0SZ7ZaBt3gVkSMUCjNZWUNDxYt2nnhiVeFdoauCy7HbX10KsuwxAN
 5U4nJv04uO4KWzVrnIFIOfQF8C+TH/6gabiAjlQ
X-QQ-GoodBg: 2
From: tangmeng <tangmeng@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 22 Oct 2021 11:43:35 +0800
Message-Id: <20211022034335.5608-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 25 Oct 2021 09:27:43 +0200
Subject: [LTP] [PATCH] link/link02: Convert to new API
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
Cc: tangmeng <tangmeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Tang Meng <tangmeng@uniontech.com>
---
 testcases/kernel/syscalls/link/link02.c | 102 ++++++------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/testcases/kernel/syscalls/link/link02.c b/testcases/kernel/syscalls/link/link02.c
index 6ac340c72..f41179f4c 100644
--- a/testcases/kernel/syscalls/link/link02.c
+++ b/testcases/kernel/syscalls/link/link02.c
@@ -1,115 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *  AUTHOR		: William Roske
- *  CO-PILOT		: Dave Fenner
- * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
+ * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  */

-/*
+/*\
+ * [Description]
  * Tests that link(2) succeds.
  */

-#include <sys/types.h>
-#include <fcntl.h>
+#include <unistd.h>
 #include <sys/stat.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
-
-static void setup(void);
-static void cleanup(void);

-char *TCID = "link02";
-int TST_TOTAL = 1;
+#include "tst_test.h"

 #define OLDPATH "oldpath"
 #define NEWPATH "newpath"

-static void verify_link(void)
+static void verify_link02(void)
 {
 	struct stat fbuf, lbuf;

 	TEST(link(OLDPATH, NEWPATH));

-	if (TEST_RETURN == 0) {
-		SAFE_STAT(cleanup, OLDPATH, &fbuf);
-		SAFE_STAT(cleanup, NEWPATH, &lbuf);
+	if (TST_RET == 0) {
+		SAFE_STAT(OLDPATH, &fbuf);
+		SAFE_STAT(NEWPATH, &lbuf);
 		if (fbuf.st_nlink > 1 && lbuf.st_nlink > 1 &&
 		    fbuf.st_nlink == lbuf.st_nlink) {
-			tst_resm(TPASS, "link("OLDPATH","NEWPATH") "
+			tst_res(TPASS, "link("OLDPATH","NEWPATH") "
 			         "returned 0 and link counts match");
 		} else {
-			tst_resm(TFAIL, "link("OLDPATH","NEWPATH") returned 0"
+			tst_res(TFAIL, "link("OLDPATH","NEWPATH") returned 0"
 				 " but stat lin count do not match %d %d",
 				 (int)fbuf.st_nlink, (int)lbuf.st_nlink);
 		}
-		SAFE_UNLINK(cleanup, NEWPATH);
 	} else {
-		tst_resm(TFAIL | TTERRNO,
+		tst_res(TFAIL | TTERRNO,
 		         "link("OLDPATH","NEWPATH") returned %ld",
-		         TEST_RETURN);
-	}
-}
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		verify_link();
+		         TST_RET);
 	}
-
-	cleanup();
-	tst_exit();
 }

 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	SAFE_TOUCH(cleanup, OLDPATH, 0700, NULL);
+	SAFE_TOUCH(OLDPATH, 0700, NULL);
 }

 static void cleanup(void)
 {
-	tst_rmdir();
+    SAFE_UNLINK(NEWPATH);
 }
+
+static struct tst_test test = {
+    .test_all = verify_link02,
+    .setup = setup,
+    .cleanup = cleanup,
+    .needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
