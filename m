Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF2171004
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6339F3C25CC
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8EAF73C2599
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:50 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 41C53600B73
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:49 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id t14so639426plr.8
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATI559pEwoGPR6cAkpsnRh0mqiHeu0Fv8fR6tyKb0Ls=;
 b=YcjAgjfg7fuyuXbuOxvhBKqXOf16KCht+aihPceB63H2WeN9MQO59YTXult8I9P1MK
 xN3Jwo2Q8rAGskaE9OdHlNMIIPxhO3N7WBF9VPXVtZm2VS7UXG7DYNB+W3GlQUELge9q
 yJ4bJ9vvFxb9cD9jcFhCVby9WQCn0r1a8etqKQEz1egeovm/l57flHo9fVKeT+Tp/fRS
 u3KRu9J+zvLOKbducewTE3K7tE7ShNpdhHPvmK2w5zIfnxGMwvGW3jy0xQJHEXgO9M4T
 eE3hvV4J8yQ4mrKorTdgxAFCa2gy3sVN+eZF9zHmdbFw8S52LHFXeuXChn0Ll+I1eRh0
 bdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATI559pEwoGPR6cAkpsnRh0mqiHeu0Fv8fR6tyKb0Ls=;
 b=GXH7EI0C/jYA3S+Egij2YkLX4K3TR4Wkik6uv785g7ee4QIF0GPZq+RpndvZENlaTs
 HKi973LUY5BSmp59MOPovo9hte32jwn9bWf09hKLSXZaa48D26LMbPyT0SXsXoRIfSrY
 HmSiN5vPhYaylnw+JM0t+g+ghtVW0SH45+qcWSX/eMa4rsbUtqFNTvR7kIvJE544Bcoj
 EG70jHJxn6ecVYHl0CGHyO2praxz/G22Fu29WGkpKtoh7uYdAU+8EpeDggTxgGF+PPD+
 txDxPu5c4wNmlCGDHQw8/AWDC3kgNcuYU1uXkaR9HIDljosMj4dT+rxu2Ir2uKSQi/hl
 vtxg==
X-Gm-Message-State: APjAAAVCwjcT7qmJDBkUJPz5TlNnyfe7ds6sOtLkmeARy/H2XFYedws2
 tU3wKiBvcZV3ChxASd6RtIirKkWiDBc=
X-Google-Smtp-Source: APXvYqx/02b6kdIvlIrkgRLfvAAiyZO2yWyC0OCXKZR/eYRbzZ0bkwLsOQ2IpAAMPsSxOT8nmMC5Nw==
X-Received: by 2002:a17:902:aa49:: with SMTP id
 c9mr2932399plr.145.1582780487106; 
 Wed, 26 Feb 2020 21:14:47 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id k67sm4549494pga.91.2020.02.26.21.14.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:14:46 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:29 +0530
Message-Id: <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
 include/tst_device.h                          |  6 +++++
 lib/tst_device.c                              | 14 +++++++++++
 testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
 3 files changed, 21 insertions(+), 24 deletions(-)

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
index 8b5459def1cb..8bf6dacf5973 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -386,6 +386,20 @@ int tst_umount(const char *path)
 	return -1;
 }
 
+int tst_is_mounted(const char *path)
+{
+	char cmd[PATH_MAX];
+	int ret;
+
+	snprintf(cmd, sizeof(cmd), "mountpoint -q %s", path);
+	ret = tst_system(cmd);
+
+	if (ret)
+		tst_resm(TINFO, "No device is mounted at %s", path);
+
+	return !ret;
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
