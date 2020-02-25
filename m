Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114616BEF8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:40:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FD433C25E7
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:40:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2503E3C04FD
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:40:01 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 207B860007F
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:39:58 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id y1so5322572plp.7
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 02:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXbJvHIyrFLwTMGEI2jeklDiyghmnNId6hn87SUYXkQ=;
 b=V+2dCl/LcRyf4K/R2zulN+NlyNzCypjRmDZCvUKvDMYBwxEwSXRqhk6ZEA+iiniY6I
 kwhZa1RExwB21z6+DLp+I70OIbtoUCiJzFBaeJyqvchITuwbaF4H6W/KAXp8yqYL4MTx
 iFSmiD4O8OakG4uEy6JNuUbgrxTLdUzFMGyS9ePIJkuQCSCkbtaVDl5OXJHmS+Rl5rdn
 9epFSyd6+8+3rzuwlOlG0ZkiY4wJ9WVSGzkl0onsMW03N0y7VkIiOBcEBkaHO+NVqU/h
 ZiYJwEIiFEYZVDjYCc5X5vXfjSya8R81VaCHXCJG80F+1XYz7ro5Ki8WbewjVKzV/yaN
 hipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXbJvHIyrFLwTMGEI2jeklDiyghmnNId6hn87SUYXkQ=;
 b=FtPjoF+mq0qDFUYmNA9CsFpyw4u+LgDeg4CT9H6hmqM2qFG8pSINwNVNtY8yQs2/pH
 2udUsED4fPp1fW8SLwH7GFV0yTYCZzXe2Mfxf4qxbRjE85CFy08pcHZtUfSbt/Jsll+q
 /GBD6+WWxeshYNIkApRWkgX9E20IvRX+zDhBjtJE6d3jwzMtMrKr99qcmpQ4o3uZhwSd
 PjgK17kGQb+a0ucO/DCkjrm5E9sqVOd63SBirC4WfVHIy+uTt59K2bfaGwlNUcM33GMt
 6HPLYfTVkBBTY6g9qRXCQnvIBE1F15UMDZsal6CHMdYbIPLoR0agmicN8Zmmydvg7oGs
 U3dQ==
X-Gm-Message-State: APjAAAUwDxsT5w+0wk9tfFLz6MPFMDK6/GoBN+PzfQfQNXNi3wuS+6Ac
 996+vrM/nAQkPywrwBF5CjqM5Tvs/gI=
X-Google-Smtp-Source: APXvYqwaXqWM/nFwIwM89eTm2YMalKM2tNlSNTWjJV3+aN7oS5xJB16o1ks3T5yFRTA4b7gmr2e8cQ==
X-Received: by 2002:a17:902:8eca:: with SMTP id
 x10mr52905499plo.94.1582627196071; 
 Tue, 25 Feb 2020 02:39:56 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id s125sm16608070pgc.53.2020.02.25.02.39.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:39:55 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 16:09:31 +0530
Message-Id: <305330ad290ce4802d832e02765b8723a976d4a7.1582627066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
References: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V4 1/10] tst_device: Add tst_is_mounted() helper
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
to the standard library and renames it to tst_is_mounted(). The helper
can be used across different files now.

Minor modifications are also done to the helper.

Acked-by: Li Wang <liwang@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V3->V4:
- s/TWARN/TINFO
- Fix commit log.

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
index 8b5459def1cb..d99fb8bc554a 100644
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
+		tst_resm(TINFO, "No device is mounted at %s", path);
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
