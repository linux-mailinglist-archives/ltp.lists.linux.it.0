Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6B30063A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EE763C6535
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DF7D33C6344
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6EA281000F2A
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE090AE05;
 Fri, 22 Jan 2021 14:55:10 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Jan 2021 15:54:56 +0100
Message-Id: <20210122145458.27964-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210122145458.27964-1-pvorel@suse.cz>
References: <20210122145458.27964-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/3] tst_check_driver(): Fix kernel module
 detection on BusyBox
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
Cc: kernel-team@android.com, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

BusyBox modprobe implementation does not support -n switch.

It does support -D, which could be used, *but* unless is busybox binary
configured with CONFIG_MODPROBE_SMALL=y (IMHO the default).

We could use modinfo and grep output for 'filename:', but we agreed on
ML that having our own implementation will be the best as it also
does not require modinfo as external dependency.

Implementation searches for for module presence in
/lib/modules/$(uname -r)/modules.{dep,builtin}.

Also treat '-' and '_' in module name as the same (follow kmod implementation).

Changed return code on error from 1 to -1 (no update needed on callers
of the function). Document return code and params in the header.

On Android still assume all drivers are available because modules.* files
might not be available. We could search for modules in /lib/modules or
/vendor/lib/modules or /system/lib/modules (old aosp), but to to determine
built-in drivers we need modules.builtin (it's required also by Busybox
mod{info,probe} implementation).

This fixes many tests on BusyBox, e.g. *all* network tests (tests using
tst_net.sh) after 305a78e4c ("tst_net.sh: Require veth for netns").

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_kernel.h |   8 ++--
 lib/tst_kernel.c     | 105 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 98 insertions(+), 15 deletions(-)

diff --git a/include/tst_kernel.h b/include/tst_kernel.h
index 71ab9466b..9e17bb71e 100644
--- a/include/tst_kernel.h
+++ b/include/tst_kernel.h
@@ -13,9 +13,11 @@ int tst_kernel_bits(void);
 /**
  * Checks support for the kernel driver.
  *
- * @param name The name of the driver.
- * @return Returns 0 if the kernel has the driver or modprobe is missing.
+ * @param driver The name of the driver.
+ * @return Returns 0 if the kernel has the driver,
+ * -1 when driver is missing or config file not available.
+ * On Android *always* 0 (always expect the driver is available).
  */
-int tst_check_driver(const char *name);
+int tst_check_driver(const char *driver);
 
 #endif	/* TST_KERNEL_H__ */
diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
index 57fa4b2be..c908bb04c 100644
--- a/lib/tst_kernel.c
+++ b/lib/tst_kernel.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2020-2021 Petr Vorel <pvorel@suse.cz>
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -17,8 +18,11 @@
 
 #include <sys/personality.h>
 #include <sys/utsname.h>
+#include <limits.h>
+
 #include "test.h"
 #include "tst_kernel.h"
+#include "old_safe_stdio.h"
 
 static int get_kernel_bits_from_uname(struct utsname *buf)
 {
@@ -81,20 +85,97 @@ int tst_kernel_bits(void)
 	return kernel_bits;
 }
 
-int tst_check_driver(const char *name)
+static int tst_search_driver(const char *driver, const char *file)
 {
-#ifndef __ANDROID__
-	const char * const argv[] = { "modprobe", "-n", name, NULL };
-	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
-			       TST_CMD_PASS_RETVAL);
-
-	/* 255 - it looks like modprobe not available */
-	return (res == 255) ? 0 : res;
-#else
-	/* Android modprobe may not have '-n', or properly installed
-	 * module.*.bin files to determine built-in drivers. Assume
-	 * all drivers are available.
+	struct stat st;
+	char buf[PATH_MAX];
+	char *path = NULL, *search = NULL, *sep = NULL;
+	FILE *f;
+	int ret = -1;
+
+	struct utsname uts;
+
+	if (uname(&uts)) {
+		tst_brkm(TBROK | TERRNO, NULL, "uname() failed");
+		return -1;
+	}
+	SAFE_ASPRINTF(NULL, &path, "/lib/modules/%s/%s", uts.release, file);
+
+	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
+		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
+		return -1;
+	}
+
+	if (access(path, R_OK)) {
+		tst_resm(TWARN, "file %s cannot be read", path);
+		return -1;
+	}
+
+	SAFE_ASPRINTF(NULL, &search, "/%s.ko", driver);
+
+	f = SAFE_FOPEN(NULL, path, "r");
+
+	while (fgets(buf, sizeof(buf), f)) {
+		/* cut dependencies after : */
+		if ((sep = strchr(buf, ':')))
+			*sep = 0;
+
+		/* driver found */
+		if (strstr(buf, search) != NULL) {
+			ret = 0;
+			break;
+		}
+	}
+
+	SAFE_FCLOSE(NULL, f);
+	free(search);
+	free(path);
+
+	return ret;
+}
+
+static int tst_check_driver_(const char *driver)
+{
+	if (!tst_search_driver(driver, "modules.dep") ||
+		!tst_search_driver(driver, "modules.builtin"))
+		return 0;
+
+	return -1;
+}
+
+int tst_check_driver(const char *driver)
+{
+#ifdef __ANDROID__
+	/*
+	 * Android may not have properly installed modules.* files. We could
+	 * search modules in /system/lib/modules, but to to determine built-in
+	 * drivers we need modules.builtin. Therefore assume all drivers are
+	 * available.
 	 */
 	return 0;
 #endif
+
+	if (!tst_check_driver_(driver))
+		return 0;
+
+	int ret = -1;
+
+	if (strrchr(driver, '-') || strrchr(driver, '_')) {
+		char *driver2 = strdup(driver);
+		char *ix = driver2;
+		char find = '-', replace = '_';
+
+		if (strrchr(driver, '_')) {
+			find = '_';
+			replace = '-';
+		}
+
+		while ((ix = strchr(ix, find)))
+			*ix++ = replace;
+
+		ret = tst_check_driver_(driver2);
+		free(driver2);
+	}
+
+	return ret;
 }
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
