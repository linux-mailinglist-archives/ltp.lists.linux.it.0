Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B4B16B9E0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 164023C2606
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D58203C262F
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:11 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0B5BF1401A99
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:11 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id k29so6629011pfp.13
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1X5opXfOBzaybIaUcWDOiXDHHGgpGf4qdyZ6jf+2q5Y=;
 b=LsoSs9DG14dtq8h1tp9ymbBGAW7Dv+NVlCF34wg+GrHKCfOBCq/hgXKRy/VrtnBg3+
 qiMRhrkg6mHbRG3MpZBBJFMhEwJi/ANJ098q1rQz/9ELGTqsJXdtYktleLXIndd9MBuc
 LildpDldOCsALlQye8UwVYiOFiigCTd260Vurbehk6P/HNLDuRARIQeaYXVGOnKJWva9
 +84guTi0Xqx4VIEm/MrT8MoZHgpjyNMVM7tF08p3WzOwl6G7nKqSBGeB2JfxOAOyvyVP
 JnsfXYS6fJ+1WjJgMZBDVLRKG7iIssct46CVKpKoxxYK79WyfYCsBIyl1jTkuCFL+eLV
 uYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X5opXfOBzaybIaUcWDOiXDHHGgpGf4qdyZ6jf+2q5Y=;
 b=D7B5lDc0aN0toXjheGV2VEWK2EuFFQlwt8HNNxT+wuIDgIvA/NfkXPj5R3yOiSBJlB
 g75owjZGOzvBp6Z0UA26I0YxfXLMRb2WwULzNwQT0A5wcHm6RqLynt/Pdy6QrQYNo6CE
 Z3k4ConMUBCXIF6pyEmchyR9n3ULeEbLfE5lDvNrDX1YAFZNjHp2UbPsh72L4GToxTrk
 OdpLr+diiOcMcyPP84E/DExnQhH0Oe2WN+L9sy7TSCzbOqtBDTSxc/AAgyisiPmhFjKJ
 yKNJGAxF4SW9FbFUPAl8GiC1MZeiNi2nJsYkgwryHiBn+6+u9ksVRNYqv4Q1KSa70rmr
 lsUw==
X-Gm-Message-State: APjAAAUfFL+UnKTJ6sjx08f9LJiX7PBVRh9aklL0Q81wEaWFK9kIjTH/
 tbcxJtOXCtm+qzRpDIeTlZXCBTPu6FA=
X-Google-Smtp-Source: APXvYqwBfhHxBc6ghMolSQFt6iDbHfAQNzeoM60K4pY0+kCQw45vdr3Z6LPnexZse7l6NWanmtPePg==
X-Received: by 2002:a62:1a97:: with SMTP id
 a145mr57842509pfa.244.1582612869068; 
 Mon, 24 Feb 2020 22:41:09 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id l25sm14480459pgn.47.2020.02.24.22.41.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:41:08 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:44 +0530
Message-Id: <37e791ad1e0badd02eb45fda194e21a6edc10512.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V3 06/10] syscalls/fsmount: Improve fsmount01 test
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

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/fsmount/fsmount01.c | 101 +++++++++++-------
 1 file changed, 65 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 514d3b0b38f8..b7810df2fd5b 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -3,67 +3,96 @@
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
+
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
 
-static void test_fsmount(void)
+static void run(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
+	int sfd, mfd;
+
 	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsopen() on %s failed", tst_device->fs_type);
+	if (TST_RET == -1) {
+		tst_res(TBROK | TTERRNO, "fsopen() on %s failed",
+			tst_device->fs_type);
+		return;
+	}
 	sfd = TST_RET;
-	tst_res(TPASS, "fsopen() on %s", tst_device->fs_type);
 
 	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO,
+	if (TST_RET < 0) {
+		SAFE_CLOSE(sfd);
+		tst_res(TBROK | TTERRNO,
 			"fsconfig() failed to set source to %s", tst_device->dev);
-	tst_res(TPASS, "fsconfig() set source to %s", tst_device->dev);
-
+		return;
+	}
 
 	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsconfig() created superblock");
-	tst_res(TPASS, "fsconfig() created superblock");
+	if (TST_RET < 0) {
+		SAFE_CLOSE(sfd);
+		tst_res(TBROK | TTERRNO, "fsconfig() created superblock");
+		return;
+	}
 
-	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsmount() failed to create a mount object");
-	mfd = TST_RET;
-	tst_res(TPASS, "fsmount() created a mount object");
+	TEST(fsmount(sfd, tc->flags, tc->attrs));
 	SAFE_CLOSE(sfd);
 
+	if (TST_RET < 0) {
+		tst_res(TFAIL | TTERRNO,
+			"fsmount() failed to create a mount object");
+		return;
+	}
+	mfd = TST_RET;
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
+	if (TST_RET < 0) {
+		tst_res(TBROK | TTERRNO,
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
