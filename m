Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172432AE9C
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 03:55:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4136D3C56FD
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 03:55:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1CEC33C56B8
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 03:55:09 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 608821A000BC
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 03:55:06 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,218,1610380800"; d="scan'208";a="105066504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Mar 2021 10:55:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 346594CE7F72
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 10:54:56 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Mar 2021 10:54:49 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Mar 2021 10:54:49 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 3 Mar 2021 10:32:35 +0800
Message-ID: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 346594CE7F72.A970F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: Use anonymous .resource_files for docparse
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

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/creat/creat07.c       | 10 ++++------
 testcases/kernel/syscalls/execve/execve02.c     | 10 ++++------
 testcases/kernel/syscalls/execve/execve04.c     | 10 ++++------
 testcases/kernel/syscalls/execve/execve05.c     | 10 ++++------
 testcases/kernel/syscalls/execveat/execveat01.c | 10 ++++------
 testcases/kernel/syscalls/execveat/execveat02.c | 10 ++++------
 testcases/kernel/syscalls/execveat/execveat03.c | 10 ++++------
 testcases/kernel/syscalls/fanotify/fanotify10.c | 10 ++++------
 testcases/kernel/syscalls/fanotify/fanotify12.c | 10 ++++------
 testcases/kernel/syscalls/pipe2/pipe2_02.c      | 10 ++++------
 testcases/kernel/syscalls/prctl/prctl06.c       | 10 ++++------
 11 files changed, 44 insertions(+), 66 deletions(-)

diff --git a/testcases/kernel/syscalls/creat/creat07.c b/testcases/kernel/syscalls/creat/creat07.c
index 1e9779476..7bd32ab4d 100644
--- a/testcases/kernel/syscalls/creat/creat07.c
+++ b/testcases/kernel/syscalls/creat/creat07.c
@@ -47,14 +47,12 @@ static void verify_creat(void)
 	SAFE_WAITPID(pid, NULL, 0);
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static struct tst_test test = {
 	.test_all = verify_creat,
 	.needs_checkpoints = 1,
 	.forks_child = 1,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	}
 };
diff --git a/testcases/kernel/syscalls/execve/execve02.c b/testcases/kernel/syscalls/execve/execve02.c
index d9fb5b919..4e6be826b 100644
--- a/testcases/kernel/syscalls/execve/execve02.c
+++ b/testcases/kernel/syscalls/execve/execve02.c
@@ -74,16 +74,14 @@ static void setup(void)
 	nobody_uid = pwd->pw_uid;
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.child_needs_reinit = 1,
 	.setup = setup,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.test_all = verify_execve,
 };
diff --git a/testcases/kernel/syscalls/execve/execve04.c b/testcases/kernel/syscalls/execve/execve04.c
index c7b8c1614..18e883ab3 100644
--- a/testcases/kernel/syscalls/execve/execve04.c
+++ b/testcases/kernel/syscalls/execve/execve04.c
@@ -63,15 +63,13 @@ static void do_child(void)
 	exit(0);
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static struct tst_test test = {
 	.test_all = verify_execve,
 	.forks_child = 1,
 	.child_needs_reinit = 1,
 	.needs_checkpoints = 1,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	}
 };
diff --git a/testcases/kernel/syscalls/execve/execve05.c b/testcases/kernel/syscalls/execve/execve05.c
index 4c9789cc5..a26eba79a 100644
--- a/testcases/kernel/syscalls/execve/execve05.c
+++ b/testcases/kernel/syscalls/execve/execve05.c
@@ -44,11 +44,6 @@ static int nchild = 8;
 
 static char *opt_nchild;
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static void do_child(void)
 {
 	char *argv[3] = {TEST_APP, "canary", NULL};
@@ -86,6 +81,9 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.child_needs_reinit = 1,
 	.needs_checkpoints = 1,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.setup = setup,
 };
diff --git a/testcases/kernel/syscalls/execveat/execveat01.c b/testcases/kernel/syscalls/execveat/execveat01.c
index 16d27acf6..55891b74c 100644
--- a/testcases/kernel/syscalls/execveat/execveat01.c
+++ b/testcases/kernel/syscalls/execveat/execveat01.c
@@ -84,13 +84,11 @@ static void cleanup(void)
 		SAFE_CLOSE(fd4);
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static struct tst_test test = {
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_execveat,
 	.child_needs_reinit = 1,
diff --git a/testcases/kernel/syscalls/execveat/execveat02.c b/testcases/kernel/syscalls/execveat/execveat02.c
index 9b08efb78..c057b8eaf 100644
--- a/testcases/kernel/syscalls/execveat/execveat02.c
+++ b/testcases/kernel/syscalls/execveat/execveat02.c
@@ -85,11 +85,6 @@ static void setup(void)
 	fd = SAFE_OPEN(TEST_REL_APP, O_PATH);
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static void cleanup(void)
 {
 	if (fd > 0)
@@ -97,7 +92,10 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_execveat,
 	.child_needs_reinit = 1,
diff --git a/testcases/kernel/syscalls/execveat/execveat03.c b/testcases/kernel/syscalls/execveat/execveat03.c
index 78b26ab56..97df8f33e 100644
--- a/testcases/kernel/syscalls/execveat/execveat03.c
+++ b/testcases/kernel/syscalls/execveat/execveat03.c
@@ -68,11 +68,6 @@ static void setup(void)
 	check_execveat();
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL,
-};
-
 static struct tst_test test = {
 	.needs_root = 1,
 	.mount_device = 1,
@@ -82,7 +77,10 @@ static struct tst_test test = {
 	.child_needs_reinit = 1,
 	.setup = setup,
 	.test_all = verify_execveat,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "8db6c34f1dbc"},
 		{"linux-git", "355139a8dba4"},
diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index eeba87568..b2eb909a7 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -534,11 +534,6 @@ static void cleanup(void)
 		tst_brk(TBROK | TERRNO, "bind umount failed");
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL
-};
-
 static struct tst_test test = {
 	.test = test_fanotify,
 	.tcnt = ARRAY_SIZE(tcases),
@@ -548,7 +543,10 @@ static struct tst_test test = {
 	.mntpoint = MOUNT_PATH,
 	.needs_root = 1,
 	.forks_child = 1,
-	.resource_files = resource_files,
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9bdda4e9cf2d"},
 		{"linux-git", "2f02fd3fa13e"},
diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
index 17086ef71..7070b9e4f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify12.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -232,11 +232,6 @@ static void do_cleanup(void)
 		SAFE_CLOSE(fd_notify);
 }
 
-static const char *const resource_files[] = {
-	TEST_APP,
-	NULL
-};
-
 static struct tst_test test = {
 	.setup = do_setup,
 	.test = do_test,
@@ -244,7 +239,10 @@ static struct tst_test test = {
 	.cleanup = do_cleanup,
 	.forks_child = 1,
 	.needs_root = 1,
-	.resource_files = resource_files
+	.resource_files = (const char *const []) {
+		TEST_APP,
+		NULL
+	}
 };
 #else
 	TST_TEST_TCONF("System does not contain required fanotify support");
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c b/testcases/kernel/syscalls/pipe2/pipe2_02.c
index 9ba69667b..ee317668b 100644
--- a/testcases/kernel/syscalls/pipe2/pipe2_02.c
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02.c
@@ -54,13 +54,11 @@ static void verify_pipe2(void)
 	cleanup();
 }
 
-static const char *const resfile[] = {
-	TESTBIN,
-	NULL,
-};
-
 static struct tst_test test = {
-	.resource_files = resfile,
+	.resource_files = (const char *const []) {
+		TESTBIN,
+		NULL
+	},
 	.cleanup = cleanup,
 	.forks_child = 1,
 	.needs_root = 1,
diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index 21d336c07..2395f1adc 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -107,13 +107,11 @@ static void setup(void)
 		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
 }
 
-static const char *const resfile[] = {
-	TESTBIN,
-	NULL,
-};
-
 static struct tst_test test = {
-	.resource_files = resfile,
+	.resource_files = (const char *const []) {
+		TESTBIN,
+		NULL
+	},
 	.setup = setup,
 	.test_all = verify_prctl,
 	.forks_child = 1,
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
