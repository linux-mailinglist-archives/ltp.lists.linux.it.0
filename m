Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6518F025
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 08:12:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29E443C4E3E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 08:12:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D31D33C4E34
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 08:12:05 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C92BA600A42
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 08:12:04 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id d17so6168808pgo.0
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEM6Vfoz13ZZXhU0kYejvpvfZFacZnBqNazPhUoKSKk=;
 b=vlbpKn2WB7WJlGIf66uQ8I0HHIj1Xy/m/ApA0JIxliOrLmHlIgahelhUagMExlGTo1
 7YnSckk+6JBVFqv3EhkTfVxGpZoRVd8fAeAABkm05k2F0VAW1n58IAeVDPk5hEMNP2wQ
 NogvfzR9HwTTqgeKz0qKfizm0KMpuVB50tLXEbIrM4huD2GHa4QHeVt0di+X27E5g34L
 sG+tKAGDrLyUzQ9uEDaThqHxkHD2UQHuAD49lZFLS3CNB+GU4sHM/+m9YweZcwIGKEZh
 Vz8s3i+c5WfEY4kZpcvMK9jwhYfDwmi16oi58rVm1uQ9akGyvzJ2SrNJUoeb8/WXK1Oz
 dixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEM6Vfoz13ZZXhU0kYejvpvfZFacZnBqNazPhUoKSKk=;
 b=Y6SPgdZb3fki1H2iuWe3ubBaoghchvbGC9IIsArIuvywPB7HlmiyaZev/CcROzptlL
 PHC0G310CXqikFDA2TkZCzc5iBVmquneqF6TY3a9MV4yTzkBcDFoTsiK0wlx5/YfEEjN
 jDfbc4rCb+hQTah6IHLhJbJaYwUhVufLAMDahqYScZvuHGGLwqul3ymNM1sbOIoqguWU
 NAuGE9dldYdEJYR0RYIi+Xh3f25mfUNsKoFbfTX7pUSEpuUJEwfF0PXfWH1UAEwg65KI
 EmdIpjjT/48/hMO+6mzBW7ELHo71TYthBMvHKDEVl4IaXL+VaLX3LyfUJjDbuZ0z/6ui
 42zw==
X-Gm-Message-State: ANhLgQ3SzerMfqueI2KtecNjeBf/v6XMZ0HrAvFQOdNwMwBjApRakRZz
 Ot3IvrjftAMLTBRKTWYHaV/LpYIXjX0=
X-Google-Smtp-Source: ADFU+vvfM7SdFusBbPGGCfgooohjzVp89viLFqtILGo9ENevjUvWL0Xw9z6ugs2+6FS5BPu6ZIu8pQ==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr22705829pfa.139.1584947522883; 
 Mon, 23 Mar 2020 00:12:02 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id q71sm6049125pfc.92.2020.03.23.00.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Mar 2020 00:12:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 12:41:58 +0530
Message-Id: <aa66c041b2eca3f874056de72ca3dcdf8825a6b5.1584947466.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/fspick: Set .mount_device to get rid of
 mounting related code
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
 testcases/kernel/syscalls/fspick/fspick.h   | 60 ---------------------
 testcases/kernel/syscalls/fspick/fspick01.c |  7 ++-
 testcases/kernel/syscalls/fspick/fspick02.c |  8 +--
 3 files changed, 7 insertions(+), 68 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/fspick/fspick.h

diff --git a/testcases/kernel/syscalls/fspick/fspick.h b/testcases/kernel/syscalls/fspick/fspick.h
deleted file mode 100644
index 4be296ee79da..000000000000
--- a/testcases/kernel/syscalls/fspick/fspick.h
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
- */
-
-#ifndef FSPICK_H__
-#define FSPICK_H__
-
-#define MNTPOINT	"mntpoint"
-
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
-		tst_brk(TBROK | TERRNO, "fsopen() failed");
-
-	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
-	}
-
-	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
-	if (TST_RET == -1) {
-		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
-	}
-
-	TEST(fsmfd = fsmount(fd, 0, 0));
-	SAFE_CLOSE(fd);
-
-	if (fsmfd == -1)
-		tst_brk(TBROK | TERRNO, "fsmount() failed");
-
-	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
-			MOVE_MOUNT_F_EMPTY_PATH));
-	SAFE_CLOSE(fsmfd);
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TERRNO, "move_mount() failed");
-
-	if (!tst_is_mounted_at_tmpdir(MNTPOINT))
-		tst_brk(TBROK | TERRNO, "device not mounted");
-
-	ismounted = 1;
-}
-
-#endif /* FSPICK_H__ */
diff --git a/testcases/kernel/syscalls/fspick/fspick01.c b/testcases/kernel/syscalls/fspick/fspick01.c
index c84723805cb9..2f372f7f126c 100644
--- a/testcases/kernel/syscalls/fspick/fspick01.c
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -6,8 +6,8 @@
  */
 #include "tst_test.h"
 #include "lapi/fsmount.h"
-#include "fspick.h"
 
+#define MNTPOINT		"mntpoint"
 #define TCASE_ENTRY(_flags)	{.name = "Flag " #_flags, .flags = _flags}
 
 static struct tcase {
@@ -58,10 +58,9 @@ static void run(unsigned int n)
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
diff --git a/testcases/kernel/syscalls/fspick/fspick02.c b/testcases/kernel/syscalls/fspick/fspick02.c
index dc8f153ccc48..b9d020226856 100644
--- a/testcases/kernel/syscalls/fspick/fspick02.c
+++ b/testcases/kernel/syscalls/fspick/fspick02.c
@@ -6,7 +6,8 @@
  */
 #include "tst_test.h"
 #include "lapi/fsmount.h"
-#include "fspick.h"
+
+#define MNTPOINT		"mntpoint"
 
 static struct tcase {
 	char *name;
@@ -44,10 +45,9 @@ static void run(unsigned int n)
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
