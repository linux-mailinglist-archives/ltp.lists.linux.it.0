Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC62C0176
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:36:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E05AB3C2DDA
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:36:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 347C93C2D45
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:36:01 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6F70314001E2
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:36:00 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id l11so8510744plt.1
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gc75TXsQ9pRIvfpL/ZfGuVWvJhVrJwNcJh9VwjdZKKc=;
 b=q+TuqjWC30TB2bqkFwV3nr6PRT86+yjQP8Xwkl0dTCd1TQ2eHhu5Hhw/kAITnXZSuc
 Zp2lwgrIbCZv3ng0BYa02nZdvdManQfDDe8N0ubUnNTLF2NZoPhO6nx4nfDQrgF4hROH
 I48khx+eru9xaj9dRytNrGxZJ+jg3FLiOKw/es+7/0NtxOR9o+CwonAyMNqLSB24D4Xm
 O9ZY+ASVrWUgdGRma02PcJUJLRz3TkjtZtdJ0yQCu2olyE+SC2VO23X3Ols3Mhgdp8PX
 kmd/xwSj/wyCBTU6oaYl7TnIPVp7YcaFHW52J50Kg9Yligm5C4vzGWUiIF4XhwyswRD8
 Bjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gc75TXsQ9pRIvfpL/ZfGuVWvJhVrJwNcJh9VwjdZKKc=;
 b=VQaeSHutNOalgxjHrEnNAdEgxkCFCkgyvvm4rOKG5aiEskR7yegnkWaFYIKi5DPK1u
 4aq8pgilchY94+8B6rTIJnlekBKHYBsE/YhYczpKt4dLxp/Yhhn7Xbfo6ma2w1NxUHIe
 a5x+9ggc4a/Wr50Jpzy3nfPs8+cbjxIgcObB6nqmKqwXoooiKlv2oqLhyaDN0QGB+D0y
 jmUWmcs4/4R8fs8rEju2c1Y8U+d0m25amg8jWhHq2huLPBr/ooN57SFHg5W/XQjM8r+z
 63nfnYiik7W8mHjQ99uH82DWuuwjpSSPMwdbWdvHdUom4tveby/fZ1TjPsPLRIwbHwzH
 G5jg==
X-Gm-Message-State: AOAM532iq2aUuQphxlYfBxywTf62NXMpnCWzGm/4GclcsMZ1cwF+yPS+
 e7hi8LatOrpoeS35keUd2sjNMO6V23cE7A==
X-Google-Smtp-Source: ABdhPJzGke9wqMEdwi9mSOhlkYyuqIWEK3eDWccGZZiuyR1SNNhJlC9eS4FCX/Q7XDOXUrs+V26kKw==
X-Received: by 2002:a17:902:b181:b029:da:c5e:77ea with SMTP id
 s1-20020a170902b181b02900da0c5e77eamr2915718plr.18.1606120558442; 
 Mon, 23 Nov 2020 00:35:58 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id c6sm1716141pjr.55.2020.11.23.00.35.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 00:35:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 23 Nov 2020 14:05:53 +0530
Message-Id: <b758999c1bd02a52a68cbb6449bb3d82dd2a4e69.1606120441.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/2] syscalls: Add tests for name_to_handle_at()
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
V1->V2:
- Separate directories for both the syscalls.
- Added common header file.
- Use tst_alloc() instead of malloc().
- Use proper format for description.
- Minor other cleanups.

 include/lapi/name_to_handle_at.h              |  54 +++++++++
 runtest/syscalls                              |   3 +
 .../syscalls/name_to_handle_at/.gitignore     |   2 +
 .../syscalls/name_to_handle_at/Makefile       |   7 ++
 .../name_to_handle_at/name_to_handle_at01.c   | 113 ++++++++++++++++++
 .../name_to_handle_at/name_to_handle_at02.c   |  82 +++++++++++++
 6 files changed, 261 insertions(+)
 create mode 100644 include/lapi/name_to_handle_at.h
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/.gitignore
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/Makefile
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c

diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
new file mode 100644
index 000000000000..19c08545802a
--- /dev/null
+++ b/include/lapi/name_to_handle_at.h
@@ -0,0 +1,54 @@
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
+		      int *mount_id, int flags);
+int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
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
index a5363277f478..65f2e58a87e4 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -846,6 +846,9 @@ nanosleep01 nanosleep01
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
index 000000000000..1213654d108f
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
@@ -0,0 +1,113 @@
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
+static int dir_fd, fd_atcwd = AT_FDCWD;
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
+}
+
+static void setup(void)
+{
+	SAFE_MKDIR(TEST_DIR, 0700);
+	dir_fd = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
+	SAFE_CHDIR(TEST_DIR);
+	SAFE_TOUCH(TEST_FILE, 0600, NULL);
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
