Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id 157B316405C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB42B3C24B7
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2CFCD3C250F
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:19 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 830171001569
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:27:34 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id 84so12211221pfy.6
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KSAF2Jf76CZlQBJhVR9dDoyC1lUCNDBG/NtvxmbRwnE=;
 b=xmvkzEb8O9mZ0+GStG2tVLLEUu1yPx6Dy5mLTFjgwEvX9vpBuwEMax9+TppzUxcYQ9
 SmRlhUklqJ+8MMgcvzdp6Eb0E54nuwpfRtjrdQvNuOJtpLn2ECjIvoHhCBLWLBKQNmEh
 Fx2Fl1yWxHpfTHdw7daRzKeeYJKTXmT54yYKytmwUBfvWYBZI0U2sJgUdeNjCvwa7j9G
 nn3fNQ2auuBZ1Qq8snN6Q2qnYyTMidjuWS6dzTYFe8hbKLPpeTpstWknuDu5MKfGd4h9
 UBB9EurZ62oVi34/jZ1pPfZb+nkkhsoid64iCuBPm6aXSt/4drz9gfsU63IECe4nl6om
 lhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSAF2Jf76CZlQBJhVR9dDoyC1lUCNDBG/NtvxmbRwnE=;
 b=SPRCwkdcsZezaFY7R1MQgrI/C8BSe/wQQv66L9hNPYqvMWalAwZ92vXqvNBDUZWtU9
 7ZPnirRKsEkvpRY05D3smu3mKYhcr0bq+d6P4rygl1EZBIf+OI70uwZ/H0+JMJ4Ul6zG
 ju6uyI+APrlzu+F+oJIf2UTxQkzMFlnXD/3GewFHhNQB/+1BmBClWATOcuSNEeDsA9Tc
 BFa6UU9E+6D+9VWulUpICA1zDC09F7a8Gxqe57XwYspcejQ9Kz90sipB+4kZ88BV3ZHx
 8b75TfID/kmMHEDJXIg6wklOdTmuiL+D4+yJ0e+WkvawUMTY/eHtGrek22TexWdqBTHT
 3wFw==
X-Gm-Message-State: APjAAAXI+qv+DSPz9GsF0VncoDYBJ98ifak2n3l7d9ZeEN/ca3bMkzFr
 TO4xmjHypiPVyjJAS2T6r3ojoaSo2IM=
X-Google-Smtp-Source: APXvYqwtC2foXIVAGFDtPk8mzxcB7OPdw+rWL6448LnO2N9/GVrk298tlwsVnfzyG8+68I0h1P2NSw==
X-Received: by 2002:a63:7311:: with SMTP id o17mr6093017pgc.377.1582104496443; 
 Wed, 19 Feb 2020 01:28:16 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id p23sm1974697pgn.92.2020.02.19.01.28.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:15 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:57:57 +0530
Message-Id: <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 01/10] tst_device: Add tst_ismount() helper
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

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_device.h                          |  6 +++++
 lib/tst_device.c                              | 25 +++++++++++++++++++
 testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
 3 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 3ad33bd48e10..3f4aaf6f75ab 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -36,6 +36,12 @@ extern struct tst_device *tst_device;
  */
 int tst_umount(const char *path);
 
+/*
+ * Verifies if an earlier mount is successful or not.
+ * @path: Mount path to verify
+ */
+int tst_ismount(const char *path);
+
 /*
  * Clears a first few blocks of the device. This is needed when device has
  * already been formatted with a filesystems, subset of mkfs.foo utils aborts
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 8b5459def1cb..4d66b5d45996 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -386,6 +386,31 @@ int tst_umount(const char *path)
 	return -1;
 }
 
+int tst_ismount(const char *path)
+{
+	char line[256];
+	FILE *file;
+	int ret = -1;
+
+	file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, path) != NULL) {
+			ret = 0;
+			break;
+		}
+	}
+
+	SAFE_FCLOSE(NULL, file);
+
+	if (ret) {
+		errno = ENOENT;
+		tst_resm(TWARN, "No device is mounted at %s", path);
+	}
+
+	return ret;
+}
+
 int find_stat_file(const char *dev, char *path, size_t path_len)
 {
 	const char *devname = strrchr(dev, '/') + 1;
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 83185b48aedd..5b8e95176728 100644
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
+	if (!tst_ismount(MNTPOINT)) {
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
