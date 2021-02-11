Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 755653188EA
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3112C3C6D49
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 51C343C6900
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1B95600C5E
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613041413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vR5x285tUR8sXk66dntXpb0GGZ4yO9gOPbVbbLKo1ro=;
 b=NwQcbwmwAEETMDJUjjLkpvZLbSkNmteqh8MUSUqjJedZwYYMj4Wv5VTjvwR7qV+0Dg80gU
 cUClVoOYwaUo7504t2hKcyYoGHhMXEtj1/3lZYWJX2vCfc8M9Lrt4OiF07/8Ve6r1oSVk/
 j3V+UCwQUUmZ0BcX4W1Sxl7INym7nvQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79B76AE57;
 Thu, 11 Feb 2021 11:03:33 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 11:03:17 +0000
Message-Id: <20210211110317.31942-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211110317.31942-1-rpalethorpe@suse.com>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] close_range: Add test
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 .../kernel/syscalls/close_range/.gitignore    |   1 +
 .../kernel/syscalls/close_range/Makefile      |  10 +
 .../syscalls/close_range/close_range01.c      | 208 ++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 testcases/kernel/syscalls/close_range/.gitignore
 create mode 100644 testcases/kernel/syscalls/close_range/Makefile
 create mode 100644 testcases/kernel/syscalls/close_range/close_range01.c

diff --git a/testcases/kernel/syscalls/close_range/.gitignore b/testcases/kernel/syscalls/close_range/.gitignore
new file mode 100644
index 000000000..291a0379c
--- /dev/null
+++ b/testcases/kernel/syscalls/close_range/.gitignore
@@ -0,0 +1 @@
+close_range01
\ No newline at end of file
diff --git a/testcases/kernel/syscalls/close_range/Makefile b/testcases/kernel/syscalls/close_range/Makefile
new file mode 100644
index 000000000..dc6413b10
--- /dev/null
+++ b/testcases/kernel/syscalls/close_range/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019-2021 Linux Test Project
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CFLAGS			+= -D_GNU_SOURCE
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/close_range/close_range01.c b/testcases/kernel/syscalls/close_range/close_range01.c
new file mode 100644
index 000000000..2e3320d0f
--- /dev/null
+++ b/testcases/kernel/syscalls/close_range/close_range01.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Taken from the kernel self tests, which in turn were based on
+ * a Syzkaller reproducer.
+ *
+ * Self test author and close_range author:
+ * Christian Brauner <christian.brauner@ubuntu.com>
+ *
+ * LTP Author: Richard Palethorpe <rpalethorpe@suse.com>
+ * Copyright (c) 2021 SUSE LLC, other copyrights may apply.
+ *
+ * - First we test if close_range closes some FDs.
+ * - Then we test if it UNSHARES some FDs before closing them.
+ * - Then we test if it sets CLOEXEC (in both cloned process and parent).
+ * - Finally we test a combination of CLOEXEC and UNSHARE.
+ *
+ * The final test is the actual bug reproducer. Note that we call
+ * clone directly to share the file table.
+ */
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "tst_clone.h"
+
+#include "lapi/clone.h"
+#include "lapi/syscalls.h"
+
+#ifndef CLOSE_RANGE_UNSHARE
+#define CLOSE_RANGE_UNSHARE	(1U << 1)
+#endif
+
+#ifndef CLOSE_RANGE_CLOEXEC
+#define CLOSE_RANGE_CLOEXEC	(1U << 2)
+#endif
+
+static int fd[3];
+
+static inline void do_close_range(unsigned int fd, unsigned int max_fd,
+				  unsigned int flags)
+{
+	int ret = tst_syscall(__NR_close_range, fd, max_fd, flags);
+
+	if (!ret)
+		return;
+
+	if (errno == EINVAL) {
+		if (flags & CLOSE_RANGE_UNSHARE)
+			tst_brk(TCONF | TERRNO, "No CLOSE_RANGE_UNSHARE");
+		if (flags & CLOSE_RANGE_CLOEXEC)
+			tst_brk(TCONF | TERRNO, "No CLOSE_RANGE_CLOEXEC");
+	}
+
+	tst_brk(TBROK | TERRNO, "close_range(%d, %d, %d)", fd, max_fd, flags);
+}
+
+static void setup(void)
+{
+	struct rlimit nfd;
+
+	SAFE_GETRLIMIT(RLIMIT_NOFILE, &nfd);
+
+	if (nfd.rlim_max < 1000) {
+		tst_brk(TCONF, "NOFILE limit max too low: %lu < 1000",
+			nfd.rlim_max);
+	}
+
+	nfd.rlim_cur = nfd.rlim_max;
+	SAFE_SETRLIMIT(RLIMIT_NOFILE, &nfd);
+}
+
+static void check_cloexec(int i, int expected)
+{
+	int present = SAFE_FCNTL(fd[i], F_GETFD) & FD_CLOEXEC;
+
+	if (expected && !present)
+		tst_res(TFAIL, "fd[%d] flags do not contain FD_CLOEXEC", i);
+
+	if (!expected && present)
+		tst_res(TFAIL, "fd[%d] flags contain FD_CLOEXEC", i);
+}
+
+static void check_closed(int min)
+{
+	int i;
+
+	for (i = min; i < 3; i++) {
+		if (fcntl(fd[i], F_GETFD) > -1)
+			tst_res(TFAIL, "fd[%d] is still open", i);
+	}
+}
+
+static void child(unsigned int n)
+{
+	switch (n) {
+	case 0:
+		SAFE_DUP2(fd[1], fd[2]);
+		do_close_range(3, ~0U, 0);
+		check_closed(0);
+		break;
+	case 1:
+		SAFE_DUP2(fd[1], fd[2]);
+		do_close_range(3, ~0U, CLOSE_RANGE_UNSHARE);
+		check_closed(0);
+		break;
+	case 2:
+		do_close_range(3, ~0U, CLOSE_RANGE_CLOEXEC);
+		check_cloexec(0, 1);
+		check_cloexec(1, 1);
+
+		SAFE_DUP2(fd[1], fd[2]);
+		check_cloexec(2, 0);
+		break;
+	case 3:
+		do_close_range(3, ~0U,
+			       CLOSE_RANGE_CLOEXEC | CLOSE_RANGE_UNSHARE);
+		check_cloexec(0, 1);
+		check_cloexec(1, 1);
+
+		SAFE_DUP2(fd[1], fd[2]);
+		check_cloexec(2, 0);
+		break;
+	}
+
+	exit(0);
+}
+
+static void run(unsigned int n)
+{
+	const struct tst_clone_args args = {
+		.flags = CLONE_FILES,
+		.exit_signal = SIGCHLD,
+	};
+
+	switch (n) {
+	case 0:
+		tst_res(TINFO, "Plain close range");
+		do_close_range(3, ~0U, 0);
+		break;
+	case 1:
+		tst_res(TINFO, "Set UNSHARE and close range");
+		do_close_range(3, ~0U, CLOSE_RANGE_UNSHARE);
+		break;
+	case 2:
+		tst_res(TINFO, "Set CLOEXEC on range");
+		do_close_range(3, ~0U, CLOSE_RANGE_CLOEXEC);
+		break;
+	case 3:
+		tst_res(TINFO, "Set UNSHARE and CLOEXEC on range");
+		do_close_range(3, ~0U,
+			       CLOSE_RANGE_CLOEXEC | CLOSE_RANGE_UNSHARE);
+		break;
+	}
+
+	fd[0] = SAFE_OPEN("mnt/tmpfile", O_RDWR | O_CREAT, 0644);
+	fd[1] = SAFE_DUP2(fd[0], 1000);
+	fd[2] = 42;
+
+	if (!SAFE_CLONE(&args))
+		child(n);
+
+	tst_reap_children();
+
+	switch (n) {
+	case 0:
+		check_closed(0);
+		break;
+	case 1:
+		check_cloexec(0, 0);
+		check_cloexec(1, 0);
+		check_cloexec(2, 0);
+		break;
+	case 2:
+		check_cloexec(0, 1);
+		check_cloexec(1, 1);
+		check_cloexec(2, 0);
+		break;
+	case 3:
+		check_cloexec(0, 0);
+		check_cloexec(1, 0);
+		check_closed(2);
+		break;
+	}
+
+	do_close_range(3, ~0U, 0);
+	check_closed(0);
+
+	if (tst_taint_check())
+		tst_res(TFAIL, "Kernel tainted");
+	else
+		tst_res(TPASS, "No kernel taints");
+}
+
+static struct tst_test test = {
+	.tcnt = 4,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+	.mount_device = 1,
+	.mntpoint = "mnt",
+	.all_filesystems = 1,
+	.test = run,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.setup = setup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "fec8a6a691033f2538cd46848f17f337f0739923"},
+		{},
+	},
+};
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
