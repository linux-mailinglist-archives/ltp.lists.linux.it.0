Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E52DCF7A
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:29:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BC883C57CD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:29:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 67B733C2555
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:29:26 +0100 (CET)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E61C1601355
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:29:25 +0100 (CET)
Received: by mail-pg1-x52e.google.com with SMTP id t37so20022732pga.7
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrB208ADHBcP3I4SVMqK6HxmwlEUbwVBk8FeTY/Z60I=;
 b=Wo+0Y5TAeaMmx84hGpRnp8pwjTGFypHFFL6uYWN+DAw4mdsR6mx5ySCiARTVHI6AU6
 tEfUWbBkowhfuUtqskpgvN45lBUG4f5e9AVdcCyxNnWf3E9L90lS523+3IK5lKjunHI+
 yl7bTg+f8CnOeO5oF1A5rDMDVs4rnx6dBHmPAPUnrnagMmfEJpd7S9pbGx1oCePwkVlP
 x3HNwtOa+OaRckEXIL/tfH+SKRm+RtcEvcelwjIoNQUnxhSB/3bgcHBEsVaQJE7cSqEJ
 saG7moMJ3Bf4YRKQzUOyH0UrS5vNWhu9OxtbuPl2H8IoUIeHwGaxHaC6bLxGfXXTv6D8
 8D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrB208ADHBcP3I4SVMqK6HxmwlEUbwVBk8FeTY/Z60I=;
 b=gRx18I3xMMOSHw/JkJfUdizF2ekx/LO+8OjhTnAYaISlG6NtI72fj3sjU9kPNgNq18
 HL5tr/BtK9YiosXkT0E+g/YPBAYxGNQgzXuYdorMp/Jb5x09n5lQIViOCryg2hK1l2D4
 /7d0p42hlVcEUr4N6Q9ouxtsK50oHKn41ZTSqWGHx30e1QYH/bFGMvwptJrg3c4vhnH/
 4QYT4PRgDqGVrs2eQuxljUJimRlIsQ8sLFlMlXQaRmetJMbs4kx2upmEVu/+3mcHZ08S
 ZI+s7RbYrGBbrQTOD/LSa5WKOqZozY0FzD0b/B4JcnnNmnFvbbpjd9S9xn5159rmrXdq
 l02A==
X-Gm-Message-State: AOAM5304J4ZLcPLxjwku/jx4wS0girnodi1NeXkZeuS1d6LLbZSUBdwj
 QlTiOxFDU5vimsxzRGL/PIfMvU6UdwPWng==
X-Google-Smtp-Source: ABdhPJyBVBLKmp4thgB3K3z9qfbOonsYHx+qwG0TwbwGFmff/sBfTxCASSXs35zA0myjOrsX/dJ/7A==
X-Received: by 2002:a63:1456:: with SMTP id 22mr10817739pgu.108.1608200963843; 
 Thu, 17 Dec 2020 02:29:23 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id n128sm5737604pga.55.2020.12.17.02.29.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 02:29:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 15:59:18 +0530
Message-Id: <d537c9be33a54d31f70bd25e3268dbebbb67ea8f.1608200941.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
References: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V3 3/3] syscalls: finit_module: Add tests
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
 include/lapi/init_module.h                    | 16 ++++
 runtest/syscalls                              |  3 +
 .../kernel/syscalls/finit_module/.gitignore   |  3 +
 .../kernel/syscalls/finit_module/Makefile     | 21 +++++
 .../syscalls/finit_module/finit_module.c      | 37 ++++++++
 .../syscalls/finit_module/finit_module01.c    | 49 ++++++++++
 .../syscalls/finit_module/finit_module02.c    | 89 +++++++++++++++++++
 7 files changed, 218 insertions(+)
 create mode 100644 testcases/kernel/syscalls/finit_module/.gitignore
 create mode 100644 testcases/kernel/syscalls/finit_module/Makefile
 create mode 100644 testcases/kernel/syscalls/finit_module/finit_module.c
 create mode 100644 testcases/kernel/syscalls/finit_module/finit_module01.c
 create mode 100644 testcases/kernel/syscalls/finit_module/finit_module02.c

diff --git a/include/lapi/init_module.h b/include/lapi/init_module.h
index 65ff70356c60..9e79e11b8557 100644
--- a/include/lapi/init_module.h
+++ b/include/lapi/init_module.h
@@ -16,4 +16,20 @@ static inline int init_module(void *module_image, unsigned long len,
 {
 	return tst_syscall(__NR_init_module, module_image, len, param_values);
 }
+
+static inline int finit_module(int fd, const char *param_values, int flags)
+{
+	return tst_syscall(__NR_finit_module, fd, param_values, flags);
+}
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
index 000000000000..5fcafdb3736d
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/.gitignore
@@ -0,0 +1,3 @@
+/finit_module01
+/finit_module02
+/*.ko
diff --git a/testcases/kernel/syscalls/finit_module/Makefile b/testcases/kernel/syscalls/finit_module/Makefile
new file mode 100644
index 000000000000..a529695d23cc
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+ifneq ($(KERNELRELEASE),)
+
+obj-m := finit_module.o
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
+MAKE_TARGETS		:= finit_module01 finit_module02 finit_module.ko
+
+include $(top_srcdir)/include/mk/module.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+endif
diff --git a/testcases/kernel/syscalls/finit_module/finit_module.c b/testcases/kernel/syscalls/finit_module/finit_module.c
new file mode 100644
index 000000000000..78d03b899a7e
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Dummy test module.
+ *
+ * The module accepts a single argument named "status" and it fails
+ * initialization if the status is set to "invalid".
+ */
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
index 000000000000..c31c0c2dce4c
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -0,0 +1,49 @@
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
+#include "tst_module.h"
+
+#define MODULE_NAME	"finit_module.ko"
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
+	TST_EXP_PASS(finit_module(fd, "status=valid", 0));
+	if (!TST_PASS)
+		return;
+
+	tst_module_unload(MODULE_NAME);
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
index 000000000000..088b15055221
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -0,0 +1,89 @@
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
+#include "tst_module.h"
+#include "tst_capability.h"
+
+#define MODULE_NAME	"finit_module.ko"
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
+	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, EBADF}, /* Keep this at index 0 */
+	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL},
+	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT},
+	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL},
+	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL},
+	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM},
+	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST},
+	{"file-not-readable", &fd, "", O_WRONLY | O_CLOEXEC, 0, 0, EBADF},
+};
+
+static void setup(void)
+{
+	finit_module_supported_by_kernel();
+
+	/* Kernel returned ENOEXEC for fd = -1 earlier */
+	if ((tst_kvercmp(4, 6, 0)) < 0)
+		tcases[0].exp_errno = ENOEXEC;
+}
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
+	/* Insert module twice */
+	if (tc->exp_errno == EEXIST)
+		tst_module_load(MODULE_NAME, NULL);
+
+	TST_EXP_FAIL(finit_module(*tc->fd, tc->param, tc->flags), tc->exp_errno);
+
+	if (tc->exp_errno == EEXIST)
+		tst_module_unload(MODULE_NAME);
+
+	if (!TST_PASS && !TST_RET)
+		tst_module_unload(MODULE_NAME);
+
+	if (tc->cap)
+		tst_cap_action(&cap_req);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.needs_root = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
