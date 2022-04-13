Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7324FF5A6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Apr 2022 13:25:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 070443CA59D
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Apr 2022 13:25:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5F5E3C6AEA
 for <ltp@lists.linux.it>; Wed, 13 Apr 2022 13:25:20 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 95FDB6006E0
 for <ltp@lists.linux.it>; Wed, 13 Apr 2022 13:25:18 +0200 (CEST)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KdgFQ4WDDzgYjb
 for <ltp@lists.linux.it>; Wed, 13 Apr 2022 19:23:22 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Apr 2022 19:25:12 +0800
To: <ltp@lists.linux.it>
Date: Wed, 13 Apr 2022 19:24:05 +0800
Message-ID: <20220413112405.48471-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] futex_waitv01: Correct assign and add cleanup
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1.Correct assign of waitv->uaddr
2.Rename function name of test_invalid_nr_futex
3.Add cleanup

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/futex/futex_waitv01.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/futex/futex_waitv01.c b/testcases/kernel/syscalls/futex/futex_waitv01.c
index 8b7bd50d3..ddc4be01c 100644
--- a/testcases/kernel/syscalls/futex/futex_waitv01.c
+++ b/testcases/kernel/syscalls/futex/futex_waitv01.c
@@ -10,6 +10,7 @@
  */

 #include <time.h>
+#include <stdlib.h>
 #include "tst_test.h"
 #include "lapi/futex.h"
 #include "futex2test.h"
@@ -32,7 +33,7 @@ static void init_timeout(struct timespec *to)

 static void init_waitv(void)
 {
-	waitv->uaddr = (uintptr_t)&futex;
+	waitv->uaddr = (uintptr_t)futex;
 	waitv->flags = FUTEX_32 | FUTEX_PRIVATE_FLAG;
 	waitv->val = 0;
 }
@@ -98,7 +99,7 @@ static void test_invalid_clockid(void)
 		     "futex_waitv invalid clockid");
 }

-static void test_invalid_nr_futex(void)
+static void test_invalid_nr_futexes(void)
 {
 	struct timespec to;

@@ -112,6 +113,12 @@ static void test_invalid_nr_futex(void)
 		     "futex_waitv invalid nr_futexes");
 }

+static void cleanup(void)
+{
+	if (futex != NULL)
+		free(futex);
+}
+
 static void run(void)
 {
 	test_invalid_flags();
@@ -119,12 +126,13 @@ static void run(void)
 	test_null_address();
 	test_null_waiters();
 	test_invalid_clockid();
-	test_invalid_nr_futex();
+	test_invalid_nr_futexes();
 }

 static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
+	.cleanup = cleanup,
 	.min_kver = "5.16",
 	.bufs =
 		(struct tst_buffers[]){
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
