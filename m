Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F292B1BAF
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D7073C5FCC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 90A613C5FC1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 22B371A00987
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0815AC91
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:22 +0100
Message-Id: <20201113131428.13199-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 04/10] syscalls/access: Make use of TEST_MACROS
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
 testcases/kernel/syscalls/access/access01.c | 43 ++++-----------------
 testcases/kernel/syscalls/access/access02.c |  8 ++--
 testcases/kernel/syscalls/access/access03.c | 28 ++------------
 3 files changed, 14 insertions(+), 65 deletions(-)

diff --git a/testcases/kernel/syscalls/access/access01.c b/testcases/kernel/syscalls/access/access01.c
index 1b73058d4..13cd2a51a 100644
--- a/testcases/kernel/syscalls/access/access01.c
+++ b/testcases/kernel/syscalls/access/access01.c
@@ -231,46 +231,17 @@ static struct tcase {
 	{DNAME_WX"/"FNAME_X, W_OK, "W_OK", EACCES, 1}
 };
 
-static void verify_success(struct tcase *tc, const char *user)
-{
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO,
-		        "access(%s, %s) as %s failed unexpectedly",
-		        tc->fname, tc->name, user);
-		return;
-	}
-
-	tst_res(TPASS, "access(%s, %s) as %s", tc->fname, tc->name, user);
-}
-
-static void verify_failure(struct tcase *tc, const char *user)
-{
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "access(%s, %s) as %s succeded unexpectedly",
-		        tc->fname, tc->name, user);
-		return;
-	}
-
-	if (TST_ERR != tc->exp_errno) {
-		tst_res(TFAIL | TTERRNO,
-		        "access(%s, %s) as %s should fail with %s",
-		        tc->fname, tc->name, user,
-		        tst_strerrno(tc->exp_errno));
-		return;
-	}
-
-	tst_res(TPASS | TTERRNO, "access(%s, %s) as %s",
-	        tc->fname, tc->name, user);
-}
-
 static void access_test(struct tcase *tc, const char *user)
 {
 	TEST(access(tc->fname, tc->mode));
 
-	if (tc->exp_errno)
-		verify_failure(tc, user);
-	else
-		verify_success(tc, user);
+	if (tc->exp_errno) {
+		TEST_FAIL(access(tc->fname, tc->mode), tc->exp_errno,
+		          "access(%s, %s) as %s", tc->fname, tc->name, user);
+	} else {
+		TEST_PASS(access(tc->fname, tc->mode),
+		          "access(%s, %s) as %s", tc->fname, tc->name, user);
+	}
 }
 
 static void verify_access(unsigned int n)
diff --git a/testcases/kernel/syscalls/access/access02.c b/testcases/kernel/syscalls/access/access02.c
index db1d350bf..3c4c1bb5e 100644
--- a/testcases/kernel/syscalls/access/access02.c
+++ b/testcases/kernel/syscalls/access/access02.c
@@ -59,13 +59,11 @@ static void access_test(struct tcase *tc, const char *user)
 	struct stat stat_buf;
 	char command[64];
 
-	TEST(access(tc->pathname, tc->mode));
+	TEST_PASS(access(tc->pathname, tc->mode),
+		  "access(%s, %s) as %s", tc->pathname, tc->name, user);
 
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "access(%s, %s) as %s failed",
-			tc->pathname, tc->name, user);
+	if (!TST_PASS)
 		return;
-	}
 
 	switch (tc->mode) {
 	case F_OK:
diff --git a/testcases/kernel/syscalls/access/access03.c b/testcases/kernel/syscalls/access/access03.c
index 612256c17..df20060d5 100644
--- a/testcases/kernel/syscalls/access/access03.c
+++ b/testcases/kernel/syscalls/access/access03.c
@@ -26,34 +26,13 @@ static struct tcase {
 	{(void *)-1, X_OK, "X_OK"},
 };
 
-static void access_test(struct tcase *tc, const char *user)
-{
-	TEST(access(tc->addr, tc->mode));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "access(%p, %s) as %s succeeded unexpectedly",
-			tc->addr, tc->name, user);
-		return;
-	}
-
-	if (TST_ERR != EFAULT) {
-		tst_res(TFAIL | TTERRNO,
-			"access(%p, %s) as %s should fail with EFAULT",
-			tc->addr, tc->name, user);
-		return;
-	}
-
-	tst_res(TPASS | TTERRNO, "access(%p, %s) as %s",
-		tc->addr, tc->name, user);
-}
-
 static void verify_access(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	pid_t pid;
 
-	/* test as root */
-	access_test(tc, "root");
+	TEST_FAIL(access(tc->addr, tc->mode), EFAULT,
+	          "invalid address as root");
 
 	/* test as nobody */
 	pid = SAFE_FORK();
@@ -61,7 +40,8 @@ static void verify_access(unsigned int n)
 		SAFE_WAITPID(pid, NULL, 0);
 	} else {
 		SAFE_SETUID(uid);
-		access_test(tc, "nobody");
+		TEST_FAIL(access(tc->addr, tc->mode), EFAULT,
+		          "invalid address as nobody");
 	}
 }
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
