Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894A1F65BD
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06B613C2DFE
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3A3E73C2E37
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 29FB1600AA1
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,499,1583164800"; d="scan'208";a="94304151"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2020 18:35:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4774D4CE26D3
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 18:35:36 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Jun 2020 18:35:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 11 Jun 2020 18:35:14 +0800
Message-ID: <1591871716-21250-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4774D4CE26D3.AE677
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/4] syscalls/ioctl_loop02: Using LOOP_CONFIGURE to
 set read_only
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

Since kernel commit 3448914e8cc5("loop: Add LOOP_CONFIGURE ioctl"),
it can explicitly request read-only mode by setting LO_FLAGS_READ_ONLY
in loop_config.info.lo_flags regardless of backing file open mode.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop02.c      | 53 +++++++++++++++----
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
index c43172ca1..c497017f5 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
@@ -11,6 +11,9 @@
  * For LOOP_CHANGE_FD, this operation is possible only if the loop device
  * is read-only and the new backing store is the same size and type as the
  * old backing store.
+ *
+ * If using LOOP_CONFIGURE ioctl, we can set LO_FLAGS_READ_ONLY
+ * flag even though backing file with write mode.
  */
 
 #include <stdio.h>
@@ -22,15 +25,39 @@
 
 static int file_fd, file_change_fd, file_fd_invalid;
 static char backing_path[1024], backing_file_path[1024], backing_file_change_path[1024];
-static int attach_flag, dev_fd, file_fd;
+static int attach_flag, dev_fd, loop_configure_sup = 1;
 static char loop_ro_path[1024], dev_path[1024];
+static struct loop_config loopconfig;
+
+static struct tcase {
+	int mode;
+	int ioctl;
+	char *message;
+} tcases[] = {
+	{O_RDONLY, LOOP_SET_FD, "Using LOOP_SET_FD to setup loopdevice"},
+	{O_RDWR, LOOP_CONFIGURE, "Using LOOP_CONFIGURE with read_only flag to setup loopdevice"},
+};
 
-static void verify_ioctl_loop(void)
+static void verify_ioctl_loop(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 	struct loop_info loopinfoget;
 
+	tst_res(TINFO, "%s", tc->message);
+	file_fd = SAFE_OPEN("test.img", tc->mode);
 	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
-	SAFE_IOCTL(dev_fd, LOOP_SET_FD, file_fd);
+
+	if (tc->ioctl == LOOP_SET_FD) {
+		SAFE_IOCTL(dev_fd, LOOP_SET_FD, file_fd);
+	} else {
+		if (!loop_configure_sup) {
+			tst_res(TCONF,
+				"Current environmet doesn't support LOOP_CONFIGURE ioctl, skip this");
+			return;
+		}
+		loopconfig.fd = file_fd;
+		SAFE_IOCTL(dev_fd, LOOP_CONFIGURE, &loopconfig);
+	}
 	attach_flag = 1;
 
 	TST_ASSERT_INT(loop_ro_path, 1);
@@ -38,11 +65,6 @@ static void verify_ioctl_loop(void)
 
 	memset(&loopinfoget, 0, sizeof(loopinfoget));
 
-	/*
-	 * In drivers/block/loop.c code, set status function doesn't handle
-	 * LO_FLAGS_READ_ONLY flag and ignore it. Only loop_set_fd with readonly
-	 * mode, lo_flags will include LO_FLAGS_READ_ONLY.
-	 */
 	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
 
 	if (loopinfoget.lo_flags & ~LO_FLAGS_READ_ONLY)
@@ -83,6 +105,7 @@ static void verify_ioctl_loop(void)
 static void setup(void)
 {
 	int dev_num;
+	int ret;
 
 	char *tmpdir = tst_get_tmpdir();
 	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
@@ -103,6 +126,17 @@ static void setup(void)
 	file_fd = SAFE_OPEN("test.img", O_RDONLY);
 	file_change_fd = SAFE_OPEN("test1.img", O_RDWR);
 	file_fd_invalid = SAFE_OPEN("test2.img", O_RDWR);
+
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
+	loopconfig.fd = -1;
+	ret = ioctl(dev_fd, LOOP_CONFIGURE, &loopconfig);
+
+	if (ret && errno != EBADF) {
+		tst_res(TINFO | TERRNO, "LOOP_CONFIGURE is not supported");
+		loop_configure_sup = 0;
+	}
+	loopconfig.info.lo_flags = LO_FLAGS_READ_ONLY;
+	SAFE_CLOSE(dev_fd);
 }
 
 static void cleanup(void)
@@ -122,7 +156,8 @@ static void cleanup(void)
 static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
-	.test_all = verify_ioctl_loop,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_ioctl_loop,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.needs_drivers = (const char *const []) {
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
