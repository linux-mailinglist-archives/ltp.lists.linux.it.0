Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23A340697
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99C1E3C90CC
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5704E3C79CB
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:49 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 048E410011A1
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:49 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id p19so3528398wmq.1
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZR3vr1Xa258gS4KrGClMvu6FAzXH/100flHgcW0V4b8=;
 b=Hr/unf3bEE6xN8LyUO0aocOqHu60P9ysNVXfX1OBK+ifzOZVJyRg8AB46RiE9mHO4B
 ksoeBq2Ut8dHIpsYbKmk8q0EWCdrD4htsVkQjTH71gD+xPU6BKSy0AvCxLNPov+FSR8v
 nwNP86XVvAUSar/+qSr4ECY1DCRr2LEY1B7tl7jpQ2sqGng5rHdc9c07w3Hr5OA889NG
 Q0qIyl3WwlVZGNlWhAy47Hs/u+dbBaDUdPliqIcAVdvzy4XvMBncVtaorR6lJsbsuMAP
 A+wZds++0+vhtxd8n3q9jpqRBaHKBvFbQuxdYC1CCfd60LbZwaToRLpVn1rFWuJlG/9v
 9U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZR3vr1Xa258gS4KrGClMvu6FAzXH/100flHgcW0V4b8=;
 b=TNP0mvutb7yO158ZO+ja8YXgRoP5rGY9I2XaBhaWQfhn+Hivy9/gJfTsyZN0NiVqck
 2CHWiew15CYndsGMF0kW8PVDXRkXOYPGTxKddk32Ts5065o4dADf6ghjOBac06/9p6Tj
 r41+VOTgHjIhUGws1kygjl5NPT2C47BlVKz1nIMefGL9zTrRC5Rt1QL+5uVaXl0P5ALs
 oUnFr2xMByMQ2k9pWmRObsyUXe/wNpBXh4HQMcgVc5VQJlboQXQs8ZQIrsl30qsd+PH2
 KI1zer5+K2PrHN4kzFfg3XtzTAVeTK5NgSNIRwDs6n5tL4Z/QCJ0kybRCjYVS12qPKTY
 nWgg==
X-Gm-Message-State: AOAM532ElDFSBhR69RpzwVgdASCEtrHQJq54yZ9Do1a6nRA7GtrWXsfQ
 jvjU8zFMfEOJcbAQE57IS9w=
X-Google-Smtp-Source: ABdhPJw1CbS29pN0YM8xnkD8R76HPViMmEvm9qDxs/cm9Sg7rDM1CvHAz4cGqEvVSycR4KsywYnv1A==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr3629013wmc.59.1616073108467; 
 Thu, 18 Mar 2021 06:11:48 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:48 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:33 +0200
Message-Id: <20210318131134.3562203-8-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 7/8] syscalls/fanotify: New test to validate
 unprivileged user permissions
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

Defined a set of new test cases to validate the fanotify interface.
They are to ensure that the correct error values are returned upon
requesting configurations forbidden for an unprivileged user.

Signed-off-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 .../kernel/syscalls/fanotify/fanotify18.c     | 198 ++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify18.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 41f1279a2..9caa3cf7a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -591,6 +591,7 @@ fanotify14 fanotify14
 fanotify15 fanotify15
 fanotify16 fanotify16
 fanotify17 fanotify17
+fanotify18 fanotify18
 
 ioperm01 ioperm01
 ioperm02 ioperm02
diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
index 20fcb3718..175e68ca3 100644
--- a/testcases/kernel/syscalls/fanotify/.gitignore
+++ b/testcases/kernel/syscalls/fanotify/.gitignore
@@ -15,4 +15,5 @@
 /fanotify15
 /fanotify16
 /fanotify17
+/fanotify18
 /fanotify_child
diff --git a/testcases/kernel/syscalls/fanotify/fanotify18.c b/testcases/kernel/syscalls/fanotify/fanotify18.c
new file mode 100644
index 000000000..1acd23ce2
--- /dev/null
+++ b/testcases/kernel/syscalls/fanotify/fanotify18.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2018 Matthew Bobrowski. All Rights Reserved.
+ *
+ * Started by Matthew Bobrowski <mbobrowski@mbobrowski.org>
+ *
+ * DESCRIPTION
+ *	This set of tests is to ensure that the unprivileged listener feature of
+ *	fanotify is functioning as expected. The objective this test case file
+ *	is to validate whether any forbidden flags that are passed by an
+ *	unprivileged user return the correct error result.
+ */
+#define _GNU_SOURCE
+#include "config.h"
+
+#include <pwd.h>
+#include <stdio.h>
+#include <errno.h>
+#include "tst_test.h"
+#include "fanotify.h"
+
+#if defined(HAVE_SYS_FANOTIFY_H)
+#include <sys/fanotify.h>
+
+/*
+ * This is a set of intialization flags that are not permitted to be used by an
+ * unprivileged user. Thus, if supplied, either EPERM or EINVAL should be
+ * returned to the calling process respectively.
+ */
+#define DISALLOWED_INIT_FLAGS	(FAN_UNLIMITED_QUEUE | FAN_UNLIMITED_MARKS | \
+				 FAN_CLASS_CONTENT | FAN_CLASS_PRE_CONTENT | \
+				 FAN_REPORT_TID)
+
+/*
+ * This is a set of mark flags that are not permitted to be used with an
+ * unprivileged listener.
+ */
+#define DISALLOWED_MARK_FLAGS	(FAN_MARK_MOUNT | FAN_MARK_FILESYSTEM)
+
+#define MOUNT_PATH	"fs_mnt"
+#define TEST_FILE	MOUNT_PATH "/testfile"
+
+static int fd_notify;
+
+static struct test_case_t {
+	const char *name;
+	unsigned long init_flags;
+	unsigned long mark_flags;
+	unsigned long long mark_mask;
+} test_cases[] = {
+	{
+		"init_flags: missing FAN_REPORT_FID",
+		FAN_CLASS_NOTIF,
+		0, 0
+	},
+	{
+		"init_flags: FAN_CLASS_CONTENT",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_CLASS_CONTENT,
+		0, 0
+	},
+	{
+		"init_flags: FAN_CLASS_PRE_CONTENT",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_CLASS_PRE_CONTENT,
+		0, 0
+	},
+	{
+		"init_flags: FAN_UNLIMITED_QUEUE",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_UNLIMITED_QUEUE,
+		0, 0
+	},
+	{
+		"init_flags: FAN_UNLIMITED_MARKS",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_UNLIMITED_MARKS,
+		0, 0
+	},
+	{
+		"init_flags: FAN_REPORT_TID",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_REPORT_TID,
+		0, 0
+	},
+	{
+		"init_flags: FAN_CLASS_NOTIF, "
+		"mark_flags: FAN_MARK_ADD | FAN_MARK_MOUNT",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_CLASS_NOTIF,
+		FAN_MARK_ADD | FAN_MARK_MOUNT, FAN_ALL_EVENTS
+	},
+	{
+		"init_flags: FAN_CLASS_NOTIF, "
+		"mark_flags: FAN_MARK_ADD | FAN_MARK_FILESYSTEM",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_CLASS_NOTIF,
+		FAN_MARK_ADD | FAN_MARK_FILESYSTEM, FAN_ALL_EVENTS
+	},
+	{
+		"init_flags: FAN_CLASS_NOTIF, "
+		"mark_flags: FAN_MARK_ADD, "
+		"mark_mask: FAN_ALL_EVENTS",
+		FANOTIFY_REQUIRED_USER_INIT_FLAGS | FAN_CLASS_NOTIF,
+		FAN_MARK_ADD, FAN_ALL_EVENTS
+	}
+};
+
+static void test_fanotify(unsigned int n)
+{
+	struct test_case_t *tc = &test_cases[n];
+
+	tst_res(TINFO, "Test #%d %s", n, tc->name);
+
+	/* Initialize fanotify */
+	fd_notify = fanotify_init(tc->init_flags, O_RDONLY);
+
+	if (fd_notify < 0) {
+		if (errno == EPERM &&
+		    ((tc->init_flags & DISALLOWED_INIT_FLAGS) ||
+		     (tc->init_flags & FANOTIFY_REQUIRED_USER_INIT_FLAGS) !=
+		      FANOTIFY_REQUIRED_USER_INIT_FLAGS)) {
+			tst_res(TPASS,
+				"Received result EPERM, as expected");
+			return;
+		} else {
+			tst_brk(TBROK | TERRNO,
+				"fanotify_init(0x%lx, O_RDONLY) failed",
+				tc->init_flags);
+		}
+	}
+
+	/* Attempt to place mark on object */
+	if (fanotify_mark(fd_notify, tc->mark_flags, tc->mark_mask, AT_FDCWD,
+				TEST_FILE) < 0) {
+		/*
+		 * Unprivileged users are only allowed to mark inodes and not
+		 * permitted to use access permissions
+		 */
+		if (errno == EPERM &&
+			(tc->mark_flags & DISALLOWED_MARK_FLAGS ||
+			 tc->mark_mask & FAN_ALL_PERM_EVENTS)) {
+			tst_res(TPASS, "Received result EPERM, as expected");
+			return;
+		}
+
+		tst_brk(TBROK | TERRNO,
+			"fanotify_mark(%d, %lx, %llx, AT_FDCWD, %s) "
+			"failed",
+			fd_notify,
+			tc->mark_flags,
+			tc->mark_mask,
+			TEST_FILE);
+	}
+
+	tst_res(TPASS,
+		"fanotify_init() and fanotify_mark() returned successfully, "
+		"as expected");
+}
+
+static void setup(void)
+{
+	int fd;
+
+	SAFE_TOUCH(TEST_FILE, 0666, NULL);
+
+	/* Check for kernel fanotify support */
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, TEST_FILE);
+
+	/* Relinquish privileged user */
+	if (geteuid() == 0) {
+		tst_res(TINFO,
+			"Running as privileged user, revoking permissions.");
+		struct passwd *nobody = SAFE_GETPWNAM("nobody");
+		SAFE_SETUID(nobody->pw_uid);
+	}
+
+	/* Check for unprivileged fanotify support */
+	fd = fanotify_init(FANOTIFY_REQUIRED_USER_INIT_FLAGS, O_RDONLY);
+	if (fd < 0) {
+		tst_brk(TCONF,
+			"unprivileged fanotify not supported by kernel?");
+	}
+	SAFE_CLOSE(fd);
+}
+
+static void cleanup(void)
+{
+	if (fd_notify > 0)
+		SAFE_CLOSE(fd_notify);
+}
+
+static struct tst_test test = {
+	.test = test_fanotify,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MOUNT_PATH,
+};
+
+#else
+	TST_TEST_CONF("System does not have required fanotify support");
+#endif
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
