Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B54566C3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E65E3C89A9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 00:58:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E06A43C89B3
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:06 +0100 (CET)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 03D3D1000D3D
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 00:58:05 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id A3ED21F47098
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637279883; bh=SEYcYBjqfpHp40Ol4xtoiG1XFKt8lQmtMcz+9DfxYd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCgtYbK46JaDoTYmzKcfo9wDGrD3+QSBaZNhyTnVNLIz+4SZmjnboRv0P2xX6/1Wz
 m/vW/G7A2jyqy0JLjEfsFDJgStJN6wSXfNJUtRF3UNUo3N4pHsksEPuKfatbXPOvh+
 H5/xAzJJwkB7V4FfRGzIcp1KXPiqKyM+S1GatCKXq0SrJVe91KBViYwnmBLtn+oNmz
 uzdi2pRtPxNNw4R4wv/dhRxD5Oj/XCst3ZbBz6gdzUgV71um2KWUA0uXQagd1DpDT6
 mO5xbz5jUOOj/rSyo7k/KWWPWZKwAcSQlXEVPVOpH7kgSB12Ekm41FB4q9iZ08KHLa
 AO4/9Gl+RmX8A==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: pvorel@suse.cz,
	jack@suse.com,
	amir73il@gmail.com,
	repnop@google.com
Date: Thu, 18 Nov 2021 18:57:38 -0500
Message-Id: <20211118235744.802584-4-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118235744.802584-1-krisman@collabora.com>
References: <20211118235744.802584-1-krisman@collabora.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/9] syscalls/fanotify22: Introduce FAN_FS_ERROR
 test
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-ext4@vger.kernel.org,
 kernel@collabora.com, ltp@lists.linux.it, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

fanotify22 is a new test validating the FAN_FS_ERROR file system error
event.  This adds some basic structure for the next patches and a single
test of error reporting during filesystem abort

The strategy for error reporting testing in fanotify22 goes like this:

  - Generate a broken filesystem
  - Start FAN_FS_ERROR monitoring group
  - Make the file system  notice the error through ordinary operations
  - Observe the event generated

FAN_FS_ERROR was added in the kernel by Linux commit
9709bd548f11 ("fanotify: Allow users to request FAN_FS_ERROR events").

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v3:
  - fanotify21 -> fanotify22 (Matthew)
Changes since v1:
  - Move defines to header file.
  - Move fanotify_mark(2) to do_test (Amir)
   - Merge abort test here
---
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |   3 +
 .../kernel/syscalls/fanotify/fanotify22.c     | 140 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify22.c

diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
index 35e73b91e392..6d4ab4ca3c06 100644
--- a/testcases/kernel/syscalls/fanotify/.gitignore
+++ b/testcases/kernel/syscalls/fanotify/.gitignore
@@ -19,4 +19,5 @@
 /fanotify19
 /fanotify20
 /fanotify21
+/fanotify22
 /fanotify_child
diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 242245826004..3a8f950950e0 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -127,6 +127,9 @@ static inline int safe_fanotify_mark(const char *file, const int lineno,
 #ifndef FAN_OPEN_EXEC_PERM
 #define FAN_OPEN_EXEC_PERM	0x00040000
 #endif
+#ifndef FAN_FS_ERROR
+#define FAN_FS_ERROR		0x00008000
+#endif
 
 /* Additional error status codes that can be returned to userspace */
 #ifndef FAN_NOPIDFD
diff --git a/testcases/kernel/syscalls/fanotify/fanotify22.c b/testcases/kernel/syscalls/fanotify/fanotify22.c
new file mode 100644
index 000000000000..55e695b133d6
--- /dev/null
+++ b/testcases/kernel/syscalls/fanotify/fanotify22.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Collabora Ltd.
+ *
+ * Author: Gabriel Krisman Bertazi <gabriel@krisman.be>
+ * Based on previous work by Amir Goldstein <amir73il@gmail.com>
+ */
+
+/*\
+ * [Description]
+ * Check fanotify FAN_ERROR_FS events triggered by intentionally
+ * corrupted filesystems:
+ *
+ * - Generate a broken filesystem
+ * - Start FAN_FS_ERROR monitoring group
+ * - Make the file system notice the error through ordinary operations
+ * - Observe the event generated
+ */
+
+#define _GNU_SOURCE
+#include "config.h"
+
+#include <stdio.h>
+#include <sys/types.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/syscall.h>
+#include "tst_test.h"
+#include <sys/fanotify.h>
+#include <sys/types.h>
+#include <fcntl.h>
+
+#ifdef HAVE_SYS_FANOTIFY_H
+#include "fanotify.h"
+
+#define BUF_SIZE 256
+static char event_buf[BUF_SIZE];
+int fd_notify;
+
+#define MOUNT_PATH "test_mnt"
+
+static void trigger_fs_abort(void)
+{
+	SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type,
+		   MS_REMOUNT|MS_RDONLY, "abort");
+}
+
+static struct test_case {
+	char *name;
+	void (*trigger_error)(void);
+} testcases[] = {
+	{
+		.name = "Trigger abort",
+		.trigger_error = &trigger_fs_abort,
+	},
+};
+
+int check_error_event_metadata(struct fanotify_event_metadata *event)
+{
+	int fail = 0;
+
+	if (event->mask != FAN_FS_ERROR) {
+		fail++;
+		tst_res(TFAIL, "got unexpected event %llx",
+			(unsigned long long)event->mask);
+	}
+
+	if (event->fd != FAN_NOFD) {
+		fail++;
+		tst_res(TFAIL, "Weird FAN_FD %llx",
+			(unsigned long long)event->mask);
+	}
+	return fail;
+}
+
+void check_event(char *buf, size_t len, const struct test_case *ex)
+{
+	struct fanotify_event_metadata *event =
+		(struct fanotify_event_metadata *) buf;
+
+	if (len < FAN_EVENT_METADATA_LEN) {
+		tst_res(TFAIL, "No event metadata found");
+		return;
+	}
+
+	if (check_error_event_metadata(event))
+		return;
+
+	tst_res(TPASS, "Successfully received: %s", ex->name);
+}
+
+static void do_test(unsigned int i)
+{
+	const struct test_case *tcase = &testcases[i];
+	size_t read_len;
+
+	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD|FAN_MARK_FILESYSTEM,
+			   FAN_FS_ERROR, AT_FDCWD, MOUNT_PATH);
+
+	tcase->trigger_error();
+
+	read_len = SAFE_READ(0, fd_notify, event_buf, BUF_SIZE);
+
+	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_REMOVE|FAN_MARK_FILESYSTEM,
+			   FAN_FS_ERROR, AT_FDCWD, MOUNT_PATH);
+
+	check_event(event_buf, read_len, tcase);
+}
+
+static void setup(void)
+{
+	REQUIRE_FANOTIFY_EVENTS_SUPPORTED_ON_FS(FAN_CLASS_NOTIF|FAN_REPORT_FID,
+						FAN_MARK_FILESYSTEM,
+						FAN_FS_ERROR, ".");
+
+	fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF|FAN_REPORT_FID,
+				       O_RDONLY);
+}
+
+static void cleanup(void)
+{
+	if (fd_notify > 0)
+		SAFE_CLOSE(fd_notify);
+}
+
+static struct tst_test test = {
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(testcases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.mount_device = 1,
+	.mntpoint = MOUNT_PATH,
+	.needs_root = 1,
+	.dev_fs_type = "ext4"
+};
+
+#else
+	TST_TEST_TCONF("system doesn't have required fanotify support");
+#endif
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
