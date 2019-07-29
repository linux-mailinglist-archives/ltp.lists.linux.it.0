Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16C783A3
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 05:29:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C19B43C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 05:29:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 82E513C1CF3
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 05:29:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 87B416001EA
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 05:29:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,320,1559491200"; d="scan'208";a="72409602"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jul 2019 11:29:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id BC91F4CDD99E
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:29:00 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 29 Jul 2019 11:29:00 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Jul 2019 09:27:32 +0800
Message-ID: <1564363652-3975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564363652-3975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1564363652-3975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: BC91F4CDD99E.AFEF8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/nanosleep04: Ported into new library
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

Also add EINVAL test when tv_nsec is negative.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/nanosleep/nanosleep04.c   | 69 +++++--------------
 1 file changed, 17 insertions(+), 52 deletions(-)

diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep04.c b/testcases/kernel/syscalls/nanosleep/nanosleep04.c
index f5108d026..572738c96 100644
--- a/testcases/kernel/syscalls/nanosleep/nanosleep04.c
+++ b/testcases/kernel/syscalls/nanosleep/nanosleep04.c
@@ -1,20 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  *  07/2001 Ported by Wayne Boyer
  *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Ported to new library:
+ * 07/2019    Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  */
 
 /*
@@ -27,60 +17,35 @@
  */
 
 #include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <sys/wait.h>
 #include <time.h>
-
-#include "test.h"
+#include "tst_test.h"
 
 static struct timespec tcases[] = {
 	{.tv_sec = -5, .tv_nsec = 9999},
 	{.tv_sec = 0, .tv_nsec = 1000000000},
+	{.tv_sec = 1, .tv_nsec = -100},
 };
 
-char *TCID = "nanosleep04";
-int TST_TOTAL = ARRAY_SIZE(tcases);
-
-static void setup(void);
-
-static void verify_nanosleep(struct timespec *tcase)
+static void verify_nanosleep(unsigned int n)
 {
-	TEST(nanosleep(tcase, NULL));
+	TEST(nanosleep(&tcases[n], NULL));
 
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "nanosleep() succeded unexpectedly");
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "nanosleep() succeded unexpectedly");
 		return;
 	}
 
-	if (TEST_ERRNO != EINVAL) {
-		tst_resm(TFAIL | TTERRNO,
-		         "nanosleep() expected failure with EINVAL");
+	if (TST_ERR != EINVAL) {
+		tst_res(TFAIL | TTERRNO,
+			"nanosleep() failed,expected EINVAL, got");
 		return;
 	}
 
-	tst_resm(TPASS, "nanoslep() failed with EINVAL");
-}
-
-int main(int ac, char **av)
-{
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		for (i = 0; i < TST_TOTAL; i++)
-			verify_nanosleep(&tcases[i]);
-	}
-
-	tst_exit();
+	tst_res(TPASS, "nanosleep() failed with EINVAL");
 }
 
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, NULL);
+static struct tst_test test = {
+	.test = verify_nanosleep,
+	.tcnt = ARRAY_SIZE(tcases),
+};
 
-	TEST_PAUSE;
-}
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
