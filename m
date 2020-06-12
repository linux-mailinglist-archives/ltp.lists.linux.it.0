Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D331F71DA
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 03:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 376473C59A9
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 03:51:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 813863C0194
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 03:51:49 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D6F8D601BFF
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 03:51:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,501,1583164800"; d="scan'208";a="94341624"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jun 2020 09:51:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8A04B4CE2804
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 09:51:40 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Jun 2020 09:51:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Jun 2020 09:51:35 +0800
Message-ID: <1591926695-1189-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8A04B4CE2804.ACA12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/ioctl_loop01: Add test for clear loop flag
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

In loop driver, LO_FLAGS_PARTSCAN can not be clear once set and
LO_FLAGS_AUTOCLEAR can be clear once set. Test this.

Also adding other linux tag.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop01.c      | 51 +++++++++++--------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index 2d9733f95..f334b5eb2 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -13,8 +13,12 @@
  * But we also check whether we can scan partition table correctly ie check
  * whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
  *
+ * For LO_FLAGS_AUTOCLEAR flag, it can be clear. For LO_FLAGS_PARTSCAN flag,
+ * it cannot be clear. We also check this.
+ *
  * It is also a regression test for kernel
- * commit 10c70d95c0f2 ("block: remove the bd_openers checks in blk_drop_partitions").
+ * commit 10c70d95c0f2 ("block: remove the bd_openers checks in blk_drop_partitions")
+ * commit 6ac92fb5cdff ("loop: Fix wrong masking of status flags").
  */
 
 #include <stdio.h>
@@ -38,38 +42,26 @@ static int dev_num, attach_flag, dev_fd, parted_sup;
 static char partscan_path[1024], autoclear_path[1024];
 static char loop_partpath[1026], sys_loop_partpath[1026];
 
-static void verify_ioctl_loop(void)
+static void check_loop_value(int set_flag, int get_flag, int autoclear_field)
 {
+	struct loop_info loopinfo = {0}, loopinfoget = {0};
 	int ret;
-	struct loop_info loopinfo, loopinfoget;
 
-	tst_attach_device(dev_path, "test.img");
-	attach_flag = 1;
-
-	TST_ASSERT_INT(partscan_path, 0);
-	TST_ASSERT_INT(autoclear_path, 0);
-	TST_ASSERT_STR(backing_path, backing_file_path);
-
-	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
-	memset(&loopinfo, 0, sizeof(loopinfo));
-	memset(&loopinfoget, 0, sizeof(loopinfoget));
-
-	loopinfo.lo_flags = SET_FLAGS;
+	loopinfo.lo_flags = set_flag;
 	SAFE_IOCTL(dev_fd, LOOP_SET_STATUS, &loopinfo);
-
 	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
 
-	if (loopinfoget.lo_flags & ~GET_FLAGS)
-		tst_res(TFAIL, "expect %d but got %d", GET_FLAGS, loopinfoget.lo_flags);
+	if (loopinfoget.lo_flags & ~get_flag)
+		tst_res(TFAIL, "expect %d but got %d", get_flag, loopinfoget.lo_flags);
 	else
 		tst_res(TPASS, "get expected lo_flag %d", loopinfoget.lo_flags);
 
 	TST_ASSERT_INT(partscan_path, 1);
-	TST_ASSERT_INT(autoclear_path, 1);
+	TST_ASSERT_INT(autoclear_path, autoclear_field);
 
 	if (!parted_sup) {
 		tst_res(TINFO, "Current environment doesn't have parted disk, skip it");
-		goto detach_device;
+		return;
 	}
 
 	ret = access(loop_partpath, F_OK);
@@ -83,8 +75,24 @@ static void verify_ioctl_loop(void)
 		tst_res(TPASS, "access %s succeeds", sys_loop_partpath);
 	else
 		tst_res(TFAIL, "access %s fails", sys_loop_partpath);
+}
+
+static void verify_ioctl_loop(void)
+{
+	tst_attach_device(dev_path, "test.img");
+	attach_flag = 1;
+
+	TST_ASSERT_INT(partscan_path, 0);
+	TST_ASSERT_INT(autoclear_path, 0);
+	TST_ASSERT_STR(backing_path, backing_file_path);
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+
+	check_loop_value(SET_FLAGS, GET_FLAGS, 1);
+
+	tst_res(TINFO, "Test flag can be clear");
+	check_loop_value(0, LO_FLAGS_PARTSCAN, 0);
 
-detach_device:
 	SAFE_CLOSE(dev_fd);
 	tst_detach_device(dev_path);
 	attach_flag = 0;
@@ -142,6 +150,7 @@ static struct tst_test test = {
 	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "10c70d95c0f2"},
+		{"linux-git", "6ac92fb5cdff"},
 		{}
 	},
 	.needs_tmpdir = 1,
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
