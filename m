Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCC21AF93
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 08:39:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA3DC3C53C0
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 08:39:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 88DE23C5390
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 08:39:53 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6C9156016F7
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 08:39:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,334,1589212800"; d="scan'208";a="96046301"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jul 2020 14:39:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 881964CE4BDE;
 Fri, 10 Jul 2020 14:39:44 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 10 Jul 2020 14:39:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 10 Jul 2020 14:39:48 +0800
Message-ID: <1594363189-20972-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200708140034.GD7276@yuki.lan>
References: <20200708140034.GD7276@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 881964CE4BDE.AF923
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/ioctl_loop06: Using LOOP_CONFIGURE to
 test invalid block size
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

Since kernel commit 3448914e8cc5("loop: Add LOOP_CONFIGURE ioctl"),
it can set the correct block size immediately by setting loop_config.block_size.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop06.c      | 89 +++++++++++++++----
 1 file changed, 73 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
index 096ec9363..2f172a09d 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
@@ -3,8 +3,8 @@
  * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
  * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
  *
- * This is a basic ioctl error test about loopdevice
- * LOOP_SET_BLOCK_SIZE.
+ * This is a basic error test about the invalid block size of loopdevice
+ * by using LOOP_SET_BLOCK_SIZE or LOOP_CONFIGURE ioctl.
  */
 
 #include <stdio.h>
@@ -15,41 +15,86 @@
 #include "tst_test.h"
 
 static char dev_path[1024];
-static int dev_num, dev_fd, attach_flag;
+static int dev_num, dev_fd, file_fd, attach_flag, loop_configure_sup = 1;
 static unsigned int invalid_value, half_value, unalign_value;
+static struct loop_config loopconfig;
 
 static struct tcase {
 	unsigned int *setvalue;
-	int exp_err;
+	int ioctl_flag;
 	char *message;
 } tcases[] = {
-	{&half_value, EINVAL, "arg < 512"},
-	{&invalid_value, EINVAL, "arg > PAGE_SIZE"},
-	{&unalign_value, EINVAL, "arg != power_of_2"},
+	{&half_value, LOOP_SET_BLOCK_SIZE,
+	"Using LOOP_SET_BLOCK_SIZE with arg < 512"},
+
+	{&invalid_value, LOOP_SET_BLOCK_SIZE,
+	"Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE"},
+
+	{&unalign_value, LOOP_SET_BLOCK_SIZE,
+	"Using LOOP_SET_BLOCK_SIZE with arg != power_of_2"},
+
+	{&half_value, LOOP_CONFIGURE,
+	"Using LOOP_CONFIGURE with block_size < 512"},
+
+	{&invalid_value, LOOP_CONFIGURE,
+	"Using LOOP_CONFIGURE with block_size > PAGE_SIZE"},
+
+	{&unalign_value, LOOP_CONFIGURE,
+	"Using LOOP_CONFIGURE with block_size != power_of_2"},
 };
 
 static void verify_ioctl_loop(unsigned int n)
+{
+	if (tcases[n].ioctl_flag == LOOP_CONFIGURE)
+		TEST(ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig));
+	else
+		TEST(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, *(tcases[n].setvalue)));
+
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "Set block size succeed unexpectedly");
+		if (tcases[n].ioctl_flag == LOOP_CONFIGURE)
+			TST_RETRY_FUNC(ioctl(dev_fd, LOOP_CLR_FD, 0), TST_RETVAL_EQ0);
+		return;
+	}
+	if (TST_ERR == EINVAL)
+		tst_res(TPASS | TTERRNO, "Set block size failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "Set block size failed expected EINVAL got");
+}
+
+static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
 	tst_res(TINFO, "%s", tc->message);
-	TEST(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, *(tc->setvalue)));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "LOOP_SET_BLOCK_SIZE succeed unexpectedly");
+	if (tc->ioctl_flag == LOOP_SET_BLOCK_SIZE) {
+		if (!attach_flag) {
+			tst_attach_device(dev_path, "test.img");
+			attach_flag = 1;
+		}
+		verify_ioctl_loop(n);
 		return;
 	}
 
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "LOOP_SET_BLOCK_SIZE failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "LOOP_SET_BLOCK_SIZE failed expected %s got",
-				tst_strerrno(tc->exp_err));
+	if (tc->ioctl_flag == LOOP_CONFIGURE && !loop_configure_sup) {
+		tst_res(TCONF, "LOOP_CONFIGURE ioctl not supported");
+		return;
+	}
+	if (attach_flag) {
+		SAFE_CLOSE(dev_fd);
+		tst_detach_device(dev_path);
+		attach_flag = 0;
 	}
+	if (dev_fd < 0)
+		dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	loopconfig.block_size = *(tc->setvalue);
+	verify_ioctl_loop(n);
 }
 
 static void setup(void)
 {
 	unsigned int pg_size;
+	int ret;
 
 	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
 	if (dev_num < 0)
@@ -67,12 +112,24 @@ static void setup(void)
 
 	if (ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, 512) && errno == EINVAL)
 		tst_brk(TCONF, "LOOP_SET_BLOCK_SIZE is not supported");
+
+	file_fd = SAFE_OPEN("test.img", O_RDWR);
+	loopconfig.fd = -1;
+	ret = ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig);
+	if (ret && errno != EBADF) {
+		tst_res(TINFO | TERRNO, "LOOP_CONFIGURE is not supported");
+		loop_configure_sup = 0;
+		return;
+	}
+	loopconfig.fd = file_fd;
 }
 
 static void cleanup(void)
 {
 	if (dev_fd > 0)
 		SAFE_CLOSE(dev_fd);
+	if (file_fd > 0)
+		SAFE_CLOSE(file_fd);
 	if (attach_flag)
 		tst_detach_device(dev_path);
 }
@@ -80,7 +137,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
-	.test = verify_ioctl_loop,
+	.test = run,
 	.tcnt = ARRAY_SIZE(tcases),
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
