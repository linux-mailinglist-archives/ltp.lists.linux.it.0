Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350E2DDEC1
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 07:55:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A03443C2A3B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 07:55:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 70F223C29E1
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 07:55:46 +0100 (CET)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B25FD200764
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 07:55:45 +0100 (CET)
Received: by mail-pf1-x435.google.com with SMTP id d2so971187pfq.5
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 22:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aMZIP5cwdNkYBvhg6bcFRwElTCFg0QdLnEsGug37J8=;
 b=w2dCPm/Rnc8SowLDjJwPbg7XA9Dd+sMngpHPevUX+oQtzFf7hOgloHXHWmj64GfYl3
 fpxRhj/vTlOlxKSeslfoag1KtL387jG4xKkZOAdZAm4k43E6hRJbhyaL5bvRgCaKaMaD
 x1tjRmJemJ42gXE7F/Rd0zmmzjloaaWxULdmZzHfbg8BZulprndk/gXbxCtVTUkz3c0Z
 iEofIfbqx8/yVXiVyXD4EGOhL+wtmd27cqZv5rD3nfu7UzdKt7hxev7qH8JDW3DNljMZ
 CSb9pDIjY13r2mBX9QPlLeQMkH6WpF74ja/6KWpQncOkco0ryfnrNWI8s/ADl4BsvbYB
 vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aMZIP5cwdNkYBvhg6bcFRwElTCFg0QdLnEsGug37J8=;
 b=GmBm8cz4UzC8zBpri1PrfQkWNZBr0rJjIe6fRwMg5GSYtWSIyiTb63MFRWIPyIIoPM
 azVZwjADqTd6U3Mc6qoeO2TqlGqrvRzm0QFTtuVcQZCuLg7M+Ludr4X5zZmW/7fOw3uL
 7meUGNDvvpOIEm3Ib/V2S983H9J81mmjFlRBtEIAaxvKrtsVwezzzcuiKJw1+QU1Q9IT
 gTx/7D46iDI/I8qY03XjkNHwkuu6yb8/4XvQx+TAsNjNvF62/wqLQ+WfWH47vjqvXQbf
 4jhV9HkKo/mAKVl1gH+DmTbEriG2yIxFCJX4ksr6fm9e5XkB/3R0M1lKkjaUcA5ysPx8
 Zamw==
X-Gm-Message-State: AOAM531vAlBYzQOzTwmQWnpIY+wmhQSP6zMsvPnMrIBcTkbHCP4VCMS1
 XQDbm8CJiRWsqtNXOCpd7nkEPhfzrTNHAA==
X-Google-Smtp-Source: ABdhPJwUIw/qqJNTVf86/k5yTqZyCEoTz51gxDEZM8aUUGvUIm1LtTxF83/rOJxr1SyK4ZnqzeggEQ==
X-Received: by 2002:a62:2e86:0:b029:1a6:5f94:2cb with SMTP id
 u128-20020a622e860000b02901a65f9402cbmr2958479pfu.19.1608274543712; 
 Thu, 17 Dec 2020 22:55:43 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id g6sm7008091pjj.48.2020.12.17.22.55.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 22:55:42 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 18 Dec 2020 12:25:31 +0530
Message-Id: <6c5fc72fcdc5e10a85249ae6d6f8cbb3f822ddf4.1608274502.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
References: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V4 3/3] syscalls: finit_module: Add tests
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
V4:
- Add fix_errno() callback in tcase in finit_module02.c and use it for 3
  of the tests.
- Add test where fd is a directory.

 include/lapi/init_module.h                    |  16 +++
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/finit_module/.gitignore   |   3 +
 .../kernel/syscalls/finit_module/Makefile     |  21 +++
 .../syscalls/finit_module/finit_module.c      |  37 +++++
 .../syscalls/finit_module/finit_module01.c    |  49 +++++++
 .../syscalls/finit_module/finit_module02.c    | 131 ++++++++++++++++++
 7 files changed, 260 insertions(+)
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
index 000000000000..109de94821da
--- /dev/null
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -0,0 +1,131 @@
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
+#define TEST_DIR	"test_dir"
+
+static int fd, fd_zero, fd_invalid = -1, fd_dir;
+
+static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
+static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
+
+struct tcase {
+	const char *name;
+	int *fd;
+	const char *param;
+	int open_flags;
+	int flags;
+	int cap;
+	int exp_errno;
+	void (*fix_errno)(struct tcase *tc);
+};
+
+static void bad_fd_setup(struct tcase *tc)
+{
+	if (tst_kvercmp(4, 6, 0) < 0)
+		tc->exp_errno = ENOEXEC;
+	else
+		tc->exp_errno = EBADF;
+}
+
+static void wo_file_setup(struct tcase *tc)
+{
+	if (tst_kvercmp(4, 6, 0) < 0)
+		tc->exp_errno = EBADF;
+	else
+		tc->exp_errno = ETXTBSY;
+}
+
+static void dir_setup(struct tcase *tc)
+{
+	if (tst_kvercmp(4, 6, 0) < 0)
+		tc->exp_errno = EISDIR;
+	else
+		tc->exp_errno = EINVAL;
+}
+
+static struct tcase tcases[] = {
+	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, bad_fd_setup},
+	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
+	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT, NULL},
+	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
+	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, NULL},
+	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM, NULL},
+	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, NULL},
+	{"file-not-readable", &fd, "", O_WRONLY | O_CLOEXEC, 0, 0, 0, wo_file_setup},
+	{"directory", &fd_dir, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, dir_setup},
+};
+
+static void setup(void)
+{
+	unsigned long int i;
+
+	finit_module_supported_by_kernel();
+	SAFE_MKDIR(TEST_DIR, 0700);
+	fd_dir = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
+
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (tcases[i].fix_errno)
+			tcases[i].fix_errno(&tcases[i]);
+	}
+}
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fd_dir);
+	SAFE_RMDIR(TEST_DIR);
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
+	TST_EXP_FAIL(finit_module(*tc->fd, tc->param, tc->flags), tc->exp_errno,
+		     "TestName: %s", tc->name);
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
+	.cleanup = cleanup,
+	.needs_root = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
