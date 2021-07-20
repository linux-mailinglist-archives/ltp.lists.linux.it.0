Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93D3CF808
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:39:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02CAD3C9802
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:39:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 886973C6293
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EC81F100077B
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:39:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C9F8202C0
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626777582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4LVMZsT7ZEeCLls1ScfY0keZPZS+0J+jifd+VuYoM0=;
 b=gv5OgtxllpIGNgMpHezr1/ASFGyQcei2ctsOzi/duT7+7NJGr5gx8aQp8b5dU8+7S2bZMn
 tI6cD9BvMs3YY17uahFcOEUR8srgZ13/0BV8tcWL7F5kAy2M4Q+OlbI/y/eJDKBYTYgdYh
 rjSwJNK7NtjYkHlNkzPiwVDkMKpuFHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626777582;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4LVMZsT7ZEeCLls1ScfY0keZPZS+0J+jifd+VuYoM0=;
 b=jpsNUqKNzbEXV1IhWpBVr3ni5UnbBbtyjDxRhiSre3WiEsYUG/PM+nbI21ezU8gW0XUUXZ
 eIPl6gshO2aJdYAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 55D5E13B2F
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id CGkWFO6n9mAuOwAAGKfGzw
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:39:42 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 12:39:41 +0200
Message-Id: <20210720103941.9767-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720103941.9767-1-mdoucha@suse.cz>
References: <20210720103941.9767-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] Add lockdown checks to init_module* and
 finit_module* tests
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../syscalls/finit_module/finit_module01.c    |  2 ++
 .../syscalls/finit_module/finit_module02.c    | 23 +++++++++++++--
 .../syscalls/init_module/init_module01.c      |  2 ++
 .../syscalls/init_module/init_module02.c      | 29 +++++++++++++------
 4 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/finit_module/finit_module01.c b/testcases/kernel/syscalls/finit_module/finit_module01.c
index 9c34282e1..21c35f101 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module01.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -51,4 +51,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
+	/* lockdown requires signed modules */
+	.skip_in_lockdown = 1,
 };
diff --git a/testcases/kernel/syscalls/finit_module/finit_module02.c b/testcases/kernel/syscalls/finit_module/finit_module02.c
index 9d9255c6d..503c8e994 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module02.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -25,6 +25,7 @@
 static char *mod_path;
 
 static int fd, fd_zero, fd_invalid = -1, fd_dir;
+static int kernel_lockdown;
 
 static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
 static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
@@ -64,11 +65,19 @@ static void dir_setup(struct tcase *tc)
 		tc->exp_errno = EINVAL;
 }
 
+static void lockdown_setup(struct tcase *tc)
+{
+	if (kernel_lockdown)
+		tc->exp_errno = EPERM;
+}
+
 static struct tcase tcases[] = {
 	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, bad_fd_setup},
 	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
-	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT, NULL},
-	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
+	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT,
+		lockdown_setup},
+	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0,
+		EINVAL, lockdown_setup},
 	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, NULL},
 	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM, NULL},
 	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, NULL},
@@ -84,6 +93,7 @@ static void setup(void)
 
 	tst_module_exists(MODULE_NAME, &mod_path);
 
+	kernel_lockdown = tst_lockdown_enabled();
 	SAFE_MKDIR(TEST_DIR, 0700);
 	fd_dir = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
 
@@ -108,8 +118,15 @@ static void run(unsigned int n)
 		tst_cap_action(&cap_drop);
 
 	/* Insert module twice */
-	if (tc->exp_errno == EEXIST)
+	if (tc->exp_errno == EEXIST) {
+		if (kernel_lockdown) {
+			tst_res(TCONF, "Kernel is locked down, skipping %s",
+				tc->name);
+			return;
+		}
+
 		tst_module_load(MODULE_NAME, NULL);
+	}
 
 	TST_EXP_FAIL(finit_module(*tc->fd, tc->param, tc->flags), tc->exp_errno,
 		     "TestName: %s", tc->name);
diff --git a/testcases/kernel/syscalls/init_module/init_module01.c b/testcases/kernel/syscalls/init_module/init_module01.c
index 2f47eed32..79e567cd6 100644
--- a/testcases/kernel/syscalls/init_module/init_module01.c
+++ b/testcases/kernel/syscalls/init_module/init_module01.c
@@ -53,4 +53,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
+	/* lockdown requires signed modules */
+	.skip_in_lockdown = 1,
 };
diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
index 3953f4f61..dac99a4da 100644
--- a/testcases/kernel/syscalls/init_module/init_module02.c
+++ b/testcases/kernel/syscalls/init_module/init_module02.c
@@ -22,6 +22,7 @@
 #define MODULE_NAME	"init_module.ko"
 
 static unsigned long size, zero_size;
+static int kernel_lockdown;
 static void *buf, *faulty_buf, *null_buf;
 
 static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
@@ -34,14 +35,15 @@ static struct tcase {
 	const char *param;
 	int cap;
 	int exp_errno;
+	int lockdown_errno;
 } tcases[] = {
-	{"NULL-buffer", &null_buf, &size, "", 0, EFAULT},
-	{"faulty-buffer", &faulty_buf, &size, "", 0, EFAULT},
-	{"null-param", &buf, &size, NULL, 0, EFAULT},
-	{"zero-size", &buf, &zero_size, "", 0, ENOEXEC},
-	{"invalid_param", &buf, &size, "status=invalid", 0, EINVAL},
-	{"no-perm", &buf, &size, "", 1, EPERM},
-	{"module-exists", &buf, &size, "", 0, EEXIST},
+	{"NULL-buffer", &null_buf, &size, "", 0, EFAULT, EFAULT},
+	{"faulty-buffer", &faulty_buf, &size, "", 0, EFAULT, EFAULT},
+	{"null-param", &buf, &size, NULL, 0, EFAULT, EPERM},
+	{"zero-size", &buf, &zero_size, "", 0, ENOEXEC, ENOEXEC},
+	{"invalid_param", &buf, &size, "status=invalid", 0, EINVAL, EPERM},
+	{"no-perm", &buf, &size, "", 1, EPERM, EPERM},
+	{"module-exists", &buf, &size, "", 0, EEXIST, EPERM},
 };
 
 static void setup(void)
@@ -51,6 +53,7 @@ static void setup(void)
 
 	tst_module_exists(MODULE_NAME, NULL);
 
+	kernel_lockdown = tst_lockdown_enabled();
 	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
 	SAFE_FSTAT(fd, &sb);
 	size = sb.st_size;
@@ -68,10 +71,18 @@ static void run(unsigned int n)
 		tst_cap_action(&cap_drop);
 
 	/* Insert module twice */
-	if (tc->exp_errno == EEXIST)
+	if (tc->exp_errno == EEXIST) {
+		if (kernel_lockdown) {
+			tst_res(TCONF, "Kernel is locked down, skipping %s",
+				tc->name);
+			return;
+		}
+
 		tst_module_load(MODULE_NAME, NULL);
+	}
 
-	TST_EXP_FAIL(init_module(*tc->buf, *tc->size, tc->param), tc->exp_errno,
+	TST_EXP_FAIL(init_module(*tc->buf, *tc->size, tc->param),
+		     kernel_lockdown ? tc->lockdown_errno : tc->exp_errno,
 		     "TestName: %s", tc->name);
 
 	if (tc->exp_errno == EEXIST)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
