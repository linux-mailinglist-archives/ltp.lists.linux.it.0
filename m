Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199916C3FD
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 15:34:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 888D13C25E7
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 15:34:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 95E223C12E6
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 15:34:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B2319200913
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 15:34:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 972A7B1C6;
 Tue, 25 Feb 2020 14:34:25 +0000 (UTC)
Date: Tue, 25 Feb 2020 15:23:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200225142314.GD62318@gacrux.arch.suse.de>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/10] Add new LTP tests related to fsmount
 family of syscalls
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I addressed some of my concerns here (+ add fspick.h to remove a bit of the duplicity):
https://github.com/pevik/ltp/tree/Viresh_Kumar/fsmount.v3.fixes

LGTM, but I'd like to have more look.
I'd also appreciate somebody else to have look.

Kind regards,
Petr

diff --git lib/tst_device.c lib/tst_device.c
index c53ae36cf..d99fb8bc5 100644
--- lib/tst_device.c
+++ lib/tst_device.c
@@ -404,7 +404,7 @@ int tst_is_mounted(const char *path)
 	SAFE_FCLOSE(NULL, file);
 
 	if (!ret)
-		tst_resm(TWARN, "No device is mounted at %s", path);
+		tst_resm(TINFO, "No device is mounted at %s", path);
 
 	return ret;
 }
diff --git testcases/kernel/syscalls/fsconfig/fsconfig02.c testcases/kernel/syscalls/fsconfig/fsconfig02.c
index d51a869ac..c3722691a 100644
--- testcases/kernel/syscalls/fsconfig/fsconfig02.c
+++ testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -7,8 +7,8 @@
 #include "tst_test.h"
 #include "lapi/fsmount.h"
 
-int fd = -1, temp_fd = -1, invalid_fd = -1;
-int aux_0 = 0, aux_1 = 1, aux_fdcwd = AT_FDCWD, aux_minus1 = -1;
+static int fd = -1, temp_fd = -1, invalid_fd = -1;
+static int aux_0 = 0, aux_1 = 1, aux_fdcwd = AT_FDCWD, aux_minus1 = -1;
 
 static struct tcase {
 	char *name;
@@ -51,9 +51,7 @@ static void setup(void)
 {
 	fsopen_supported_by_kernel();
 
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
+	TEST(fd = fsopen(tst_device->fs_type, 0));
 	if (fd == -1)
 		tst_brk(TBROK | TERRNO, "fsopen() failed");
 
diff --git testcases/kernel/syscalls/fsmount/fsmount01.c testcases/kernel/syscalls/fsmount/fsmount01.c
index b7810df2f..6774a43ff 100644
--- testcases/kernel/syscalls/fsmount/fsmount01.c
+++ testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -41,13 +41,12 @@ static void run(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	int sfd, mfd;
 
-	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
-	if (TST_RET == -1) {
+	TEST(sfd = fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
+	if (sfd == -1) {
 		tst_res(TBROK | TTERRNO, "fsopen() on %s failed",
 			tst_device->fs_type);
 		return;
 	}
-	sfd = TST_RET;
 
 	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET < 0) {
diff --git testcases/kernel/syscalls/fsmount/fsmount02.c testcases/kernel/syscalls/fsmount/fsmount02.c
index c61caa8e8..90dbff1fd 100644
--- testcases/kernel/syscalls/fsmount/fsmount02.c
+++ testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -33,9 +33,7 @@ static void setup(void)
 {
 	fsopen_supported_by_kernel();
 
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
+	TEST(fd = fsopen(tst_device->fs_type, 0));
 	if (fd == -1)
 		tst_brk(TBROK | TERRNO, "fsopen() failed");
 
diff --git testcases/kernel/syscalls/fsopen/fsopen01.c testcases/kernel/syscalls/fsopen/fsopen01.c
index 51fab25d9..84cb38fcf 100644
--- testcases/kernel/syscalls/fsopen/fsopen01.c
+++ testcases/kernel/syscalls/fsopen/fsopen01.c
@@ -25,9 +25,7 @@ static void run(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	int fd, fsmfd;
 
-	TEST(fsopen(tst_device->fs_type, tc->flags));
-	fd = TST_RET;
-
+	TEST(fd = fsopen(tst_device->fs_type, tc->flags));
 	if (fd == -1) {
 		tst_res(TFAIL | TERRNO, "fsopen() failed");
 		return;
diff --git testcases/kernel/syscalls/fspick/fspick.h testcases/kernel/syscalls/fspick/fspick.h
new file mode 100644
index 000000000..8d42eff05
--- /dev/null
+++ testcases/kernel/syscalls/fspick/fspick.h
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef FSPICK_H__
+#define FSPICK_H__
+
+#define MNTPOINT	"mntpoint"
+
+static int ismounted;
+
+static void cleanup(void)
+{
+	if (ismounted)
+		SAFE_UMOUNT(MNTPOINT);
+}
+
+static void setup(void)
+{
+	int fd, fsmfd;
+
+	fsopen_supported_by_kernel();
+
+	TEST(fd = fsopen(tst_device->fs_type, 0));
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+	}
+
+	TEST(fsmfd = fsmount(fd, 0, 0));
+	SAFE_CLOSE(fd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsmount() failed");
+
+	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
+			MOVE_MOUNT_F_EMPTY_PATH));
+	SAFE_CLOSE(fsmfd);
+
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "move_mount() failed");
+
+	ismounted = 1;
+
+	if (!tst_is_mounted(MNTPOINT))
+		tst_brk(TBROK | TERRNO, "device not mounted");
+}
+
+#endif /* FSPICK_H__ */
diff --git testcases/kernel/syscalls/fspick/fspick01.c testcases/kernel/syscalls/fspick/fspick01.c
index 9d4b28a6a..217cb1f12 100644
--- testcases/kernel/syscalls/fspick/fspick01.c
+++ testcases/kernel/syscalls/fspick/fspick01.c
@@ -6,8 +6,7 @@
  */
 #include "tst_test.h"
 #include "lapi/fsmount.h"
-
-#define MNTPOINT	"mntpoint"
+#include "fspick.h"
 
 #define TCASE_ENTRY(_flags)	{.name = "Flag " #_flags, .flags = _flags}
 
@@ -21,58 +20,6 @@ static struct tcase {
 	TCASE_ENTRY(FSPICK_EMPTY_PATH),
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
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
-	if (fd == -1)
-		tst_brk(TBROK | TERRNO, "fsopen() failed");
-
-	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
-	}
-
-	TEST(fsmount(fd, 0, 0));
-	SAFE_CLOSE(fd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TERRNO, "fsmount() failed");
-
-	fsmfd = TST_RET;
-	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
-			MOVE_MOUNT_F_EMPTY_PATH));
-	SAFE_CLOSE(fsmfd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TERRNO, "move_mount() failed");
-
-	ismounted = 1;
-
-	if (!tst_is_mounted(MNTPOINT))
-		tst_brk(TBROK | TERRNO, "device not mounted");
-}
-
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
diff --git testcases/kernel/syscalls/fspick/fspick02.c testcases/kernel/syscalls/fspick/fspick02.c
index c702140ec..dc552c754 100644
--- testcases/kernel/syscalls/fspick/fspick02.c
+++ testcases/kernel/syscalls/fspick/fspick02.c
@@ -6,8 +6,7 @@
  */
 #include "tst_test.h"
 #include "lapi/fsmount.h"
-
-#define MNTPOINT	"mntpoint"
+#include "fspick.h"
 
 static struct tcase {
 	char *name;
@@ -21,59 +20,6 @@ static struct tcase {
 	{"invalid-flags", AT_FDCWD, MNTPOINT, 0x10, EINVAL},
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
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
-	if (fd == -1)
-		tst_brk(TBROK | TERRNO, "fsopen() failed");
-
-	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
-	}
-
-	TEST(fsmount(fd, 0, 0));
-	SAFE_CLOSE(fd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TERRNO, "fsmount() failed");
-
-	fsmfd = TST_RET;
-
-	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
-			MOVE_MOUNT_F_EMPTY_PATH));
-	SAFE_CLOSE(fsmfd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TERRNO, "move_mount() failed");
-
-	ismounted = 1;
-
-	if (!tst_is_mounted(MNTPOINT))
-		tst_brk(TBROK | TERRNO, "device not mounted");
-}
-
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
diff --git testcases/kernel/syscalls/move_mount/move_mount01.c testcases/kernel/syscalls/move_mount/move_mount01.c
index aef0e15e1..b5513dd18 100644
--- testcases/kernel/syscalls/move_mount/move_mount01.c
+++ testcases/kernel/syscalls/move_mount/move_mount01.c
@@ -28,25 +28,23 @@ static void run(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	int fsmfd, fd;
 
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
+	TEST(fd = fsopen(tst_device->fs_type, 0));
 	if (fd == -1) {
-		tst_res(TBROK | TERRNO, "fsopen() failed");
+		tst_res(TFAIL | TERRNO, "fsopen() failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
 		return;
 	}
 
@@ -54,7 +52,7 @@ static void run(unsigned int n)
 	SAFE_CLOSE(fd);
 
 	if (TST_RET == -1) {
-		tst_res(TBROK | TERRNO, "fsmount() failed");
+		tst_res(TFAIL | TERRNO, "fsmount() failed");
 		return;
 	}
 
diff --git testcases/kernel/syscalls/move_mount/move_mount02.c testcases/kernel/syscalls/move_mount/move_mount02.c
index 98b7be77f..d85381e90 100644
--- testcases/kernel/syscalls/move_mount/move_mount02.c
+++ testcases/kernel/syscalls/move_mount/move_mount02.c
@@ -32,25 +32,23 @@ static void run(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	int fd;
 
-	TEST(fsopen(tst_device->fs_type, 0));
-	fd = TST_RET;
-
+	TEST(fd = fsopen(tst_device->fs_type, 0));
 	if (fd == -1) {
-		tst_res(TBROK | TERRNO, "fsopen() failed");
+		tst_res(TFAIL | TERRNO, "fsopen() failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TERRNO, "fsconfig() failed");
 		return;
 	}
 
@@ -58,7 +56,7 @@ static void run(unsigned int n)
 	SAFE_CLOSE(fd);
 
 	if (TST_RET == -1) {
-		tst_res(TBROK | TERRNO, "fsmount() failed");
+		tst_res(TFAIL | TERRNO, "fsmount() failed");
 		return;
 	}
 
diff --git testcases/kernel/syscalls/open_tree/open_tree01.c testcases/kernel/syscalls/open_tree/open_tree01.c
index ef603cc27..191d3196d 100644
--- testcases/kernel/syscalls/open_tree/open_tree01.c
+++ testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -52,18 +52,18 @@ static void run(unsigned int n)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig failed");
+		tst_res(TBROK | TERRNO, "fsconfig() failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TBROK | TERRNO, "fsconfig failed");
+		tst_res(TBROK | TERRNO, "fsconfig() failed");
 		return;
 	}
 
-	TEST(fsmount(fd, 0, 0));
+	TEST(fsmfd = fsmount(fd, 0, 0));
 	SAFE_CLOSE(fd);
 
 	if (TST_RET == -1) {
@@ -71,8 +71,6 @@ static void run(unsigned int n)
 		return;
 	}
 
-	fsmfd = TST_RET;
-
 	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
 			MOVE_MOUNT_F_EMPTY_PATH));
 	SAFE_CLOSE(fsmfd);
diff --git testcases/kernel/syscalls/open_tree/open_tree02.c testcases/kernel/syscalls/open_tree/open_tree02.c
index 5d0ffcf4e..2823531cb 100644
--- testcases/kernel/syscalls/open_tree/open_tree02.c
+++ testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -44,22 +44,21 @@ static void setup(void)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig failed");
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
 	}
 
-	TEST(fsmount(fd, 0, 0));
+	TEST(fsmfd = fsmount(fd, 0, 0));
 	SAFE_CLOSE(fd);
 
 	if (TST_RET == -1)
 		tst_brk(TBROK | TERRNO, "fsmount() failed");
 
-	fsmfd = TST_RET;
 	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
 			MOVE_MOUNT_F_EMPTY_PATH));
 	SAFE_CLOSE(fsmfd);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
