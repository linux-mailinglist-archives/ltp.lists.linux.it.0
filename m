Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F62B1BB4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:15:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F9AF3C657A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:15:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 648AF3C5FF7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EACD0200A16
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BBF4AF52
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:43 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:27 +0100
Message-Id: <20201113131428.13199-10-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 09/10] syscalls/capset: Make use of TEST_MACROS
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
 testcases/kernel/syscalls/capset/capset01.c | 14 ++++-------
 testcases/kernel/syscalls/capset/capset02.c | 28 +++++++--------------
 testcases/kernel/syscalls/capset/capset03.c | 10 +-------
 testcases/kernel/syscalls/capset/capset04.c | 13 +++-------
 4 files changed, 18 insertions(+), 47 deletions(-)

diff --git a/testcases/kernel/syscalls/capset/capset01.c b/testcases/kernel/syscalls/capset/capset01.c
index f8540539d..da0fc8113 100644
--- a/testcases/kernel/syscalls/capset/capset01.c
+++ b/testcases/kernel/syscalls/capset/capset01.c
@@ -20,16 +20,15 @@ static struct tcase {
 	int version;
 	char *message;
 } tcases[] = {
-	{0x19980330, "Test on LINUX_CAPABILITY_VERSION_1"},
-	{0x20071026, "Test on LINUX_CAPABILITY_VERSION_2"},
-	{0x20080522, "Test on LINUX_CAPABILITY_VERSION_3"},
+	{0x19980330, "LINUX_CAPABILITY_VERSION_1"},
+	{0x20071026, "LINUX_CAPABILITY_VERSION_2"},
+	{0x20080522, "LINUX_CAPABILITY_VERSION_3"},
 };
 
 static void verify_capset(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	tst_res(TINFO, "%s", tc->message);
 	header->version = tc->version;
 	header->pid = pid;
 
@@ -38,11 +37,8 @@ static void verify_capset(unsigned int n)
 		return;
 	}
 
-	TEST(tst_syscall(__NR_capset, header, data));
-	if (TST_RET == 0)
-		tst_res(TPASS, "capset() returned %ld", TST_RET);
-	else
-		tst_res(TFAIL | TTERRNO, "Test Failed, capset() returned %ld", TST_RET);
+	TEST_PASS(tst_syscall(__NR_capset, header, data),
+	          "capset() with %s", tc->message);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/capset/capset02.c b/testcases/kernel/syscalls/capset/capset02.c
index a6c4f29a0..d45b52297 100644
--- a/testcases/kernel/syscalls/capset/capset02.c
+++ b/testcases/kernel/syscalls/capset/capset02.c
@@ -43,12 +43,12 @@ static struct tcase {
 	int flag;
 	char *message;
 } tcases[] = {
-	{0x20080522, 0, CAP1, CAP1, CAP1, EFAULT, 1, "Test bad address header"},
-	{0x20080522, 0, CAP1, CAP1, CAP1, EFAULT, 2, "Test bad address data"},
-	{0, 0, CAP1, CAP1, CAP1, EINVAL, 0, "Test bad version"},
-	{0x20080522, 0, CAP2, CAP1, CAP1, EPERM, 0, "Test bad value data(when pE is not in pP)"},
-	{0x20080522, 0, CAP1, CAP2, CAP1, EPERM, 0, "Test bad value data(when pP is not in old pP)"},
-	{0x20080522, 0, CAP1, CAP1, CAP2, EPERM, 0, "Test bad value data(when pI is not in bounding set or old pI)"},
+	{0x20080522, 0, CAP1, CAP1, CAP1, EFAULT, 1, "bad address header"},
+	{0x20080522, 0, CAP1, CAP1, CAP1, EFAULT, 2, "bad address data"},
+	{0, 0, CAP1, CAP1, CAP1, EINVAL, 0, "bad version"},
+	{0x20080522, 0, CAP2, CAP1, CAP1, EPERM, 0, "bad value data(when pE is not in pP)"},
+	{0x20080522, 0, CAP1, CAP2, CAP1, EPERM, 0, "bad value data(when pP is not in old pP)"},
+	{0x20080522, 0, CAP1, CAP1, CAP2, EPERM, 0, "bad value data(when pI is not in bounding set or old pI)"},
 };
 
 static void verify_capset(unsigned int n)
@@ -62,19 +62,9 @@ static void verify_capset(unsigned int n)
 	data->permitted = tc->permitted;
 	data->inheritable = tc->inheritable;
 
-	tst_res(TINFO, "%s", tc->message);
-
-	TEST(tst_syscall(__NR_capset, tc->flag - 1 ? header : bad_addr,
-				tc->flag - 2 ? data : bad_addr));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "capset() succeed unexpectedly");
-		return;
-	}
-	if (TST_ERR == tc->exp_err)
-		tst_res(TPASS | TTERRNO, "capset() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "capset() expected %s got ",
-			tst_strerrno(tc->exp_err));
+	TEST_FAIL(tst_syscall(__NR_capset, tc->flag - 1 ? header : bad_addr,
+	                      tc->flag - 2 ? data : bad_addr),
+	          tc->exp_err, "capset() with %s", tc->message);
 	/*
 	 * When an unsupported version value is specified, it will
 	 * return the kernel preferred value of _LINUX_CAPABILITY_VERSION_?.
diff --git a/testcases/kernel/syscalls/capset/capset03.c b/testcases/kernel/syscalls/capset/capset03.c
index d5754753d..b8eb826d0 100644
--- a/testcases/kernel/syscalls/capset/capset03.c
+++ b/testcases/kernel/syscalls/capset/capset03.c
@@ -23,15 +23,7 @@ static void verify_capset(void)
 {
 	tst_res(TINFO, "Test bad value data(when pI is not old pP or old pI without CAP_SETPCAP)");
 	data[0].inheritable = CAP2;
-	TEST(tst_syscall(__NR_capset, header, data));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "capset succeed unexpectedly");
-		return;
-	}
-	if (TST_ERR == EPERM)
-		tst_res(TPASS | TTERRNO, "capset() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "capset expected EPERM, bug got");
+	TEST_FAIL(tst_syscall(__NR_capset, header, data), EPERM, "capset()");
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/capset/capset04.c b/testcases/kernel/syscalls/capset/capset04.c
index 81ad7a35f..b5aeff19f 100644
--- a/testcases/kernel/syscalls/capset/capset04.c
+++ b/testcases/kernel/syscalls/capset/capset04.c
@@ -24,18 +24,11 @@ static void verify_capset(void)
 	if (!child_pid)
 		pause();
 
-	header->pid = child_pid;
+	tst_res(TINFO, "Test capset() for a different process");
 
-	TEST(tst_syscall(__NR_capset, header, data));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "capset succeed unexpectedly");
-		return;
-	}
+	header->pid = child_pid;
 
-	if (TST_ERR == EPERM)
-		tst_res(TPASS, "capset can't modify other process capabilities");
-	else
-		tst_res(TFAIL | TTERRNO, "capset expected EPERM, bug got");
+	TEST_FAIL(tst_syscall(__NR_capset, header, data), EPERM, "capset()");
 
 	SAFE_KILL(child_pid, SIGTERM);
 	SAFE_WAIT(NULL);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
