Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8A6A1E0
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:37:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2BAD3C1D0A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:37:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 284103C1808
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:37:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 74A411A01131
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:37:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,496,1557158400"; d="scan'208";a="71541138"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2019 13:37:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 810974CDB941;
 Tue, 16 Jul 2019 13:37:47 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 16 Jul 2019 13:37:51 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 16 Jul 2019 13:37:37 +0800
Message-ID: <1563255457-2336-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190715154945.GA28618@rei.lan>
References: <20190715154945.GA28618@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 810974CDB941.ACACD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4] syscalls/prctl06: New test for prctl() with
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
 testcases/kernel/syscalls/prctl/prctl06.c     | 115 ++++++++++++++++++
 testcases/kernel/syscalls/prctl/prctl06.h     |  64 ++++++++++
 .../kernel/syscalls/prctl/prctl06_execve.c    |  45 +++++++
 6 files changed, 232 insertions(+)
 create mode 100644 testcases/kernel/syscalls/prctl/prctl06.c
 create mode 100644 testcases/kernel/syscalls/prctl/prctl06.h
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
index 000000000..eafbedfef
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -0,0 +1,115 @@
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
+ * 3)The setting of this bit is inherited by children created by fork(2),
+ *  and preserved across execve(2). We also check NoNewPrivs field in
+ *  /proc/self/status if it supports.
+ */
+
+#include "prctl06.h"
+
+static uid_t nobody_uid;
+static gid_t nobody_gid;
+
+static void do_prctl(void)
+{
+	char ipc_env_var[1024];
+	char *const argv[] = {BIN_PATH, "After execve, parent process", NULL};
+	char *const childargv[] = {BIN_PATH, "After execve, child process", NULL};
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
+		check_no_new_privs(1, "After fork, child process");
+		execve(BIN_PATH, childargv, envp);
+		tst_brk(TFAIL | TTERRNO,
+			"child process failed to execute prctl_execve");
+
+	} else {
+		tst_reap_children();
+		check_no_new_privs(1, "parent process");
+		execve(BIN_PATH, argv, envp);
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
+
+	SAFE_CHMOD(BIN_PATH, SUID_MODE);
+	SAFE_CHOWN(BIN_PATH, 0, 0);
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
diff --git a/testcases/kernel/syscalls/prctl/prctl06.h b/testcases/kernel/syscalls/prctl/prctl06.h
new file mode 100644
index 000000000..72f9c4e5a
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06.h
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#ifndef PRCTL06_H
+#define PRCTL06_H
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
+#define PROC_STATUS        "/proc/self/status"
+#define IPC_ENV_VAR        "LTP_IPC_PATH"
+#define MNTPOINT           "mntpoint"
+#define TESTBIN            "prctl06_execve"
+#define TEST_REL_BIN_DIR   MNTPOINT"/"
+#define BIN_PATH           MNTPOINT"/"TESTBIN
+#define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
+
+static int flag = 1;
+
+void check_proc_field(int val, char *name)
+{
+	int field = 0;
+
+	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field));
+	if (TST_RET == 1) {
+		tst_res(TCONF,
+			"%s doesn't support NoNewPrivs field", PROC_STATUS);
+		flag = 0;
+		return;
+	}
+	if (val == field)
+		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
+			name, PROC_STATUS, val, field);
+	else
+		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
+			name, PROC_STATUS, val, field);
+}
+
+void check_no_new_privs(int val, char *name)
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
+#endif
diff --git a/testcases/kernel/syscalls/prctl/prctl06_execve.c b/testcases/kernel/syscalls/prctl/prctl06_execve.c
new file mode 100644
index 000000000..d1e60e6c2
--- /dev/null
+++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * dummy program which is used by prctl06 testcase
+ */
+#define TST_NO_DEFAULT_MAIN
+#include "prctl06.h"
+
+
+int main(int argc, char **argv)
+{
+	struct passwd *pw;
+
+	pw = SAFE_GETPWNAM("nobody");
+
+	tst_reinit();
+	if (argc != 2)
+		tst_brk(TFAIL, "argc is %d, expected 2", argc);
+
+	check_no_new_privs(1, argv[1]);
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
