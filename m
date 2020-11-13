Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D911F2B1BB3
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1F033C5FD2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E1F5B3C5FD9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 930441A009A4
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34EFBABD1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:43 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:26 +0100
Message-Id: <20201113131428.13199-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 08/10] syscalls/capget: Make use of TEST_MACROS
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
 testcases/kernel/syscalls/capget/capget01.c | 17 +++++---------
 testcases/kernel/syscalls/capget/capget02.c | 26 +++++++--------------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
index f3767594b..87a866453 100644
--- a/testcases/kernel/syscalls/capget/capget01.c
+++ b/testcases/kernel/syscalls/capget/capget01.c
@@ -20,25 +20,20 @@ static struct tcase {
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
 
 static void verify_capget(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	tst_res(TINFO, "%s", tc->message);
-
 	hdr->version = tc->version;
 	hdr->pid = pid;
-	TEST(tst_syscall(__NR_capget, hdr, data));
-	if (TST_RET == 0)
-		tst_res(TPASS, "capget() returned %ld", TST_RET);
-	else
-		tst_res(TFAIL | TTERRNO, "Test Failed, capget() returned %ld",
-				TST_RET);
+
+	TEST_PASS(tst_syscall(__NR_capget, hdr, data),
+	          "capget() with %s", tc->message);
 
 	if (data[0].effective & 1 << CAP_NET_RAW)
 		tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");
diff --git a/testcases/kernel/syscalls/capget/capget02.c b/testcases/kernel/syscalls/capget/capget02.c
index e770ea0a9..befd8924d 100644
--- a/testcases/kernel/syscalls/capget/capget02.c
+++ b/testcases/kernel/syscalls/capget/capget02.c
@@ -31,11 +31,11 @@ static struct tcase {
 	int flag;
 	char *message;
 } tcases[] = {
-	{0x20080522, 0, EFAULT, 1, "Test bad address header"},
-	{0x20080522, 0, EFAULT, 2, "Test bad address data"},
-	{0, 0, EINVAL, 0, "Test bad version"},
-	{0x20080522, -1, EINVAL, 0, "Test bad pid"},
-	{0x20080522, 1, ESRCH, 0, "Test unused pid"},
+	{0x20080522, 0, EFAULT, 1, "bad address header"},
+	{0x20080522, 0, EFAULT, 2, "bad address data"},
+	{0, 0, EINVAL, 0, "bad version"},
+	{0x20080522, -1, EINVAL, 0, "bad pid"},
+	{0x20080522, 1, ESRCH, 0, "unused pid"},
 };
 
 static void verify_capget(unsigned int n)
@@ -48,25 +48,15 @@ static void verify_capget(unsigned int n)
 	else
 		header->pid = tc->pid;
 
-	tst_res(TINFO, "%s", tc->message);
-
 	/*
 	 * header must not be NULL. data may be NULL only when the user is
 	 * trying to determine the preferred capability version format
 	 * supported by the kernel. So use tst_get_bad_addr() to get
 	 * this error.
 	 */
-	TEST(tst_syscall(__NR_capget, tc->flag - 1 ? header : NULL,
-				tc->flag - 2 ? data : bad_data));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "capget() succeed unexpectedly");
-		return;
-	}
-	if (TST_ERR == tc->exp_err)
-		tst_res(TPASS | TTERRNO, "capget() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "capget() expected %s got ",
-			tst_strerrno(tc->exp_err));
+	TEST_FAIL(tst_syscall(__NR_capget, tc->flag - 1 ? header : NULL,
+	                      tc->flag - 2 ? data : bad_data),
+		  tc->exp_err, "capget() with %s", tc->message);
 
 	/*
 	 * When an unsupported version value is specified, it will
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
