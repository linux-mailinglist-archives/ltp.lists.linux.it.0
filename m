Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9F2C1DAD
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:44:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E710C3C2D11
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:44:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6E7283C23F5
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:44:38 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9F21B200A15
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:44:37 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id b6so6930322pfp.7
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 21:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+iyWv7jbkzEXoP/msAQvl3UyNtqPLFbBYZow12DfFmA=;
 b=OtlJjBX0FrDBpAPei6yeZQVMHwCLqDxuKVpx0DaJY0/0BUAJBEVwisp7AfQv4e/izq
 B5kW7oEVogsfwF8ZXhKKTVudYP2VHGZBZd0k4xxi99hjxptjP9N9GSPgyFiFhg46s7mS
 ip3s5otOzglBXzv34X6jJ9NZ/OBg7gj4V5FhrmZ1I3cy9MRggl3hZYCxJS75H3NwJZWY
 aqraZBVJlh/oAPse0ChpP7+A+Zxue9xeFEV8A6W4NMZ9JVQAm2KnJ6g1FruO6n+MDsx+
 QjZAJg/uA5tfS3OP8xSAOiNtbs+fQl9k+/+yvowQPJ3bZVvvSb//FB3tbSISdU2f1ZAV
 QOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+iyWv7jbkzEXoP/msAQvl3UyNtqPLFbBYZow12DfFmA=;
 b=pX4AnBCzrIV8Fm82K9v0qrUtWDBx89fd99ZoGa/sxxM4JMEJbSMtbvyzv87r1/+Dza
 mi/KUDEjrOZF/Lk3d6BHtbrusX9ffpRPLmN2BOwWdlUns4Eydn1pchz7ObKgpCnAyiWQ
 cUjpVFOKNVueOWQaa5ru9PexloJQ+7TCoSyvhaLR6LIzHoa+RMD0ybkOIlz2xZq67lwm
 JyY/ADnSksCDWMt+299oTQ3MavDG9ppzUNe02fMlRFvG43Oem0WhZlzp5l4fNZSecIA1
 k7+HEJP/A8C+6d9JLbagVIFxMFyWPo2fz+wBe9jLoUuYRA/ybfkMVkMb4J7FlL0nDfgX
 ZdXA==
X-Gm-Message-State: AOAM532/TOdVc5pgsXziF0Kl6EdsUy0Upl1LjgTm92h4SO52zHzsHlpR
 xOwTuYNGDWTLY1nFR8jgcUAJZRJDQc4Vlg==
X-Google-Smtp-Source: ABdhPJxr/5l3CQoWZR69H3jRLNAIGwtTZX6MbJH41+jxs1vQAcYJCJL8+HctNSiKuocYAntg6B5j7A==
X-Received: by 2002:aa7:818e:0:b029:197:dda4:de37 with SMTP id
 g14-20020aa7818e0000b0290197dda4de37mr2664976pfi.75.1606196675562; 
 Mon, 23 Nov 2020 21:44:35 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id gg19sm1392128pjb.21.2020.11.23.21.44.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 21:44:34 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 24 Nov 2020 11:14:28 +0530
Message-Id: <79f282b7796b4b4bcf6936483bb819105e941f77.1606196558.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 1/2] syscalls: Add tests for name_to_handle_at()
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

This adds basic success and failure tests for name_to_handle_at()
syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V3:
- Implement name_to_handle_at() and open_by_handle_at() in the header
  file with tst_syscall().

- Add test for dirfd referring to a file with AT_EMPTY_PATH flag.

 include/lapi/name_to_handle_at.h              |  63 ++++++++++
 runtest/syscalls                              |   3 +
 .../syscalls/name_to_handle_at/.gitignore     |   2 +
 .../syscalls/name_to_handle_at/Makefile       |   7 ++
 .../name_to_handle_at/name_to_handle_at01.c   | 116 ++++++++++++++++++
 .../name_to_handle_at/name_to_handle_at02.c   |  82 +++++++++++++
 6 files changed, 273 insertions(+)
 create mode 100644 include/lapi/name_to_handle_at.h
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/.gitignore
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/Makefile
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c

diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
new file mode 100644
index 000000000000..16cba239d769
--- /dev/null
+++ b/include/lapi/name_to_handle_at.h
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef NAME_TO_HANDLE_AT_H__
+#define NAME_TO_HANDLE_AT_H__
+
+#include <sys/syscall.h>
+#include "config.h"
+#include "lapi/syscalls.h"
+#include "tst_buffers.h"
+#include "tst_test.h"
+
+#ifndef HAVE_NAME_TO_HANDLE_AT
+struct file_handle {
+	unsigned int handle_bytes;
+	int handle_type;
+	/* File identifier.  */
+	unsigned char f_handle[0];
+};
+
+int name_to_handle_at(int dfd, const char *pathname, struct file_handle *handle,
+		      int *mount_id, int flags)
+{
+	return tst_syscall(__NR_name_to_handle_at, dfd, pathname, handle,
+			   mount_id, flags);
+}
+
+int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
+{
+	return tst_syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
+}
+#endif
+
+/* Returns a valid pointer on success, NULL on errors */
+static inline struct file_handle *
+allocate_file_handle(int dfd, const char *pathname)
+{
+	struct file_handle fh = {}, *fhp;
+	int mount_id;
+
+	/*
+	 * Make an initial call to name_to_handle_at() to discover the size
+	 * required for the file handle.
+	 */
+	TEST(name_to_handle_at(dfd, pathname, &fh, &mount_id, 0));
+	if (TST_RET != -1 || TST_ERR != EOVERFLOW) {
+		tst_res(TFAIL | TTERRNO,
+			"name_to_handle_at() should fail with EOVERFLOW");
+		return NULL;
+	}
+
+	/* Valid file handle */
+	fhp = tst_alloc(sizeof(*fhp) + fh.handle_bytes);
+	fhp->handle_type = fh.handle_type;
+	fhp->handle_bytes = fh.handle_bytes;
+
+	return fhp;
+}
+
+#endif /* NAME_TO_HANDLE_AT_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index adf410ed11a4..e9299bf3fe2a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -843,6 +843,9 @@ nanosleep01 nanosleep01
 nanosleep02 nanosleep02
 nanosleep04 nanosleep04
 
+name_to_handle_at01 name_to_handle_at01
+name_to_handle_at02 name_to_handle_at02
+
 nftw01 nftw01
 nftw6401 nftw6401
 
diff --git a/testcases/kernel/syscalls/name_to_handle_at/.gitignore b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
new file mode 100644
index 000000000000..268a8a34f85e
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
@@ -0,0 +1,2 @@
+name_to_handle_at01
+name_to_handle_at02
diff --git a/testcases/kernel/syscalls/name_to_handle_at/Makefile b/testcases/kernel/syscalls/name_to_handle_at/Makefile
new file mode 100644
index 000000000000..18896b6f28c0
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
new file mode 100644
index 000000000000..ef56f2a86cb8
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic name_to_handle_at() tests.
+ *
+ * [ALGORITHM]
+ *  - Check that EOVERFLOW is returned as expected by name_to_handle_at().
+ *  - Check that we were able to access a file's stat with name_to_handle_at()
+ *    and open_by_handle_at().
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
+		tst_res(TPASS, "name_to_handle_at() passed (%d)", n);
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
diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
new file mode 100644
index 000000000000..4e73b2f5dee8
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Failure tests for name_to_handle_at().
+\*/
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include "lapi/name_to_handle_at.h"
+
+#define TEST_FILE "test_file"
+
+static struct file_handle fh, high_fh = {.handle_bytes = MAX_HANDLE_SZ + 1};
+static struct file_handle *valid_fhp = &fh, *invalid_fhp, *high_fhp = &high_fh;
+static int mount_id, *valid_mount_id = &mount_id, *invalid_mount_id;
+static const char *valid_path = TEST_FILE, *invalid_path, *empty_path = "";
+
+static struct tcase {
+	const char *name;
+	int dfd;
+	const char **pathname;
+	int flags;
+	struct file_handle **fhp;
+	int **mount_id;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-dfd", -1, &valid_path, 0, &valid_fhp, &valid_mount_id, EBADF},
+	{"not a directory", 0, &valid_path, 0, &valid_fhp, &valid_mount_id, ENOTDIR},
+	{"invalid-path", AT_FDCWD, &invalid_path, 0, &valid_fhp, &valid_mount_id, EFAULT},
+	{"invalid-file-handle", AT_FDCWD, &valid_path, 0, &invalid_fhp, &valid_mount_id, EFAULT},
+	{"zero-file-handle-size", AT_FDCWD, &valid_path, 0, &valid_fhp, &valid_mount_id, EOVERFLOW},
+	{"high-file-handle-size", AT_FDCWD, &valid_path, 0, &high_fhp, &valid_mount_id, EINVAL},
+	{"invalid-mount_id", AT_FDCWD, &valid_path, 0, &valid_fhp, &invalid_mount_id, EFAULT},
+	{"invalid-flags", AT_FDCWD, &valid_path, -1, &valid_fhp, &valid_mount_id, EINVAL},
+	{"empty-path", AT_FDCWD, &empty_path, 0, &valid_fhp, &valid_mount_id, ENOENT},
+};
+
+static void setup(void)
+{
+	void *faulty_address;
+
+	SAFE_TOUCH(TEST_FILE, 0600, NULL);
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_fhp = faulty_address;
+	invalid_mount_id = faulty_address;
+	invalid_path = faulty_address;
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(name_to_handle_at(tc->dfd, *tc->pathname, *tc->fhp, *tc->mount_id,
+			       tc->flags));
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "%s: name_to_handle_at() passed unexpectedly",
+			tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO,
+			"%s: name_to_handle_at() should fail with %s", tc->name,
+			tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: name_to_handle_at() failed as expected",
+		tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
