Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A42F9FD3
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:34:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB0763C2403
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:34:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5211C3C2403
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F04EE1A00162
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1ECAEB939;
 Mon, 18 Jan 2021 12:34:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 13:34:32 +0100
Message-Id: <20210118123433.17071-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118123433.17071-1-pvorel@suse.cz>
References: <20210118123433.17071-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/2] lib: Fix kernel module detection on BusyBox
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
-r)/modules.dep, for Android in /system/lib/modules/modules.dep.

Android is always a bit tricky, thus does not fail when depmod.dep (it
might not be available or or modules directory not readable for non-root
user) or module itself not found.

This fixes many tests on BusyBox, e.g. *all* network tests (tests using
tst_net.sh) after 305a78e4c ("tst_net.sh: Require veth for netns").

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_kernel.c | 63 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
index 57fa4b2be..ef01cda3d 100644
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
@@ -81,15 +85,64 @@ int tst_kernel_bits(void)
 	return kernel_bits;
 }
 
+#ifndef __ANDROID__
+# define MODULES_DIR "/lib/modules"
+#else
+# define MODULES_DIR "/system/lib/modules"
+#endif
+
 int tst_check_driver(const char *name)
 {
+	struct stat st;
+	char *depmod_path = NULL;
+	char buf[PATH_MAX], module[PATH_MAX], search[PATH_MAX] = "/";
+	FILE *f;
+
+#ifndef __ANDROID__
+	struct utsname uts;
+
+	if (uname(&uts)) {
+		tst_brkm(TBROK | TERRNO, NULL, "uname()");
+		return -1;
+	}
+	SAFE_ASPRINTF(NULL, &depmod_path, "%s/%s/modules.dep", MODULES_DIR, uts.release);
+#else
+	SAFE_ASPRINTF(NULL, &depmod_path, "%s/modules.dep", MODULES_DIR);
+#endif
+
+	if (stat(depmod_path, &st) || !(S_ISREG(st.st_mode) || S_ISLNK(st.st_mode))) {
 #ifndef __ANDROID__
-	const char * const argv[] = { "modprobe", "-n", name, NULL };
-	int res = tst_cmd_(NULL, argv, "/dev/null", "/dev/null",
-			       TST_CMD_PASS_RETVAL);
+		tst_resm(TWARN, "expected depmod file %s does not exist or not a file", depmod_path);
+#endif
+		return 0;
+	}
+
+	if (access(depmod_path, R_OK)) {
+#ifndef __ANDROID__
+		tst_resm(TWARN, "depmod file %s cannot be read", depmod_path);
+#endif
+		return 0;
+	}
+
+	strcat(search, name);
+	strcat(search, ".ko");
 
-	/* 255 - it looks like modprobe not available */
-	return (res == 255) ? 0 : res;
+	f = SAFE_FOPEN(NULL, depmod_path, "r");
+
+	while (fgets(buf, sizeof(buf), f)) {
+		if (sscanf(buf, "%s:", module) != 1)
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
+#ifndef __ANDROID__
+	return 1;
 #else
 	/* Android modprobe may not have '-n', or properly installed
 	 * module.*.bin files to determine built-in drivers. Assume
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
