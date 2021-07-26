Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F93D52FE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 08:05:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 970813C6725
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 08:05:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AA8A3C32EE
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 08:05:28 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 097FA1A00148
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 08:05:26 +0200 (CEST)
X-QQ-mid: bizesmtp49t1627279520t52d1sp5
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 26 Jul 2021 14:05:16 +0800 (CST)
X-QQ-SSF: 01400000002000208000000B0000000
X-QQ-FEAT: moFI7pRdYxDb8O/FWyA1nIzClCsU7VdvYIvIHEsAwaigNaRkhWM43u6CVezMG
 mdzkafkBpv2cyIEZeHj4TZFgEgwruAuJIcvgOPQ6KbQSRcv3KdxFVHFkZZd65SlS93Ike2b
 AfyDJWz1ayG1MfMoeKlJe3meM796UcApVZlsnJ/s5ldeX/ACqs3IhGOM5Ce9xQgHi1HIj9G
 uXu1ZX5lgfDcE/hJzbUFQBPHO5ncudAVfEHzPStTTqRAx7k8MvmR90Gg+jGPytUSqtUQoC2
 NO9e3KZHewXPjK/itpZXpYfnvvS43IMZsG9ybw//52MjuSeeS8qZDTIcw1/aXQXZJTsrF6N
 DoYyJ5I6luou4D7Bp4=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 14:05:15 +0800
Message-Id: <20210726060515.6796-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
