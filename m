Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE71D17D2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 16:42:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86AFB3C54DF
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 16:42:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 439893C2555
 for <ltp@lists.linux.it>; Wed, 13 May 2020 16:42:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0D3761A01442
 for <ltp@lists.linux.it>; Wed, 13 May 2020 16:42:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,388,1583164800"; d="scan'208";a="92014709"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 22:42:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id CF6D750A996E
 for <ltp@lists.linux.it>; Wed, 13 May 2020 22:42:21 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 22:42:22 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 13 May 2020 22:42:21 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 13 May 2020 22:36:29 +0800
Message-ID: <20200513143629.2103-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200513143629.2103-1-yangx.jy@cn.fujitsu.com>
References: <20200513143629.2103-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CF6D750A996E.ABF4F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

1) Drop .min_kver flag directly because of two following reasons:
   a) pidfd_open(2) may be backported to old kernel which is less
      than v5.3 so kernel version check is meaningless.
   b) tst_syscall() can report TCONF if pidfd_open(2) is not supported.
2) For pidfd_open03.c, check if pidfd_open(2) is not supported before
   calling fork() and remove unnecessary TEST().

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/pidfd_open/pidfd_open01.c   |  1 -
 .../kernel/syscalls/pidfd_open/pidfd_open02.c   |  1 -
 .../kernel/syscalls/pidfd_open/pidfd_open03.c   | 17 ++++++++++++-----
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
index f475fe28e..b88fd0bf9 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -31,6 +31,5 @@ static void run(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "5.3",
 	.test_all = run,
 };
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
index dc86cae7a..a7328ddfe 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -51,7 +51,6 @@ static void run(unsigned int n)
 }
 
 static struct tst_test test = {
-	.min_kver = "5.3",
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = run,
 	.setup = setup,
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
index 48470e5e1..af719e1f4 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
@@ -27,11 +27,9 @@ static void run(void)
 		exit(EXIT_SUCCESS);
 	}
 
-	TEST(pidfd_open(pid, 0));
-
-	fd = TST_RET;
+	fd = pidfd_open(pid, 0);
 	if (fd == -1)
-		tst_brk(TFAIL | TTERRNO, "pidfd_open() failed");
+		tst_brk(TFAIL | TERRNO, "pidfd_open() failed");
 
 	TST_CHECKPOINT_WAKE(0);
 
@@ -49,8 +47,17 @@ static void run(void)
 		tst_res(TPASS, "pidfd_open() passed");
 }
 
+static void pidfd_open_supported_by_kernel(void)
+{
+	int pidfd;
+
+	pidfd = tst_syscall(__NR_pidfd_open, getpid(), 0);
+	if (pidfd != -1)
+		SAFE_CLOSE(pidfd);
+}
+
 static struct tst_test test = {
-	.min_kver = "5.3",
+	.setup = pidfd_open_supported_by_kernel,
 	.test_all = run,
 	.forks_child = 1,
 	.needs_checkpoints = 1,
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
