Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC44182FBF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9824E3C5F86
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 243E73C5EB0
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:42 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E73B46021A6
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:41 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id mj6so2333083pjb.5
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOn2xFWx6RTHcokFDsoJ4haSS35lMVLeJyHxWDPO0FM=;
 b=hgIjo5rPEsw4OGqfKTXSB2x7pj1xeGg0esQovxl2oQuf3pRgDALZFvlo/drCVQ0fnF
 /eC6HySofbTtrZ152JXYuhxx9UROg3h+xvRjFfL0zlXeJHlMJMnURzLywpStD/sf5Xcb
 LPnRa7oqFxPcGB5hutIUHkEHvUrMmE1bmwafTpzNgV5wIpctlFS+H9tbefZjJR+HtcX4
 jyaaGTT4w7XoW1qFWjOeo10uAW2H+7Fs3DyZ8ovZhrD/bFAJ3Q+OU1sKiR3rPD0ou56i
 rdul/ZsFAWtkErNQX/Po+Wtyyn6uvTjnHPA4Rs9nrmcuzeREeqkMFQFgTxWc1/ZQgMSK
 /BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOn2xFWx6RTHcokFDsoJ4haSS35lMVLeJyHxWDPO0FM=;
 b=rK50MKc6xJlKB/jyLIl+AO2eWtcoN1mo/NSJoPP1bi9gGpTpzlDJrxcc/pkUiE8rd4
 rwlf16CZi7a8PRZq+vIh89/e9vYJWTNwUMnV7qphhcEwBYTTV887PIidRD6VyVP3w8KW
 M4D+l3VpP7ph6dVdknDP7Cdi6XJFixLVvpXnAQrprruJJQmqJwgX1Tw9kb4Ztj3y3bHM
 I5Ry632Um3k4r6YMGpgaPbnSi0KKnWuQSif5Pz7tLvhr56fcvSYXbudS+BmoMO5vYV0R
 CLVnGNDggnyx9edXiIFc3aCmUJoc1QqxHAL2BWv0S7z9JOtxpviSJrkvC7pip+istzNN
 ujWg==
X-Gm-Message-State: ANhLgQ2Pe6w7nL3+ESPUrTsx5lXdC9CyxwZDITSOmdlFJs4oiLral2y4
 Wb/BTy6i98P3fHlLQ/lVYIYjU8vxlvE=
X-Google-Smtp-Source: ADFU+vs0g76DlXzygJFiywSLtXNjGkawf4S7+nvbfj4JxvkdZYUYXrCK9lIAKFBvyAb7HXuFDrlwZg==
X-Received: by 2002:a17:902:74c7:: with SMTP id
 f7mr7364316plt.243.1584014496047; 
 Thu, 12 Mar 2020 05:01:36 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id e187sm2344811pfe.50.2020.03.12.05.01.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:35 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:06 +0530
Message-Id: <34617a5bd9778cd1350f620629315c3c759e4e07.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V6 06/10] syscalls/fsmount: Improve fsmount01 test
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
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
 testcases/kernel/syscalls/fsmount/fsmount01.c | 99 ++++++++++++-------
 1 file changed, 63 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 43337e22e224..34d9365d4680 100644
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
 
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"move_mount() failed to attach to the mount point");
+		return;
+	}
+
 	if (tst_is_mounted_at_tmpdir(MNTPOINT)) {
 		SAFE_UMOUNT(MNTPOINT);
-		is_mounted = 0;
+		tst_res(TPASS, "%s: fsmount() passed", tc->name);
 	}
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
