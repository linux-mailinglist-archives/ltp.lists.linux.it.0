Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF078304A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:11:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53FD33C1CDE
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:11:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 19C4D3C185E
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:11:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4480E1A0114B
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:11:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09AC330EA1B4
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:02 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802F85D9C8
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:01 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  6 Aug 2019 13:10:56 +0200
Message-Id: <a1e04fe183c0f261263d08fded3ae28227324a37.1565089789.git.jstancek@redhat.com>
In-Reply-To: <76fa74b68aa0794f58e01d5794fffa3a02df0203.1565089789.git.jstancek@redhat.com>
References: <76fa74b68aa0794f58e01d5794fffa3a02df0203.1565089789.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 06 Aug 2019 11:11:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] clock_getres01: add test variants
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

0 - default, could be either VDSO or syscall
1 - syscall with valid res parameter
2 - syscall with NULL res parameter

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/clock_getres/clock_getres01.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
index 6b556965530e..21c003aea50b 100644
--- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
+++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
@@ -13,6 +13,7 @@
 #include <errno.h>
 
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
 static struct timespec res;
@@ -40,7 +41,18 @@ static struct test_case {
 
 static void do_test(unsigned int i)
 {
-	TEST(clock_getres(tcase[i].clk_id, tcase[i].res));
+	switch (tst_variant) {
+	case 0:
+		TEST(clock_getres(tcase[i].clk_id, tcase[i].res));
+		break;
+	case 1:
+		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id,
+			tcase[i].res));
+		break;
+	case 2:
+		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id, NULL));
+		break;
+	}
 
 	if (TST_RET != tcase[i].ret) {
 		if (TST_ERR == EINVAL) {
@@ -65,4 +77,5 @@ static void do_test(unsigned int i)
 static struct tst_test test = {
 	.test = do_test,
 	.tcnt = ARRAY_SIZE(tcase),
+	.test_variants = 3,
 };
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
