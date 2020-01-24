Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210E147C09
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:48:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF51D3C23B7
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:48:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 313703C23CF
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:48:45 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0CFFD1000551
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:48:41 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id 4so826847pfz.9
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 01:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIFVBIDW7OjsV1+1vJ2OgSojfhnEDUCYtCe+78SfvGk=;
 b=q7Nvl1Vm+TPmPvc+KQIKaqdS7Gm8Oq5yePqqeHBvft1f+VeQDjwowd927TiBz3qGTh
 IcxfgCdY/aJybrTHKoiWlxwad2AxT+hq1pkVoUPgTCCMZZ/O8UGII56iqW8bSx9wB7le
 SX3UWvSq2tN6WhoIP5mVkX/9oxb+vBVrkXfGMQCLQQHLEC2Pz2Wfw/I/sO8hfn/WJQsD
 y/XrrguSIyiVVAUwk1L0pAvsM3bB0AkW+rpgCRwLXKeRw9MYGHbF+h5yvFwu1QmmC8+W
 07yhRf5E4rIR1OsowigrIdOLv7T+neg9KooP6grSmQvVMyOKrWahXWt8XQl6jWRRlyzw
 TyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIFVBIDW7OjsV1+1vJ2OgSojfhnEDUCYtCe+78SfvGk=;
 b=LBbIOJa+lA5bpbLnobfl20Brw6dd/s59bl0rHfzY/U6MDZpDAweFFsYLGvewb9JR4c
 MqcFZ8RIBIaT2aBqKKMBCuowAUfj/NFrJk7YR681vJlvDQQANU3oo9Kp7Tlh4XkdEhBf
 8jSYhCbrElEyhXgzssGEgJ9ZRnEYPw+GQCC/poh304Uea6he0hoYA5m9myJRoC/X0XA2
 ilZoeOpq9M31Y80Z1g5RhqzBdmns79/qmco4MHOjA+A20rxEB3Hd7mFirR9RCSUUR+Mq
 yrq3a+5pxTR9ZPVs3GX9FGoR7MXHy3N6YLxpRVuhFl6oLWe9CWF7NS7WIG7hqa1woRsj
 9Z8A==
X-Gm-Message-State: APjAAAUdN+sqpZMQNgzHohgATD6BoIuwxAkna0RPoGAJvHDimIuHbTK1
 6eCenkPBb4BrSmZrPQ5nY2aULA==
X-Google-Smtp-Source: APXvYqwaAwIeNZJkqgJeL2MaL6/Tj/ZdIoedhKVhBw1uUzVdaGnBAJBPv5UsFIBlXCjN4sJtnWPCVg==
X-Received: by 2002:a63:3d4:: with SMTP id 203mr3073593pgd.266.1579859320086; 
 Fri, 24 Jan 2020 01:48:40 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id l66sm6037884pga.30.2020.01.24.01.48.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 01:48:39 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 24 Jan 2020 15:18:27 +0530
Message-Id: <8dc3dff0390db58b2f472501c30595647a913e34.1579858930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <1dbcadb1781ba1f0584eb92c83aec5f66abb109c.1579858930.git.viresh.kumar@linaro.org>
References: <1dbcadb1781ba1f0584eb92c83aec5f66abb109c.1579858930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V3 2/2] syscalls/pidfd_open
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
 include/lapi/pidfd_open.h                     | 21 +++++++
 runtest/syscalls                              |  4 ++
 .../kernel/syscalls/pidfd_open/.gitignore     |  3 +
 testcases/kernel/syscalls/pidfd_open/Makefile |  6 ++
 .../kernel/syscalls/pidfd_open/pidfd_open01.c | 34 ++++++++++
 .../kernel/syscalls/pidfd_open/pidfd_open02.c | 63 +++++++++++++++++++
 .../kernel/syscalls/pidfd_open/pidfd_open03.c | 63 +++++++++++++++++++
 8 files changed, 195 insertions(+)
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
index 000000000000..ced163be83bf
--- /dev/null
+++ b/include/lapi/pidfd_open.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef PIDFD_OPEN_H
+#define PIDFD_OPEN_H
+
+#include "config.h"
+#include <sys/types.h>
+#include "lapi/syscalls.h"
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
index f58fefe17c34..f083758bc637 100644
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
index 000000000000..e40ea4f2eff5
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic pidfd_open() test, fetches the PID of the current process and tries to
+ * get its file descriptor.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+#include "lapi/syscalls.h"
+
+static void run(void)
+{
+	int fd;
+
+	TEST(pidfd_open(getpid(), 0));
+
+	fd = TST_RET;
+	if (fd == -1)
+		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
+
+	SAFE_CLOSE(fd);
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
index 000000000000..5e5431335731
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic pidfd_open() test to test invalid arguments.
+ */
+#include <sys/types.h>
+#include <sys/syscall.h>
+
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+#include "lapi/syscalls.h"
+
+#define INVALID_PID	-1
+#define MY_PID		0
+#define EXPIRED_PID	1
+
+static struct tcase {
+	char *name;
+	int pid;
+	int flags;
+	int exp_errno;
+} tcases[] = {
+	{"test-expired-pid", EXPIRED_PID, 0, ESRCH},
+	{"test-invalid-pid", INVALID_PID, 0, EINVAL},
+	{"test-invalid-flags", MY_PID, 1, EINVAL},
+};
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	pid_t pid;
+
+	if (tc->pid == EXPIRED_PID)
+		pid = tst_get_unused_pid();
+	else if (tc->pid == MY_PID)
+		pid = getpid();
+	else
+		pid = tc->pid;
+
+	TEST(pidfd_open(pid, tc->flags));
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
+};
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
new file mode 100644
index 000000000000..efa14dc52d7a
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
@@ -0,0 +1,63 @@
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
+#include <sys/types.h>
+#include <sys/syscall.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+#include "lapi/syscalls.h"
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
+	} else {
+		TEST(pidfd_open(pid, 0));
+
+		fd = TST_RET;
+		if (fd == -1)
+			tst_brk(TFAIL | TTERRNO, "pidfd_open() failed");
+
+		TST_CHECKPOINT_WAKE(0);
+
+		pollfd.fd = fd;
+		pollfd.events = POLLIN;
+
+		ready = poll(&pollfd, 1, -1);
+
+		SAFE_CLOSE(fd);
+		SAFE_WAITPID(pid, NULL, 0);
+
+		if (ready == -1)
+			tst_brk(TBROK | TERRNO, "poll() failed");
+
+		if (ready != 1)
+			tst_brk(TBROK, "poll() should return 1");
+
+		tst_res(TPASS, "pidfd_open() passed");
+	}
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
