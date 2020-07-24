Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4422C58C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:50:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85FEA3C4CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:50:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 413C73C05A1
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:50:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C319E1001DAE
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:50:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F7D5AD20
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 12:51:01 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Jul 2020 14:50:52 +0200
Message-Id: <20200724125052.20973-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200724125052.20973-1-mdoucha@suse.cz>
References: <20200724125052.20973-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Add chdir() test for unprivileged user
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

chdir01 tests chdir() return values with root permissions. chdir02 does
the same test scenario with EUID set to nobody.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/chdir/.gitignore |   1 +
 testcases/kernel/syscalls/chdir/chdir02.c  | 134 +++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 testcases/kernel/syscalls/chdir/chdir02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 70b3277d3..deadc21bc 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -54,6 +54,7 @@ capset04 capset04
 cacheflush01 cacheflush01
 
 chdir01 chdir01
+chdir02 chdir02
 chdir01A symlink01 -T chdir01
 chdir04 chdir04
 
diff --git a/testcases/kernel/syscalls/chdir/.gitignore b/testcases/kernel/syscalls/chdir/.gitignore
index 1b15eb6b9..3475c5e54 100644
--- a/testcases/kernel/syscalls/chdir/.gitignore
+++ b/testcases/kernel/syscalls/chdir/.gitignore
@@ -1,2 +1,3 @@
 /chdir01
+/chdir02
 /chdir04
diff --git a/testcases/kernel/syscalls/chdir/chdir02.c b/testcases/kernel/syscalls/chdir/chdir02.c
new file mode 100644
index 000000000..e62362808
--- /dev/null
+++ b/testcases/kernel/syscalls/chdir/chdir02.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines  Corp., 2001
+ *     07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * Check that the chdir() syscall returns correct value and error code
+ * in various situations when called by regular user
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <pwd.h>
+
+#include "tst_test.h"
+
+#define MNTPOINT "mntpoint"
+
+#define FILE_NAME "testfile"
+#define DIR_NAME "subdir"
+#define BLOCKED_NAME "keep_out"
+#define LINK_NAME1 "symloop"
+#define LINK_NAME2 "symloop2"
+
+static char *workdir;
+static unsigned int skip_symlinks, skip_blocked;
+static struct passwd *ltpuser;
+
+static struct test_case {
+	const char *name;
+	int retval, experr;
+} testcase_list[] = {
+	{FILE_NAME, -1, ENOTDIR},
+	{BLOCKED_NAME, -1, EACCES},
+	{DIR_NAME, 0, 0},
+	{".", 0, 0},
+	{"..", 0, 0},
+	{"/", 0, 0},
+	{"missing", -1, ENOENT},
+	{LINK_NAME1, -1, ELOOP},
+};
+
+static void setup(void)
+{
+	char *cwd;
+	int fd;
+	struct stat statbuf;
+
+	cwd = SAFE_GETCWD(NULL, 0);
+	workdir = SAFE_MALLOC(strlen(cwd) + strlen(MNTPOINT) + 2);
+	sprintf(workdir, "%s/%s", cwd, MNTPOINT);
+	free(cwd);
+	SAFE_CHDIR(workdir);
+	SAFE_MKDIR(DIR_NAME, 0755);
+	SAFE_MKDIR(BLOCKED_NAME, 0644);
+
+	/* FAT and NTFS override file and directory permissions */
+	SAFE_STAT(BLOCKED_NAME, &statbuf);
+	skip_blocked = statbuf.st_mode & 0111;
+	skip_symlinks = 0;
+	TEST(symlink(LINK_NAME1, LINK_NAME2));
+
+	if (!TST_RET)
+		SAFE_SYMLINK(LINK_NAME2, LINK_NAME1);
+	else if (TST_RET == -1 && TST_ERR == EPERM)
+		skip_symlinks = 1; /* man symlink(2): EPERM == unsupported */
+	else
+		tst_brk(TBROK | TTERRNO, "Cannot create symlinks");
+
+	fd = SAFE_CREAT(FILE_NAME, 0644);
+	SAFE_CLOSE(fd);
+
+	if (!ltpuser)
+		ltpuser = SAFE_GETPWNAM("nobody");
+
+	SAFE_SETEUID(ltpuser->pw_uid);
+}
+
+static void run(unsigned int n)
+{
+	struct test_case *tc = testcase_list + n;
+
+	if (tc->experr == EACCES && skip_blocked) {
+		tst_res(TCONF, "Skipping permission test, FS mangles dir mode");
+		return;
+	}
+
+	if (tc->experr == ELOOP && skip_symlinks) {
+		tst_res(TCONF, "Skipping symlink loop test, not supported");
+		return;
+	}
+
+	/* Reset current directory to mountpoint */
+	SAFE_CHDIR(workdir);
+
+	TEST(chdir(tc->name));
+
+	if (TST_RET != tc->retval) {
+		tst_res(TFAIL | TTERRNO,
+			"chdir(\"%s\") returned unexpected value %ld",
+			tc->name, TST_RET);
+		return;
+	}
+
+	if (TST_RET != 0 && TST_ERR != tc->experr) {
+		tst_res(TFAIL | TTERRNO,
+			"chdir(\"%s\") returned unexpected error", tc->name);
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "chdir(\"%s\") returned correct value",
+		tc->name);
+}
+
+static void cleanup(void)
+{
+	free(workdir);
+	SAFE_SETEUID(0);
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.test = run,
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.setup = setup,
+	.cleanup = cleanup
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
