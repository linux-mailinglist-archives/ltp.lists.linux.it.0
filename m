Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44D1BF4A7
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:58:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4C3E3C283A
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:58:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BB6A73C5E5D
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9B39A1A00CD3
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,334,1583164800"; d="scan'208";a="90855865"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 17:58:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B66EF4BCC88B
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 17:58:34 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 17:58:34 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Apr 2020 17:58:35 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 30 Apr 2020 17:58:24 +0800
Message-ID: <1588240704-14747-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588240704-14747-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200429120609.GA668@yuki.lan>
 <1588240704-14747-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B66EF4BCC88B.AFD21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] syscalls/prctl: Use TST_ASSERT_FILE_INT/STR
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/prctl/prctl06.c     | 20 ++++++--
 testcases/kernel/syscalls/prctl/prctl06.h     | 29 ++----------
 .../kernel/syscalls/prctl/prctl06_execve.c    | 13 ++++--
 testcases/kernel/syscalls/prctl/prctl07.c     | 46 +++++--------------
 4 files changed, 39 insertions(+), 69 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index 0e1274a2a..b64c94e40 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -21,16 +21,18 @@
 
 static uid_t nobody_uid;
 static gid_t nobody_gid;
+static int proc_flag = 1;
+static char proc_sup[20] = "Yes";
 
 static void do_prctl(void)
 {
 	char ipc_env_var[1024];
-	char *const argv[] = {BIN_PATH, "After execve, parent process", NULL};
-	char *const childargv[] = {BIN_PATH, "After execve, child process", NULL};
+	char *const argv[] = {BIN_PATH, "After execve, parent process", proc_sup, NULL};
+	char *const childargv[] = {BIN_PATH, "After execve, child process", proc_sup, NULL};
 	char *const envp[] = {ipc_env_var, NULL };
 	int childpid;
 
-	check_no_new_privs(0, "parent");
+	check_no_new_privs(0, "parent", proc_flag);
 
 	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
 	if (TST_RET == -1) {
@@ -46,14 +48,14 @@ static void do_prctl(void)
 
 	childpid = SAFE_FORK();
 	if (childpid == 0) {
-		check_no_new_privs(1, "After fork, child process");
+		check_no_new_privs(1, "After fork, child process", proc_flag);
 		execve(BIN_PATH, childargv, envp);
 		tst_brk(TFAIL | TTERRNO,
 			"child process failed to execute prctl_execve");
 
 	} else {
 		tst_reap_children();
-		check_no_new_privs(1, "parent process");
+		check_no_new_privs(1, "parent process", proc_flag);
 		execve(BIN_PATH, argv, envp);
 		tst_brk(TFAIL | TTERRNO,
 			"parent process failed to execute prctl_execve");
@@ -74,6 +76,7 @@ static void verify_prctl(void)
 static void setup(void)
 {
 	struct passwd *pw;
+	int field;
 
 	pw = SAFE_GETPWNAM("nobody");
 	nobody_uid = pw->pw_uid;
@@ -96,6 +99,13 @@ static void setup(void)
 
 	tst_brk(TBROK | TTERRNO,
 		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
+
+	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field));
+	if (TST_RET == 1) {
+		tst_res(TCONF, "%s doesn't support NoNewPrivs field", PROC_STATUS);
+		proc_flag = 0;
+		strcpy(proc_sup, "No");
+	}
 }
 
 static const char *const resfile[] = {
diff --git a/testcases/kernel/syscalls/prctl/prctl06.h b/testcases/kernel/syscalls/prctl/prctl06.h
index 7f5be20bb..227ce3006 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.h
+++ b/testcases/kernel/syscalls/prctl/prctl06.h
@@ -24,30 +24,7 @@
 #define BIN_PATH           MNTPOINT"/"TESTBIN
 #define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
 
-void check_proc_field(int val, char *name)
-{
-	static int flag = 1;
-	int field = 0;
-
-	if (!flag)
-		return;
-
-	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field));
-	if (TST_RET == 1) {
-		tst_res(TCONF,
-			"%s doesn't support NoNewPrivs field", PROC_STATUS);
-		flag = 0;
-		return;
-	}
-	if (val == field)
-		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
-			name, PROC_STATUS, val, field);
-	else
-		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
-			name, PROC_STATUS, val, field);
-}
-
-void check_no_new_privs(int val, char *name)
+void check_no_new_privs(int val, char *name, int flag)
 {
 	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
 	if (TST_RET == val)
@@ -58,8 +35,8 @@ void check_no_new_privs(int val, char *name)
 		tst_res(TFAIL,
 			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
 			name, val, TST_RET);
-
-	check_proc_field(val, name);
+	if (flag)
+		TST_ASSERT_FILE_INT(PROC_STATUS, "NoNewPrivs:", val);
 }
 
 #endif
diff --git a/testcases/kernel/syscalls/prctl/prctl06_execve.c b/testcases/kernel/syscalls/prctl/prctl06_execve.c
index d1e60e6c2..cca261ac4 100644
--- a/testcases/kernel/syscalls/prctl/prctl06_execve.c
+++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
@@ -12,14 +12,19 @@
 int main(int argc, char **argv)
 {
 	struct passwd *pw;
+	int proc_flag;
 
 	pw = SAFE_GETPWNAM("nobody");
 
 	tst_reinit();
-	if (argc != 2)
-		tst_brk(TFAIL, "argc is %d, expected 2", argc);
-
-	check_no_new_privs(1, argv[1]);
+	if (argc != 3)
+		tst_brk(TFAIL, "argc is %d, expected 3", argc);
+
+	if (!strcmp(argv[2], "Yes"))
+		proc_flag = 1;
+	else
+		proc_flag = 0;
+	check_no_new_privs(1, argv[1], proc_flag);
 
 	TEST(getegid());
 	if (TST_RET == 0)
diff --git a/testcases/kernel/syscalls/prctl/prctl07.c b/testcases/kernel/syscalls/prctl/prctl07.c
index 79f7710a8..a6f23a098 100644
--- a/testcases/kernel/syscalls/prctl/prctl07.c
+++ b/testcases/kernel/syscalls/prctl/prctl07.c
@@ -34,36 +34,9 @@
 #include "tst_test.h"
 
 #define PROC_STATUS "/proc/self/status"
-
-#ifdef HAVE_SYS_CAPABILITY_H
-static void check_proc_capamb(char *message, int flag)
-{
-	int cap_num;
-	char CapAmb[20];
-
-	SAFE_FILE_LINES_SCANF(PROC_STATUS, "CapAmb:%s", CapAmb);
-	cap_num = strtol(CapAmb, NULL, 16);
-	if (flag == 2) {
-		if (cap_num == 0)
-			tst_res(TPASS,
-				"%s, %s CapAmb has been clear as %d",
-				message, PROC_STATUS, cap_num);
-		else
-			tst_res(TFAIL,
-				"%s, %s CapAmb has been clear expect 0, got %d",
-				message, PROC_STATUS, cap_num);
-		return;
-	}
-	if (cap_num == (1 << CAP_NET_BIND_SERVICE))
-		tst_res(flag ? TPASS : TFAIL,
-			"%s, CapAmb in %s has CAP_NET_BIND_SERVICE",
-			message, PROC_STATUS);
-	else
-		tst_res(flag ? TFAIL : TPASS,
-			"%s, CapAmb in %s doesn't have CAP_NET_BIND_SERVICE",
-			message, PROC_STATUS);
-}
-#endif
+#define ZERO_STRING "0000000000000000"
+/*CAP_NET_BIND_SERVICE stored in the CapAmb field of PROC_STATUS*/
+#define CAP_STRING  "0000000000000400"
 
 static inline void check_cap_raise(unsigned int cap, char *message, int fail_flag)
 {
@@ -127,7 +100,8 @@ static void verify_prctl(void)
 	cap_set_flag(caps, CAP_PERMITTED, numcaps, caplist, CAP_SET);
 	cap_set_proc(caps);
 
-	check_proc_capamb("At the beginning", 0);
+	tst_res(TINFO, "At the beginning");
+	TST_ASSERT_FILE_STR(PROC_STATUS, "CapAmb", ZERO_STRING);
 
 	cap_clear_flag(caps, CAP_INHERITABLE);
 	cap_set_proc(caps);
@@ -148,14 +122,17 @@ static void verify_prctl(void)
 	/*Even this cap has been in ambient set, raise succeeds and return 0*/
 	check_cap_raise(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERIVCE twice", 0);
 
-	check_proc_capamb("After PR_CAP_AMBIENT_RAISE", 1);
+	tst_res(TINFO, "After PR_CAP_AMBIENT_RAISE");
+	TST_ASSERT_FILE_STR(PROC_STATUS, "CapAmb", CAP_STRING);
 
 	check_cap_is_set(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERVICE was", 1);
 	check_cap_is_set(CAP_NET_RAW, "CAP_NET_RAW was", 0);
 	/*move a cap what was not in ambient set, it also return 0*/
 	check_cap_lower(CAP_NET_RAW, "CAP_NET_RAW(it wasn't in ambient set)");
 	check_cap_lower(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERVICE(it was in ambient set)");
-	check_proc_capamb("After PR_CAP_AMBIENT_LORWER", 0);
+
+	tst_res(TINFO, "After PR_CAP_AMBIENT_LORWER");
+	TST_ASSERT_FILE_STR(PROC_STATUS, "CapAmb", ZERO_STRING);
 
 	prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, CAP_NET_BIND_SERVICE, 0, 0, 0);
 	tst_res(TINFO, "raise cap for clear");
@@ -165,7 +142,8 @@ static void verify_prctl(void)
 	else
 		tst_res(TFAIL | TERRNO, "PR_AMBIENT_CLEAR_ALL failed");
 
-	check_proc_capamb("After PR_CAP_AMBIENT_CLEAN_ALL", 2);
+	tst_res(TINFO, "After PR_CAP_AMBIENT_CLEAR_ALL");
+	TST_ASSERT_FILE_STR(PROC_STATUS, "CapAmb", ZERO_STRING);
 
 	cap_free(caps);
 #else
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
