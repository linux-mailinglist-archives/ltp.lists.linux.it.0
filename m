Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A049C14AE43
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 04:03:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 257023C23A7
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 04:03:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5977F3C257C
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 04:03:00 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D0D3600C47
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 04:02:59 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id n7so5857204pfn.0
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 19:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PDOXyKf7IEgBeMqxHy9nMGHDOZ+teeloGq0T1cUZ1a8=;
 b=E468Y6G6F32yKMe+Jh6bXF0szgj3Pyu8S4XLRyZx87ecMcJulQYoeqGkGVYaeEbQMc
 ZkBrkzfHEaFwTlBGCcyOgwl/zBcGrx/chQsqFhzEUSlYr1vcxC2W6UcIlZDvob3rc8yq
 cYhItaoXhp4TVUCIL1tEaBwCatV50IcnHj7cs/AFfFXZZbKHFCloUzD80Geioqe+CXXP
 9MmkctZ/0/EpVEo/MKMOSd59ukx3p0ACF0zRSwKghVb67IuuHAqTVwDTHw3WhAosFi4n
 ppAYvARzeVzqMPAFF+i68uQhwQ7hri19FejkXmh4bCxhpghmPUzfsRk7L4BEXFvRCCqu
 sHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDOXyKf7IEgBeMqxHy9nMGHDOZ+teeloGq0T1cUZ1a8=;
 b=TBJiDL3bjJqTxvlxqN3IKzMBp12fyNhnv4QkYIw8byFeOBRRb5WGrOzXZ0wRrtq7CG
 rDN4wv/FiwVeiP+4a6d4veQXNRsCNGBiBbzCQnGMx2HcJuK119aJlTILwHFZO6R3pjXL
 HuMsn+UK3X2mbfwPkukrwwTYbt0/PFWDltavOAns3tCkUJ+6Zj7QF2q0MP1k4i9s54Xi
 G0DRzgLH7yGfd6ZuL7gdWuYziJkpMRpH9c0bZN8eZ7LCh00S59dxdbUF+fVKESJ9MQab
 TMk/WtpSRdPwmV8rC4X6/NRL8ZsRtVZ5qRRPviCeM8nBsnaeMv3IFHYIdY4C90BVVTJW
 wMNg==
X-Gm-Message-State: APjAAAV4RlesP9kP5DtJGhPWDnIv5egV3pQjPxkkwak/JM6GAxBOgNn6
 HnDlTWjJqNdshWjVNYHs63OGRQ==
X-Google-Smtp-Source: APXvYqzI01IM2y49CE5XKBMtXwa34RRROtZjVynDhmlVraQpwbT9P3TLl+lEvxVbHUPiXCnwMHSCzg==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr22436461pgt.124.1580180577606; 
 Mon, 27 Jan 2020 19:02:57 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id a17sm456976pjv.6.2020.01.27.19.02.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 19:02:55 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 28 Jan 2020 08:32:52 +0530
Message-Id: <cc9d0f47db41cad97c590cf7b58e8d662a437a91.1580180304.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
References: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V4 2/2] syscalls/io_pgetevents: New tests
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
V3->V4:
- Dropped few helpers from io_pgetevents.h as loading the AIO_LIBS from
  Makefile made the warnings go away.
- Better handling of the failure in setup() path.
- Use "return" to avoid using if/else maze.

V2->V3:
- Dropped duplicate headers
- Handle failure tests with global variable
- All changes were inspired from the reviews of pidfd_open() patchset.

V1->V2:
- Do the failure testing with help of array and .tcnt.
- Use tst_syscall().
- Removed cleanup() routines.
- Improved print messages and few more minor changes.

 configure.ac                                  |   1 +
 include/lapi/io_pgetevents.h                  |  30 +++++
 runtest/syscalls                              |   4 +
 .../kernel/syscalls/io_pgetevents/.gitignore  |   2 +
 .../kernel/syscalls/io_pgetevents/Makefile    |   9 ++
 .../syscalls/io_pgetevents/io_pgetevents01.c  |  61 +++++++++++
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 103 ++++++++++++++++++
 7 files changed, 210 insertions(+)
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
index 000000000000..5cdaffb6b15d
--- /dev/null
+++ b/include/lapi/io_pgetevents.h
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IO_PGETEVENTS_H
+#define IO_PGETEVENTS_H
+
+#include <sys/syscall.h>
+#include <sys/types.h>
+
+#include "config.h"
+#include "lapi/syscalls.h"
+#include "tst_test.h"
+
+#ifdef HAVE_LIBAIO
+#include <libaio.h>
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
index a28a1f2ecd45..0743cf4e3f74 100644
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
index 000000000000..c26cffd37f39
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+LDLIBS			+= $(AIO_LIBS)
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
new file mode 100644
index 000000000000..d685adb48759
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic io_pgetevents() test to receive 1 event successfully.
+ */
+#include "lapi/io_pgetevents.h"
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
+		tst_res(TPASS, "io_pgetevents() works as expected");
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
index 000000000000..0c7fc59024df
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic io_pgetevents() test to check various failures.
+ */
+#include "lapi/io_pgetevents.h"
+
+#ifdef HAVE_LIBAIO
+static sigset_t sigmask;
+static struct io_event events[1];
+static io_context_t ctx, invalid_ctx = 0;
+static int fd, ctx_initialized;
+
+static struct tcase {
+	char *name;
+	io_context_t *ctx;
+	long min_nr;
+	long max_nr;
+	struct io_event *events;
+	struct timespec *timeout;
+	sigset_t *sigmask;
+	int exp_errno;
+} tcases[] = {
+	{"invalid ctx", &invalid_ctx, 1, 1, events, NULL, &sigmask, EINVAL},
+	{"invalid min_nr", &ctx, -1, 1, events, NULL, &sigmask, EINVAL},
+	{"invalid max_nr", &ctx, 1, -1, events, NULL, &sigmask, EINVAL},
+	{"invalid events", &ctx, 1, 1, NULL, NULL, &sigmask, EFAULT},
+	{"invalid timeout", &ctx, 1, 1, events, (void *)(0xDEAD), &sigmask, EFAULT},
+	{"invalid sigmask", &ctx, 1, 1, events, NULL, (void *)(0xDEAD), EFAULT},
+};
+
+static void setup(void)
+{
+	struct iocb cb, *cbs[1];
+	char data[4096];
+	int ret;
+
+	cbs[0] = &cb;
+
+	sigemptyset(&sigmask);
+
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+	io_prep_pwrite(&cb, fd, data, 4096, 0);
+
+	ret = io_setup(1, &ctx);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "io_setup() failed");
+
+	ctx_initialized = 1;
+
+	ret = io_submit(ctx, 1, cbs);
+	if (ret != 1)
+		tst_brk(TBROK | TERRNO, "io_submit() failed");
+}
+
+static void cleanup(void)
+{
+	if (ctx_initialized) {
+		if (io_destroy(ctx) < 0)
+			tst_res(TBROK | TERRNO, "io_destroy() failed");
+	}
+
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events,
+			   tc->timeout, tc->sigmask));
+
+	if (TST_RET == 1) {
+		tst_res(TFAIL, "%s: io_pgetevents() passed unexpectedly",
+			tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: io_pgetevents() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: io_pgetevents() failed as expected",
+		tc->name);
+}
+
+static struct tst_test test = {
+	.min_kver = "4.18",
+	.needs_tmpdir = 1,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
+
+#else
+TST_TEST_TCONF("test requires libaio and it's development packages");
+#endif
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
