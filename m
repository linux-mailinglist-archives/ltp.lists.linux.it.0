Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38E7F526
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 12:34:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C521A3C1E12
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 12:34:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5AB833C1DFD
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 12:34:56 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 34543100455D
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 12:34:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,337,1559491200"; d="scan'208";a="72748171"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 18:34:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 00ADF4CDFAB7
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 18:34:47 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 2 Aug 2019 18:34:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 2 Aug 2019 18:34:41 +0800
Message-ID: <1564742081-2234-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 00ADF4CDFAB7.A0A5F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before test
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

stx_attributes_mask shows what's supported in stx_attributes.
we should check four attrbutes whether supports on tested filesystem
and report the non-supported attributes  before test.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/statx/statx04.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx04.c b/testcases/kernel/syscalls/statx/statx04.c
index 71de734f5..e4b198c07 100644
--- a/testcases/kernel/syscalls/statx/statx04.c
+++ b/testcases/kernel/syscalls/statx/statx04.c
@@ -138,23 +138,37 @@ static void caid_flags_setup(void)
 	attr |= FS_COMPR_FL | FS_APPEND_FL | FS_IMMUTABLE_FL | FS_NODUMP_FL;
 
 	ret = ioctl(fd, FS_IOC_SETFLAGS, &attr);
-	if (ret < 0) {
-		if (errno == EOPNOTSUPP)
-			tst_brk(TCONF, "Flags not supported");
+	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "ioctl(%i, FS_IOC_SETFLAGS, %i)", fd, attr);
-	}
 
 	clear_flags = 1;
 }
 
 static void setup(void)
 {
+	struct statx buf;
+
 	SAFE_MKDIR(TESTDIR_FLAGGED, 0777);
 	SAFE_MKDIR(TESTDIR_UNFLAGGED, 0777);
 
 	if (!strcmp(tst_device->fs_type, "btrfs") && tst_kvercmp(4, 13, 0) < 0)
 		tst_brk(TCONF, "Btrfs statx() supported since 4.13");
 
+	TEST(statx(AT_FDCWD, TESTDIR_FLAGGED, 0, 0, &buf));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO,
+			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)", TESTDIR_FLAGGED);
+
+	/* Mask to show which attributes are supported on filesystem. */
+	if ((buf.stx_attributes_mask & FS_COMPR_FL) == 0)
+		tst_brk(TCONF, "filesystem doesn't support FS_COMPR_FL");
+	if ((buf.stx_attributes_mask & FS_APPEND_FL) == 0)
+		tst_brk(TCONF, "filesystem doesn't support FS_APPEND_FL");
+	if ((buf.stx_attributes_mask & FS_IMMUTABLE_FL) == 0)
+		tst_brk(TCONF, "filesystem doesn't support FS_IMMUTABLE_FL");
+	if ((buf.stx_attributes_mask & FS_NODUMP_FL) == 0)
+		tst_brk(TCONF, "filesystem doesn't support FS_NODUMP_FL");
+
 	caid_flags_setup();
 }
 
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
