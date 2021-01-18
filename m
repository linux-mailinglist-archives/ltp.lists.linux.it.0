Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9642B2FA5BF
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 17:13:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 000CE3C30BD
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 17:13:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1605F3C13E3
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:13:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6AEC56005F6
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:13:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B405FAC9B;
 Mon, 18 Jan 2021 16:13:15 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 17:13:08 +0100
Message-Id: <20210118161308.30771-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>
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

Implementation searches for for module presence in /lib/modules/$(uname
-r)/modules.{dep,builtin}. On Android expect files in /system/lib/modules
directory.

On Android still assume all drivers are available as config files might
not be available).

This fixes many tests on BusyBox, e.g. *all* network tests (tests using
tst_net.sh) after 305a78e4c ("tst_net.sh: Require veth for netns").

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* Check also modules.builtin (built-in dependency).

Kind regards,
Petr

 lib/tst_kernel.c | 81 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 72 insertions(+), 9 deletions(-)

diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
index 57fa4b2be..ab324a643 100644
--- a/lib/tst_kernel.c
+++ b/lib/tst_kernel.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
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
@@ -81,20 +85,79 @@ int tst_kernel_bits(void)
 	return kernel_bits;
 }
 
-int tst_check_driver(const char *name)
+#ifndef __ANDROID__
+# define MODULES_DIR "/lib/modules"
+#else
+# define MODULES_DIR "/system/lib/modules"
+#endif
+
+
+int tst_search_driver(const char *driver, const char *file)
 {
+	struct stat st;
+	char *path = NULL;
+	char buf[PATH_MAX], module[PATH_MAX], search[PATH_MAX] = "/";
+	FILE *f;
+
 #ifndef __ANDROID__
-	const char * const argv[] = { "modprobe", "-n", name, NULL };
-	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
-			       TST_CMD_PASS_RETVAL);
+	struct utsname uts;
 
-	/* 255 - it looks like modprobe not available */
-	return (res == 255) ? 0 : res;
+	if (uname(&uts)) {
+		tst_brkm(TBROK | TERRNO, NULL, "uname() failed");
+		return -1;
+	}
+	SAFE_ASPRINTF(NULL, &path, "%s/%s/%s", MODULES_DIR, uts.release, file);
 #else
-	/* Android modprobe may not have '-n', or properly installed
-	 * module.*.bin files to determine built-in drivers. Assume
-	 * all drivers are available.
+	SAFE_ASPRINTF(NULL, &path, "%s/%s", MODULES_DIR, file);
+#endif
+
+	if (stat(path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
+#ifndef __ANDROID__
+		tst_resm(TWARN, "expected file %s does not exist or not a file", path);
+#endif
+		return -1;
+	}
+
+	if (access(path, R_OK)) {
+#ifndef __ANDROID__
+		tst_resm(TWARN, "file %s cannot be read", path);
+#endif
+		return -1;
+	}
+
+	strcat(search, driver);
+	strcat(search, ".ko");
+
+	f = SAFE_FOPEN(NULL, path, "r");
+
+	while (fgets(buf, sizeof(buf), f)) {
+		if (sscanf(buf, "%s", module) != 1)
+			continue;
+
+		if (strstr(module, search) != NULL) {
+			SAFE_FCLOSE(NULL, f);
+			return 0;
+		}
+	}
+
+	SAFE_FCLOSE(NULL, f);
+
+	return -1;
+}
+
+int tst_check_driver(const char *driver)
+{
+#ifdef __ANDROID__
+	/*
+	 * Android may not have properly installed modules.* files to determine
+	 * built-in drivers. Assume all drivers are available.
 	 */
 	return 0;
 #endif
+
+	if (!tst_search_driver(driver, "modules.dep") ||
+		!tst_search_driver(driver, "modules.builtin"))
+		return 0;
+
+	return 1;
 }
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
