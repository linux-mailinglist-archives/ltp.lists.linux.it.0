Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD62182FB9
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7797A3C5EA8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9F6903C5E95
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:24 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4A2AB2001A1
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:23 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so2578109pjb.0
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ON8eEx+ZXhfrRDbQm2MXvRKWX6E8Q+suApZNzid2uw=;
 b=HqWGocypUnObmf++Fv9jHYTs4zzrn4hY0hpG5EBVTbE1nQzrzzmWw7kYhCcZgP+Z99
 yGjHPcUXO8RhVMOlODiS9pXw3fNoc7LLg0MGMfpa9yBTGUspRnK9AMjtfudeQGLykSA5
 cfzn2Qh6b5Y3HvYd8CjQyl9JNYwFsuJOQ3RARLOfR3ztGBL2Ee7+HVKfADTBMxQnh5yA
 x9f+FLffJVg23CGzsqWwRUlxTVPvDvnWFrCwanoVWI+O7qC4GsBeelYpGCEQeQj+7wNl
 BHGxBbykxkKd+0eunsi+lHKgc135FsHJtl01NGaYIQoHKtO5bPi1D/4VeSlN9xcDS9W/
 bPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ON8eEx+ZXhfrRDbQm2MXvRKWX6E8Q+suApZNzid2uw=;
 b=ZV30E3Eq3N236SbdSZYpkS7goZCySrnUpkAY367YURBEvz5oRHgrjGr1OXWatfWgkA
 /6aKw6Bg3ZhYwmAK/Cu0Q3zNNCokJrM/4GeR0UC1+WyzE50qVDghuuTYlhbQodkXvg2p
 9adapZB2DOUZaPHhIkZatc3eXXwoX4unJ4X8Zr6FtzmEm4oeDgBOwrg5dvBhJKgY6kga
 1yYL/QWSVTRJko7wW/gvfBDW6dpBkZXcljOOApOYeRYa46IyQXXea2YjoIHBhJok2Xig
 S7bJ8GStSSDVH4CU2kejSsZxYESozOWgVm8tNkydi6XJtxmSEhM1j+w51W3GQxNXdp0D
 nx9w==
X-Gm-Message-State: ANhLgQ2W16QGzbPH3vJNCRFrkzf4aVCkD/G7/IIJtTFlC6hHWfbb8386
 cc5b1asVBM7Tmvxx7OhhxniWrKJIwDI=
X-Google-Smtp-Source: ADFU+vsc/J4oOqpaQipPoxqpb+bYAKkvx5eZLG7asbg5z3H6Y0PHcEO7FcudwQnQchqKmIvh+tuVCA==
X-Received: by 2002:a17:902:db83:: with SMTP id
 m3mr8120114pld.166.1584014481387; 
 Thu, 12 Mar 2020 05:01:21 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id j12sm38389648pga.78.2020.03.12.05.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:01 +0530
Message-Id: <4ee56e50f8b239ce74ec295bdd1caa8395da509e.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V6 01/10] tst_device: Add tst_is_mounted() and
 tst_is_mounted_at_tmpdir() helpers
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

This patch moves the ismount() helper added to the fsmount syscall tests
to the standard library and renames it to tst_is_mounted() and also adds
a new helper tst_is_mounted_at_tmpdir(). These helpers can be used
across different files now.

Minor modifications are also done to the helper.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_device.h                          |  7 +++
 lib/tst_device.c                              | 44 +++++++++++++++++++
 testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +----------
 3 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 04577eb1ac55..950cfe1edcba 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -24,6 +24,13 @@ extern struct tst_device *tst_device;
  */
 int tst_umount(const char *path);
 
+/*
+ * Verifies if an earlier mount is successful or not.
+ * @path: Mount path to verify
+ */
+int tst_is_mounted(const char *path);
+int tst_is_mounted_at_tmpdir(const char *path);
+
 /*
  * Clears a first few blocks of the device. This is needed when device has
  * already been formatted with a filesystems, subset of mkfs.foo utils aborts
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 8b5459def1cb..a703512d2aeb 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -386,6 +386,50 @@ int tst_umount(const char *path)
 	return -1;
 }
 
+int tst_is_mounted(const char *path)
+{
+	char line[PATH_MAX];
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
+int tst_is_mounted_at_tmpdir(const char *path)
+{
+	char cdir[PATH_MAX], mpath[PATH_MAX];
+	int ret;
+
+	if (!getcwd(cdir, PATH_MAX)) {
+		tst_resm(TWARN | TERRNO, "Failed to find current directory");
+		return 0;
+	}
+
+	ret = snprintf(mpath, PATH_MAX, "%s/%s", cdir, path);
+	if (ret < 0 || ret >= PATH_MAX) {
+		tst_resm(TWARN | TERRNO,
+			 "snprintf() should have returned %d instead of %d",
+			 PATH_MAX, ret);
+		return 0;
+	}
+
+	return tst_is_mounted(mpath);
+}
+
 int find_stat_file(const char *dev, char *path, size_t path_len)
 {
 	const char *devname = strrchr(dev, '/') + 1;
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 83185b48aedd..530a794647c1 100644
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
+	if (tst_is_mounted_at_tmpdir(MNTPOINT)) {
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
