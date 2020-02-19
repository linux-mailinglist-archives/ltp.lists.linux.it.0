Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id 8E767164061
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70EF43C24A4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1F1D53C25EC
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:33 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4FBC12011E5
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:32 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id z12so12442540pgl.4
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeobkxJ45t1g99CsX9IgecgtBneRGWUQ0ONyL/Xg7aQ=;
 b=Nb+WFIVBcTrpZ9R87Yv9bQSCMEr7Wo4AeafMM0NVtauN1z87qJN00WDm56PG8cx149
 gDskCGxnP9r/lXVBq/l/eoyU3LxtEOj3eFBxxmRUdx9ruBJmAbAvdRjY7aL0pQ2O313O
 kWRuieee4xKDVQUoVMFWGFNmEm8NC/3g20gtgmCN6DacVezcXROTOMT/Zg2DuOWxyNJl
 gPFjcU5Gd+cM93GcuGH6LRW5AiGYVqbKCeIRDLGcTfEKztTQpXXtUsb0wZt7vWHIFpZA
 X5bkwarjpiaQSC+0zEFVXIlWBg6H/Hh+HNhC/Q/fP3JpGaVAtexBW66uxlTj/iEs/4Zw
 9AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AeobkxJ45t1g99CsX9IgecgtBneRGWUQ0ONyL/Xg7aQ=;
 b=g1QV645j5K5p8bGZVreQBmiFgUxh0ISYQ8nRwghC2vVdDuKrDLDFd8NmfaPOsRf4yA
 DSItVHZK2P4Px95efOlOaD0U1cS24tK9GGz0uj3RzcQQ15ImjC042yDvmVRGjQ37sxrW
 ju590wDMBcqdHwP58oQ5Cl5zHil/TY2gU4goTPkJo/KGfM2StgYW8L2865v2ZbukmpuI
 wFMyAd1xQwnbuWugfRclP9ec7ApxJYm53C+CnmRxmJ490xNNX3Rx1QTXx8VoHnVFtigi
 pqOvBFhG8sVctzJsEsJO84KaajoRo5vSxgaV9NDeZTTHWaXSYQmazTpJw0tHgOq3UZ+9
 m8tw==
X-Gm-Message-State: APjAAAU5uzXIi9lqvX12ZxVcF1Mcay1zPhP2O13WHal/tNpRQ7tzKIbm
 t4ou9qIrh6Fkyo7p8y/VihdlwrN8fkw=
X-Google-Smtp-Source: APXvYqz0WfRk7QkPAyABKdprAgvZMSkaFugy2KWkMMp5aV/ep+8fn9DCQD6bp5f7vzyGd7qVVgWhtw==
X-Received: by 2002:a63:5508:: with SMTP id j8mr26365592pgb.170.1582104510378; 
 Wed, 19 Feb 2020 01:28:30 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id y6sm1865612pgc.10.2020.02.19.01.28.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:58:02 +0530
Message-Id: <9706f359006ea409d2f85c111d3e001ca6f6d128.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 06/10] syscalls/fsmount: Improve fsmount01 test
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
 testcases/kernel/syscalls/fsmount/fsmount01.c | 92 ++++++++++++-------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index c3cf8106f63b..b746a14ba472 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -3,67 +3,95 @@
  * Copyright (C) 2020 Red Hat, Inc.  All rights reserved.
  * Author: Zorro Lang <zlang@redhat.com>
  *
- * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(), move_mount())
- * to mount a filesystem without any specified mount options.
+ * Description:
+ * Basic fsmount() test.
  */
 
-#include <sys/mount.h>
-
 #include "tst_test.h"
 #include "lapi/fsmount.h"
 
-#define MNTPOINT "newmount_point"
-static int sfd, mfd, is_mounted;
+#define MNTPOINT	"mntpoint"
+
+static struct tcase {
+	char *name;
+	unsigned int flags;
+	unsigned int mount_attrs;
+} tcases[] = {
+	{"Flag 0, attr RDONLY", 0, MOUNT_ATTR_RDONLY},
+	{"Flag 0, attr NOSUID", 0, MOUNT_ATTR_NOSUID},
+	{"Flag 0, attr NODEV", 0, MOUNT_ATTR_NODEV},
+	{"Flag 0, attr NOEXEC", 0, MOUNT_ATTR_NOEXEC},
+	{"Flag 0, attr RELATIME", 0, MOUNT_ATTR_RELATIME},
+	{"Flag 0, attr NOATIME", 0, MOUNT_ATTR_NOATIME},
+	{"Flag 0, attr STRICTATIME", 0, MOUNT_ATTR_STRICTATIME},
+	{"Flag 0, attr NODIRATIME", 0, MOUNT_ATTR_NODIRATIME},
+	{"Flag CLOEXEC, attr RDONLY", FSMOUNT_CLOEXEC, MOUNT_ATTR_RDONLY},
+	{"Flag CLOEXEC, attr NOSUID", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOSUID},
+	{"Flag CLOEXEC, attr NODEV", FSMOUNT_CLOEXEC, MOUNT_ATTR_NODEV},
+	{"Flag CLOEXEC, attr NOEXEC", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOEXEC},
+	{"Flag CLOEXEC, attr RELATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_RELATIME},
+	{"Flag CLOEXEC, attr NOATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOATIME},
+	{"Flag CLOEXEC, attr STRICTATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_STRICTATIME},
+	{"Flag CLOEXEC, attr NODIRATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_NODIRATIME},
+};
 
-static void cleanup(void)
+static void setup(void)
 {
-	if (is_mounted)
-		SAFE_UMOUNT(MNTPOINT);
+	fsopen_supported_by_kernel();
 }
 
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
+		tst_brk(TBROK | TTERRNO, "fsopen() on %s failed",
+			tst_device->fs_type);
+	}
 	sfd = TST_RET;
-	tst_res(TPASS, "fsopen() on %s", tst_device->fs_type);
 
 	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET < 0)
+	if (TST_RET < 0) {
+		SAFE_CLOSE(sfd);
 		tst_brk(TBROK | TTERRNO,
 			"fsconfig() failed to set source to %s", tst_device->dev);
-	tst_res(TPASS, "fsconfig() set source to %s", tst_device->dev);
-
+	}
 
 	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET < 0)
+	if (TST_RET < 0) {
+		SAFE_CLOSE(sfd);
 		tst_brk(TBROK | TTERRNO, "fsconfig() created superblock");
-	tst_res(TPASS, "fsconfig() created superblock");
+	}
 
-	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "fsmount() failed to create a mount object");
-	mfd = TST_RET;
-	tst_res(TPASS, "fsmount() created a mount object");
+	TEST(fsmount(sfd, tc->flags, tc->mount_attrs));
 	SAFE_CLOSE(sfd);
 
+	if (TST_RET < 0) {
+		tst_brk(TFAIL | TTERRNO,
+			"fsmount() failed to create a mount object");
+	}
+	mfd = TST_RET;
+
 	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
-	if (TST_RET < 0)
-		tst_brk(TBROK | TTERRNO, "move_mount() failed to attach to the mount point");
-	is_mounted = 1;
-	tst_res(TPASS, "move_mount() attached to the mount point");
 	SAFE_CLOSE(mfd);
 
-	if (!tst_ismount(MNTPOINT)) {
-		SAFE_UMOUNT(MNTPOINT);
-		is_mounted = 0;
+	if (TST_RET < 0) {
+		tst_brk(TBROK | TTERRNO,
+			"move_mount() failed to attach to the mount point");
 	}
+
+	if (!tst_ismount(MNTPOINT))
+		tst_res(TPASS, "%s: fsmount() passed", tc->name);
+
+	SAFE_UMOUNT(MNTPOINT);
 }
 
 static struct tst_test test = {
-	.test_all = test_fsmount,
-	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
 	.needs_root = 1,
 	.mntpoint = MNTPOINT,
 	.format_device = 1,
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
