Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316D3D54AC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 09:55:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4817C3C922A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 09:55:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 53ABC3C0D20
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 09:55:36 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76FCB200922
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 09:55:33 +0200 (CEST)
X-QQ-mid: bizesmtp52t1627286129tjmwi48x
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 26 Jul 2021 15:55:23 +0800 (CST)
X-QQ-SSF: 01400000002000208000000B0000000
X-QQ-FEAT: X+Lnu8pJYlcge8yWip7pXCJ3WDAo+nGUCl2r5Svmu99sAzImc/0ajeVGNu1GE
 /J+QfKvxz+k2d617n2ATkcHfjz2gSadlJGG1B2DU6PPz/GcKqSekoVebXTM18+HyXVZeFvF
 k2rsYAmaKEl2ko3g+1/0CDc/PMV/4g0/sNF72MO+xEy46ZBoulye4pIS72eqgQ4qpYKif6h
 IFSEls74fS2dy9AnxT3B8rodjq3TYujT0i4k1bnHGXH32vT8FKXpxomdacBDzs3GRqKkFWC
 Toxe88Uu5ONcAYkO+GWsIXpwqBI5z7K9loiY9WUzb+l6lN1/gpegG5HZGGsghCBFfot5zzI
 pUBOax7oKhwiNObFms=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 15:55:22 +0800
Message-Id: <20210726075522.11529-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [1/2] syscalls/memset01: Convert to new API
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

diff --git a/testcases/kernel/syscalls/memset/memset01.c b/testcases/kernel/syscalls/memset/memset01.c
index 1a0ccd0df..0864443c7 100644
--- a/testcases/kernel/syscalls/memset/memset01.c
+++ b/testcases/kernel/syscalls/memset/memset01.c
@@ -1,36 +1,14 @@
 /*
- *
  *   Copyright (c) International Business Machines  Corp., 2002
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
  */

 /* 01/02/2003	Port to LTP	avenkat@us.ibm.com */
 /* 06/30/2001	Port to Linux	nsharoff@us.ibm.com */

-/*
- * NAME
- *	memset1.c -- test setting of  buffer
+/*\
+ * [DESCRIPTION]
  *
- * CALLS
- *	memset(3)
- *
- * ALGORITHM
- *	Check boundary conditions, go through 64 byte window.
- *
- * RESTRICTIONS
+ * The testcase for test setting of buffer by check boundary conditions.
  */

 #include <stdio.h>
@@ -39,62 +17,44 @@
 #include <stdlib.h>
 #include <errno.h>

-#include "test.h"
-
-char *TCID = "memset01";
+#include "tst_test.h"

 #undef BSIZE
 #define BSIZE	4096
-#define LEN	100
-#define FAILED 0
-#define PASSED 1

 char buf[BSIZE];

-int local_flag = PASSED;
-int block_number;
-int TST_TOTAL = 1;
-
 void fill(void);
 int checkit(char *str);

-int main(int argc, char *argv[])
+static void setup(void)
 {
-	register int i, j;
-	char *p;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	local_flag = PASSED;
-
 	fill();
+}
+
+static void verify_memset(void)
+{
+	register int i, j;
+	char *p = &buf[400];

 	for (i = 0; i < 200; i++) {
 		fill();
-		p = &buf[400];
 		memset(p, 0, i);
 		if ((j = checkit(p)) != i) {
-			tst_resm(TINFO,
-				 "Not enough zero bytes, wanted %d, got %d", i,
-				 j);
-			local_flag = FAILED;
+			tst_res(TINFO, "Not enough zero bytes, wanted %d, got %d", i, j);
 			break;
 		}
 		if (!p[-1] || !p[i]) {
-			tst_resm(TINFO, "Boundary error, clear of %d", i);
-			local_flag = FAILED;
-		}
-		if (local_flag == FAILED)
+			tst_res(TINFO, "Boundary error, clear of %d", i);
 			break;
+		}
 	}

-	(local_flag == FAILED) ? tst_resm(TFAIL,
-					  "Test failed") : tst_resm(TPASS,
-								    "Test passed");
-	(local_flag == FAILED) ? tst_resm(TFAIL,
-					  "Test failed") : tst_resm(TPASS,
-								    "Test passed");
-	tst_exit();
+	if (i == 200) {
+		tst_res(TPASS, "Test passed");
+	} else {
+		tst_res(TFAIL, "Test fails");
+	}
 }

 void fill(void)
@@ -113,3 +73,7 @@ int checkit(char *str)

 	return (i);
 }
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_memset,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
