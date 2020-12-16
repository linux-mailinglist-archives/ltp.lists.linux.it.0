Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE82DBEFB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:50:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97F443C57DA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:50:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F215B3C2800
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:50:32 +0100 (CET)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C93C1000BDE
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:50:32 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id x18so6604697pln.6
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hb/F9v7S5yG3qubwU1Adprl65nccMWIBl51V/nomFpM=;
 b=p+FHUA9EvbDbCH3CMU/5FbyU3f5rNTLF02ICkPryoUVpBMlUYJ7KF41nKgEHACUVI4
 kZFq94mval+IxB6uHQHjBlU+QMdLskvLQKGRSY9fXFGGUTnlrV4AIkmt9QRD3WxO3zKn
 S6WjS6wVyFJaSaEKMK42DYH0QdFs+tf0qDKGszf2S9PIPFgrX5DNE7HRKSPXnsWFcXZA
 URztF01cWvVQ3Z69Al32/YLj27lksH1Zyz5ZHAJiBKrnTlNsfsqPF7ZfFbhMSiMkdOAw
 94beGpAh+qHXbjOXuVxNj1i/y5k+VjTyDWShnf996BO73FBRAaDi4q3OaMrJFFUWSjFt
 So0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hb/F9v7S5yG3qubwU1Adprl65nccMWIBl51V/nomFpM=;
 b=bBMkRER/by3l6lBCIu1QCqeCFqVjAb62ors7QqCmAtfHLu2oW7O2CVbzmCEl2BT5Wo
 NLgL7e5oLoiXUr4QwYKZlOs7//RTMdITZaw7NyUXcJZMGtDzsolcMKxdGquwbOqYlZCN
 sdU7YUfhfHGBFajrPeuhrtzeJ49jAxSd+p+tgJPPWKd/NeXsQPTbYYN6OdZwhgqp6v0d
 M30fIvXbM09y3ktLX5GuEnf8EitjJK4xsWZzolrKDgp0bCNApQYDBDwHe00rE2u2eadQ
 9Ekww2diguGMFHtv6jb2VchqtbNvbbmhC0Z1fEpRpCpJ3tgWa92f4SZBY1guPA0TyRHs
 +Viw==
X-Gm-Message-State: AOAM531qj79Vy/1KailOVnEPDYSZlmsum9dpuPgPVQotxSNy5oTPhq1O
 OgB5/Rz7uj66DtHDKr28R2Ngro0mCt/zHQ==
X-Google-Smtp-Source: ABdhPJzONWFkD4/AYi3gmTXKboa+tMm46H56sW/naWm6P1e6tw3jez0Mbrk6GvSB0O/bwCARP3Kzgw==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr2607378pjb.83.1608115830569; 
 Wed, 16 Dec 2020 02:50:30 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id s5sm1746907pju.9.2020.12.16.02.50.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 02:50:30 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 16:20:21 +0530
Message-Id: <34f9706f7dfdc232ae7b37d72edd2a9ae02faaae.1608115761.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <5b2a65fa61ea2eb897a9a79827ad7b5f0a8e61cd.1608115761.git.viresh.kumar@linaro.org>
References: <5b2a65fa61ea2eb897a9a79827ad7b5f0a8e61cd.1608115761.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls: finit_module: Add tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch adds success and failure tests for finit_module() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/init_module.h                    |  15 +++
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/finit_module/.gitignore   |   3 +
 .../kernel/syscalls/finit_module/Makefile     |  21 ++++
 .../kernel/syscalls/finit_module/dummy_mod.c  |  43 ++++++++
 .../syscalls/finit_module/finit_module01.c    |  54 ++++++++++
 .../syscalls/finit_module/finit_module02.c    | 101 ++++++++++++++++++
 7 files changed, 240 insertions(+)
 create mode 100644 testcases/kernel/syscalls/finit_module/.gitignore
 create mode 100644 testcases/kernel/syscalls/finit_module/Makefile
 create mode 100644 testcases/kernel/syscalls/finit_module/dummy_mod.c
 create mode 100644 testcases/kernel/syscalls/finit_module/finit_module01.c
 create mode 100644 testcases/kernel/syscalls/finit_module/finit_module02.c

diff --git a/include/lapi/init_module.h b/include/lapi/init_module.h
index ad556aec4aaa..480ed35ddb74 100644
--- a/include/lapi/init_module.h
+++ b/include/lapi/init_module.h
@@ -18,4 +18,19 @@ static inline int init_module(void *module_image, unsigned long len,
 	return tst_syscall(__NR_init_module, module_image, len, param_values);
 }
 #endif
+
+void finit_module_supported_by_kernel(void)
+{
+       if ((tst_kvercmp(3, 8, 0)) < 0) {
+               /* Check if the syscall is backported on an older kernel */
+               TEST(syscall(__NR_finit_module, 0, "", 0));
+               if (TST_RET == -1 && TST_ERR == ENOSYS)
+                       tst_brk(TCONF, "Test not supported on kernel version < v3.8");
+       }
+}
+
+static inline int finit_module(int fd, const char *param_values, int flags)
+{
+	return tst_syscall(__NR_finit_module, fd, param_values, flags);
+}
 #endif /* INIT_MODULE_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index 28174dddd716..961545e73834 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -327,6 +327,9 @@ fgetxattr01 fgetxattr01
 fgetxattr02 fgetxattr02
 fgetxattr03 fgetxattr03
 
+finit_module01 finit_module01
+finit_module02 finit_module02
+
 flistxattr01 flistxattr01
 flistxattr02 flistxattr02
 flistxattr03 flistxattr03
diff --git a/testcases/kernel/syscalls/finit_module/.gitignore b/testcases/kernel/syscalls/finit_module/.gitignore
new file mode 100644
index 000000000000..d3b34a460874
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/.gitignore
@@ -0,0 +1,3 @@
+/finit_module01
+/finit_module02
+/dummy_mod.ko
diff --git a/testcases/kernel/syscalls/finit_module/Makefile b/testcases/kernel/syscalls/finit_module/Makefile
new file mode 100644
index 000000000000..61880abbe9ff
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+ifneq ($(KERNELRELEASE),)
+
+obj-m := dummy_mod.o
+
+else
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+REQ_VERSION_MAJOR	:= 3
+REQ_VERSION_PATCH	:= 8
+
+MAKE_TARGETS		:= finit_module01 finit_module02 dummy_mod.ko
+
+include $(top_srcdir)/include/mk/module.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+endif
diff --git a/testcases/kernel/syscalls/finit_module/dummy_mod.c b/testcases/kernel/syscalls/finit_module/dummy_mod.c
new file mode 100644
index 000000000000..7c0b7a06aaa4
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/dummy_mod.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Dummy test module.
+ *
+ * [ALGORITHM]
+ *
+ * The module accepts a single argument named "status" and it fails
+ * initialization if the status is set to "invalid".
+\*/
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/proc_fs.h>
+#include <linux/kernel.h>
+
+static char status[20];
+module_param_string(status, status, 20, 0444);
+
+static int dummy_init(void)
+{
+	struct proc_dir_entry *proc_dummy;
+
+	if (!strcmp(status, "invalid"))
+		return -EINVAL;
+
+	proc_dummy = proc_mkdir("dummy", 0);
+	return 0;
+}
+module_init(dummy_init);
+
+static void dummy_exit(void)
+{
+	remove_proc_entry("dummy", 0);
+}
+module_exit(dummy_exit);
+
+MODULE_LICENSE("GPL");
diff --git a/testcases/kernel/syscalls/finit_module/finit_module01.c b/testcases/kernel/syscalls/finit_module/finit_module01.c
new file mode 100644
index 000000000000..a359612e3188
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic finit_module() tests.
+ *
+ * [ALGORITHM]
+ *
+ * Inserts a simple module after opening and mmaping the module file.
+\*/
+
+#include <errno.h>
+#include "lapi/init_module.h"
+#include "old_module.h"
+
+#define MODULE_NAME	"dummy_mod.ko"
+
+int fd;
+
+static void setup(void)
+{
+	finit_module_supported_by_kernel();
+	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
+}
+
+static void run(void)
+{
+	TEST(finit_module(fd, "status=valid", 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "finit_module() failed for %s",
+			MODULE_NAME);
+		return;
+	}
+
+	tst_module_unload(NULL, MODULE_NAME);
+
+	tst_res(TPASS, "finit_module() passed");
+}
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/finit_module/finit_module02.c b/testcases/kernel/syscalls/finit_module/finit_module02.c
new file mode 100644
index 000000000000..c364aef28935
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic finit_module() failure tests.
+ *
+ * [ALGORITHM]
+ *
+ * Tests various failure scenarios for finit_module().
+\*/
+
+#include <linux/capability.h>
+#include <errno.h>
+#include "lapi/init_module.h"
+#include "old_module.h"
+#include "tst_capability.h"
+
+#define MODULE_NAME	"dummy_mod.ko"
+
+static int fd, fd_zero, fd_invalid = -1;
+
+static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
+static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
+
+static struct tcase {
+	const char *name;
+	int *fd;
+	const char *param;
+	int open_flags;
+	int flags;
+	int cap;
+	int exp_errno;
+} tcases[] = {
+	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL},
+	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, ENOEXEC},
+	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT},
+	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL},
+	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL},
+	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM},
+	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST},
+	{"file-not-readable", &fd, "", O_WRONLY | O_CLOEXEC, 0, 0, EBADF},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	fd = SAFE_OPEN(MODULE_NAME, tc->open_flags);
+
+	if (tc->cap)
+		tst_cap_action(&cap_drop);
+
+	TEST(finit_module(*tc->fd, tc->param, tc->flags));
+
+	/* Insert module twice */
+	if (tc->exp_errno == EEXIST) {
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO,
+				"%s: finit_module() failed unexpectedly",
+				tc->name);
+			goto out;
+		}
+
+		TEST(finit_module(*tc->fd, tc->param, tc->flags));
+		tst_module_unload(NULL, MODULE_NAME);
+	}
+
+	if (tc->cap)
+		tst_cap_action(&cap_req);
+
+	if (TST_RET != -1) {
+		tst_module_unload(NULL, MODULE_NAME);
+		tst_res(TFAIL, "%s: finit_module() passed unexpectedly",
+			tc->name);
+		goto out;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO,
+			"%s: finit_module() should fail with %s", tc->name,
+			tst_strerrno(tc->exp_errno));
+		goto out;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: finit_module() failed as expected",
+		tc->name);
+
+out:
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = finit_module_supported_by_kernel,
+	.needs_root = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
