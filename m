Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F072DBEFD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:50:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74A0D3C6726
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:50:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 296BC3C2800
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:50:34 +0100 (CET)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0266D600856
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:50:29 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id m5so1370637pjv.5
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25+sC0f4YvDtObBx5bEFrF0rvw57IUicBPESwoZM93Y=;
 b=jvqeGkCvMJMNm9kwLN6XL9dX4Arr3ZcwYnxv+80IV7CanIxyMbKqr4Wv8IY06jDy9F
 kZ9mve1L1lzq+VFfmBZcnxreejKjbxJv5kgIkdTAsriaDRY9/UxKFgeLbaRAq3/ntkSK
 v0jzMHp9hPo79sSgo+xidFIXsBS8q8EQbYCxrBVUnS2ILit1CmEOaYhfsWhOGPGYwiGN
 3g+39S2Jfves/UQd9bpeS3aWtsk4sYZRC57hk2ZwFAcrJJjwkX24Gr5NG61ZAmUoOao/
 j1HhYiGxstbb4UjGp2ix8oyDTT0CWCuS52wtYB5mBJACvO2jb2Gg6vwA4Noqv0gHzJ0n
 675g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25+sC0f4YvDtObBx5bEFrF0rvw57IUicBPESwoZM93Y=;
 b=Z4ed9s9+yoTm/iZJWbQveaof+DN/xP8nLV4t5npBmsMPBQzn5hxhBSV9pgg8tzHg/H
 GMDSq7CGV3zqq6mZXud1iKtiomKGBdO67/Qr6cumgQqMg33sIb3+XVtGTTh45oCv0Xj4
 /UU6w/ragoxnEiC4wngH7N+J2Ezxgg4hv1lCZt2NlW6lZwT0QRNyc4ialD/GHKlDYI4T
 82PPBXpJnwrYCktLPMvuJ0iTiu9FpblIuVX91hVF6WZToPbB5EITFLa3Stp1M+GWhiUl
 En7YBLuvJLsbOsZOliWPrM7I/Y3iED2M+j9DO5Mes6bKCOheiD+ZqE8k79/If/kAFuWz
 VUmg==
X-Gm-Message-State: AOAM532ynrIY+XTRU8iUBG+Aa1UjaB0azQ3p2MmkUv7jq5DFp1fmUVmk
 GF6VHx0Ek3BUTVkJP+3ea2VMlau/BCig1A==
X-Google-Smtp-Source: ABdhPJy3t6j5HVD0dtMcwWBq1XMAKpUSYN1SZ4bqWqCCTU8d6VUiCOtarJhIDFrWnecTv/A1fcDAiA==
X-Received: by 2002:a17:902:8f90:b029:db:fc74:c59a with SMTP id
 z16-20020a1709028f90b02900dbfc74c59amr1780983plo.58.1608115827798; 
 Wed, 16 Dec 2020 02:50:27 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id mq8sm1607058pjb.13.2020.12.16.02.50.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 02:50:26 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 16:20:20 +0530
Message-Id: <5b2a65fa61ea2eb897a9a79827ad7b5f0a8e61cd.1608115761.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls: init_module: Add tests
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

This patch adds success and failure tests for init_module() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |   1 +
 include/lapi/init_module.h                    |  21 ++++
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/init_module/.gitignore    |   3 +
 .../kernel/syscalls/init_module/Makefile      |  21 ++++
 .../kernel/syscalls/init_module/dummy_mod.c   |  43 +++++++
 .../syscalls/init_module/init_module01.c      |  59 +++++++++
 .../syscalls/init_module/init_module02.c      | 115 ++++++++++++++++++
 8 files changed, 266 insertions(+)
 create mode 100644 include/lapi/init_module.h
 create mode 100644 testcases/kernel/syscalls/init_module/.gitignore
 create mode 100644 testcases/kernel/syscalls/init_module/Makefile
 create mode 100644 testcases/kernel/syscalls/init_module/dummy_mod.c
 create mode 100644 testcases/kernel/syscalls/init_module/init_module01.c
 create mode 100644 testcases/kernel/syscalls/init_module/init_module02.c

diff --git a/configure.ac b/configure.ac
index 06be1c09417a..9840d99525fb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -89,6 +89,7 @@ AC_CHECK_FUNCS_ONCE([ \
     getauxval \
     getdents \
     getdents64 \
+    init_module \
     io_pgetevents \
     io_uring_setup \
     io_uring_register \
diff --git a/include/lapi/init_module.h b/include/lapi/init_module.h
new file mode 100644
index 000000000000..ad556aec4aaa
--- /dev/null
+++ b/include/lapi/init_module.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef INIT_MODULE_H__
+#define INIT_MODULE_H__
+
+#include "config.h"
+#include "lapi/syscalls.h"
+#include "tst_test.h"
+
+#ifndef HAVE_INIT_MODULE
+static inline int init_module(void *module_image, unsigned long len,
+			      const char *param_values)
+{
+	return tst_syscall(__NR_init_module, module_image, len, param_values);
+}
+#endif
+#endif /* INIT_MODULE_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index 9c328697b4a3..28174dddd716 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -517,6 +517,9 @@ getxattr03 getxattr03
 getxattr04 getxattr04
 getxattr05 getxattr05
 
+init_module01 init_module01
+init_module02 init_module02
+
 #Needs tty device.
 #ioctl01 ioctl01 -D /dev/tty0
 #ioctl02 ioctl02 -D /dev/tty0
diff --git a/testcases/kernel/syscalls/init_module/.gitignore b/testcases/kernel/syscalls/init_module/.gitignore
new file mode 100644
index 000000000000..91e8ab971ccd
--- /dev/null
+++ b/testcases/kernel/syscalls/init_module/.gitignore
@@ -0,0 +1,3 @@
+/init_module01
+/init_module02
+/dummy_mod.ko
diff --git a/testcases/kernel/syscalls/init_module/Makefile b/testcases/kernel/syscalls/init_module/Makefile
new file mode 100644
index 000000000000..ec40fb55c8fc
--- /dev/null
+++ b/testcases/kernel/syscalls/init_module/Makefile
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
+REQ_VERSION_MAJOR	:= 2
+REQ_VERSION_PATCH	:= 6
+
+MAKE_TARGETS		:= init_module01 init_module02 dummy_mod.ko
+
+include $(top_srcdir)/include/mk/module.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+endif
diff --git a/testcases/kernel/syscalls/init_module/dummy_mod.c b/testcases/kernel/syscalls/init_module/dummy_mod.c
new file mode 100644
index 000000000000..7c0b7a06aaa4
--- /dev/null
+++ b/testcases/kernel/syscalls/init_module/dummy_mod.c
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
diff --git a/testcases/kernel/syscalls/init_module/init_module01.c b/testcases/kernel/syscalls/init_module/init_module01.c
new file mode 100644
index 000000000000..9e8b03553a11
--- /dev/null
+++ b/testcases/kernel/syscalls/init_module/init_module01.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic init_module() tests.
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
+static struct stat sb;
+static void *buf;
+
+static void setup(void)
+{
+	int fd;
+
+	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
+	SAFE_FSTAT(fd, &sb);
+	buf = SAFE_MMAP(0, sb.st_size, PROT_READ|PROT_EXEC, MAP_PRIVATE, fd, 0);
+	SAFE_CLOSE(fd);
+}
+
+static void run(void)
+{
+	TEST(init_module(buf, sb.st_size, "status=valid"));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "init_module() failed for %s",
+			MODULE_NAME);
+		return;
+	}
+
+	tst_module_unload(NULL, MODULE_NAME);
+
+	tst_res(TPASS, "init_module() passed");
+}
+
+static void cleanup(void)
+{
+	munmap(buf, sb.st_size);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
new file mode 100644
index 000000000000..d93c5cec856b
--- /dev/null
+++ b/testcases/kernel/syscalls/init_module/init_module02.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic init_module() failure tests.
+ *
+ * [ALGORITHM]
+ *
+ * Tests various failure scenarios for init_module().
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
+static unsigned long size, zero_size;
+static void *buf, *faulty_buf, *null_buf;
+
+static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
+static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
+
+static struct tcase {
+	const char *name;
+	void **buf;
+	unsigned long *size;
+	const char *param;
+	int cap;
+	int exp_errno;
+} tcases[] = {
+	{"NULL-buffer", &null_buf, &size, "", 0, EFAULT},
+	{"faulty-buffer", &faulty_buf, &size, "", 0, EFAULT},
+	{"null-param", &buf, &size, NULL, 0, EFAULT},
+	{"zero-size", &buf, &zero_size, "", 0, ENOEXEC},
+	{"invalid_param", &buf, &size, "status=invalid", 0, EINVAL},
+	{"no-perm", &buf, &size, "", 1, EPERM},
+	{"module-exists", &buf, &size, "", 0, EEXIST},
+};
+
+static void setup(void)
+{
+	struct stat sb;
+	int fd;
+
+	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
+	SAFE_FSTAT(fd, &sb);
+	size = sb.st_size;
+	buf = SAFE_MMAP(0, size, PROT_READ|PROT_EXEC, MAP_PRIVATE, fd, 0);
+	SAFE_CLOSE(fd);
+
+	faulty_buf = tst_get_bad_addr(NULL);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	if (tc->cap)
+		tst_cap_action(&cap_drop);
+
+	TEST(init_module(*tc->buf, *tc->size, tc->param));
+
+	/* Insert module twice */
+	if (tc->exp_errno == EEXIST) {
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO,
+				"%s: init_module() failed unexpectedly",
+				tc->name);
+			return;
+		}
+
+		TEST(init_module(*tc->buf, *tc->size, tc->param));
+		tst_module_unload(NULL, MODULE_NAME);
+	}
+
+	if (tc->cap)
+		tst_cap_action(&cap_req);
+
+	if (TST_RET != -1) {
+		tst_module_unload(NULL, MODULE_NAME);
+		tst_res(TFAIL, "%s: init_module() passed unexpectedly",
+			tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO,
+			"%s: init_module() should fail with %s", tc->name,
+			tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: init_module() failed as expected",
+		tc->name);
+}
+
+static void cleanup(void)
+{
+	munmap(buf, size);
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
