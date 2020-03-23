Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157018F027
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 08:12:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3DAF3C4E5B
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 08:12:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9D3DB3C4E47
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 08:12:08 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6DBA814011A9
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 08:12:07 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id j1so4380634pfe.0
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3eAoH3eHGrD2yFveUaEjAPU89scw0+JdWnzddBSqsH0=;
 b=oyYbZcyMtsg2AKFXsZt+brDjkfyisXYYoMOUeXEfQYnTiBnd713bWdgThMaBSeQlbx
 iEuVEdHi2tBGu4BIQ7+BVqj2bgyJB+J9M/jAqmoAU1fXdcYDJnfZYXjndW67aZSIN7ms
 JtsWUE4FmuzdRHsQ/Zbv3J29HPwSFYWGUhIPn9HQ3riwehys7H/x5JLA0XUYpNvduqQz
 lKrP88jEkVBMl1+95VvJ61STvdsP+G2zio3iFOgRcdL5S65hXyE3sQ3qc/fw4sZhuhbr
 SNeujvdaetoO4jOanC7+VaNOfEOsF239qVN4Hknq4BdE47wtn+jnQU1Ak5RXM0p9055N
 ALUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3eAoH3eHGrD2yFveUaEjAPU89scw0+JdWnzddBSqsH0=;
 b=QbsstVqVUPUzM5pz4F2CWSd39Lq9X+i28TM4jdsdK2OoAN39NN/oV/Wg1XiY3Q0U1H
 xj5VPBpMqcLoXxk8u54cnybflHaLvUE99X++B2RQwitLqiCstSOVpg+gx2YYrXS1uuxP
 jx4QnU2eac8uVnwwAHJDeWBZKh2eIXbCU+v2bOYTRio6WpBBqREsagi9nIloZh5g7Iln
 pYc+g2zZlYsv6KPflpIzeuR0nvSOX8q2E9MPB/TI1lu7zhN1ka6DyMd1T4b/tY26bVbe
 lpjFOVoAJaxKjU/y7BXJeAzti5yMOXWbTPA+YTBUjSXEbvX9b8kfvYvh4bOXEitXACc4
 9BfQ==
X-Gm-Message-State: ANhLgQ3LiE0GdDYHbbC74wSjpICjRdqCBOn8hqmiJJsP4vEcjaK4C55f
 R92Ph8Aa4zP3TPsJiZNFzSAFOQ9lFj0=
X-Google-Smtp-Source: ADFU+vu43E43M5Qrito6Wrk9+N4tDl6oHDTYPPjjuCCwAy8dHGScaSwOPDXpygzzVWRfZ8VeyruofQ==
X-Received: by 2002:a65:6446:: with SMTP id s6mr20990583pgv.5.1584947525623;
 Mon, 23 Mar 2020 00:12:05 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id n22sm11244367pjq.36.2020.03.23.00.12.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Mar 2020 00:12:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 12:41:59 +0530
Message-Id: <c1cee81b06a1195635eca1791e0af9c22798e9f7.1584947466.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <aa66c041b2eca3f874056de72ca3dcdf8825a6b5.1584947466.git.viresh.kumar@linaro.org>
References: <aa66c041b2eca3f874056de72ca3dcdf8825a6b5.1584947466.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/open_tree: Set .mount_device to get rid
 of mounting related code
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

We don't necessarily need to work with the fsmount() related syscalls to
initially mount the device, we can set .mount_device instead and get rid
of a lot of code.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/open_tree/open_tree01.c   | 53 ++----------------
 .../kernel/syscalls/open_tree/open_tree02.c   | 54 +------------------
 2 files changed, 6 insertions(+), 101 deletions(-)

diff --git a/testcases/kernel/syscalls/open_tree/open_tree01.c b/testcases/kernel/syscalls/open_tree/open_tree01.c
index ddaabed810bd..f217866bbb2b 100644
--- a/testcases/kernel/syscalls/open_tree/open_tree01.c
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -38,54 +38,12 @@ static void setup(void)
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
-	int fd, fsmfd, otfd;
-
-	TEST(fd = fsopen(tst_device->fs_type, 0));
-	if (fd == -1) {
-		tst_res(TFAIL | TTERRNO, "fsopen() failed");
-		return;
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
-		return;
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
-		return;
-	}
-
-	TEST(fsmfd = fsmount(fd, 0, 0));
-	SAFE_CLOSE(fd);
-
-	if (fsmfd == -1) {
-		tst_res(TFAIL | TTERRNO, "fsmount() failed");
-		return;
-	}
-
-	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
-			MOVE_MOUNT_F_EMPTY_PATH));
-	SAFE_CLOSE(fsmfd);
-
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "move_mount() failed");
-		return;
-	}
-
-	if (!tst_is_mounted_at_tmpdir(MNTPOINT)) {
-		tst_res(TFAIL | TTERRNO, "device not mounted");
-		return;
-	}
+	int otfd;
 
 	TEST(otfd = open_tree(AT_FDCWD, MNTPOINT, tc->flags | OPEN_TREE_CLONE));
 	if (otfd == -1) {
 		tst_res(TFAIL | TTERRNO, "open_tree() failed");
-		goto out;
+		return;
 	}
 
 	TEST(move_mount(otfd, "", AT_FDCWD, OT_MNTPOINT,
@@ -94,16 +52,13 @@ static void run(unsigned int n)
 
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "move_mount() failed");
-		goto out;
+		return;
 	}
 
 	if (tst_is_mounted_at_tmpdir(OT_MNTPOINT)) {
 		SAFE_UMOUNT(OT_MNTPOINT);
 		tst_res(TPASS, "%s: open_tree() passed", tc->name);
 	}
-
-out:
-	SAFE_UMOUNT(MNTPOINT);
 }
 
 static struct tst_test test = {
@@ -112,7 +67,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-	.format_device = 1,
+	.mount_device = 1,
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.dev_fs_flags = TST_FS_SKIP_FUSE,
diff --git a/testcases/kernel/syscalls/open_tree/open_tree02.c b/testcases/kernel/syscalls/open_tree/open_tree02.c
index 76a750ae412b..32ad1aefe556 100644
--- a/testcases/kernel/syscalls/open_tree/open_tree02.c
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -21,55 +21,6 @@ static struct tcase {
 	{"invalid-flags", AT_FDCWD, MNTPOINT, 0xFFFFFFFF, EINVAL},
 };
 
-static int ismounted;
-
-static void cleanup(void)
-{
-	if (ismounted)
-		SAFE_UMOUNT(MNTPOINT);
-}
-
-static void setup(void)
-{
-	int fd, fsmfd;
-
-	fsopen_supported_by_kernel();
-
-	TEST(fd = fsopen(tst_device->fs_type, 0));
-	if (fd == -1)
-		tst_brk(TBROK | TTERRNO, "fsopen() failed");
-
-	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
-	}
-
-	TEST(fsmfd = fsmount(fd, 0, 0));
-	SAFE_CLOSE(fd);
-
-	if (fsmfd == -1)
-		tst_brk(TBROK | TTERRNO, "fsmount() failed");
-
-	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
-			MOVE_MOUNT_F_EMPTY_PATH));
-	SAFE_CLOSE(fsmfd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "move_mount() failed");
-
-	if (!tst_is_mounted_at_tmpdir(MNTPOINT))
-		tst_brk(TBROK | TTERRNO, "device not mounted");
-
-	ismounted = 1;
-}
-
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
@@ -95,10 +46,9 @@ static void run(unsigned int n)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = run,
-	.setup = setup,
-	.cleanup = cleanup,
+	.setup = fsopen_supported_by_kernel,
 	.needs_root = 1,
-	.format_device = 1,
+	.mount_device = 1,
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.dev_fs_flags = TST_FS_SKIP_FUSE,
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
