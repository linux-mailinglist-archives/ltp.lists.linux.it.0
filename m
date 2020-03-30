Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67D197C29
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21C373C317C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0A6D33C312D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8E3846005FB
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EBFCAAEE6;
 Mon, 30 Mar 2020 12:43:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 14:43:38 +0200
Message-Id: <20200330124338.6764-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330124338.6764-1-pvorel@suse.cz>
References: <20200330124338.6764-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/5] Use SAFE_CMD()
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

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt                 |  4 ++--
 include/tst_safe_macros.h                       |  5 ++---
 testcases/kernel/syscalls/add_key/add_key05.c   | 14 ++++----------
 testcases/kernel/syscalls/quotactl/quotactl01.c | 11 ++---------
 testcases/kernel/syscalls/quotactl/quotactl06.c |  9 +--------
 5 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 6f1eee490..75c2e517a 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1283,8 +1283,8 @@ return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
 'stdout_path' and 'stderr_path' determine where to redirect the program
 stdout and stderr I/O streams.
 
-The 'SAFE_CMD()' macro can be used automatic handling non zero exits (exits
-with 'TBROK') or 'ENOENT' (exits with 'TCONF').
+The 'SAFE_CMD()' macro can be used automatic handling non-zero exits (exits
+with 'TBROK') and 'ENOENT' (exits with 'TCONF').
 
 .Example
 [source,c]
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 38eb67d1d..bcd4b9c9e 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -540,9 +540,8 @@ void safe_cmd(const char *file, const int lineno, const char *const argv[],
 {
 	int rval;
 
-	switch ((rval = tst_run_cmd(argv, stdout_path, stderr_path,
-				    TST_RUN_CMD_PASS_EXIT_VAL |
-				    TST_RUN_CMD_CHECK_CMD))) {
+	switch ((rval = tst_cmd(argv, stdout_path, stderr_path, TST_CMD_PASS_RETVAL
+							| TST_CMD_CHECK_CMD))) {
 	case 0:
 		break;
 	default:
diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
index aa2b9cb2f..f64c359bb 100644
--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -36,16 +36,10 @@ static void add_user(void)
 		return;
 
 	const char *const cmd_useradd[] = {"useradd", username, NULL};
-	int rc;
-
-	switch ((rc = tst_cmd(cmd_useradd, NULL, NULL, TST_CMD_PASS_RETVAL))) {
-	case 0:
-		user_added = 1;
-		ltpuser = SAFE_GETPWNAM(username);
-		break;
-	default:
-		tst_brk(TBROK, "useradd failed (%d)", rc);
-	}
+
+	SAFE_CMD(cmd_useradd, NULL, NULL);
+	user_added = 1;
+	ltpuser = SAFE_GETPWNAM(username);
 	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
 }
 
diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index 6f0b60ffc..e1ec22529 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -162,15 +162,8 @@ static struct tcase {
 static void setup(void)
 {
 	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
-	int ret;
-
-	ret = tst_cmd(cmd, NULL, NULL, TST_CMD_PASS_RETVAL);
-	switch (ret) {
-	case 0:
-		break;
-	default:
-		tst_brk(TBROK, "quotacheck exited with %i", ret);
-	}
+
+	SAFE_CMD(cmd, NULL, NULL);
 
 	test_id = geteuid();
 	if (access(USRPATH, F_OK) == -1)
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 773114dfd..0a36c97a4 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -146,16 +146,9 @@ static void verify_quotactl(unsigned int n)
 static void setup(void)
 {
 	const char *const cmd[] = {"quotacheck", "-uF", "vfsv0", MNTPOINT, NULL};
-	int ret;
 	unsigned int i;
 
-	ret = tst_cmd(cmd, NULL, NULL, TST_CMD_PASS_RETVAL);
-	switch (ret) {
-	case 0:
-		break;
-	default:
-		tst_brk(TBROK, "quotacheck exited with %i", ret);
-	}
+	SAFE_CMD(cmd, NULL, NULL);
 
 	if (access(USRPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
