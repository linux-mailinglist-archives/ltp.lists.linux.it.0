Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1551AD678
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 08:53:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBA0F3C2AD4
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 08:53:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E43403C2ABC
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 08:53:18 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A6D2A1000AE0
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 08:53:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,393,1580745600"; d="scan'208";a="89190910"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Apr 2020 14:53:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0549049DF12B;
 Fri, 17 Apr 2020 14:42:34 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Apr 2020 14:53:05 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 17 Apr 2020 14:53:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 17 Apr 2020 14:39:41 +0800
Message-ID: <20200417063943.309285-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 0549049DF12B.AC2D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/{quotactl04,
 statx05}.c: Replace extra_opts[] with fs_opts[]
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
Cc: lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

extra_opts[] is to store the options which are passed after device name
(e.g. fs-size: mkfs -t ext4 /dev/sda1 <fs-size>) so perfer to use
fs_opts[] for quotactl04.c and statx05.c.

Also add a hint to doc/test-writing-guidelines.txt.

References:
https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/mmap/mmap16.c

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt                 | 3 +++
 testcases/kernel/syscalls/quotactl/quotactl04.c | 4 ++--
 testcases/kernel/syscalls/statx/statx05.c       | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 895f6c99d..3e33fd4c1 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1116,6 +1116,9 @@ The extra options 'extra_opts' should either be 'NULL' if there are none, or a
 will be passed after device name. e.g: +mkfs -t ext4 -b 1024 /dev/sda1 102400+
 in this case.
 
+Note that perfer to store the options which can be passed before or after device
+name by 'fs_opts' array.
+
 2.2.17 Verifying a filesystem's free space
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index 8dab83da0..b0db8fe5d 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -102,10 +102,10 @@ static struct tcase {
 
 static void setup(void)
 {
-	const char *const extra_opts[] = {"-O quota,project", NULL};
+	const char *const fs_opts[] = {"-O quota,project", NULL};
 
 	test_id = geteuid();
-	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
+	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
 	mount_flag = 1;
 }
diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
index 42911fc17..77684e1ed 100644
--- a/testcases/kernel/syscalls/statx/statx05.c
+++ b/testcases/kernel/syscalls/statx/statx05.c
@@ -87,12 +87,12 @@ static void run(unsigned int i)
 static void setup(void)
 {
 	char opt_bsize[32];
-	const char *const extra_opts[] = {"-O encrypt", opt_bsize, NULL};
+	const char *const fs_opts[] = {"-O encrypt", opt_bsize, NULL};
 	int ret;
 
 	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
 
-	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, extra_opts);
+	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
 	mount_flag = 1;
 
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
