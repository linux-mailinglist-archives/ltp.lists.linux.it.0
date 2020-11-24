Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE72C1DAE
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:44:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D7023C2E41
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:44:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EBCA33C4E52
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:44:40 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 627011A004AB
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:44:40 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id l17so6015204pgk.1
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 21:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPkvz5f9rQ4+lRKfqx7bo26gJ1XZBwREU+kmxjaI/Uc=;
 b=UppFC0Ri4wdsJQgSGVixAETcIuycGnauJDfsAph1gwqZsFUpw4LnLpRGxIC3MPS2ei
 YJcZ7FiM4eEYgf+tSrJ9Xu03MFuH3Sy3fUYXWoidA+/MJS63kdkHhVYUsGKkgudukAt3
 i5eygbblHW+JEdRqq2ho1JcsWm+S/BNJ+a6J7GwQz6LzTOJTrtGmWnFDHVpexhnWqGKM
 +mtDbUMMcbVznS0hGb6V+FSuotc+pLHvod6T6NjlX5QHZ1Dzkqlk7sjt55nNEStVJ9sL
 efX6E8z5u4c6qVsbDXul9uDFowOCe2vFNIWR/9mnzNi0CzOAGyBqSFNr/to6De6whD9t
 Qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPkvz5f9rQ4+lRKfqx7bo26gJ1XZBwREU+kmxjaI/Uc=;
 b=g2MD1Xf9l7ZwFevOVWxEMonAvKRxf6proIXnkys231m8XJPnTL0jXtp4Xf/9t4G0GU
 ghNb2E9zPa1F8eXWx1lBCVEtO324eN7bYX8aCZXXqj7RCL6OehiPaw+H7KSa3yap0X23
 CxFdAAyJkNJa0UbwfIqYCTv5HZjZEPcCbcVl5OPsG0c5YrZkyBlpxcbDiK7Gvu5174aI
 NIRUpKNNwnZyCROm8O57pxBuLthxdC87iJptmsGtztmPdH5veCw3jGohvSC1YZJgn51g
 N4oJ/oteV/UwqtlVZU8aRUD9QWgjpdMYHMe/cBA+9xJJeDQT8ZnCoV3kavD3eZL1fTQ7
 /uBw==
X-Gm-Message-State: AOAM531kk2UntZor5Or5OY5q+Aix9E+Q1Zw6xIKiBTZKw/9twCoWsS/S
 iquhi8VIaPgFuRjiF1s/29DUnrSiUKeRyw==
X-Google-Smtp-Source: ABdhPJzLW4wbWZk3STz4q8x7RUIf6Xx7pikuXTqK7bmQednLexmAQ+QDsQ1REBafzV4hscxDYaCMxQ==
X-Received: by 2002:a17:90a:578a:: with SMTP id
 g10mr172794pji.197.1606196678499; 
 Mon, 23 Nov 2020 21:44:38 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id t6sm13409748pfb.45.2020.11.23.21.44.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 21:44:37 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 24 Nov 2020 11:14:29 +0530
Message-Id: <d4c771f2a43034af28a8b05ee8eb560bcf07713f.1606196558.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <79f282b7796b4b4bcf6936483bb819105e941f77.1606196558.git.viresh.kumar@linaro.org>
References: <79f282b7796b4b4bcf6936483bb819105e941f77.1606196558.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 2/2] syscalls: Add tests for open_by_handle_at()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds basic success and failure tests for open_by_handle_at()
syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |   3 +
 .../syscalls/open_by_handle_at/.gitignore     |   2 +
 .../syscalls/open_by_handle_at/Makefile       |   7 ++
 .../open_by_handle_at/open_by_handle_at01.c   | 115 ++++++++++++++++++
 .../open_by_handle_at/open_by_handle_at02.c   | 109 +++++++++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 testcases/kernel/syscalls/open_by_handle_at/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_by_handle_at/Makefile
 create mode 100644 testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
 create mode 100644 testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index e9299bf3fe2a..25179b74ecdf 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -879,6 +879,9 @@ openat201 openat201
 openat202 openat202
 openat203 openat203
 
+open_by_handle_at01 open_by_handle_at01
+open_by_handle_at02 open_by_handle_at02
+
 open_tree01 open_tree01
 open_tree02 open_tree02
 
diff --git a/testcases/kernel/syscalls/open_by_handle_at/.gitignore b/testcases/kernel/syscalls/open_by_handle_at/.gitignore
new file mode 100644
index 000000000000..799eba82a90b
--- /dev/null
+++ b/testcases/kernel/syscalls/open_by_handle_at/.gitignore
@@ -0,0 +1,2 @@
+open_by_handle_at01
+open_by_handle_at02
diff --git a/testcases/kernel/syscalls/open_by_handle_at/Makefile b/testcases/kernel/syscalls/open_by_handle_at/Makefile
new file mode 100644
index 000000000000..18896b6f28c0
--- /dev/null
+++ b/testcases/kernel/syscalls/open_by_handle_at/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
new file mode 100644
index 000000000000..35597a13c182
--- /dev/null
+++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic open_by_handle_at() tests.
+ *
+ * [ALGORITHM]
+ *  - Check that we were able to access a file's stat which is opened with
+ *    open_by_handle_at().
+\*/
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sys/stat.h>
+#include "lapi/name_to_handle_at.h"
+
+#define TEST_FILE "test_file"
+#define TEST_DIR "test_dir"
+
+static int dir_fd, fd_atcwd = AT_FDCWD, file_fd;
+static struct file_handle *fhp;
+
+static struct tcase {
+	int *dfd;
+	const char *pathname;
+	int name_flags;
+	int flags;
+} tcases[] = {
+	{&dir_fd, TEST_FILE, 0, O_RDWR},
+	{&dir_fd, TEST_FILE, 0, O_RDONLY},
+	{&dir_fd, TEST_FILE, 0, O_WRONLY},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
+	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
+	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
+	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
+	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
+	{&dir_fd, "", AT_EMPTY_PATH, O_RDONLY},
+	{&file_fd, "", AT_EMPTY_PATH, O_RDONLY},
+
+	{&fd_atcwd, TEST_FILE, 0, O_RDWR},
+	{&fd_atcwd, TEST_FILE, 0, O_RDONLY},
+	{&fd_atcwd, TEST_FILE, 0, O_WRONLY},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
+	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
+	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
+	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
+	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
+	{&fd_atcwd, "", AT_EMPTY_PATH, O_RDONLY},
+};
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(dir_fd);
+	SAFE_CLOSE(file_fd);
+}
+
+static void setup(void)
+{
+	SAFE_MKDIR(TEST_DIR, 0700);
+	dir_fd = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
+	SAFE_CHDIR(TEST_DIR);
+	SAFE_TOUCH(TEST_FILE, 0600, NULL);
+	file_fd = SAFE_OPEN("foo_file", O_RDWR | O_CREAT);
+	fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	struct stat file_stat;
+	int fd, mount_id;
+
+	TEST(name_to_handle_at(*tc->dfd, tc->pathname, fhp, &mount_id,
+			       tc->name_flags));
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed (%d)", n);
+		return;
+	}
+
+	TEST(fd = open_by_handle_at(*tc->dfd, fhp, tc->flags));
+	if (fd < 0) {
+		tst_res(TFAIL | TTERRNO, "open_by_handle_at() failed (%d)", n);
+		return;
+	}
+
+	SAFE_FSTAT(fd, &file_stat);
+
+	/* Don't check stats when pathname is empty */
+	if (file_stat.st_size == 0 || !tc->pathname[0])
+		tst_res(TPASS, "open_by_handle_at() passed (%d)", n);
+	else
+		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
new file mode 100644
index 000000000000..3c8f06d854c1
--- /dev/null
+++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Failure tests for open_by_handle_at().
+\*/
+#define _GNU_SOURCE
+#include <linux/capability.h>
+#include <fcntl.h>
+#include "tst_capability.h"
+#include "lapi/name_to_handle_at.h"
+
+#define TEST_FILE "test_file"
+#define FOO_SYMLINK "foo_symlink"
+
+static struct file_handle high_fh = {.handle_bytes = MAX_HANDLE_SZ + 1}, *high_fhp = &high_fh;
+static struct file_handle zero_fh, *zero_fhp = &zero_fh;
+static struct file_handle *valid_fhp, *invalid_fhp, *link_fhp;
+
+static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_DAC_READ_SEARCH);
+static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_DAC_READ_SEARCH);
+
+static struct tcase {
+	const char *name;
+	int dfd;
+	struct file_handle **fhp;
+	int flags;
+	int cap;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-dfd", -1, &valid_fhp, O_RDWR, 0, EBADF},
+	{"stale-dfd", 0, &valid_fhp, O_RDWR, 0, ESTALE},
+	{"invalid-file-handle", AT_FDCWD, &invalid_fhp, O_RDWR, 0, EFAULT},
+	{"high-file-handle-size", AT_FDCWD, &high_fhp, O_RDWR, 0, EINVAL},
+	{"zero-file-handle-size", AT_FDCWD, &zero_fhp, O_RDWR, 0, EINVAL},
+	{"no-capability", AT_FDCWD, &valid_fhp, O_RDWR, 1, EPERM},
+	{"symlink", AT_FDCWD, &link_fhp, O_RDWR, 0, ELOOP},
+};
+
+static void setup(void)
+{
+	void *faulty_address;
+	int mount_id;
+
+	SAFE_TOUCH(TEST_FILE, 0600, NULL);
+	SAFE_SYMLINK(TEST_FILE, FOO_SYMLINK);
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_fhp = faulty_address;
+
+	valid_fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+	if (!valid_fhp)
+		return;
+
+	TEST(name_to_handle_at(AT_FDCWD, TEST_FILE, valid_fhp, &mount_id, 0));
+	if (TST_RET)
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed");
+
+	/* Symlink's file handle */
+	link_fhp = tst_alloc(sizeof(*link_fhp) + valid_fhp->handle_bytes);
+	link_fhp->handle_type = valid_fhp->handle_type;
+	link_fhp->handle_bytes = valid_fhp->handle_bytes;
+
+	TEST(name_to_handle_at(AT_FDCWD, FOO_SYMLINK, link_fhp, &mount_id, 0));
+	if (TST_RET)
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int fd;
+
+	if (tc->cap)
+		tst_cap_action(&cap_drop);
+
+	TEST(fd = open_by_handle_at(tc->dfd, *tc->fhp, tc->flags));
+
+	if (tc->cap)
+		tst_cap_action(&cap_req);
+
+	if (TST_RET != -1) {
+		SAFE_CLOSE(fd);
+		tst_res(TFAIL, "%s: open_by_handle_at() passed unexpectedly",
+			tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO,
+			"%s: open_by_handle_at() should fail with %s", tc->name,
+			tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: open_by_handle_at() failed as expected",
+		tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
