Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31313147CAC
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:53:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9E8F3C23A3
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:53:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 28F2D3C242F
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:53:41 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5B03860BCE2
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:53:36 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id g6so553013plp.6
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 01:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6/g17AIXvwxBBZhnqt/1JpLM38EwcYv13U5tQglCXQI=;
 b=FXRHxpGfPpzR8YPv7I8uiu5VuXR/jMkWPP6Za+5+PIXLSIvxbRPkM2SP9Zx1HEoD6E
 3mkL9Su4eNpym0K7goMi+gamEclyDL9WFjgCIitOkejmNTxN0WNv8Q+T4H6DI4SAhHpf
 kJrmSJ9WbTkmBwjnv2E01qmFZPU6qTcmDgO7mODy0dy5DU81NMtoCw3NnWVbAjjyWQWI
 czke7Ztxb6kL/bmiiDSpl0u/Yuuij2pI+15IN9rAELXyWEPNdA+fJUmjki630VuTj7+t
 P5mocVkoO4M1rnzx23HRjeoot4vpf/Nx43WHVqY6AjmlSuh+XDhQCdYR5WXzHNgvDJPZ
 OlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6/g17AIXvwxBBZhnqt/1JpLM38EwcYv13U5tQglCXQI=;
 b=GoJDLaPwL+Yi0t4ufpNmnhtaplUQx2rqQ/O5bUAiM5gIvQ1lK45Zw0UbZoxJysM39W
 D0zo/C5208yuvR5TLNXbCTvaa8bU18dXG8nF6yNYBTk3ApgE2feLHcD9bFBrHSKrgDZ/
 44VIAbLvA7TFsOhHDtSkCykOqBOivDPKUNdrQvR8UyDXrB7pItgW8uw2eEmxA52zuO8f
 UxCJovFpMeI6q/lN5LBxZ24oyUIfqlGX0+O93cGRJZf5MXZHuhLC+Y2lZbNg6/YqfBV3
 MVe8hkg9xuQflSjB4dY+Q2AeU/lXVz0JaOvtCvqtlRAcvT5wyu/OSh84TtqObhngVDDS
 1nHA==
X-Gm-Message-State: APjAAAU+O9pS6H/rLEtsjfFuF+QKTMw1Ehk06Jsy2FcThGkgqVOo2YYF
 rtpltfJoiNWdvjpEuidPOVs1Eg==
X-Google-Smtp-Source: APXvYqy+Px7XMiafTs7Zwx2PYbg4jJ8R2ZgTHUQcbfGLa9c0qQZkbpee1zddzeeGfLH+XAtm0gYmJA==
X-Received: by 2002:a17:90a:748:: with SMTP id
 s8mr2326869pje.104.1579859615952; 
 Fri, 24 Jan 2020 01:53:35 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id ep12sm6236256pjb.7.2020.01.24.01.53.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 01:53:35 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 24 Jan 2020 15:23:29 +0530
Message-Id: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <d3a4f3d5740a64a51752bba89f2b8e2c5326b78c.1579859350.git.viresh.kumar@linaro.org>
References: <d3a4f3d5740a64a51752bba89f2b8e2c5326b78c.1579859350.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/2] syscalls/io_pgetevents
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
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add tests to check working of io_pgetevents() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- Do the failure testing with help of array and .tcnt.
- Use tst_syscall().
- Removed cleanup() routines.
- Improved print messages and few more minor changes.

 configure.ac                                  |   1 +
 include/lapi/io_pgetevents.h                  |  49 ++++++++
 runtest/syscalls                              |   4 +
 .../kernel/syscalls/io_pgetevents/.gitignore  |   2 +
 .../kernel/syscalls/io_pgetevents/Makefile    |   6 +
 .../syscalls/io_pgetevents/io_pgetevents01.c  |  69 +++++++++++
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 111 ++++++++++++++++++
 7 files changed, 242 insertions(+)
 create mode 100644 include/lapi/io_pgetevents.h
 create mode 100644 testcases/kernel/syscalls/io_pgetevents/.gitignore
 create mode 100644 testcases/kernel/syscalls/io_pgetevents/Makefile
 create mode 100644 testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
 create mode 100644 testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c

diff --git a/configure.ac b/configure.ac
index 1bf0911d88ad..c7cdff1c422c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -75,6 +75,7 @@ AC_CHECK_FUNCS([ \
     getdents \
     getdents64 \
     kcmp \
+    io_pgetevents \
     mkdirat \
     mknodat \
     name_to_handle_at \
diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
new file mode 100644
index 000000000000..c498db83e7d0
--- /dev/null
+++ b/include/lapi/io_pgetevents.h
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IO_PGETEVENTS_H
+#define IO_PGETEVENTS_H
+
+#include <sys/types.h>
+
+#include "config.h"
+#include "lapi/syscalls.h"
+
+#ifdef HAVE_LIBAIO
+#include <libaio.h>
+
+#ifndef HAVE_IO_SETUP
+int io_setup(int nr, io_context_t *ctxp)
+{
+	return tst_syscall(__NR_io_setup, nr, ctxp);
+}
+#endif /* HAVE_IO_SETUP */
+
+#ifndef HAVE_IO_DESTROY
+int io_destroy(io_context_t ctx)
+{
+	return tst_syscall(__NR_io_destroy, ctx);
+}
+#endif /* HAVE_IO_DESTROY */
+
+#ifndef HAVE_IO_SUBMIT
+int io_submit(io_context_t ctx, long nr, struct iocb **iocbpp)
+{
+	return tst_syscall(__NR_io_submit, ctx, nr, iocbpp);
+}
+#endif /* HAVE_IO_SUBMIT */
+
+#ifndef HAVE_IO_PGETEVENTS
+int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
+		 struct io_event *events, struct timespec *timeout,
+		 sigset_t *sigmask)
+{
+	return syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events, timeout, sigmask);
+}
+#endif /* HAVE_IO_PGETEVENTS */
+#endif /* HAVE_LIBAIO */
+
+#endif /* IO_PGETEVENTS_H */
diff --git a/runtest/syscalls b/runtest/syscalls
index f083758bc637..33ec1e59e51d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -556,6 +556,10 @@ ioprio_set03 ioprio_set03
 io_cancel01 io_cancel01
 io_destroy01 io_destroy01
 io_getevents01 io_getevents01
+
+io_pgetevents01 io_pgetevents01
+io_pgetevents02 io_pgetevents02
+
 io_setup01 io_setup01
 io_submit01 io_submit01
 
diff --git a/testcases/kernel/syscalls/io_pgetevents/.gitignore b/testcases/kernel/syscalls/io_pgetevents/.gitignore
new file mode 100644
index 000000000000..ae02077ba44b
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/.gitignore
@@ -0,0 +1,2 @@
+io_pgetevents01
+io_pgetevents02
diff --git a/testcases/kernel/syscalls/io_pgetevents/Makefile b/testcases/kernel/syscalls/io_pgetevents/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
new file mode 100644
index 000000000000..9b34f973c424
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic io_pgetevents() test to receive 1 event successfully.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <fcntl.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include "tst_test.h"
+#include "lapi/io_pgetevents.h"
+#include "lapi/syscalls.h"
+
+#ifdef HAVE_LIBAIO
+static void run(void)
+{
+	struct io_event events[1];
+	struct iocb cb, *cbs[1];
+	io_context_t ctx = 0;
+	sigset_t sigmask;
+	char data[4096];
+	int ret, fd;
+
+	cbs[0] = &cb;
+	sigemptyset(&sigmask);
+
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+	io_prep_pwrite(&cb, fd, data, 4096, 0);
+
+	ret = io_setup(1, &ctx);
+	if (ret < 0) {
+		tst_res(TBROK | TERRNO, "io_setup() failed");
+		goto exit;
+	}
+
+	ret = io_submit(ctx, 1, cbs);
+	if (ret != 1) {
+		tst_res(TBROK | TERRNO, "io_submit() failed");
+		goto exit;
+	}
+
+	/* get the reply */
+	ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
+
+	if (ret == 1)
+		tst_res(TPASS, "io_pgetevents() worked as expected");
+	else
+		tst_res(TFAIL | TERRNO, "io_pgetevents() failed");
+
+	if (io_destroy(ctx) < 0)
+		tst_res(TBROK | TERRNO, "io_destroy() failed");
+
+exit:
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.min_kver = "4.18",
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+
+#else
+TST_TEST_TCONF("test requires libaio and it's development packages");
+#endif
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
new file mode 100644
index 000000000000..35722c4b21d6
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic io_pgetevents() test to check various failures.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <fcntl.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include "tst_test.h"
+#include "lapi/io_pgetevents.h"
+#include "lapi/syscalls.h"
+
+#ifdef HAVE_LIBAIO
+static struct tcase {
+	char *name;
+	int invalid_ctx;
+	long min_nr;
+	long max_nr;
+	int invalid_events;
+	int invalid_timeout;
+	int invalid_sigmask;
+	int exp_errno;
+} tcases[] = {
+	{"test-invalid-ctx", 1, 1, 1, 0, 0, 0, EINVAL},
+	{"test-invalid-min_nr", 0, -1, 1, 0, 0, 0, EINVAL},
+	{"test-invalid-max_nr", 0, 1, -1, 0, 0, 0, EINVAL},
+	{"test-invalid-events", 0, 1, 1, 1, 0, 0, EFAULT},
+	{"test-invalid-timeout", 0, 1, 1, 0, 1, 0, EFAULT},
+	{"test-invalid-sigmask", 0, 1, 1, 0, 0, 1, EFAULT},
+};
+
+static void run(unsigned int n)
+{
+	struct io_event events[1], *events_ptr = NULL;
+	sigset_t sigmask, *psigmask = (void *)(0xDEAD);
+	struct timespec *timeout = (void *)(0xDEAD);
+	struct tcase *tc = &tcases[n];
+	struct iocb cb, *cbs[1];
+	io_context_t ctx = 0;
+	char data[4096];
+	int ret, fd;
+
+	cbs[0] = &cb;
+
+	if (!tc->invalid_timeout)
+		timeout = NULL;
+
+	if (!tc->invalid_sigmask) {
+		psigmask = &sigmask;
+		sigemptyset(psigmask);
+	}
+
+	if (!tc->invalid_events)
+		events_ptr = events;
+
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+	io_prep_pwrite(&cb, fd, data, 4096, 0);
+
+	if (!tc->invalid_ctx) {
+		ret = io_setup(1, &ctx);
+		if (ret < 0) {
+			tst_res(TBROK | TERRNO, "io_setup() failed");
+			goto exit;
+		}
+
+		ret = io_submit(ctx, 1, cbs);
+		if (ret != 1) {
+			tst_res(TBROK | TERRNO, "io_submit() failed");
+			goto exit;
+		}
+	}
+
+	/* Invalid Max event count */
+	TEST(io_pgetevents(ctx, tc->min_nr, tc->max_nr, events_ptr, timeout,
+			   psigmask));
+
+	if (TST_RET == 1) {
+		tst_res(TFAIL, "%s: io_pgetevents() passed unexpectedly",
+			tc->name);
+	} else if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: io_pgetevents() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	} else {
+		tst_res(TPASS | TTERRNO, "%s: io_pgetevents() failed as expected",
+			tc->name);
+	}
+
+	if (!tc->invalid_ctx) {
+		if (io_destroy(ctx) < 0)
+			tst_res(TBROK | TERRNO, "io_destroy() failed");
+	}
+
+exit:
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.min_kver = "4.18",
+	.needs_tmpdir = 1,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+};
+
+#else
+TST_TEST_TCONF("test requires libaio and it's development packages");
+#endif
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
