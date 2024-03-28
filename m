Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9385876FE7
	for <lists+linux-ltp@lfdr.de>; Sat,  9 Mar 2024 10:01:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 803B33CE955
	for <lists+linux-ltp@lfdr.de>; Sat,  9 Mar 2024 10:01:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 323083CE95B
 for <ltp@lists.linux.it>; Sat,  9 Mar 2024 10:01:30 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F2982200168
 for <ltp@lists.linux.it>; Sat,  9 Mar 2024 10:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709974888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hqofvs5a79zIZmFc+CoWB3kuBtWsZj+3Hfscmtno8AI=;
 b=TYAwdvPScY9ul085jtTjrVvy/lfp8cWpjjn/RLer3/GLxFLU/gGZvfAsY+17VUz1ZHukZv
 qipBjLTiYklzVoVK/qAAqOgqcxc4w82KOXmx0MiHeuy7cHqYQ5pmCGtYMdWWNpppMd/1oo
 nfk0e27IT5CHR3O6rbsLbYW+NISO97E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-W5jD-wsBOfmpUS6Y3QXGDQ-1; Sat,
 09 Mar 2024 04:01:22 -0500
X-MC-Unique: W5jD-wsBOfmpUS6Y3QXGDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B1751C41A18;
 Sat,  9 Mar 2024 09:01:22 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A0D37F6;
 Sat,  9 Mar 2024 09:01:20 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	pvorel@suse.cz
Date: Sat,  9 Mar 2024 17:01:12 +0800
Message-Id: <20240309090113.3121235-3-liwang@redhat.com>
In-Reply-To: <20240309090113.3121235-1-liwang@redhat.com>
References: <20240309090113.3121235-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/3] init_module: To handle kernel module signature
 enforcement
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

The patch modifies init_module syscall test cases to account
for kernel module signature enforcement. It adds parsing for
the 'module.sig_enforce' parameter and adjusts test expectations
based on whether signature enforcement is enabled, using
new conditional logic.

If enforcement is active, tests expect an EKEYREJECTED error;
otherwise, they proceed as normal.

Signed-off-by: Li Wang <liwang@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>
---
 .../syscalls/delete_module/delete_module01.c  |  8 ++++
 .../syscalls/delete_module/delete_module03.c  |  8 ++++
 .../syscalls/finit_module/finit_module01.c    | 15 +++++++-
 .../syscalls/finit_module/finit_module02.c    | 37 ++++++++++++-------
 .../syscalls/init_module/init_module01.c      | 13 +++++++
 .../syscalls/init_module/init_module02.c      | 19 +++++++++-
 6 files changed, 85 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/delete_module/delete_module01.c b/testcases/kernel/syscalls/delete_module/delete_module01.c
index 90d8b5289..11c4eae58 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module01.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module01.c
@@ -14,8 +14,10 @@
  * Install dummy_del_mod.ko and delete it with delete_module(2).
  */
 
+#include <stdlib.h>
 #include "tst_test.h"
 #include "tst_module.h"
+#include "tst_kconfig.h"
 #include "lapi/syscalls.h"
 
 #define MODULE_NAME	"dummy_del_mod"
@@ -25,6 +27,12 @@ static int module_loaded;
 
 static void do_delete_module(void)
 {
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	if (atoi(params.value) == 1)
+		tst_brk(TCONF, "module signature is enforced, skip test");
+
 	if (!module_loaded) {
 		tst_module_load(MODULE_NAME_KO, NULL);
 		module_loaded = 1;
diff --git a/testcases/kernel/syscalls/delete_module/delete_module03.c b/testcases/kernel/syscalls/delete_module/delete_module03.c
index 7e92fc2af..fdf0c293d 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module03.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module03.c
@@ -12,9 +12,11 @@
  * if tried to remove a module while other modules depend on this module.
  */
 
+#include <stdlib.h>
 #include <errno.h>
 #include "tst_test.h"
 #include "tst_module.h"
+#include "tst_kconfig.h"
 #include "lapi/syscalls.h"
 
 #define DUMMY_MOD		"dummy_del_mod"
@@ -50,6 +52,12 @@ static void do_delete_module(void)
 
 static void setup(void)
 {
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	if (atoi(params.value) == 1)
+		tst_brk(TCONF, "module signature is enforced, skip test");
+
 	/* Load first kernel module */
 	tst_module_load(DUMMY_MOD_KO, NULL);
 	dummy_mod_loaded = 1;
diff --git a/testcases/kernel/syscalls/finit_module/finit_module01.c b/testcases/kernel/syscalls/finit_module/finit_module01.c
index 1929c30fa..01c5e987d 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module01.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -13,18 +13,25 @@
  * Inserts a simple module after opening and mmaping the module file.
  */
 
+#include <stdlib.h>
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
+#include "tst_kconfig.h"
 
 #define MODULE_NAME	"finit_module.ko"
 
-static int fd;
+static int fd, sig_enforce;
 
 static char *mod_path;
 
 static void setup(void)
 {
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	sig_enforce = atoi(params.value);
+
 	tst_module_exists(MODULE_NAME, &mod_path);
 
 	fd = SAFE_OPEN(mod_path, O_RDONLY|O_CLOEXEC);
@@ -32,6 +39,12 @@ static void setup(void)
 
 static void run(void)
 {
+	if (sig_enforce == 1) {
+		tst_res(TINFO, "module signature is enforced");
+		TST_EXP_FAIL(finit_module(fd, "status=valid", 0), EKEYREJECTED);
+		return;
+	}
+
 	TST_EXP_PASS(finit_module(fd, "status=valid", 0));
 	if (!TST_PASS)
 		return;
diff --git a/testcases/kernel/syscalls/finit_module/finit_module02.c b/testcases/kernel/syscalls/finit_module/finit_module02.c
index 223d9b388..22bb50be9 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module02.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -14,9 +14,11 @@
  */
 
 #include <linux/capability.h>
+#include <stdlib.h>
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
+#include "tst_kconfig.h"
 #include "tst_capability.h"
 
 #define MODULE_NAME	"finit_module.ko"
@@ -25,7 +27,7 @@
 static char *mod_path;
 
 static int fd, fd_zero, fd_invalid = -1, fd_dir;
-static int kernel_lockdown, secure_boot;
+static int kernel_lockdown, secure_boot, sig_enforce;
 
 static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
 static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
@@ -59,27 +61,26 @@ static void dir_setup(struct tcase *tc)
 }
 
 static struct tcase tcases[] = {
-	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, 0,
-		bad_fd_setup},
+	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, 0, bad_fd_setup},
 	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, 0, NULL},
 	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT, 1, NULL},
-	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0,
-		EINVAL, 1, NULL},
-	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, 0,
-		NULL},
+	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, 1, NULL},
+	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, 0, NULL},
 	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM, 0, NULL},
-	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, 1,
-		NULL},
-	{"file-not-readable", &fd, "", O_WRONLY | O_CLOEXEC, 0, 0, EBADF, 0,
-		NULL},
-	{"file-readwrite", &fd, "", O_RDWR | O_CLOEXEC, 0, 0, ETXTBSY, 0,
-		NULL},
+	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, 1, NULL},
+	{"module-unsigned", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EKEYREJECTED, 1, NULL},
+	{"file-not-readable", &fd, "", O_WRONLY | O_CLOEXEC, 0, 0, EBADF, 0, NULL},
+	{"file-readwrite", &fd, "", O_RDWR | O_CLOEXEC, 0, 0, ETXTBSY, 0, NULL},
 	{"directory", &fd_dir, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, 0, dir_setup},
 };
 
 static void setup(void)
 {
 	unsigned long int i;
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	sig_enforce = atoi(params.value);
 
 	tst_module_exists(MODULE_NAME, &mod_path);
 
@@ -109,6 +110,16 @@ static void run(unsigned int n)
 		return;
 	}
 
+	if ((sig_enforce == 1) && (tc->exp_errno != EKEYREJECTED)) {
+		tst_res(TCONF, "module signature is enforced, skipping %s", tc->name);
+		return;
+	}
+
+	if ((sig_enforce != 1) && (tc->exp_errno == EKEYREJECTED)) {
+		tst_res(TCONF, "module signature is not enforced, skipping %s", tc->name);
+		return;
+	}
+
 	fd = SAFE_OPEN(mod_path, tc->open_flags);
 
 	if (tc->cap)
diff --git a/testcases/kernel/syscalls/init_module/init_module01.c b/testcases/kernel/syscalls/init_module/init_module01.c
index 26ff0b93b..1f2442635 100644
--- a/testcases/kernel/syscalls/init_module/init_module01.c
+++ b/testcases/kernel/syscalls/init_module/init_module01.c
@@ -13,18 +13,25 @@
  * Inserts a simple module after opening and mmaping the module file.
  */
 
+#include <stdlib.h>
 #include <errno.h>
 #include "lapi/init_module.h"
 #include "tst_module.h"
+#include "tst_kconfig.h"
 
 #define MODULE_NAME	"init_module.ko"
 
 static struct stat sb;
 static void *buf;
+static int sig_enforce;
 
 static void setup(void)
 {
 	int fd;
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	sig_enforce = atoi(params.value);
 
 	tst_module_exists(MODULE_NAME, NULL);
 
@@ -36,6 +43,12 @@ static void setup(void)
 
 static void run(void)
 {
+	if (sig_enforce == 1) {
+		tst_res(TINFO, "module signature is enforced");
+		TST_EXP_FAIL(init_module(buf, sb.st_size, "status=valid"), EKEYREJECTED);
+		return;
+	}
+
 	TST_EXP_PASS(init_module(buf, sb.st_size, "status=valid"));
 	if (!TST_PASS)
 		return;
diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
index e6730e21c..e69628fc6 100644
--- a/testcases/kernel/syscalls/init_module/init_module02.c
+++ b/testcases/kernel/syscalls/init_module/init_module02.c
@@ -14,15 +14,17 @@
  */
 
 #include <linux/capability.h>
+#include <stdlib.h>
 #include <errno.h>
 #include "lapi/init_module.h"
+#include "tst_kconfig.h"
 #include "tst_module.h"
 #include "tst_capability.h"
 
 #define MODULE_NAME	"init_module.ko"
 
 static unsigned long size, zero_size;
-static int kernel_lockdown, secure_boot;
+static int kernel_lockdown, secure_boot, sig_enforce;
 static void *buf, *faulty_buf, *null_buf;
 
 static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
@@ -44,12 +46,17 @@ static struct tcase {
 	{"invalid_param", &buf, &size, "status=invalid", 0, 1, EINVAL},
 	{"no-perm", &buf, &size, "", 1, 0, EPERM},
 	{"module-exists", &buf, &size, "", 0, 1, EEXIST},
+	{"module-unsigned", &buf, &size, "", 0, 1, EKEYREJECTED},
 };
 
 static void setup(void)
 {
 	struct stat sb;
 	int fd;
+	struct tst_kcmdline_var params = TST_KCMDLINE_INIT("module.sig_enforce");
+
+	tst_kcmdline_parse(&params, 1);
+	sig_enforce = atoi(params.value);
 
 	tst_module_exists(MODULE_NAME, NULL);
 
@@ -73,6 +80,16 @@ static void run(unsigned int n)
 		return;
 	}
 
+	if ((sig_enforce == 1) && (tc->exp_errno != EKEYREJECTED)) {
+		tst_res(TCONF, "module signature is enforced, skipping %s", tc->name);
+		return;
+	}
+
+	if ((sig_enforce != 1) && (tc->exp_errno == EKEYREJECTED)) {
+		tst_res(TCONF, "module signature is not enforced, skipping %s", tc->name);
+		return;
+	}
+
 	if (tc->cap)
 		tst_cap_action(&cap_drop);
 
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
