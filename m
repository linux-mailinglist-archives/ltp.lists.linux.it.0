Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 023183D519F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 05:49:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D3183C26F7
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 05:49:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2F113C03FF
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 05:49:47 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DA3A41000656
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 05:49:42 +0200 (CEST)
X-QQ-mid: bizesmtp42t1627271375tpsf2qc1
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 26 Jul 2021 11:49:31 +0800 (CST)
X-QQ-SSF: 01400000000000208000B00A0000000
X-QQ-FEAT: uH5RWnoBUGoyX/Ekhnkc0lNq6i7STp//4OBkRUK7Zr2Hd01uiHqE8mrwZZ+UX
 SBLJ+uLmdXDNzzHCRmSBXV0odK9/Vc2DGrpi1IpcCXI1uAm9rlz0VwSEA1wZlZCMtsXuUTg
 Otf704B12fKX7a+vSQxzrUtLgxRDckLHv1L0BQNY+xToS6e8hb8eCYP9fQwdK849Cm2VmGD
 Mbhry/XJZBSqfYuJtxFzIrQVdpB8Yh31Nky2sNCybfEF7UptctQtn1qcIwUDSmPg5jtyEVy
 IaA49oy4ya2LEaYxRQyfZDTtiJs6GZA3GoEHKgdqU4Waoe4A6sYJGhM7juebisCDgKFaWNP
 uiKbtKl
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 11:49:28 +0800
Message-Id: <20210726034928.15766-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/memcmp01: Convert to new API
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

diff --git a/testcases/kernel/syscalls/memcmp/memcmp01.c b/testcases/kernel/syscalls/memcmp/memcmp01.c
index 3b4b4e3cd..6ac9de385 100644
--- a/testcases/kernel/syscalls/memcmp/memcmp01.c
+++ b/testcases/kernel/syscalls/memcmp/memcmp01.c
@@ -1,237 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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

 /* 01/02/2003	Port to LTP	avenkat&us.ibm.com */
 /* 06/30/2001	Port to Linux	nsharoff@us.ibm.com */

-/*
- * NAME
- *	memcmp1 -- buffer  compare
+/*\
+ * [DESCRIPTION]
  *
- * CALLS
- *	memcmp(3)
- *
- * ALGORITHM
- *	Check boundary conditions.
- *
- * RESTRICTIONS
+ * The testcase for buffer comparison by check boundary conditions.
  */

 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <string.h>
-#include <errno.h>
-
-#include "test.h"
-
-char *TCID = "memcmp1";
+#include "tst_test.h"

 #undef  BSIZE
 #define BSIZE	4096
 #define LEN	100
-#define FAILED 0
-#define PASSED 1

 char buf[BSIZE];

-int local_flag = PASSED;
-int block_number;
-FILE *temp;
-int TST_TOTAL = 2;
-int anyfail();
-int blenter();
-int blexit();
-int instress();
+static struct test_case {
+	char *p;
+	char *q;
+	int len;
+} tcases[] = {
+	{ &buf[100], &buf[800], LEN},
+	{ &buf[800], &buf[100], LEN},
+};

-void setup();
-
-void clearit();
-void fill(char *str);
-int checkit(char *str);
-
-int main(int argc, char *argv[])
+void fill(char *str, int len)
 {
-	char *p, *q;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-	blenter();
-
-	clearit();
-
-	p = &buf[100];
-	q = &buf[800];
-
-	fill(p);
-	fill(q);
-
-	if (memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp fails - should have succeeded.\n");
-		local_flag = FAILED;
-	}
-
-	p[LEN - 1] = 0;
-
-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
-	};
-
-	p[LEN - 1] = 'a';
-	p[0] = 0;
-
-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
-	};
-
-	p[0] = 'a';
-	q[LEN - 1] = 0;
-
-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
-	};
-
-	q[LEN - 1] = 'a';
-	q[0] = 0;
-
-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
-	};
+	register int i;
+	for (i = 0; i < len; i++)
+		*str++ = 'a';
+}

-	q[0] = 'a';
+static void setup(void)
+{
+	register int i;

-	if (memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp fails - should have succeeded.\n");
-		local_flag = FAILED;
+	for (i = 0; i < BSIZE; i++) {
+		buf[i] = 0;
 	}

-	blexit();
-/*--------------------------------------------------------------*/
-	blenter();
-
-	clearit();
-
-	p = &buf[800];
-	q = &buf[100];
+	return ;
+}

-	fill(p);
-	fill(q);
+static void verify_memcmp(char *p, char *q, int len)
+{
+	fill(p, len);
+	fill(q, len);

-	if (memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp fails - should have succeeded.\n");
-		local_flag = FAILED;
+	if (memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp fails - should have succeeded.");
+		goto out;
 	}

-	p[LEN - 1] = 0;
+	p[len - 1] = 0;

-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
+	if (!memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp succeeded - should have failed.");
+		goto out;
 	};

-	p[LEN - 1] = 'a';
+	p[len - 1] = 'a';
 	p[0] = 0;

-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
+	if (!memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp succeeded - should have failed.");
+		goto out;
 	};

 	p[0] = 'a';
-	q[LEN - 1] = 0;
+	q[len - 1] = 0;

-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
+	if (!memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp succeeded - should have failed.");
+		goto out;
 	};

-	q[LEN - 1] = 'a';
+	q[len - 1] = 'a';
 	q[0] = 0;

-	if (!memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp succeeded - should have failed.\n");
-		local_flag = FAILED;
+	if (!memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp succeeded - should have failed.");
+		goto out;
 	};

 	q[0] = 'a';

-	if (memcmp(p, q, LEN)) {
-		fprintf(temp, "\tmemcmp fails - should have succeeded.\n");
-		local_flag = FAILED;
+	if (memcmp(p, q, len)) {
+		tst_res(TFAIL, "\tmemcmp fails - should have succeeded.");
+		goto out;
 	}
-
-	blexit();
-
-	anyfail();
-	tst_exit();
-}
-
-void clearit(void)
-{
-	register int i;
-
-	for (i = 0; i < BSIZE; i++)
-		buf[i] = 0;
+
+	tst_res(TPASS, "Test passed");
+out:
+	return ;
 }

-void fill(char *str)
+static void run_test(unsigned int nr)
 {
-	register int i;
-	for (i = 0; i < LEN; i++)
-		*str++ = 'a';
-}
+	struct test_case *tcase = &tcases[nr];

-int checkit(char *str)
-{
-	register int i;
-	for (i = 0; i < LEN; i++)
-		if (*str++ != 'a')
-			return (-1);
-
-	return (0);
-}
+	verify_memcmp(tcase->p, tcase->q, tcase->len);

-int anyfail(void)
-{
-	tst_exit();
+	return ;
 }

-void setup(void)
-{
-	temp = stderr;
-}
-
-int blenter(void)
-{
-	local_flag = PASSED;
-	return 0;
-}
-
-int blexit(void)
-{
-	(local_flag == FAILED) ? tst_resm(TFAIL,
-					  "Test failed") : tst_resm(TPASS,
-								    "Test passed");
-	return 0;
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.test = run_test,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
