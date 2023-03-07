Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 306986ADF26
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Mar 2023 13:52:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2EB93CB88B
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Mar 2023 13:52:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C791E3CB855
 for <ltp@lists.linux.it>; Tue,  7 Mar 2023 13:52:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 53F3D100048A
 for <ltp@lists.linux.it>; Tue,  7 Mar 2023 13:52:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBE8F1FE17;
 Tue,  7 Mar 2023 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678193537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gf368CuOXdXbzPZ3/C6x1IARqWG5VoCIW7cQMuTCQug=;
 b=nQuhGvStUwAqyybP5/6HaLgX+31zfJiTai4FvMa+T+UZhjQxc9MkHcZOAgdEZbPzyglUgI
 6v/ubzARHSAWmuqhs7ypsHxFuOVUNkPS3H7J+BGWlj3Mv9o9CuEp0OgO5vFA+k8g/cGqbm
 Us31BXMJvoLDJBvGpxOlGylZ9N3Yz7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678193537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gf368CuOXdXbzPZ3/C6x1IARqWG5VoCIW7cQMuTCQug=;
 b=0WJjKMUJ1x3BKdEoflZs+BzgOw1tekLgvHItjci70kY+PwafS6PIuoeYMyyeUiHxPkVmSI
 2IZUqATIbnqmXNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98E2E1341F;
 Tue,  7 Mar 2023 12:52:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ytxxI4EzB2RqPwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 07 Mar 2023 12:52:17 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue,  7 Mar 2023 13:50:10 +0100
Message-Id: <20230307125010.28964-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Remove ltp_quick_clone from mountns testing suite
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

ltp_quick_clone has been replaced by SAFE_CLONE in the mountns testing
suite that now is independed from libclone and legacy API.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Check for CONFIG_USER_NS

 testcases/kernel/containers/mountns/mountns.h | 18 -----------------
 .../kernel/containers/mountns/mountns01.c     | 20 +++++++++++--------
 .../kernel/containers/mountns/mountns02.c     | 20 +++++++++++--------
 .../kernel/containers/mountns/mountns03.c     | 20 +++++++++++--------
 .../kernel/containers/mountns/mountns04.c     |  6 +++++-
 5 files changed, 41 insertions(+), 43 deletions(-)

diff --git a/testcases/kernel/containers/mountns/mountns.h b/testcases/kernel/containers/mountns/mountns.h
index 615f1a058..9bb854659 100644
--- a/testcases/kernel/containers/mountns/mountns.h
+++ b/testcases/kernel/containers/mountns/mountns.h
@@ -8,28 +8,10 @@
 #define COMMON_H
 
 #include "tst_test.h"
-#include "lapi/sched.h"
 
 #define DIRA "LTP_DIR_A"
 #define DIRB "LTP_DIR_B"
 
-static int dummy_child(void *v)
-{
-	(void)v;
-	return 0;
-}
-
-static void check_newns(void)
-{
-	int pid, status;
-
-	pid = ltp_clone_quick(CLONE_NEWNS | SIGCHLD, dummy_child, NULL);
-	if (pid < 0)
-		tst_brk(TCONF, "CLONE_NEWNS not supported");
-
-	SAFE_WAIT(&status);
-}
-
 static void umount_folders(void)
 {
 	if (tst_is_mounted(DIRA))
diff --git a/testcases/kernel/containers/mountns/mountns01.c b/testcases/kernel/containers/mountns/mountns01.c
index e8f176920..41c2956ea 100644
--- a/testcases/kernel/containers/mountns/mountns01.c
+++ b/testcases/kernel/containers/mountns/mountns01.c
@@ -33,8 +33,9 @@
 #include <sys/mount.h>
 #include "mountns.h"
 #include "tst_test.h"
+#include "lapi/sched.h"
 
-static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
+static void child_func(void)
 {
 	TST_CHECKPOINT_WAIT(0);
 
@@ -51,13 +52,11 @@ static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
 	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
 	SAFE_UMOUNT(DIRA);
-
-	return 0;
 }
 
 static void run(void)
 {
-	int ret;
+	const struct tst_clone_args args = { CLONE_NEWNS, SIGCHLD };
 
 	SAFE_UNSHARE(CLONE_NEWNS);
 
@@ -67,9 +66,10 @@ static void run(void)
 	SAFE_MOUNT(DIRA, DIRA, "none", MS_BIND, NULL);
 	SAFE_MOUNT("none", DIRA, "none", MS_SHARED, NULL);
 
-	ret = ltp_clone_quick(CLONE_NEWNS | SIGCHLD, child_func, NULL);
-	if (ret < 0)
-		tst_brk(TBROK, "clone failed");
+	if (!SAFE_CLONE(&args)) {
+		child_func();
+		return;
+	}
 
 	SAFE_MOUNT(DIRB, DIRA, "none", MS_BIND, NULL);
 
@@ -93,7 +93,6 @@ static void run(void)
 
 static void setup(void)
 {
-	check_newns();
 	create_folders();
 }
 
@@ -107,5 +106,10 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = run,
 	.needs_root = 1,
+	.forks_child = 1,
 	.needs_checkpoints = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/mountns/mountns02.c b/testcases/kernel/containers/mountns/mountns02.c
index 4b85fa79b..7ca01a438 100644
--- a/testcases/kernel/containers/mountns/mountns02.c
+++ b/testcases/kernel/containers/mountns/mountns02.c
@@ -34,8 +34,9 @@
 #include <sys/mount.h>
 #include "mountns.h"
 #include "tst_test.h"
+#include "lapi/sched.h"
 
-static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
+static void child_func(void)
 {
 	TST_CHECKPOINT_WAIT(0);
 
@@ -51,13 +52,11 @@ static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
 	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
 	SAFE_UMOUNT(DIRA);
-
-	return 0;
 }
 
 static void run(void)
 {
-	int ret;
+	const struct tst_clone_args args = { CLONE_NEWNS, SIGCHLD };
 
 	SAFE_UNSHARE(CLONE_NEWNS);
 
@@ -68,9 +67,10 @@ static void run(void)
 
 	SAFE_MOUNT("none", DIRA, "none", MS_PRIVATE, NULL);
 
-	ret = ltp_clone_quick(CLONE_NEWNS | SIGCHLD, child_func, NULL);
-	if (ret < 0)
-		tst_brk(TBROK, "clone failed");
+	if (!SAFE_CLONE(&args)) {
+		child_func();
+		return;
+	}
 
 	SAFE_MOUNT(DIRB, DIRA, "none", MS_BIND, NULL);
 
@@ -94,7 +94,6 @@ static void run(void)
 
 static void setup(void)
 {
-	check_newns();
 	create_folders();
 }
 
@@ -108,5 +107,10 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = run,
 	.needs_root = 1,
+	.forks_child = 1,
 	.needs_checkpoints = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/mountns/mountns03.c b/testcases/kernel/containers/mountns/mountns03.c
index 1d26a25d8..3b4936b06 100644
--- a/testcases/kernel/containers/mountns/mountns03.c
+++ b/testcases/kernel/containers/mountns/mountns03.c
@@ -36,8 +36,9 @@
 #include <sys/mount.h>
 #include "mountns.h"
 #include "tst_test.h"
+#include "lapi/sched.h"
 
-static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
+static void child_func(void)
 {
 	/*
 	 * makes mount DIRA a slave of DIRA (all slave mounts have
@@ -59,13 +60,11 @@ static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
 	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
 	SAFE_UMOUNT(DIRA);
-
-	return 0;
 }
 
 static void run(void)
 {
-	int ret;
+	const struct tst_clone_args args = { CLONE_NEWNS, SIGCHLD };
 
 	SAFE_UNSHARE(CLONE_NEWNS);
 
@@ -76,9 +75,10 @@ static void run(void)
 
 	SAFE_MOUNT("none", DIRA, "none", MS_SHARED, NULL);
 
-	ret = ltp_clone_quick(CLONE_NEWNS | SIGCHLD, child_func, NULL);
-	if (ret < 0)
-		tst_brk(TBROK, "clone failed");
+	if (!SAFE_CLONE(&args)) {
+		child_func();
+		return;
+	}
 
 	TST_CHECKPOINT_WAIT(0);
 
@@ -104,7 +104,6 @@ static void run(void)
 
 static void setup(void)
 {
-	check_newns();
 	create_folders();
 }
 
@@ -118,5 +117,10 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = run,
 	.needs_root = 1,
+	.forks_child = 1,
 	.needs_checkpoints = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/mountns/mountns04.c b/testcases/kernel/containers/mountns/mountns04.c
index fc392f1a7..7b4dcb16d 100644
--- a/testcases/kernel/containers/mountns/mountns04.c
+++ b/testcases/kernel/containers/mountns/mountns04.c
@@ -22,6 +22,7 @@
 #include <sys/mount.h>
 #include "mountns.h"
 #include "tst_test.h"
+#include "lapi/sched.h"
 
 static void run(void)
 {
@@ -46,7 +47,6 @@ static void run(void)
 
 static void setup(void)
 {
-	check_newns();
 	create_folders();
 }
 
@@ -61,4 +61,8 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL,
+	},
 };
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
