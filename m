Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C377A340696
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DC8E3C90B2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 65A933C605A
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:48 +0100 (CET)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D757601C44
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:47 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id j7so5488861wrd.1
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGx7rnQJFt4cGaqohdhS+HZdpDooxTlO9o6DNfMcCi0=;
 b=jXxzOVdjUGEsUKTmDsEDhXQhGwMMFhJYoXgrw4ieneKN8uuEdnR/IPbjl1DQhwL40j
 1cisCWgSx+83kkTmOzKdTcrNgfVDjFJ2VV3uyRfqUtRpwR+lp7p/6qmECzLKdRWbTzD8
 YGbfsXZzEMYARDgO6jmDDMBXfZHr7Zhx5e6K1noPCrPSKQqRnscl8A0iL2OEnNr3N8Ps
 RFcoGbhaToXqN4xdYpQEkCGyNEK75skiGKq4KE/gR2TSVUB/Rl6nc60IvNxb2kqmZmQW
 hKwhTjqUiFR+98SoPtibmh1nd+3mRo5xOQ0OjnOIg9z6ogjK+I9fl0k+WHIhVsURsqIm
 3dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGx7rnQJFt4cGaqohdhS+HZdpDooxTlO9o6DNfMcCi0=;
 b=DWuLylVPMJEBQuf6cEwDoFBcv+yzVzaqfaKqV1S2HLEM8kEDV3mKlV/4WCezxVTql1
 XV0gKqCckEqE1/J0U7v8qWRL98qk0bVNvRes2d7XIFZwINVVFkMJp20kkXdC3Ht89f5z
 Yx9mg7UL2585Gy6qGGYeDJGzDE1+LSIZnL43FlgjKxZhd/qeYhQT7iD05fOzKlmoG168
 zRmxwazYFwtkR7QpcxHLyDWts519y3YfKmXHlRBZ83UWeg6wqtgCTWN+6zkrzRHzkaLg
 BhOW4NQYyyuQdWt3/1F3ITZIN9X+q0+lwVVJBNv2RIsFPlm5mPcVwcy+MctTrkS0U58P
 6+3Q==
X-Gm-Message-State: AOAM5334cgl/Vmv9Ligt1XYu7GI+jJLNOM6rrQNAqTCF4LJbQv1liU6b
 d6t0TFjMh6Zd8Hf3rX8FxcIbsb9DgJk=
X-Google-Smtp-Source: ABdhPJwktAaFgxogV/f1bjVye/b4x/9dZLrT3+9XsDqZUEBASPsutpZVrZyOEfpLIs+LiDEykE9Nkw==
X-Received: by 2002:adf:e791:: with SMTP id n17mr9540144wrm.322.1616073107140; 
 Thu, 18 Mar 2021 06:11:47 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:46 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:32 +0200
Message-Id: <20210318131134.3562203-7-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 6/8] syscalls/fanotify: New test for fanotify user
 limits
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Check that fanotify groups and marks limit are enforced correctly.
If user ns is supported, verify that global limit and per user ns
limits are both enforced.

In older kernels, the groups limit per user is hardcoded 128.
In recent kernels, the global limits can be configured via
/proc/sys/fs/fanotify/max_user_* and can be further restricted
per user ns via /proc/sys/user/max_fanotify_*.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |   3 +
 .../kernel/syscalls/fanotify/fanotify17.c     | 266 ++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify17.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9d4c57bb2..41f1279a2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -590,6 +590,7 @@ fanotify13 fanotify13
 fanotify14 fanotify14
 fanotify15 fanotify15
 fanotify16 fanotify16
+fanotify17 fanotify17
 
 ioperm01 ioperm01
 ioperm02 ioperm02
diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
index e7cf224fd..20fcb3718 100644
--- a/testcases/kernel/syscalls/fanotify/.gitignore
+++ b/testcases/kernel/syscalls/fanotify/.gitignore
@@ -14,4 +14,5 @@
 /fanotify14
 /fanotify15
 /fanotify16
+/fanotify17
 /fanotify_child
diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 039379961..a2be18338 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -125,6 +125,9 @@ static inline int safe_fanotify_mark(const char *file, const int lineno,
 #define FAN_OPEN_EXEC_PERM	0x00040000
 #endif
 
+/* Flags required for unprivileged user group */
+#define FANOTIFY_REQUIRED_USER_INIT_FLAGS    (FAN_REPORT_FID)
+
 /*
  * FAN_ALL_PERM_EVENTS has been deprecated, so any new permission events
  * are not to be added to it. To cover the instance where a new permission
diff --git a/testcases/kernel/syscalls/fanotify/fanotify17.c b/testcases/kernel/syscalls/fanotify/fanotify17.c
new file mode 100644
index 000000000..ee242a441
--- /dev/null
+++ b/testcases/kernel/syscalls/fanotify/fanotify17.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2018 FUJITSU LIMITED. All rights reserved.
+ * Copyright (c) 2021 CTERA Networks.  All Rights Reserved.
+ *
+ * User ns support by: Xiao Yang <yangx.jy@cn.fujitsu.com>
+ * Forked from getxattr05.c by Amir Goldstein <amir73il@gmail.com>
+ */
+
+/*
+ * DESCRIPTION
+ *     Check that fanotify groups and marks limits are enforced correctly.
+ *     If user ns is supported, verify that global limit and per user ns
+ *     limits are both enforced.
+ *     Otherwise, we only check that global groups limit is enforced.
+ */
+#define _GNU_SOURCE
+#include "config.h"
+#include <errno.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sched.h>
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "lapi/namespaces_constants.h"
+
+#ifdef HAVE_SYS_FANOTIFY_H
+#include "fanotify.h"
+
+#define MOUNT_PATH	"fs_mnt"
+#define TEST_FILE	MOUNT_PATH "/testfile"
+#define SELF_USERNS	"/proc/self/ns/user"
+#define MAX_USERNS	"/proc/sys/user/max_user_namespaces"
+#define UID_MAP		"/proc/self/uid_map"
+
+#define GLOBAL_MAX_GROUPS "/proc/sys/fs/fanotify/max_user_groups"
+#define GLOBAL_MAX_MARKS  "/proc/sys/fs/fanotify/max_user_marks"
+#define USERNS_MAX_GROUPS "/proc/sys/user/max_fanotify_groups"
+#define USERNS_MAX_MARKS  "/proc/sys/user/max_fanotify_marks"
+
+/*
+ * In older kernels those limits were fixed in kernel.
+ * The fanotify_init() man page documents the max groups limit is 128, but the
+ * implementation actually allows one extra group.
+ */
+#define DEFAULT_MAX_GROUPS 129
+#define DEFAULT_MAX_MARKS  8192
+
+static int orig_max_userns = -1;
+static int user_ns_supported = 1;
+static int max_groups = DEFAULT_MAX_GROUPS;
+static int max_marks = DEFAULT_MAX_MARKS;
+
+static struct tcase {
+	const char *tname;
+	unsigned int init_flags;
+	/* 0: without userns, 1: with userns */
+	int set_userns;
+	/* 0: don't map root UID in userns, 1: map root UID in userns */
+	int map_root;
+	/* 0: unlimited groups in userns */
+	int max_user_groups;
+	/* 0: unlimited marks in userns */
+	int max_user_marks;
+} tcases[] = {
+	{
+		"Global groups limit in init user ns",
+		FAN_CLASS_NOTIF,
+		0, 0, 0, 0,
+	},
+	{
+		"Global groups limit in privileged user ns",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS,
+		1, 1, 0, 0,
+	},
+	{
+		"Local groups limit in unprivileged user ns",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS,
+		1, 0, 10, 0,
+	},
+	{
+		"Local marks limit in unprivileged user ns",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS,
+		1, 0, 0, 10,
+	},
+};
+
+/* Verify that groups and marks cannot be created beyond limit */
+static void verify_user_limits(unsigned int init_flags, int groups, int marks)
+{
+	int i, fd = 0, ret = 0;
+
+	for (i = 0; i <= groups; i++) {
+		fd = fanotify_init(init_flags, O_RDONLY);
+		/*
+		 * Don't bother closing fd's, the child process will exit
+		 * and all fd's will be closed.
+		 */
+		if (fd < 0)
+			break;
+
+		ret = fanotify_mark(fd, FAN_MARK_ADD, FAN_OPEN, AT_FDCWD,
+				    TEST_FILE);
+		if (ret < 0)
+			break;
+
+	}
+	if (fd > 0 && i > groups) {
+		tst_res(TFAIL,
+			"Created %d groups and marks - "
+			"groups limit (%d) exceeded", i, groups);
+	} else if (!ret && i > marks) {
+		tst_res(TFAIL,
+			"Created %d groups and marks - "
+			"marks limit (%d) exceeded", i, marks);
+	} else if (ret < 0 && errno == ENOSPC && marks < groups) {
+		/*
+		 * ENOSPC is to be returned to the calling process when
+		 * fanotify marks limit is reached.
+		 */
+		tst_res(TPASS,
+			"Created %d marks - "
+			"below marks limit (%d)", i, marks);
+	} else if (fd < 0 && errno == EMFILE) {
+		/*
+		 * EMFILE is to be returned to the calling process when
+		 * fanotify groups limit is reached.
+		 */
+		tst_res(TPASS,
+			"Created %d groups - "
+			"below groups limit (%d)", i, groups);
+	} else if (errno == EPERM) {
+		tst_res(TCONF,
+			"unprivileged fanotify not supported by kernel?");
+	} else if (fd < 0) {
+		tst_brk(TBROK | TERRNO,
+			"fd=%d, fanotify_init(%x, O_RDONLY) failed",
+			fd, init_flags);
+	} else if (ret < 0) {
+		tst_brk(TBROK | TERRNO,
+			"ret=%d, fanotify_mark(%d, FAN_MARK_ADD, FAN_OPEN, "
+			"AT_FDCWD, '" TEST_FILE "') failed", ret, fd);
+	}
+}
+
+static void do_unshare(int map_root)
+{
+	int res;
+
+	/* unshare() should support CLONE_NEWUSER flag since Linux 3.8 */
+	res = unshare(CLONE_NEWUSER);
+	if (res == -1)
+		tst_brk(TFAIL | TERRNO, "unshare(CLONE_NEWUSER) failed");
+
+	if (map_root) {
+		/*
+		 * uid_map file should exist since Linux 3.8 because
+		 * it is available on Linux 3.5
+		 */
+		if (access(UID_MAP, F_OK))
+			tst_brk(TBROK, "file %s didn't exist", UID_MAP);
+
+		SAFE_FILE_PRINTF(UID_MAP, "%d %d %d", 0, 0, 1);
+	}
+}
+
+static void test_fanotify(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int groups = max_groups;
+	int marks = max_marks;
+	pid_t pid;
+
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	if (tc->set_userns && !user_ns_supported) {
+		tst_res(TCONF, "fanotify inside user namespace is not supported");
+		return;
+	}
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		if (tc->set_userns) {
+			do_unshare(tc->map_root);
+			/* Not changing global limits, only per userns limits */
+			if (tc->max_user_groups && tc->max_user_groups < groups) {
+				/* Further limit user ns groups */
+				marks = groups = tc->max_user_groups;
+				SAFE_FILE_PRINTF(USERNS_MAX_GROUPS, "%d", groups);
+			}
+			if (tc->max_user_marks && tc->max_user_marks < marks) {
+				/* Further limit user ns marks */
+				marks = tc->max_user_marks;
+				SAFE_FILE_PRINTF(USERNS_MAX_MARKS, "%d", marks);
+			}
+		}
+		verify_user_limits(tc->init_flags, groups, marks);
+		exit(0);
+	}
+
+	tst_reap_children();
+}
+
+static void setup_rlimit(unsigned int max_files)
+{
+	struct rlimit rlim;
+
+	SAFE_GETRLIMIT(RLIMIT_NOFILE, &rlim);
+	rlim.rlim_cur = max_files;
+	SAFE_SETRLIMIT(RLIMIT_NOFILE, &rlim);
+}
+
+static void setup(void)
+{
+	SAFE_TOUCH(TEST_FILE, 0666, NULL);
+	/* Check for kernel fanotify support */
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, TEST_FILE);
+
+	/*
+	 * The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call unshare().
+	 */
+	if (access(SELF_USERNS, F_OK) != 0) {
+		user_ns_supported = 0;
+	} else if (!access(MAX_USERNS, F_OK)) {
+		SAFE_FILE_SCANF(MAX_USERNS, "%d", &orig_max_userns);
+		SAFE_FILE_PRINTF(MAX_USERNS, "%d", 10);
+	}
+
+	/*
+	 * In older kernels those limits were fixed in kernel and fanotify is
+	 * not permitted inside user ns.
+	 */
+	if (access(GLOBAL_MAX_GROUPS, F_OK) && errno == ENOENT) {
+		user_ns_supported = 0;
+	} else {
+		SAFE_FILE_SCANF(GLOBAL_MAX_GROUPS, "%d", &max_groups);
+		SAFE_FILE_SCANF(GLOBAL_MAX_MARKS, "%d", &max_marks);
+	}
+	tst_res(TINFO, "max_fanotify_groups=%d max_fanotify_marks=%d",
+		max_groups, max_marks);
+
+	/* Make sure we are not limited by nr of open files */
+	setup_rlimit(max_groups * 2);
+}
+
+static void cleanup(void)
+{
+	if (orig_max_userns != -1)
+		SAFE_FILE_PRINTF(MAX_USERNS, "%d", orig_max_userns);
+}
+
+static struct tst_test test = {
+	.test = test_fanotify,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.mount_device = 1,
+	.mntpoint = MOUNT_PATH,
+};
+#else
+	TST_TEST_TCONF("system doesn't have required fanotify support");
+#endif
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
