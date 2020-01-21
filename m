Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E89901436C9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 06:47:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB4933C2387
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 06:47:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 29DFE3C0B90
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 06:47:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 95B7560072F
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 06:47:48 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,344,1574092800"; d="scan'208";a="82332202"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jan 2020 13:47:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EB185406AB15
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 13:38:24 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 21 Jan 2020 13:47:34 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Jan 2020 13:47:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 21 Jan 2020 13:47:58 +0800
Message-ID: <1579585678-2209-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EB185406AB15.AD14C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/timer*: use linux git tags for timer
 testcases
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

I test these three cases(timer_delete01.c, timer_settime01.c, timer_settime02.c)
on arm machines, they will get unknown 524 error like timer_create01.c.
They are also regresstion test, so add linux tags about this error.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/timer_delete/timer_delete01.c   | 7 +++++++
 testcases/kernel/syscalls/timer_settime/timer_settime01.c | 7 +++++++
 testcases/kernel/syscalls/timer_settime/timer_settime02.c | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/testcases/kernel/syscalls/timer_delete/timer_delete01.c b/testcases/kernel/syscalls/timer_delete/timer_delete01.c
index 962eb5670..6e5fc9940 100644
--- a/testcases/kernel/syscalls/timer_delete/timer_delete01.c
+++ b/testcases/kernel/syscalls/timer_delete/timer_delete01.c
@@ -12,6 +12,9 @@
  *
  *	Creates a timer for each available clock and then tries
  *	to delete them again.
+ *
+ * This is also regression test for commit:
+ * f18ddc13af98 ("alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP")
  */
 
 #include <errno.h>
@@ -60,4 +63,8 @@ static void run(void)
 static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "f18ddc13af98"},
+		{}
+	}
 };
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 7bf00f527..da365d221 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -16,6 +16,9 @@
  * 4) Using absolute time
  *
  * All of these tests are supposed to be successful.
+ *
+ * This is also regression test for commit:
+ * f18ddc13af98 ("alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP")
  */
 
 #include <stdlib.h>
@@ -121,4 +124,8 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "f18ddc13af98"},
+		{}
+	}
 };
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index 74cb33d73..bcabb7695 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -18,6 +18,9 @@
  * 4) Passing an invalid timer -> EINVAL
  * 5) Passing an invalid address for new_value -> EFAULT
  * 6) Passing an invalid address for old_value -> EFAULT
+ *
+ * This is also regression test for commit:
+ * f18ddc13af98 ("alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP")
  */
 
 #include <errno.h>
@@ -116,4 +119,8 @@ static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "f18ddc13af98"},
+		{}
+	}
 };
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
