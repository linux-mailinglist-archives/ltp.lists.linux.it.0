Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 677232A9AA0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 18:17:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35BA13C6676
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 18:17:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 597F03C2391
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 18:17:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 65D1B600F9D
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 18:17:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A33CACE3
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 17:17:13 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  6 Nov 2020 18:17:07 +0100
Message-Id: <20201106171707.7246-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Add tst_secureboot_enabled() helper function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Also check for SecureBoot status in tst_lockdown_enabled() if the lockdown
sysfile is not available/readable

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 configure.ac            |  1 +
 include/mk/config.mk.in |  4 ++--
 include/tst_lockdown.h  |  1 +
 lib/tst_lockdown.c      | 44 +++++++++++++++++++++++++++++++++++++++++
 m4/ltp-libefivar.m4     |  9 +++++++++
 5 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 m4/ltp-libefivar.m4

diff --git a/configure.ac b/configure.ac
index 03e4e09c9..d9ca5ad38 100644
--- a/configure.ac
+++ b/configure.ac
@@ -296,6 +296,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
 LTP_CHECK_CC_WARN_OLDSTYLE
 LTP_CHECK_CLONE_SUPPORTS_7_ARGS
 LTP_CHECK_CRYPTO
+LTP_CHECK_EFIVAR
 LTP_CHECK_FORTIFY_SOURCE
 LTP_CHECK_KERNEL_DEVEL
 LTP_CHECK_KEYUTILS_SUPPORT
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 427608a17..cffd11245 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -56,8 +56,8 @@ libdir			:= @libdir@
 mandir			:= @mandir@
 
 CPPFLAGS		:= @CPPFLAGS@
-CFLAGS			:= @CFLAGS@
-LDLIBS			:= @LIBS@
+CFLAGS			:= @CFLAGS@ @EFIVAR_CFLAGS@
+LDLIBS			:= @LIBS@ @EFIVAR_LIBS@
 LDFLAGS			:= @LDFLAGS@
 
 DEBUG_CFLAGS		?= -g
diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
index 78eaeccea..172a7daf5 100644
--- a/include/tst_lockdown.h
+++ b/include/tst_lockdown.h
@@ -5,6 +5,7 @@
 
 #define PATH_LOCKDOWN	"/sys/kernel/security/lockdown"
 
+int tst_secureboot_enabled(void);
 int tst_lockdown_enabled(void);
 
 #endif /* TST_LOCKDOWN_H */
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
index e7c19813c..47a112b4b 100644
--- a/lib/tst_lockdown.c
+++ b/lib/tst_lockdown.c
@@ -2,21 +2,65 @@
 
 #define TST_NO_DEFAULT_MAIN
 
+#include "config.h"
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mount.h>
 
+#ifdef HAVE_EFIVAR
+#include <efivar.h>
+#endif /* HAVE_EFIVAR */
+
 #include "tst_test.h"
 #include "tst_safe_macros.h"
 #include "tst_safe_stdio.h"
 #include "tst_lockdown.h"
 
+int tst_secureboot_enabled(void)
+{
+#ifdef HAVE_EFIVAR
+	int ret, status = 0;
+	uint8_t *data = NULL;
+	size_t size = 0;
+	uint32_t attrs = 0;
+
+	efi_error_clear();
+	ret = efi_get_variable(EFI_GLOBAL_GUID, "SecureBoot", &data, &size,
+		&attrs);
+
+	if (ret) {
+		char *fn, *func, *msg;
+		int ln, err, i = 0;
+
+		while (efi_error_get(i++, &fn, &func, &ln, &msg, &err) > 0)
+			tst_res(TINFO, "Efivar error: %s", msg);
+
+		efi_error_clear();
+	} else if (data) {
+		status = *data;
+		tst_res(TINFO, "SecureBoot: %s", status ? "on" : "off");
+	}
+
+	if (data)
+		free(data);
+
+	return status;
+#else /* HAVE_EFIVAR */
+	tst_res(TINFO, "%s(): LTP was built without efivar support", __func__);
+	return -1;
+#endif /* HAVE_EFIVAR */
+}
+
 int tst_lockdown_enabled(void)
 {
 	char line[BUFSIZ];
 	FILE *file;
 
 	if (access(PATH_LOCKDOWN, F_OK) != 0) {
+		/* SecureBoot enabled means integrity lockdown */
+		if (tst_secureboot_enabled() > 0)
+			return 1;
+
 		tst_res(TINFO, "Unable to determine system lockdown state");
 		return 0;
 	}
diff --git a/m4/ltp-libefivar.m4 b/m4/ltp-libefivar.m4
new file mode 100644
index 000000000..0a2750701
--- /dev/null
+++ b/m4/ltp-libefivar.m4
@@ -0,0 +1,9 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+
+AC_DEFUN([LTP_CHECK_EFIVAR], [
+	dnl efivar library and headers
+	PKG_CHECK_MODULES([EFIVAR], [efivar], [
+		AC_DEFINE([HAVE_EFIVAR], [1], [Define to 1 if you have libefivar library and headers])
+	], [have_efivar=no])
+])
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
