Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6716B9D5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28BEA3C25EB
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 23E003C25FD
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:40:58 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4AE9D1A0148E
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:40:57 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id y30so6358036pga.13
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m1+g+Nh+OU/bDaFhyeQgMtxQSSrOA2Bo7+ItpHMnZCU=;
 b=DAvKNuWaqd4RqggO2BSNfzpLho4d8ejXIRFFyRJ5sRcy69DXeKohAaL855Ixa9lwel
 1CBT3JHZVhFum/Q8DzXYdQK66qXQ5XKbDJv4lv/ZqE43I/C67xpZVbyID1kqYl4vbiZC
 oV9G2qFTRwDccvVNXi5HgYAQkXxgugXiRa6XeMUWkvLgNQj45bjebCYawE7aUSM5W+q0
 6/JHkdwvYca9sGw7hXhGivF5C2yt1KyB4yZLQac8ksfINTX9qyjuIDIc6v1C+goZoHXw
 /pl2abDx6EgBxoJghWkBju6L3cAYuiRSIxkt086UnVweycWeGXPyFlrgIX0nasPVV/2U
 dryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1+g+Nh+OU/bDaFhyeQgMtxQSSrOA2Bo7+ItpHMnZCU=;
 b=i0FjjBL2ooqQjEag2S4jejzp67tBFBjvtRJTNb4PbAbaAsklpQxS2KPQ/CmfPaDaFr
 rL/hkT5o/3r8+ni3HXwrH4nIWt058w1zNp4r0QwcW6W+CbcFl01s9uCARt2LIlZFdDGG
 Lu6NpCWXuEB/R0ar6KBaNVz2RMNCXZx+3cVxnMfriUTiM0nnt9JbFnJK3/yhKwhOIHP1
 riDEZ4d5xb0PWhKTwzmyCcXHiPN63XpotNnIQ3sTIfU0+TLkSzvHirbhrZiXTI1BU/Qk
 nLyhXu0yq3pIpxIR9sfNMaB0MyY8qM4wUonDHPK18XrMsvXMzFED0xX2JMZm+W9IC5IN
 MkUw==
X-Gm-Message-State: APjAAAV/e01WR56YXeaDwddw4BabuUy82SP4BsEewRqv7W4joJCoVq+P
 oC8aXh6o9xPgzDA57z2h0eFcmyJeKQo=
X-Google-Smtp-Source: APXvYqxrdib438QFWugSwqUDTcqvsnxlGcWKPm34vHyft1H7Yis0IvjwhYTDmEQ6fWeNhQdikp+OxQ==
X-Received: by 2002:a62:33c6:: with SMTP id
 z189mr55707047pfz.246.1582612855328; 
 Mon, 24 Feb 2020 22:40:55 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id j125sm15362021pfg.160.2020.02.24.22.40.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:40:54 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:39 +0530
Message-Id: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 01/10] tst_device: Add tst_ismount() helper
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

This patch moves the ismount() helper added to the fsmount syscall tests
to the standard library and renames it to tst_ismount(). The helper can
be used across different files now.

Minor modifications are also done to the helper.

Acked-by: Li Wang <liwang@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_device.h                          |  6 +++++
 lib/tst_device.c                              | 23 +++++++++++++++++
 testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index f5609f5986bb..bd6910672d2f 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -36,6 +36,12 @@ extern struct tst_device *tst_device;
  */
 int tst_umount(const char *path);
 
+/*
+ * Verifies if an earlier mount is successful or not.
+ * @path: Mount path to verify
+ */
+int tst_is_mounted(const char *path);
+
 /*
  * Clears a first few blocks of the device. This is needed when device has
  * already been formatted with a filesystems, subset of mkfs.foo utils aborts
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 8b5459def1cb..c53ae36cf8b9 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -386,6 +386,29 @@ int tst_umount(const char *path)
 	return -1;
 }
 
+int tst_is_mounted(const char *path)
+{
+	char line[256];
+	FILE *file;
+	int ret = 0;
+
+	file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, path) != NULL) {
+			ret = 1;
+			break;
+		}
+	}
+
+	SAFE_FCLOSE(NULL, file);
+
+	if (!ret)
+		tst_resm(TWARN, "No device is mounted at %s", path);
+
+	return ret;
+}
+
 int find_stat_file(const char *dev, char *path, size_t path_len)
 {
 	const char *devname = strrchr(dev, '/') + 1;
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 83185b48aedd..8e29a1537334 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -12,30 +12,10 @@
 #include "tst_test.h"
 #include "lapi/fcntl.h"
 #include "lapi/fsmount.h"
-#include "tst_safe_stdio.h"
 
-#define LINELENGTH 256
 #define MNTPOINT "newmount_point"
 static int sfd, mfd, is_mounted;
 
-static int ismount(char *mntpoint)
-{
-	int ret = 0;
-	FILE *file;
-	char line[LINELENGTH];
-
-	file = SAFE_FOPEN("/proc/mounts", "r");
-
-	while (fgets(line, sizeof(line), file)) {
-		if (strstr(line, mntpoint) != NULL) {
-			ret = 1;
-			break;
-		}
-	}
-	SAFE_FCLOSE(file);
-	return ret;
-}
-
 static void cleanup(void)
 {
 	if (is_mounted)
@@ -76,12 +56,9 @@ static void test_fsmount(void)
 	tst_res(TPASS, "move_mount() attached to the mount point");
 	SAFE_CLOSE(mfd);
 
-	if (ismount(MNTPOINT)) {
-		tst_res(TPASS, "device mounted");
+	if (tst_is_mounted(MNTPOINT)) {
 		SAFE_UMOUNT(MNTPOINT);
 		is_mounted = 0;
-	} else {
-		tst_res(TFAIL, "device not mounted");
 	}
 }
 
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
