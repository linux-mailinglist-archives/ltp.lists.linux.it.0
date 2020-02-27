Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD4171009
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B95103C2573
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A88373C25CF
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:04 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 839ED600B73
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:03 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id 12so644417pjb.5
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6C8GzG1G6D6OWQFqy5c8OAlud50lOnkKOnOD8S8DLnQ=;
 b=fc5bgYyr2am3QKOoJrIoFH08EME7lXpfuRBw1vu3gp+ZEpGyR+o4whj2L/ZTjZl9+B
 yDBF3X3GlLLjya6fwuDEDJk/zjulOuyM4A29ZrNN1nTYk827hkBcDaW7DKVtQADtk2ag
 MK0TW50evCTaAkaPyPyC2zu9qdHrTK2qPiuFJZxwGZWaYTuou3PfD1x3PeADN4qkRLzw
 U4K9+R9djx4YwUYYqCquoawQyNUo7tJuXf+fHE6BpnB9vKAAgk49fM6yKkpv51kp817t
 On7nipvYoN31fubxkdOTXaKcf2szdoNPXPjUbL0A3miJIqmvnZNHL9neRNifDmmaNGWt
 rr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6C8GzG1G6D6OWQFqy5c8OAlud50lOnkKOnOD8S8DLnQ=;
 b=jBAh7FYPcsq0lFFyG4eGVGw0xukOUd4Ky2ztkPCPXVw5xQIBZyX5SS0XHkmQ0gUvX3
 HTvoqp9H592VRicD0AzyYkEKhsv2PPz9siV6psiNGJ6duvY8ilj9f2wz1YXZ7mOmA7kX
 51ZunXGnTmSiHKqV9Yx5LQ5SLxEv5stSJNVJQt2utH+xhGW4usW4X3Z9bkCeNwqpFXMj
 Pz8K+HMBcjdxM/mVKjO4SAXUw1l+O51VZ2xO0uUJr/oYr+aPHQZMqST+wNOS1uRMmHW3
 mfF98Upr1xIV7jofvEUfZgxlmWz/YfvONPB906Xxg1B285FyKL0v0JmAMIqvZBW0Qgwf
 dZ2w==
X-Gm-Message-State: APjAAAWB0DxclCluYXE0qIVl9/HiI3JNSbQfp5A25neW6rp3CPBnbpwY
 gi0SKkVIQIKVYm6b9e8mAEuZfDJKbI8=
X-Google-Smtp-Source: APXvYqyy3oc41uMtDOtXLtbtvhHJm6Z1C4d4geHQdLJhXcUb74mjjWRhc2RBuLDIKvF1nFuGx30QHQ==
X-Received: by 2002:a17:902:a514:: with SMTP id
 s20mr2850488plq.300.1582780501615; 
 Wed, 26 Feb 2020 21:15:01 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id n2sm4507368pgi.48.2020.02.26.21.15.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:15:01 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:34 +0530
Message-Id: <15594e36e83ddf307d423777b930e9b848c6a943.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V5 06/10] syscalls/fsmount: Improve fsmount01 test
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch updates the fsmount01.c file to make it look similar to all
other fsmount related syscall tests and here is the list of all changes:

- Test all fsmount flags and mount attributes
- Remove extra PASS messages as all we want to test here is fsmount()
  and not other syscalls.
- On the same lines, print TFAIL for fsmount() syscall and TBROK for
  other calls.
- close sfd on failures
- Make the file look similar to other fsmount related tests
- General cleanup

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/fsmount/fsmount01.c | 103 +++++++++++-------
 1 file changed, 65 insertions(+), 38 deletions(-)

diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 514d3b0b38f8..8c3538bf8c84 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -3,67 +3,94 @@
  * Copyright (C) 2020 Red Hat, Inc.  All rights reserved.
  * Author: Zorro Lang <zlang@redhat.com>
  *
- * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(), move_mount())
- * to mount a filesystem without any specified mount options.
+ * Basic fsmount() test.
  */
 
-#include <sys/mount.h>
-
 #include "tst_test.h"
 #include "lapi/fsmount.h"
 
-#define MNTPOINT "newmount_point"
-static int sfd, mfd, is_mounted;
+#define MNTPOINT	"mntpoint"
 
-static void cleanup(void)
-{
-	if (is_mounted)
-		SAFE_UMOUNT(MNTPOINT);
-}
+#define TCASE_ENTRY(_flags, _attrs)	{.name = "Flag " #_flags ", Attr " #_attrs, .flags = _flags, .attrs = _attrs}
 
-static void test_fsmount(void)
+static struct tcase {
+	char *name;
+	unsigned int flags;
+	unsigned int attrs;
+} tcases[] = {
+	TCASE_ENTRY(0, MOUNT_ATTR_RDONLY),
+	TCASE_ENTRY(0, MOUNT_ATTR_NOSUID),
+	TCASE_ENTRY(0, MOUNT_ATTR_NODEV),
+	TCASE_ENTRY(0, MOUNT_ATTR_NOEXEC),
+	TCASE_ENTRY(0, MOUNT_ATTR_RELATIME),
+	TCASE_ENTRY(0, MOUNT_ATTR_NOATIME),
+	TCASE_ENTRY(0, MOUNT_ATTR_STRICTATIME),
+	TCASE_ENTRY(0, MOUNT_ATTR_NODIRATIME),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_RDONLY),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_NOSUID),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_NODEV),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_NOEXEC),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_RELATIME),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_NOATIME),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_STRICTATIME),
+	TCASE_ENTRY(FSMOUNT_CLOEXEC, MOUNT_ATTR_NODIRATIME),
+};
+
+static void run(unsigned int n)
 {
-	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsopen() on %s failed", tst_device->fs_type);
-	sfd = TST_RET;
-	tst_res(TPASS, "fsopen() on %s", tst_device->fs_type);
+	struct tcase *tc = &tcases[n];
+	int sfd, mfd;
+
+	TEST(sfd = fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
+	if (sfd == -1) {
+		tst_res(TFAIL | TTERRNO, "fsopen() on %s failed",
+			tst_device->fs_type);
+		return;
+	}
 
 	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO,
+	if (TST_RET == -1) {
+		SAFE_CLOSE(sfd);
+		tst_res(TFAIL | TTERRNO,
 			"fsconfig() failed to set source to %s", tst_device->dev);
-	tst_res(TPASS, "fsconfig() set source to %s", tst_device->dev);
-
+		return;
+	}
 
 	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsconfig() created superblock");
-	tst_res(TPASS, "fsconfig() created superblock");
+	if (TST_RET == -1) {
+		SAFE_CLOSE(sfd);
+		tst_res(TFAIL | TTERRNO, "fsconfig() created superblock");
+		return;
+	}
 
-	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsmount() failed to create a mount object");
-	mfd = TST_RET;
-	tst_res(TPASS, "fsmount() created a mount object");
+	TEST(mfd = fsmount(sfd, tc->flags, tc->attrs));
 	SAFE_CLOSE(sfd);
 
+	if (mfd == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"fsmount() failed to create a mount object");
+		return;
+	}
+
 	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "move_mount() failed to attach to the mount point");
-	is_mounted = 1;
-	tst_res(TPASS, "move_mount() attached to the mount point");
 	SAFE_CLOSE(mfd);
 
-	if (tst_is_mounted(MNTPOINT)) {
-		SAFE_UMOUNT(MNTPOINT);
-		is_mounted = 0;
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"move_mount() failed to attach to the mount point");
+		return;
 	}
+
+	if (tst_is_mounted(MNTPOINT))
+		tst_res(TPASS, "%s: fsmount() passed", tc->name);
+
+	SAFE_UMOUNT(MNTPOINT);
 }
 
 static struct tst_test test = {
-	.test_all = test_fsmount,
-	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = fsopen_supported_by_kernel,
 	.needs_root = 1,
 	.mntpoint = MNTPOINT,
 	.format_device = 1,
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
