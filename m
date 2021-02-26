Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0C325C46
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 05:01:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B6D33C5A3F
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 05:01:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E58523C0F5F
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 05:01:41 +0100 (CET)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CA32F600066
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 05:01:39 +0100 (CET)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DmwsV2LBlz7q4R
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 11:59:58 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Feb 2021 12:01:28 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 26 Feb 2021 12:00:57 +0800
Message-ID: <20210226040057.184076-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl: Remove requirement of loop driver
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

There is no loop driver when config CONFIG_BLK_DEV_LOOP is set to y, and
we have check the loop device in tst_find_free_loopdev. So we can remove
the requirement of loop driver.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop02.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop03.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop04.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop06.c | 4 ----
 testcases/kernel/syscalls/ioctl/ioctl_loop07.c | 4 ----
 7 files changed, 28 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index cf71184b4..27713847d 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -142,10 +142,6 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = verify_ioctl_loop,
 	.needs_root = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "10c70d95c0f2"},
 		{"linux-git", "6ac92fb5cdff"},
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
index ac6184216..538b64e00 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
@@ -157,8 +157,4 @@ static struct tst_test test = {
 	.test = verify_ioctl_loop,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop03.c b/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
index 9cf5a41fa..ee3748178 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
@@ -68,8 +68,4 @@ static struct tst_test test = {
 	.test_all = verify_ioctl_loop,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
index b4ab44a74..615247aec 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
@@ -91,8 +91,4 @@ static struct tst_test test = {
 	.test_all = verify_ioctl_loop,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index f8fa413a9..ec88d6039 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -151,8 +151,4 @@ static struct tst_test test = {
 	.test_all = verify_ioctl_loop,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
index bd0d289ca..969b98c41 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
@@ -136,8 +136,4 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
index efe48962e..5e1b38866 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
@@ -158,8 +158,4 @@ static struct tst_test test = {
 		{"linux-git", "79e5dc59e297"},
 		{}
 	},
-	.needs_drivers = (const char *const []) {
-		"loop",
-		NULL
-	}
 };
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
