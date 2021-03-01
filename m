Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1679C327616
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 03:26:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C32413C577D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 03:26:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E641A3C4DCF
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 03:26:31 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 452DD1400980
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 03:26:30 +0100 (CET)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dpkbk11gNzMgL0
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 10:24:18 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 10:26:17 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 1 Mar 2021 10:25:50 +0800
Message-ID: <20210301022550.96228-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] De-duplication: Remove requirement of needs_tmpdir
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

The flag is not needed to be set when use these flags: '.all_filesystems',
'.format_device', '.mntpoint', '.mount_device' '.needs_checkpoints',
'.needs_device', '.resource_file'. These flags imply creating temporary
directory.

For those:
	fanotify13.c
	setxattr01.c
	fanotify16.c
	close_range01.c
	clone301.c
	fanotify09.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/clone3/clone301.c           | 1 -
 testcases/kernel/syscalls/close_range/close_range01.c | 1 -
 testcases/kernel/syscalls/fanotify/fanotify09.c       | 1 -
 testcases/kernel/syscalls/fanotify/fanotify13.c       | 1 -
 testcases/kernel/syscalls/fanotify/fanotify16.c       | 1 -
 testcases/kernel/syscalls/setxattr/setxattr01.c       | 1 -
 6 files changed, 6 deletions(-)

diff --git a/testcases/kernel/syscalls/clone3/clone301.c b/testcases/kernel/syscalls/clone3/clone301.c
index bf009e940..11787fc7e 100644
--- a/testcases/kernel/syscalls/clone3/clone301.c
+++ b/testcases/kernel/syscalls/clone3/clone301.c
@@ -172,7 +172,6 @@ static struct tst_test test = {
 	.test = run,
 	.setup = setup,
 	.needs_root = 1,
-	.needs_tmpdir = 1,
 	.needs_checkpoints = 1,
 	.bufs = (struct tst_buffers []) {
 		{&args, .size = sizeof(*args)},
diff --git a/testcases/kernel/syscalls/close_range/close_range01.c b/testcases/kernel/syscalls/close_range/close_range01.c
index 56def2426..6ecd4576e 100644
--- a/testcases/kernel/syscalls/close_range/close_range01.c
+++ b/testcases/kernel/syscalls/close_range/close_range01.c
@@ -190,7 +190,6 @@ static void run(unsigned int n)

 static struct tst_test test = {
 	.tcnt = 4,
-	.needs_tmpdir = 1,
 	.forks_child = 1,
 	.mount_device = 1,
 	.mntpoint = "mnt",
diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 918e40274..089655d29 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -365,7 +365,6 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.mount_device = 1,
 	.mntpoint = MOUNT_PATH,
-	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "54a307ba8d3c"},
diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index 6d812cdd1..1fb12ae68 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -289,7 +289,6 @@ static struct tst_test test = {
 	.setup = do_setup,
 	.cleanup = do_cleanup,
 	.needs_root = 1,
-	.needs_tmpdir = 1,
 	.mount_device = 1,
 	.mntpoint = MOUNT_PATH,
 	.all_filesystems = 1,
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index c4b8a5abc..801d05cc2 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -562,7 +562,6 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.mntpoint = MOUNT_PATH,
 	.all_filesystems = 1,
-	.needs_tmpdir = 1,
 	.needs_root = 1
 };

diff --git a/testcases/kernel/syscalls/setxattr/setxattr01.c b/testcases/kernel/syscalls/setxattr/setxattr01.c
index 8b84dfe0d..8cd2821d0 100644
--- a/testcases/kernel/syscalls/setxattr/setxattr01.c
+++ b/testcases/kernel/syscalls/setxattr/setxattr01.c
@@ -210,7 +210,6 @@ static struct tst_test test = {
 	.mntpoint = MNTPOINT,
 	.mount_device = 1,
 	.all_filesystems = 1,
-	.needs_tmpdir = 1,
 	.needs_root = 1,
 };

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
