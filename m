Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A23E23EE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B57943C6C47
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B0923C4C1F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:17 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A0FC51A008BC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:16 +0200 (CEST)
X-QQ-mid: bizesmtp53t1628234651tzi0p7my
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 15:24:06 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000C0000000
X-QQ-FEAT: TqRn4mu1FxbEGpAUPnp2sa6slC7Jg++YHuUzm1+DN6TR6KThc7Xh4AH+FtuHq
 wF3Z8qVtODTiQWgpj9eprHE0dG/CJWamEpuvz+3R75juflppx+wnsMkd75oLTd5bYYcO50+
 hSJH+fUqjNWzdvyeWE05LwVC3I/G7Uz/a5dXRCyDd8N88f2/jO2dLT28XiZRyEVdUP/G8kQ
 BUXQP+bLKTgo0ZoVHw20lxYBzCWNbln8YKXdyCRwOdSIEhalbVJHt+d61YVtgT+gQ6uhC/l
 jqcfOyMYNd+ZGlKh7IV+KOonN84xbU76fUFU806fz6fk3RufbHEto0+SMrW8adTZG/dhmtZ
 oXnKWZQGTdJbGf7Z6I=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 15:24:05 +0800
Message-Id: <20210806072405.8695-1-zhanglianjie@uniontech.com>
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
Subject: [LTP] [PATCH 2/4] syscalls/chmod02: Convert to new API
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

diff --git a/testcases/kernel/syscalls/chmod/chmod02.c b/testcases/kernel/syscalls/chmod/chmod02.c
index 94a77aeb1..e69f6b4e0 100644
--- a/testcases/kernel/syscalls/chmod/chmod02.c
+++ b/testcases/kernel/syscalls/chmod/chmod02.c
@@ -1,107 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *
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
- */
-
-/*
  * AUTHOR	: William Roske
  * CO-PILOT	: Dave Fenner
  * DATE STARTED	: 03/30/92
+ */
+
+/*\
+ * [Description]
  *
  *  Calls chmod(2) with different modes and expects success.
  */

-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
-
-char *TCID = "chmod02";
-int TST_TOTAL = ARRAY_SIZE(modes);
+#include "tst_test.h"

 #define FNAME "test_file"
+static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };

-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_chmod(unsigned int n)
 {
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(chmod(FNAME, modes[i]));
+	int mode = modes[n];

-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "chmod(%s, %#o) failed", FNAME, modes[i]);
-			} else {
-				tst_resm(TPASS,
-					 "chmod(%s, %#o) returned %ld",
-					 FNAME, modes[i], TEST_RETURN);
-			}
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
+	TST_EXP_PASS(chmod(FNAME, mode), "chmod(%s, %#o) returned %ld",
+				FNAME, modes[n], TST_RET);
 }

 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	SAFE_FILE_PRINTF(cleanup, FNAME, "File content\n");
+	SAFE_FILE_PRINTF(FNAME, "File content\n");
 }

-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(modes),
+	.test = verify_chmod,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
