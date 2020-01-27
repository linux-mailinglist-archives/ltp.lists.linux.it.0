Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD90149FF2
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 09:38:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E6273C2381
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 09:38:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 54A703C003A
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 09:38:02 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF69B201125
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 09:37:57 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id ay11so3501637plb.0
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 00:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaXiOIvjLcLcsrZXmm+cPT732jzSBBCldWoclENU6+w=;
 b=fonjfdU2B8/XbSk/DSOPnbX//Of9DvZigijBKd2eZ+O7wvSr7NPosGBUVsQaTwvI6d
 ++2pCBAeTKulr1soFeaycAOY3f27eIq6HXhDmqlPPt1KX5sq8LTv7oVoetaE6TlIQ3Rn
 52NHoInLRsQPrZvBpsD0/43A3XaY7VjF/gv/+iDrHxNyKS4hZ9o7uhQ9J45KNiWBSNp9
 YsOLGSr8dBWnQf/7FCbAQfRCpg3RfHviANIY+72U00NNSwxsap2RNtx5u6fYCqnboRht
 VEEM6aF/b92dvFiZGyR8XTPgkAWx0NSJv4dIoAPk2GzIzCR0V1F6kyPCg8HZp5iObQbi
 OQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uaXiOIvjLcLcsrZXmm+cPT732jzSBBCldWoclENU6+w=;
 b=H06TWBiKkmdibZ9yj7Oypdsz+tILeAkzD1mD46sQ8CgNWxRVeQ+wELc4hytFH2+eFJ
 GRkDNkomiV47pZWoN3z9Jx5jPXbq/TdliGQPHRw6MJjiiyUX8jAfXHdne+j8grgr74W/
 ZSJm+dquENruonyZYFjYkOux1xAGKG0zh9Fj+uRECSoDPBOsW2Q65IYrTbRnEO4s0Uqd
 60Zelzow/2vOf2Ot3EBaVyt03LlLduf1ZbTCYfY5vAtVHJiRVB14Y/0g96oy+k2pirPc
 K6y5V+v+156c8iNbhLGhEbdCtQPako2hbSJFGGqnc90+E/vDxeqmMV4G+oRkPUDdOAmk
 tJLg==
X-Gm-Message-State: APjAAAVMfKZ4jCb5S9oepYUY4Ljr7WcwDajT6hPLFQPaii3xidApo3yX
 243wdID7WPMCEydCDc5XGwF+mg==
X-Google-Smtp-Source: APXvYqyr8si901uRu7C3LfjO43seU5nxWEnhSWUwgvX/RyIBabV7gquxyKzXsKGQbyiIC4NHjgTUWw==
X-Received: by 2002:a17:90b:14a:: with SMTP id
 em10mr8919453pjb.4.1580114275967; 
 Mon, 27 Jan 2020 00:37:55 -0800 (PST)
Received: from localhost ([122.172.51.87])
 by smtp.gmail.com with ESMTPSA id d189sm14930169pga.70.2020.01.27.00.37.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 00:37:55 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 27 Jan 2020 14:07:48 +0530
Message-Id: <169e5dfcac201330511347e38a25f373fc698c92.1580114160.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <007f89609cfe05cc4f7f0f310f05fc4bb0be829d.1580114160.git.viresh.kumar@linaro.org>
References: <007f89609cfe05cc4f7f0f310f05fc4bb0be829d.1580114160.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V4 2/2] syscalls/pidfd_open
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

Add tests to check working of pidfd_open() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V3->V4:
- Dropped duplicate headers
- Dropped local variable "fd" and used TST_RET directly.
- Handle failure tests with global variable
- Remove else part after creating child process
- Improved print messages

V2->V3:
- Add pidfd_open03 to syscalls and .gitignore files.
- Use TEST, tst_get_unused_pid, etc.
- Do the failure testing with help of array and .tcnt.
- Improved print messages.
- Removed useless comments.
- Few more minor changes.

V1->V2:
- New test to test failures
- Use SAFE_FORK, checkpoints, etc
- Print error numbers as well.
- Improved print messages.

 configure.ac                                  |  1 +
 include/lapi/pidfd_open.h                     | 24 ++++++++
 runtest/syscalls                              |  4 ++
 .../kernel/syscalls/pidfd_open/.gitignore     |  3 +
 testcases/kernel/syscalls/pidfd_open/Makefile |  6 ++
 .../kernel/syscalls/pidfd_open/pidfd_open01.c | 27 +++++++++
 .../kernel/syscalls/pidfd_open/pidfd_open02.c | 58 +++++++++++++++++++
 .../kernel/syscalls/pidfd_open/pidfd_open03.c | 57 ++++++++++++++++++
 8 files changed, 180 insertions(+)
 create mode 100644 include/lapi/pidfd_open.h
 create mode 100644 testcases/kernel/syscalls/pidfd_open/.gitignore
 create mode 100644 testcases/kernel/syscalls/pidfd_open/Makefile
 create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
 create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
 create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open03.c

diff --git a/configure.ac b/configure.ac
index 50d14967d3c6..1bf0911d88ad 100644
--- a/configure.ac
+++ b/configure.ac
@@ -79,6 +79,7 @@ AC_CHECK_FUNCS([ \
     mknodat \
     name_to_handle_at \
     openat \
+    pidfd_open \
     pidfd_send_signal \
     pkey_mprotect \
     preadv \
diff --git a/include/lapi/pidfd_open.h b/include/lapi/pidfd_open.h
new file mode 100644
index 000000000000..9f532f86e18e
--- /dev/null
+++ b/include/lapi/pidfd_open.h
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef PIDFD_OPEN_H
+#define PIDFD_OPEN_H
+
+#include <sys/syscall.h>
+#include <sys/types.h>
+
+#include "lapi/syscalls.h"
+
+#include "config.h"
+
+#ifndef HAVE_PIDFD_OPEN
+int pidfd_open(pid_t pid, unsigned int flags)
+{
+	return tst_syscall(__NR_pidfd_open, pid, flags);
+}
+#endif
+
+#endif /* PIDFD_OPEN_H */
diff --git a/runtest/syscalls b/runtest/syscalls
index 1f7598b2fe25..a28a1f2ecd45 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -848,6 +848,10 @@ pause03 pause03
 personality01 personality01
 personality02 personality02
 
+pidfd_open01 pidfd_open01
+pidfd_open02 pidfd_open02
+pidfd_open03 pidfd_open03
+
 pidfd_send_signal01 pidfd_send_signal01
 pidfd_send_signal02 pidfd_send_signal02
 pidfd_send_signal03 pidfd_send_signal03
diff --git a/testcases/kernel/syscalls/pidfd_open/.gitignore b/testcases/kernel/syscalls/pidfd_open/.gitignore
new file mode 100644
index 000000000000..e0b8900c1c33
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/.gitignore
@@ -0,0 +1,3 @@
+pidfd_open01
+pidfd_open02
+pidfd_open03
diff --git a/testcases/kernel/syscalls/pidfd_open/Makefile b/testcases/kernel/syscalls/pidfd_open/Makefile
new file mode 100644
index 000000000000..5ea7d67db123
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
new file mode 100644
index 000000000000..93bb86687a78
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic pidfd_open() test, fetches the PID of the current process and tries to
+ * get its file descriptor.
+ */
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+
+static void run(void)
+{
+	TEST(pidfd_open(getpid(), 0));
+
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
+
+	SAFE_CLOSE(TST_RET);
+
+	tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
+}
+
+static struct tst_test test = {
+	.min_kver = "5.3",
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
new file mode 100644
index 000000000000..8a549963e34f
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic pidfd_open() test to test invalid arguments.
+ */
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+
+#define INVALID_PID	-1
+
+pid_t expired_pid, my_pid, invalid_pid = -1;
+
+static struct tcase {
+	char *name;
+	pid_t *pid;
+	int flags;
+	int exp_errno;
+} tcases[] = {
+	{"expired pid", &expired_pid, 0, ESRCH},
+	{"invalid pid", &invalid_pid, 0, EINVAL},
+	{"invalid flags", &my_pid, 1, EINVAL},
+};
+
+static void setup(void)
+{
+	expired_pid = tst_get_unused_pid();
+	my_pid = getpid();
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(pidfd_open(*tc->pid, tc->flags));
+
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_brk(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
+		tc->name);
+}
+
+static struct tst_test test = {
+	.min_kver = "5.3",
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
new file mode 100644
index 000000000000..48470e5e1d43
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * This program opens the PID file descriptor of the child process created with
+ * fork(). It then uses poll to monitor the file descriptor for process exit, as
+ * indicated by an EPOLLIN event.
+ */
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+
+static void run(void)
+{
+	struct pollfd pollfd;
+	int fd, ready;
+	pid_t pid;
+
+	pid = SAFE_FORK();
+
+	if (!pid) {
+		TST_CHECKPOINT_WAIT(0);
+		exit(EXIT_SUCCESS);
+	}
+
+	TEST(pidfd_open(pid, 0));
+
+	fd = TST_RET;
+	if (fd == -1)
+		tst_brk(TFAIL | TTERRNO, "pidfd_open() failed");
+
+	TST_CHECKPOINT_WAKE(0);
+
+	pollfd.fd = fd;
+	pollfd.events = POLLIN;
+
+	ready = poll(&pollfd, 1, -1);
+
+	SAFE_CLOSE(fd);
+	SAFE_WAITPID(pid, NULL, 0);
+
+	if (ready != 1)
+		tst_res(TFAIL, "poll() returned %d", ready);
+	else
+		tst_res(TPASS, "pidfd_open() passed");
+}
+
+static struct tst_test test = {
+	.min_kver = "5.3",
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
