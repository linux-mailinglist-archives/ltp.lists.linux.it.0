Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD622AAA2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 10:29:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B50753C4D5F
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 10:29:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 593BC3C1D48
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 10:29:40 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 40CEB1000DB6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 10:29:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="96792917"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 16:29:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B354F4CE4BDF
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 16:29:31 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 16:29:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 23 Jul 2020 16:30:01 +0800
Message-ID: <1595493001-15724-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595493001-15724-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1595493001-15724-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B354F4CE4BDF.A1778
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] syscalls/ioctl: Use tst_detach_device_by_fd api
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl09.c      | 5 ++---
 testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 6 ++----
 testcases/kernel/syscalls/ioctl/ioctl_loop02.c | 5 +----
 testcases/kernel/syscalls/ioctl/ioctl_loop04.c | 5 ++---
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c b/testcases/kernel/syscalls/ioctl/ioctl09.c
index 6a7f4042b..151618df4 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl09.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl09.c
@@ -70,7 +70,6 @@ static void verify_ioctl(void)
 	tst_attach_device(dev_path, "test.img");
 	attach_flag = 1;
 
-	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 	loopinfo.lo_flags =  LO_FLAGS_PARTSCAN;
 	SAFE_IOCTL(dev_fd, LOOP_SET_STATUS, &loopinfo);
 	check_partition(1, true);
@@ -81,8 +80,7 @@ static void verify_ioctl(void)
 	check_partition(1, true);
 	check_partition(2, true);
 
-	SAFE_CLOSE(dev_fd);
-	tst_detach_device(dev_path);
+	tst_detach_device_by_fd(dev_path, dev_fd);
 	attach_flag = 0;
 }
 
@@ -92,6 +90,7 @@ static void setup(void)
 	if (dev_num < 0)
 		tst_brk(TBROK, "Failed to find free loop device");
 	tst_prealloc_file("test.img", 1024 * 1024, 20);
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index f334b5eb2..845a1399b 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -86,15 +86,12 @@ static void verify_ioctl_loop(void)
 	TST_ASSERT_INT(autoclear_path, 0);
 	TST_ASSERT_STR(backing_path, backing_file_path);
 
-	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
-
 	check_loop_value(SET_FLAGS, GET_FLAGS, 1);
 
 	tst_res(TINFO, "Test flag can be clear");
 	check_loop_value(0, LO_FLAGS_PARTSCAN, 0);
 
-	SAFE_CLOSE(dev_fd);
-	tst_detach_device(dev_path);
+	tst_detach_device_by_fd(dev_path, dev_fd);
 	attach_flag = 0;
 }
 
@@ -129,6 +126,7 @@ static void setup(void)
 	sprintf(sys_loop_partpath, "/sys/block/loop%d/loop%dp1", dev_num, dev_num);
 	sprintf(backing_file_path, "%s/test.img", tst_get_tmpdir());
 	sprintf(loop_partpath, "%sp1", dev_path);
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
index 3a03d052a..ac6184216 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
@@ -50,7 +50,6 @@ static void verify_ioctl_loop(unsigned int n)
 
 	tst_res(TINFO, "%s", tc->message);
 	file_fd = SAFE_OPEN("test.img", tc->mode);
-	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 
 	if (tc->ioctl == LOOP_SET_FD) {
 		SAFE_IOCTL(dev_fd, LOOP_SET_FD, file_fd);
@@ -97,9 +96,8 @@ static void verify_ioctl_loop(unsigned int n)
 		tst_res(TFAIL, "LOOP_CHANGE_FD succeeded");
 	}
 
-	SAFE_CLOSE(dev_fd);
 	SAFE_CLOSE(file_fd);
-	tst_detach_device(dev_path);
+	tst_detach_device_by_fd(dev_path, dev_fd);
 	attach_flag = 0;
 }
 
@@ -136,7 +134,6 @@ static void setup(void)
 		loop_configure_sup = 0;
 	}
 	loopconfig.info.lo_flags = LO_FLAGS_READ_ONLY;
-	SAFE_CLOSE(dev_fd);
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
index b882728fc..af3e90ddc 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
@@ -33,7 +33,6 @@ static void verify_ioctl_loop(void)
 	attach_flag = 1;
 
 	TST_ASSERT_INT(sys_loop_sizepath, OLD_SIZE/512);
-	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 	file_fd = SAFE_OPEN("test.img", O_RDWR);
 	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
 
@@ -55,8 +54,7 @@ static void verify_ioctl_loop(void)
 	TST_ASSERT_INT(sys_loop_sizepath, NEW_SIZE/512);
 
 	SAFE_CLOSE(file_fd);
-	SAFE_CLOSE(dev_fd);
-	tst_detach_device(dev_path);
+	tst_detach_device_by_fd(dev_path, dev_fd);
 	unlink("test.img");
 	attach_flag = 0;
 }
@@ -70,6 +68,7 @@ static void setup(void)
 	wrbuf = SAFE_MALLOC(OLD_SIZE);
 	memset(wrbuf, 'x', OLD_SIZE);
 	sprintf(sys_loop_sizepath, "/sys/block/loop%d/size", dev_num);
+	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
 }
 
 static void cleanup(void)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
