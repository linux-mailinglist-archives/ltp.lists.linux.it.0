Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014F38054E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:33:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3430C3C330B
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:33:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 114743C2306
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:33:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 52556201116
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:33:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CB20AECE
 for <ltp@lists.linux.it>; Fri, 14 May 2021 08:33:26 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 14 May 2021 10:07:08 +0200
Message-Id: <20210514080708.20036-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/unshare02: Fix failures on Debian
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

The order of checks in kernel is not defined and on Debian we end up
getting eperm even before the flags are checked which fails the invalid
flags testcase.

The fix is simple, we change the test to setuid() only for the EPERM
test.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/unshare/unshare02.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/unshare/unshare02.c b/testcases/kernel/syscalls/unshare/unshare02.c
index e9bd9ed2c..9b222fae2 100644
--- a/testcases/kernel/syscalls/unshare/unshare02.c
+++ b/testcases/kernel/syscalls/unshare/unshare02.c
@@ -30,6 +30,8 @@
 
 #ifdef HAVE_UNSHARE
 
+static uid_t nobody_uid;
+
 static struct test_case_t {
 	int mode;
 	int expected_error;
@@ -42,20 +44,19 @@ static struct test_case_t {
 static void run(unsigned int i)
 {
 	pid_t pid = SAFE_FORK();
-	if (pid == 0)
+	if (pid == 0) {
+		if (tc[i].expected_error == EPERM)
+			SAFE_SETUID(nobody_uid);
+
 		TST_EXP_FAIL(unshare(tc[i].mode), tc[i].expected_error,
 			     "unshare(%s)", tc[i].desc);
+	}
 }
 
 static void setup(void)
 {
 	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
-	SAFE_SETEUID(ltpuser->pw_uid);
-}
-
-static void cleanup(void)
-{
-	SAFE_SETEUID(0);
+	nobody_uid = ltpuser->pw_uid;
 }
 
 static struct tst_test test = {
@@ -63,7 +64,6 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_tmpdir = 1,
 	.needs_root = 1,
-	.cleanup = cleanup,
 	.setup = setup,
 	.test = run,
 };
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
