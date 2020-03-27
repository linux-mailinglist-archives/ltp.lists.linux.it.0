Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4144196091
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 968083C3319
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:39:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E0F773C32E8
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 67AAD1A0081C
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57E90AC6C;
 Fri, 27 Mar 2020 21:39:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 22:39:20 +0100
Message-Id: <20200327213924.18816-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327213924.18816-1-pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/6] Use .needs_cmds
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

Change for quotactl01: require also userdel

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New commit.

 testcases/kernel/syscalls/add_key/add_key05.c   | 8 +++++---
 testcases/kernel/syscalls/quotactl/quotactl01.c | 7 ++++---
 testcases/kernel/syscalls/quotactl/quotactl06.c | 7 ++++---
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
index a39bfa0b7..7443a4970 100644
--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -43,9 +43,6 @@ static void add_user(void)
 		user_added = 1;
 		ltpuser = SAFE_GETPWNAM(username);
 		break;
-	case 255:
-		tst_brk(TCONF, "useradd not found");
-		break;
 	default:
 		tst_brk(TBROK, "useradd failed (%d)", rc);
 	}
@@ -215,6 +212,11 @@ static struct tst_test test = {
 		{&user_buf, .size = 64},
 		{}
 	},
+	.needs_cmds = (const char *const []) {
+		"useradd",
+		"userdel",
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "a08bf91ce28"},
 		{"linux-git", "2e356101e72"},
diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index ede61d7e4..6cc1deeb8 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -168,9 +168,6 @@ static void setup(void)
 	switch (ret) {
 	case 0:
 		break;
-	case 255:
-		tst_brk(TCONF, "quotacheck binary not installed");
-		break;
 	default:
 		tst_brk(TBROK, "quotacheck exited with %i", ret);
 	}
@@ -234,5 +231,9 @@ static struct tst_test test = {
 	.dev_fs_type = "ext4",
 	.mntpoint = MNTPOINT,
 	.mnt_data = "usrquota,grpquota",
+	.needs_cmds = (const char *const []) {
+		"quotacheck",
+		NULL
+	},
 	.setup = setup,
 };
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index a3b4517e0..758bd84cd 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -153,9 +153,6 @@ static void setup(void)
 	switch (ret) {
 	case 0:
 		break;
-	case 255:
-		tst_brk(TCONF, "quotacheck binary not installed");
-		break;
 	default:
 		tst_brk(TBROK, "quotacheck exited with %i", ret);
 	}
@@ -192,5 +189,9 @@ static struct tst_test test = {
 	.mntpoint = MNTPOINT,
 	.mount_device = 1,
 	.mnt_data = "usrquota",
+	.needs_cmds = (const char *const []) {
+		"quotacheck",
+		NULL
+	},
 	.needs_root = 1,
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
