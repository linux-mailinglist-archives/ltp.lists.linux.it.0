Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2942C269E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 13:56:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A9D03C4E50
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 13:56:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 512263C14BC
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 13:56:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 99B8B6006EF
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 13:56:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02B35AEC1
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 12:56:19 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Nov 2020 13:57:09 +0100
Message-Id: <20201124125709.12192-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] syscalls/quotactl: Define kconfigs inline.
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/quotactl/quotactl01.c | 10 ++++------
 testcases/kernel/syscalls/quotactl/quotactl02.c |  5 ++++-
 testcases/kernel/syscalls/quotactl/quotactl02.h |  4 ----
 testcases/kernel/syscalls/quotactl/quotactl03.c | 10 ++++------
 testcases/kernel/syscalls/quotactl/quotactl04.c | 10 ++++------
 testcases/kernel/syscalls/quotactl/quotactl05.c |  5 ++++-
 testcases/kernel/syscalls/quotactl/quotactl06.c | 10 ++++------
 7 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index e1ec22529..7b3649fa5 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -210,14 +210,12 @@ static void verify_quota(unsigned int n)
 	tst_res(TPASS, "quotactl succeeded to %s", tc->des);
 }
 
-static const char *kconfigs[] = {
-	"CONFIG_QFMT_V2",
-	NULL
-};
-
 static struct tst_test test = {
 	.needs_root = 1,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_QFMT_V2",
+		NULL
+	},
 	.test = verify_quota,
 	.tcnt = ARRAY_SIZE(tcases),
 	.mount_device = 1,
diff --git a/testcases/kernel/syscalls/quotactl/quotactl02.c b/testcases/kernel/syscalls/quotactl/quotactl02.c
index cd8a0c388..4186bff65 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl02.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl02.c
@@ -142,7 +142,10 @@ static void verify_quota(unsigned int n)
 
 static struct tst_test test = {
 	.needs_root = 1,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_XFS_QUOTA",
+		NULL
+	},
 	.test = verify_quota,
 	.tcnt = ARRAY_SIZE(tcases),
 	.mount_device = 1,
diff --git a/testcases/kernel/syscalls/quotactl/quotactl02.h b/testcases/kernel/syscalls/quotactl/quotactl02.h
index 5140a7042..37f3d7eb7 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl02.h
+++ b/testcases/kernel/syscalls/quotactl/quotactl02.h
@@ -26,10 +26,6 @@ static uint32_t test_id;
 static int x_getnextquota_nsup;
 static int x_getstatv_nsup;
 static const char mntpoint[] = "mnt_point";
-static const char *kconfigs[] = {
-	"CONFIG_XFS_QUOTA",
-	NULL
-};
 
 void check_support_cmd(int quotatype)
 {
diff --git a/testcases/kernel/syscalls/quotactl/quotactl03.c b/testcases/kernel/syscalls/quotactl/quotactl03.c
index d95719521..3ec931727 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl03.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl03.c
@@ -64,14 +64,12 @@ static void verify_quota(void)
 		tst_res(TPASS, "quotactl() failed with ENOENT as expected");
 }
 
-static const char *kconfigs[] = {
-	"CONFIG_XFS_QUOTA",
-	NULL
-};
-
 static struct tst_test test = {
 	.needs_root = 1,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_XFS_QUOTA",
+		NULL
+	},
 	.test_all = verify_quota,
 	.mount_device = 1,
 	.dev_fs_type = "xfs",
diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index 3cc2b974f..9bd160e77 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -154,14 +154,12 @@ static void verify_quota(unsigned int n)
 	tst_res(TPASS, "quotactl succeeded to %s", tc->des);
 }
 
-static const char *kconfigs[] = {
-	"CONFIG_QFMT_V2",
-	NULL
-};
-
 static struct tst_test test = {
 	.needs_root = 1,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_QFMT_V2",
+		NULL
+	},
 	.min_kver = "4.10", /* commit 689c958cbe6b (ext4: add project quota support) */
 	.test = verify_quota,
 	.tcnt = ARRAY_SIZE(tcases),
diff --git a/testcases/kernel/syscalls/quotactl/quotactl05.c b/testcases/kernel/syscalls/quotactl/quotactl05.c
index af5a164e4..e811e47a4 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl05.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl05.c
@@ -99,7 +99,10 @@ static void verify_quota(unsigned int n)
 
 static struct tst_test test = {
 	.needs_root = 1,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_XFS_QUOTA",
+		NULL
+	},
 	.test = verify_quota,
 	.tcnt = ARRAY_SIZE(tcases),
 	.mount_device = 1,
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 0a36c97a4..2818a4dc4 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -168,14 +168,12 @@ static void setup(void)
 	}
 }
 
-static const char *kconfigs[] = {
-	"CONFIG_QFMT_V2",
-	NULL
-};
-
 static struct tst_test test = {
 	.setup = setup,
-	.needs_kconfigs = kconfigs,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_QFMT_V2",
+		NULL
+	},
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_quotactl,
 	.dev_fs_type = "ext4",
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
