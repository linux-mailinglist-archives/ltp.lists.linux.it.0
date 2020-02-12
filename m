Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A09515A209
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 08:31:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A22C43C25DF
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 08:31:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2712A3C136C
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 08:31:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0FBB2201468
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 08:31:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83196381"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 15:31:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C1E0D406AB15
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 15:22:07 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 15:31:38 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 12 Feb 2020 15:31:38 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <yangx.jy@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 15:31:55 +0800
Message-ID: <1581492715-15110-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <5E438D72.4020203@cn.fujitsu.com>
References: <5E438D72.4020203@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C1E0D406AB15.AC579
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] aio02: Drop O_DIRECT flag for tmpfs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tmpfs doesn't support O_DIRECT flag, drop it. userer still can run aio02
with different filesystem by mounting specified filesystem on $TMPDIR.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/io/aio/aio02.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/io/aio/aio02.c b/testcases/kernel/io/aio/aio02.c
index e283afba9..3bb89c45f 100644
--- a/testcases/kernel/io/aio/aio02.c
+++ b/testcases/kernel/io/aio/aio02.c
@@ -18,7 +18,8 @@
 #define AIO_MAXIO 32
 #define AIO_BLKSIZE (64*1024)
 
-static int wait_count = 0;
+static int wait_count;
+static unsigned int use_tmpfs;
 
 #define DESC_FLAGS_OPR(x, y) .desc = (x == IO_CMD_PWRITE ? "WRITE: " #y: "READ : " #y), \
 	.flags = y, .operation = x
@@ -206,6 +207,11 @@ static void test_io(unsigned int n)
 	int status;
 	struct testcase *tc = testcases + n;
 
+	if (use_tmpfs && (tc->flags & O_DIRECT)) {
+		tst_res(TINFO, "Drop O_DIRECT flag for tmpfs");
+		tc->flags &= (~O_DIRECT);
+	}
+
 	status = io_tio("file", tc->flags, tc->operation);
 	if (status)
 		tst_res(TFAIL, "%s, status = %d", tc->desc, status);
@@ -213,7 +219,14 @@ static void test_io(unsigned int n)
 		tst_res(TPASS, "%s", tc->desc);
 }
 
+static void setup(void)
+{
+	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+		use_tmpfs = 1;
+}
+
 static struct tst_test test = {
+	.setup = setup,
 	.needs_tmpdir = 1,
 	.test = test_io,
 	.tcnt = ARRAY_SIZE(testcases),
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
