Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3215361B03
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:03:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 868973C6FBC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:03:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B14583C3316
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:03:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 52D07200919
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:03:31 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ANdSCSK6tY/aOzdC8ogPXwBPXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz73/JoRsYRX1Io729EYaaR3e0z/RIyK0wGZvnYwX8om?=
 =?us-ascii?q?uvK+hZjLfK5zH7ASXx+qp8+M5bHJRWM9H7AVhkgcuS2mDReOoI+9Wb7Luuwd7X?=
 =?us-ascii?q?0nYFd3AIV4hb8wx7BgyHe3cbeCB6A/MCeqah2g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613404800"; d="scan'208";a="107193768"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Apr 2021 16:03:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id BE05F4D0B8A9
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 16:03:27 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 16:03:22 +0800
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 16:03:22 +0800
Received: from localhost.localdomain (10.167.220.115) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 16 Apr 2021 16:03:21 +0800
From: Zenghui Gao <gaozh.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 15 Apr 2021 10:05:51 -0400
Message-ID: <20210415140552.15762-1-gaozh.jy@fujitsu.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: BE05F4D0B8A9.A5AA5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: gaozh.jy@fujitsu.com
X-Spam-Status: No, score=1.2 required=7.0 tests=DATE_IN_PAST_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NEUTRAL autolearn=disabled
 version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/wait01.c: Convert to new API
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
Cc: Zenghui Gao <gaozh.jy@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Take use of macros and clean up.

Signed-off-by: Zenghui Gao <gaozh.jy@fujitsu.com>
Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>
---
 testcases/kernel/syscalls/wait/wait01.c | 82 ++++---------------------
 1 file changed, 13 insertions(+), 69 deletions(-)

diff --git a/testcases/kernel/syscalls/wait/wait01.c b/testcases/kernel/syscalls/wait/wait01.c
index bd22c1191..3af95cf9b 100644
--- a/testcases/kernel/syscalls/wait/wait01.c
+++ b/testcases/kernel/syscalls/wait/wait01.c
@@ -1,81 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
-/*
- * Test Description:
- *  Verify that,
- *	The calling process does not have any unwaited-for children,
- *	ECHILD would return.
+/*\
+ * [Description]
+ *
+ * The calling process does not have any unwaited-for children,
+ * ECHILD would return.
  */
 
 #include <errno.h>
-#include <sys/types.h>
 #include <sys/wait.h>
+#include <sys/types.h>
+#include "tst_test.h"
 
-#include "test.h"
-
-char *TCID = "wait01";
-int TST_TOTAL = 1;
-static void setup(void);
-static void wait_verify(void);
-static void cleanup(void);
-
-int main(int argc, char **argv)
-{
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		wait_verify();
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-static void wait_verify(void)
+static void verify_wait(void)
 {
-	TEST(wait(NULL));
-
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL | TTERRNO, "wait failed unexpectedly: %ld",
-			TEST_RETURN);
-		return;
-	}
-
-	if (TEST_ERRNO == ECHILD) {
-		tst_resm(TPASS | TTERRNO, "wait failed as expected");
-	} else {
-		tst_resm(TFAIL | TTERRNO,
-			 "wait failed unexpectedly; expected: %d - %s",
-			 ECHILD, strerror(ECHILD));
-	}
+	TST_EXP_FAIL(wait(NULL), ECHILD);
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = verify_wait,
+};
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
