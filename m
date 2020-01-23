Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833714613D
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:01:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24A9F3C237E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:01:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 590003C2377
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:01:35 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 715321A01087
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:01:33 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id p9so814660plk.9
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 21:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BhvSmjbBbs325AykEZZ5eRfW9fRlYZRfIOHwDhZhZro=;
 b=mHHwqKbqdWP4WPn0g5biVUVwRhtq1MQNZKyDo7yW5xwLokDZPpnZivVtP8hwMIGAVl
 3eh4cDJOzEVvKxtXIcjmnqRmVjl+7WZckYViEjGvDhbqE6urHC8R/r9VmUbZ8W1XJHGG
 nWtUFGcakJgnYW69FVFf2W83SQt+4BW92N7/7/mBnQasZhfsA5It9RDM29tMNeSleZOa
 mg30dNxo8RrLnP/+I97wONvO9ShzBLuUnWyjll5qPxWNLCIsE8AbJrBxLIrGPA/VYr9g
 JJQoW1UzfaZYFU6HV0VSp7eSyoe2YvNlVVVRd8M8CvkkqaNI30eCvjRs9KdZ4FfCIfoq
 CUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BhvSmjbBbs325AykEZZ5eRfW9fRlYZRfIOHwDhZhZro=;
 b=PjB85BD6kikQkGYHwBXDxcwP5VuWYEvtb9Ink1kdzPRFsfik3I3F9G4/Ltr1Fq7Msw
 /Af1i5bKGlv41WsHNhYykCQ8QkrdZaIYtx05CvFcBTv71Q4E13LuOXabDvSFRout6o3h
 5ARqBZ841iT86Jb01dgyVtu2H/nVNz4zotgnVDGOe1y3DO2Bly7V3KwX34akBs9soWz5
 G1YBCTIyaP+lQr3wzJZWaDhRSA9KTNanJDTcLz3T5hu9D+XElTwMooXZvqSKzXDTVdPD
 UdSCknYgbFuBa8RxTt1SxoFTwIgtzLsmo0se90a1QTohjsehCAx3Q/rYL2Sc+dKa+aux
 fnfQ==
X-Gm-Message-State: APjAAAUTdyIvd+7q2ZChWU9mb62Bk0AYAzJysRJpOCKcvYuRxCIL3Tjj
 8Wd4cRlh/8nUD4b43piF9Q6kia6mxxs=
X-Google-Smtp-Source: APXvYqwo4hbvfrror853lxxrOK31nm2FKxFTVKUwKTXvx7pjIpB7oVmq29Ry0j71S8Hkf9XEDL5S2w==
X-Received: by 2002:a17:902:8549:: with SMTP id
 d9mr14217019plo.153.1579755691454; 
 Wed, 22 Jan 2020 21:01:31 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id g7sm644911pfq.33.2020.01.22.21.01.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 21:01:30 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 10:31:24 +0530
Message-Id: <6aae63a2e362a0f09cf35fff058e7741f0987208.1579755655.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/io_pgetevents
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

Add tests to check working of io_pgetevents() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |  1 +
 include/lapi/io_pgetevents.h                  | 49 +++++++++++
 runtest/syscalls                              |  4 +
 .../kernel/syscalls/io_pgetevents/.gitignore  |  2 +
 .../kernel/syscalls/io_pgetevents/Makefile    |  6 ++
 .../syscalls/io_pgetevents/io_pgetevents01.c  | 73 +++++++++++++++++
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 81 +++++++++++++++++++
 7 files changed, 216 insertions(+)
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
index 000000000000..0499dc03b3f2
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
+	return syscall(__NR_io_setup, nr, ctxp);
+}
+#endif /* HAVE_IO_SETUP */
+
+#ifndef HAVE_IO_DESTROY
+int io_destroy(io_context_t ctx)
+{
+	return syscall(__NR_io_destroy, ctx);
+}
+#endif /* HAVE_IO_DESTROY */
+
+#ifndef HAVE_IO_SUBMIT
+int io_submit(io_context_t ctx, long nr, struct iocb **iocbpp)
+{
+	return syscall(__NR_io_submit, ctx, nr, iocbpp);
+}
+#endif /* HAVE_IO_SUBMIT */
+
+#ifndef HAVE_IO_PGETEVENTS
+int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
+		 struct io_event *events, struct timespec *timeout,
+		 sigset_t *sigmask)
+{
+	return tst_syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events, timeout, sigmask);
+}
+#endif /* HAVE_IO_PGETEVENTS */
+#endif /* HAVE_LIBAIO */
+
+#endif /* IO_PGETEVENTS_H */
diff --git a/runtest/syscalls b/runtest/syscalls
index a2d749d526a8..6d167b800ac7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -554,6 +554,10 @@ ioprio_set03 ioprio_set03
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
index 000000000000..f8a12193dd2c
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -0,0 +1,73 @@
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
+
+static int fd = -1;
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fd);
+}
+
+static void run(void)
+{
+	struct io_event events[1];
+	struct iocb cb, *cbs[1];
+	io_context_t ctx = 0;
+	sigset_t sigmask;
+	char data[4096];
+	int ret;
+
+	sigemptyset(&sigmask);
+
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+
+	ret = io_setup(1, &ctx);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "io_setup() failed");
+
+	io_prep_pwrite(&cb, fd, data, 4096, 0);
+
+	cbs[0] = &cb;
+
+	ret = io_submit(ctx, 1, cbs);
+	if (ret != 1)
+		tst_brk(TBROK | TERRNO, "io_submit() failed");
+
+	/* get the reply */
+	ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
+
+	if (io_destroy(ctx) < 0)
+		tst_brk(TBROK | TERRNO, "io_destroy() failed");
+
+	if (ret == 1)
+		tst_res(TPASS, "io_pgetevents() working as expected");
+	else
+		tst_brk(TBROK| TERRNO, "io_pgetevents() failed");
+}
+
+static struct tst_test test = {
+	.min_kver = "4.18",
+	.test_all = run,
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+};
+
+#else
+TST_TEST_TCONF("test requires libaio and it's development packages");
+#endif
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
new file mode 100644
index 000000000000..de101e6cd0e9
--- /dev/null
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -0,0 +1,81 @@
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
+
+static int fd = -1;
+
+static void cleanup(void)
+{
+	SAFE_CLOSE(fd);
+}
+
+static void run(void)
+{
+	struct io_event events[1];
+	struct iocb cb, *cbs[1];
+	io_context_t ctx = 0;
+	sigset_t sigmask;
+	char data[4096];
+	int ret;
+
+	sigemptyset(&sigmask);
+
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+
+	ret = io_setup(1, &ctx);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "io_setup() failed");
+
+	io_prep_pwrite(&cb, fd, data, 4096, 0);
+
+	cbs[0] = &cb;
+
+	ret = io_submit(ctx, 1, cbs);
+	if (ret != 1)
+		tst_brk(TBROK | TERRNO, "io_submit() failed");
+
+	/* Invalid Max event count */
+	ret = io_pgetevents(ctx, 1, 0, events, NULL, &sigmask);
+
+	/* Invalid events*/
+	if (ret != 1)
+		ret = io_pgetevents(ctx, 1, 1, NULL, NULL, &sigmask);
+
+	if (io_destroy(ctx) < 0)
+		tst_brk(TBROK | TERRNO, "io_destroy() failed");
+
+	/* Invalid ctx */
+	if (ret != 1)
+		ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
+
+	if (ret != 1)
+		tst_res(TPASS, "io_pgetevents() failed as expected");
+	else
+		tst_brk(TBROK| TERRNO, "io_pgetevents() passed unexpectedly");
+}
+
+static struct tst_test test = {
+	.min_kver = "4.18",
+	.test_all = run,
+	.needs_tmpdir = 1,
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
