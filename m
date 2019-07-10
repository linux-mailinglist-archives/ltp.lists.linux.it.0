Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217A63F17
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 04:05:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E08A83C1D02
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 04:05:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 733863C14F5
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 04:05:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AE99E600B8B
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 04:05:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,472,1557158400"; d="scan'208";a="71066041"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jul 2019 10:05:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id DAAEB4B40405;
 Wed, 10 Jul 2019 10:05:16 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 10 Jul 2019 10:05:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Sat, 6 Jul 2019 06:48:56 +0800
Message-ID: <1562366936-26456-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190709105303.GA4914@rei.lan>
References: <20190709105303.GA4914@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: DAAEB4B40405.AF9E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=2.1 required=7.0 tests=DATE_IN_PAST_96_XX,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH RESEND] syscalls/prctl06.c: New test for prctl() with
 PR_{SET, GET}_NO_NEW_PRIVS
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/prctl.h                          |   5 +
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/prctl/.gitignore    |   1 +
 testcases/kernel/syscalls/prctl/prctl06.c     | 173 ++++++++++++++++++
 .../kernel/syscalls/prctl/prctl06_execve.c    |  65 +++++++
 5 files changed, 245 insertions(+)
 create mode 100644 testcases/kernel/syscalls/prctl/prctl06.c
 create mode 100644 testcases/kernel/syscalls/prctl/prctl06_execve.c

diff --git a/include/lapi/prctl.h b/include/lapi/prctl.h
index ad0b12bce..54b3da20f 100644
--- a/include/lapi/prctl.h
+++ b/include/lapi/prctl.h
@@ -24,4 +24,9 @@
 # define PR_GET_CHILD_SUBREAPER	37
 #endif
 
+#ifndef PR_SET_NO_NEW_PRIVS
+# define PR_SET_NO_NEW_PRIVS 38
+# define PR_GET_NO_NEW_PRIVS 39
+#endif
+
 #endif /* LAPI_PRCTL_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index 702d6a8c7..a9cad6748 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -860,6 +860,7 @@ prctl02 prctl02
 prctl03 prctl03
 prctl04 prctl04
 prctl05 prctl05
+prctl06 prctl06
 
 pread01 pread01
 pread01_64 pread01_64
diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
index 9ecaf9854..f52f6f665 100644
--- a/testcases/kernel/syscalls/prctl/.gitignore
+++ b/testcases/kernel/syscalls/prctl/.gitignore
@@ -3,3 +3,4 @@
 /prctl03
 /prctl04
 /prctl05
+/prctl06
diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
new file mode 100644
index 000000000..9dd82a241
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * Test PR_GET_NO_NEW_PRIVS and PR_SET_NO_NEW_PRIVS of prctl(2).
+ *
+ * 1)Return the value of the no_new_privs bit for the calling thread.
+ *  A value of 0 indicates the regular execve(2) behavior.  A value of
+ *  1 indicates execve(2) will operate in the privilege-restricting mode.
+ * 2)With no_new_privs set to 1, diables privilege granting operations
+ *  at execve-time. For example, a process will not be able to execute a
+ *  setuid binary to change their uid or gid if this bit is set. The same
+ *  is true for file capabilities.
+ * 3)The setting of this bit is inherited by children created by fork(2).
+ *  We also check NoNewPrivs field in /proc/[pid]/status if it supports.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/prctl.h>
+#include <pwd.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <sys/capability.h>
+#include <lapi/prctl.h>
+#include "tst_test.h"
+
+#define IPC_ENV_VAR        "LTP_IPC_PATH"
+#define MNTPOINT           "mntpoint"
+#define TESTBIN            "prctl06_execve"
+#define TEST_REL_BIN_DIR   MNTPOINT"/"
+#define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
+
+static int flag = 1;
+static char CapEff[20];
+
+static void check_proc_field(int val, char *name)
+{
+	char path[50];
+	pid_t pid;
+	int field = 0;
+
+	pid = getpid();
+	sprintf(path, "/proc/%d/status", pid);
+
+	TEST(FILE_LINES_SCANF(path, "NoNewPrivs:%d", &field));
+	if (TST_RET == 1) {
+		tst_res(TCONF,
+			"/proc/[pid]/status doesn't support NoNewPrivs field");
+		flag = 0;
+		return;
+	}
+	if (val == field)
+		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
+			name, path, val, field);
+	else
+		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
+			name, path, val, field);
+
+	SAFE_FILE_LINES_SCANF(path, "CapEff:%s", CapEff);
+}
+
+static void check_no_new_privs(int val, char *name)
+{
+	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
+	if (TST_RET == val)
+		tst_res(TPASS,
+			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %d",
+			name, val, val);
+	else
+		tst_res(TFAIL,
+			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
+			name, val, TST_RET);
+	if (flag)
+		check_proc_field(val, name);
+}
+
+static void do_prctl(void)
+{
+	char ipc_env_var[1024];
+	char *const argv[] = {"prctl06_execve", "parent process", CapEff, NULL};
+	char *const childargv[] = {"prctl06_execve", "child process", CapEff, NULL};
+	char *const envp[] = {"LTP_TEST_ENV_VAR=test", ipc_env_var, NULL };
+	int childpid;
+	struct passwd *pw;
+	uid_t nobody_uid;
+	gid_t nobody_gid;
+
+	pw = SAFE_GETPWNAM("nobody");
+	nobody_uid = pw->pw_uid;
+	nobody_gid = pw->pw_gid;
+
+	check_no_new_privs(0, "parent");
+	tst_res(TINFO,
+		"parent process CapEff %s when no new privs was 0", CapEff);
+
+	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_NO_NEW_PRIVS) failed");
+		return;
+	}
+	tst_res(TPASS, "prctl(PR_SET_NO_NEW_PRIVS) succeeded");
+
+	SAFE_CHMOD("prctl06_execve", SUID_MODE);
+	SAFE_SETGID(nobody_gid);
+	SAFE_SETUID(nobody_uid);
+
+	sprintf(ipc_env_var, IPC_ENV_VAR "=%s", getenv(IPC_ENV_VAR));
+
+	childpid = SAFE_FORK();
+	if (childpid == 0) {
+		check_no_new_privs(1, "child");
+		execve("prctl06_execve", childargv, envp);
+		tst_brk(TFAIL | TTERRNO,
+			"child process failed to execute prctl_execve");
+
+	} else {
+		tst_reap_children();
+		check_no_new_privs(1, "parent");
+		tst_res(TINFO,
+			"parent process CapEff %s when no new privs was 1", CapEff);
+		execve("prctl06_execve", argv, envp);
+		tst_brk(TFAIL | TTERRNO,
+			"parent process failed to execute prctl_execve");
+	}
+}
+
+static void verify_prctl(void)
+{
+	int pid;
+
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		do_prctl();
+		exit(0);
+	}
+	tst_reap_children();
+}
+
+static void setup(void)
+{
+	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
+	if (TST_RET == 0) {
+		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
+		SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
+		return;
+	}
+
+	if (TST_ERR == EINVAL)
+		tst_brk(TCONF,
+			"kernel doesn't support PR_GET/SET_NO_NEW_PRIVS");
+
+	tst_brk(TBROK | TTERRNO,
+		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
+}
+
+static const char *const resfile[] = {
+	TESTBIN,
+	NULL,
+};
+
+static struct tst_test test = {
+	.resource_files = resfile,
+	.setup = setup,
+	.test_all = verify_prctl,
+	.forks_child = 1,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.child_needs_reinit = 1,
+};
diff --git a/testcases/kernel/syscalls/prctl/prctl06_execve.c b/testcases/kernel/syscalls/prctl/prctl06_execve.c
new file mode 100644
index 000000000..6b256afae
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * dummy program which is used by prctl06 testcase
+ */
+#define TST_NO_DEFAULT_MAIN
+#include <stdlib.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <errno.h>
+#include <pwd.h>
+#include <stdio.h>
+#include <string.h>
+#include "tst_test.h"
+
+int main(int argc, char **argv)
+{
+	struct passwd *pw;
+	uid_t unknown_uid;
+	gid_t unknown_gid;
+	char path[50];
+	char CapEff[20];
+	pid_t pid;
+
+	tst_reinit();
+	if (argc != 3)
+		tst_brk(TFAIL, "argc is %d, expected 3", argc);
+
+	pid = getpid();
+	sprintf(path, "/proc/%d/status", pid);
+	SAFE_FILE_LINES_SCANF(path, "CapEff:%s", CapEff);
+
+	if (strncmp(CapEff, argv[2], sizeof(CapEff)))
+		tst_res(TFAIL,
+			"%s gains root privileges, current CapEff %s, expect %s",
+			argv[1], CapEff, argv[2]);
+	else
+		tst_res(TPASS,
+			"%s doesn't gain root privileges, CapEff %s",
+			argv[1], CapEff);
+
+	pw = SAFE_GETPWNAM("nobody");
+	unknown_uid = pw->pw_uid + 1;
+	unknown_gid = pw->pw_gid + 1;
+
+	TEST(setgid(unknown_gid));
+	if (TST_RET == -1)
+		tst_res(TPASS,
+			"%s setgid(%d) isn't permmit", argv[1], unknown_gid);
+	else
+		tst_res(TFAIL, "%s setgid(%d) succeed expectedly",
+			argv[1], unknown_gid);
+
+	TEST(setuid(unknown_uid));
+	if (TST_RET == -1)
+		tst_res(TPASS,
+			"%s setuid(%d) isn't permmit", argv[1], unknown_uid);
+	else
+		tst_res(TFAIL, " %s setuid(%d) succeed unexpectedly",
+			argv[1], unknown_gid);
+
+	return 0;
+}
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
