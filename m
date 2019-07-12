Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B191665F1
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 06:53:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BFE23C1CF3
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 06:53:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 76C6E3C1C94
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 06:53:25 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 934B62016AE
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 06:53:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71236780"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 12:53:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 829254CDE658;
 Fri, 12 Jul 2019 12:53:18 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 12 Jul 2019 12:53:20 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 12 Jul 2019 12:53:17 +0800
Message-ID: <1562907197-2322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190711113405.GA27889@rei.lan>
References: <20190711113405.GA27889@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 829254CDE658.AE0BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/prctl06: New test for prctl() with
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
 testcases/kernel/syscalls/prctl/.gitignore    |   2 +
 testcases/kernel/syscalls/prctl/prctl06.c     | 165 ++++++++++++++++++
 .../kernel/syscalls/prctl/prctl06_execve.c    |  52 ++++++
 5 files changed, 225 insertions(+)
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
index 42c200423..ef7af41b5 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -865,6 +865,7 @@ prctl02 prctl02
 prctl03 prctl03
 prctl04 prctl04
 prctl05 prctl05
+prctl06 prctl06
 
 pread01 pread01
 pread01_64 pread01_64
diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
index 9ecaf9854..ee994086f 100644
--- a/testcases/kernel/syscalls/prctl/.gitignore
+++ b/testcases/kernel/syscalls/prctl/.gitignore
@@ -3,3 +3,5 @@
 /prctl03
 /prctl04
 /prctl05
+/prctl06
+/prctl06_execve
diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
new file mode 100644
index 000000000..71160b1c1
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -0,0 +1,165 @@
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
+static uid_t nobody_uid;
+static gid_t nobody_gid;
+static int flag = 1;
+
+static void check_proc_field(int val, char *name)
+{
+	int field = 0;
+	char path[50];
+
+	strcpy(path, "/proc/self/status");
+	TEST(FILE_LINES_SCANF(path, "NoNewPrivs:%d", &field));
+	if (TST_RET == 1) {
+		tst_res(TCONF,
+			"%s doesn't support NoNewPrivs field", path);
+		flag = 0;
+		return;
+	}
+	if (val == field)
+		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
+			name, path, val, field);
+	else
+		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
+			name, path, val, field);
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
+	char *const argv[] = {"prctl06_execve", "parent process", NULL};
+	char *const childargv[] = {"prctl06_execve", "child process", NULL};
+	char *const envp[] = {ipc_env_var, NULL };
+	int childpid;
+
+	check_no_new_privs(0, "parent");
+
+	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_NO_NEW_PRIVS) failed");
+		return;
+	}
+	tst_res(TPASS, "prctl(PR_SET_NO_NEW_PRIVS) succeeded");
+
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
+}
+
+static void setup(void)
+{
+	struct passwd *pw;
+
+	pw = SAFE_GETPWNAM("nobody");
+	nobody_uid = pw->pw_uid;
+	nobody_gid = pw->pw_gid;
+
+	SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
+	SAFE_CHMOD("prctl06_execve", SUID_MODE);
+	SAFE_CHOWN("prctl06_execve", 0, 0);
+
+	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
+	if (TST_RET == 0) {
+		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
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
index 000000000..92e218020
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
@@ -0,0 +1,52 @@
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
+	char path[50];
+	struct passwd *pw;
+
+	pw = SAFE_GETPWNAM("nobody");
+
+	tst_reinit();
+	if (argc != 2)
+		tst_brk(TFAIL, "argc is %d, expected 2", argc);
+
+	strcpy(path, "/proc/self/status");
+
+	TEST(getegid());
+	if (TST_RET == 0)
+		tst_res(TFAIL,
+			"%s getegid() returns 0 unexpectedly, it gains root privileges",
+			argv[1]);
+	if (TST_RET == pw->pw_gid)
+		tst_res(TPASS,
+			"%s getegid() returns nobody, it doesn't gain root privileges",
+			argv[1]);
+
+	TEST(geteuid());
+	if (TST_RET == 0)
+		tst_res(TFAIL,
+			"%s geteuid() returns 0 unexpectedly, it gains root privileges",
+			argv[1]);
+	if (TST_RET == pw->pw_uid)
+		tst_res(TPASS,
+			"%s geteuid() returns nobody, it doesn't gain root privileges",
+			argv[1]);
+
+	return 0;
+}
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
