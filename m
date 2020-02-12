Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE115A04F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:08:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FDD63C2382
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:08:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 71A173C038C
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:08:12 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9B6071001974
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:08:06 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83186645"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 13:08:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2D1DE406AB15
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 12:58:27 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 13:07:57 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 12 Feb 2020 13:08:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 Feb 2020 13:08:13 +0800
Message-ID: <1581484093-13127-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 2D1DE406AB15.ADA93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] aio02: Use mounted filesystem instead of temp
 directory
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

tmpfs doesn't support O_DIRECT flag, open file with this flag on
tmpfs will report EINVAL error. I thin we should test this case on
ext2 filesystem instead of temp directory.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/io/aio/aio02.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/io/aio/aio02.c b/testcases/kernel/io/aio/aio02.c
index e283afba9..205d1b088 100644
--- a/testcases/kernel/io/aio/aio02.c
+++ b/testcases/kernel/io/aio/aio02.c
@@ -17,7 +17,8 @@
 
 #define AIO_MAXIO 32
 #define AIO_BLKSIZE (64*1024)
-
+#define MNTPOINT   "mnt_point"
+#define FILE_TEST MNTPOINT"/file"
 static int wait_count = 0;
 
 #define DESC_FLAGS_OPR(x, y) .desc = (x == IO_CMD_PWRITE ? "WRITE: " #y: "READ : " #y), \
@@ -206,7 +207,7 @@ static void test_io(unsigned int n)
 	int status;
 	struct testcase *tc = testcases + n;
 
-	status = io_tio("file", tc->flags, tc->operation);
+	status = io_tio(FILE_TEST, tc->flags, tc->operation);
 	if (status)
 		tst_res(TFAIL, "%s, status = %d", tc->desc, status);
 	else
@@ -214,7 +215,9 @@ static void test_io(unsigned int n)
 }
 
 static struct tst_test test = {
-	.needs_tmpdir = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.needs_root = 1,
 	.test = test_io,
 	.tcnt = ARRAY_SIZE(testcases),
 };
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
