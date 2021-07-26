Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8C3D54AE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 09:55:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23D123C6D05
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 09:55:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C9E63C0D20
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 09:55:54 +0200 (CEST)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 48018100093D
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 09:55:52 +0200 (CEST)
X-QQ-mid: bizesmtp46t1627286148t78ra3rg
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 26 Jul 2021 15:55:44 +0800 (CST)
X-QQ-SSF: 01400000002000208000000B0000000
X-QQ-FEAT: Qdju4dZZJ7CAIaey3If1z/Uvsf0jJkLtd1An4ivU1+GvpjNHpIwrbUMOtS6+j
 WDGB7J3OqZFivLDk9HdMbUdqROcacBZUk2kQX6Hjo/ISEev1dfW8Kt6rItS5FQKajlYiVCk
 mkUDspNbPq0/shwRMZJWJSgarNbUuCxUzws4TZtuvsmQJRfj1uy0qy/A1X3ABZ5cbmZ4778
 FgskQaezYPg3GQ5TXzbI1hjwFP9Tr4VPlzxsZxZrQtIRTB3M7I5Qlg1k/wwhbgDEDaKQiJc
 9Nezg/mLIg49TAauQUVLDYFMr6nl1IWbA1ljyDxZiiICNBiS53fJa32/pLxxok0KTEzHslX
 UFxjS5Q4UEewVeYD4qlvynFGpBvhQ==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 15:55:40 +0800
Message-Id: <20210726075540.11814-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [2/2] syscalls/memcpy01: Convert to new API
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

diff --git a/testcases/kernel/syscalls/memcpy/memcpy01.c b/testcases/kernel/syscalls/memcpy/memcpy01.c
index 1212465f5..7c56475ac 100644
--- a/testcases/kernel/syscalls/memcpy/memcpy01.c
+++ b/testcases/kernel/syscalls/memcpy/memcpy01.c
@@ -1,41 +1,14 @@
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
- *	memcpy  --  test memcpy
- *
- * CALLS
- *	memcpy1(3)
- *
- * ALGORITHM
- *	There are 2 cases for copies:  S = Source, D = Destination
- *
- *	  1 - S < D no overlap
- *	  2 - D < S no overlap
+/*\
+ * [DESCRIPTION]
  *
- *	We try both cases.  Check buffer boundaries.
- *
- * RESTRICTIONS
+ * The testcase for buffer copy by check boundary conditions.
  */

 #include <stdio.h>
@@ -44,98 +17,16 @@
 #include <string.h>
 #include <errno.h>

-#include "test.h"
+#include "tst_test.h"

 char *TCID = "memcpy1";

 #undef  BSIZE
 #define BSIZE	4096
 #define LEN	100
-#define FAILED 0
-#define PASSED 1

-int local_flag = PASSED;
-int block_number;
-FILE *temp;
-int TST_TOTAL = 1;
 char buf[BSIZE];

-
-int anyfail();
-int blenter();
-int blexit();
-
-void setup();
-void clearit();
-void fill(char *str);
-int checkit(char *str);
-
-int main(int argc, char *argv[])
-{
-	char *p, *q;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();		/* temp file is now open        */
-/*--------------------------------------------------------------*/
-	blenter();
-
-	clearit();
-
-	p = &buf[100];
-
-	fill(p);
-	q = &buf[800];
-	memcpy(q, p, LEN);
-
-	if (checkit(q)) {
-		fprintf(temp, "\tcopy failed - missed data\n");
-		local_flag = FAILED;
-	}
-
-	if (p[-1] || p[LEN]) {
-		fprintf(temp, "\tcopy failed - 'to' bounds\n");
-		local_flag = FAILED;
-	}
-
-	if (q[-1] || q[LEN]) {
-		fprintf(temp, "\tcopy failed - 'from' bounds\n");
-		local_flag = FAILED;
-	}
-
-	blexit();
-/*--------------------------------------------------------------*/
-	blenter();
-
-	clearit();
-
-	p = &buf[800];
-
-	fill(p);
-	q = &buf[100];
-	memcpy(q, p, LEN);
-
-	if (checkit(q)) {
-		fprintf(temp, "\tcopy failed - missed data\n");
-		local_flag = FAILED;
-	}
-
-	if (p[-1] || p[LEN]) {
-		fprintf(temp, "\tcopy failed - 'to' bounds\n");
-		local_flag = FAILED;
-	}
-
-	if (q[-1] || q[LEN]) {
-		fprintf(temp, "\tcopy failed - 'from' bounds\n");
-		local_flag = FAILED;
-	}
-
-	blexit();
-
-	anyfail();
-	tst_exit();
-}
-
 void clearit(void)
 {
 	register int i;
@@ -144,46 +35,76 @@ void clearit(void)
 		buf[i] = 0;
 }

-void fill(char *str)
+void fill(char *str, int len)
 {
 	register int i;
-	for (i = 0; i < LEN; i++)
+	for (i = 0; i < len; i++)
 		*str++ = 'a';
 }

-int checkit(char *str)
+int checkit(char *str, int len)
 {
 	register int i;
-	for (i = 0; i < LEN; i++)
+	for (i = 0; i < len; i++)
 		if (*str++ != 'a')
 			return (-1);

 	return (0);
 }

-int anyfail(void)
-{
-	(local_flag == FAILED) ? tst_resm(TFAIL,
-					  "Test failed") : tst_resm(TPASS,
-								    "Test passed");
-	tst_exit();
-}
+static struct test_case {
+	char *p;
+	char *q;
+	int len;
+} tcases[] = {
+	{ &buf[100], &buf[800], LEN},
+	{ &buf[800], &buf[100], LEN},
+};

-void setup(void)
+static void setup(void)
 {
-	temp = stderr;
+	clearit();
+
+	return ;
 }

-int blenter(void)
+static void verify_memcpy(char *p, char *q, int len)
 {
-	local_flag = PASSED;
-	return 0;
+	fill(p, len);
+	memcpy(q, p, LEN);
+
+	if (checkit(q, len)) {
+		tst_res(TFAIL, "\tcopy failed - missed data");
+		goto out;
+	}
+
+	if (p[-1] || p[LEN]) {
+		tst_res(TFAIL, "\tcopy failed - 'to' bounds");
+		goto out;
+	}
+
+	if (q[-1] || q[LEN]) {
+		tst_res(TFAIL, "\tcopy failed - 'from' bounds");
+		goto out;
+	}
+
+	tst_res(TPASS, "Test passed");
+out:
+	return ;
 }

-int blexit(void)
+static void run_test(unsigned int nr)
 {
-	(local_flag == FAILED) ? tst_resm(TFAIL,
-					  "Test failed") : tst_resm(TPASS,
-								    "Test passed");
-	return 0;
+	struct test_case *tcase = &tcases[nr];
+
+	clearit();
+	verify_memcpy(tcase->p, tcase->q, tcase->len);
+
+	return ;
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.test = run_test,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
