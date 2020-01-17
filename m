Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C062F1408BC
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:15:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 645033C24E1
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:15:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7CA9F3C24B0
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:15:37 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 340A9200DD1
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:15:33 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id x8so11522193pgk.8
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 03:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnYLBGYGoVMpB23Ux+FhPyxs/6Pdu2xPchWkMRgD7ME=;
 b=S62dpMFWmLFbrLB/WrmmtGHEVNYaujBm1ERA3bCfmM4wJaeFu4SKN+vYWBfhF+h8J6
 edS6LEc2K0gaU3hK4rQtm3u9F5osyQcRSipaLSREjSslm2V6PdRmUswlMawDyIvtCOwB
 Q8eW86texeRgqlqymAOUdtda0WBJGjmi5SiOAQdnUkGWpNuAQUoffdMqjjoWyqaqLnvT
 Isx42i+rVinQ/tdngHO30v4wnm/u+MadBkLhyJ0viBKQj//6uerk6LhUqP8DOHs5yq5f
 3it9m33qoDlA5vFcArI0iLZW1IwhwYnOz57FHRBMIn5L+0BE3vhNQAJGFgznXiprjWrk
 VoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnYLBGYGoVMpB23Ux+FhPyxs/6Pdu2xPchWkMRgD7ME=;
 b=GTL5bNhkQ31FjW9rlu4pLQR/qdE1hXKqFJSiOHZtyhf2GIqZMOkRNBlGzLXBK+gj6o
 cpayqKaJ/3l7y0n9MgcvU89UHtYXCPrSUaSXb/gdQiRk2Glk8Ml/UvI7R2w9xwyJ0E+e
 0/Kwo0ZlBtT0cA2ygIBYAtqzo93jEDfc+g6KGNUHRH/lFL0x8UeJ+1QIop0tNMrSAAn8
 uPjc1mRw/4/OaehbnGqRhzHRZx4nLLVILPYxAcidqnwMOCfP0kRKxe+jMistPiln2OYx
 WgZkL1F1ik7kp3oje/H+mviry9ZQKdbEBA9YXbjsi9cdyultyL20VzkYCXpFGJekL6gW
 UpTg==
X-Gm-Message-State: APjAAAVKw8cXPCovC6DmQYSH9mlOfX4dZGAo1CHq9z0TEqI0AXZbCx6o
 ewEl29xQVFQ3sBKUDTw6G9BHNDdPd98=
X-Google-Smtp-Source: APXvYqziZmMaLukZ7jhV05/9FCM4A1+o3rJKFAHHbhoq0PtAFBHWwR/u8+6EfTMunQgZNHYbn2pCAw==
X-Received: by 2002:a62:7fcd:: with SMTP id a196mr2377695pfd.208.1579259731324; 
 Fri, 17 Jan 2020 03:15:31 -0800 (PST)
Received: from localhost ([122.172.71.156])
 by smtp.gmail.com with ESMTPSA id a2sm27817392pgv.64.2020.01.17.03.15.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jan 2020 03:15:30 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 16:45:10 +0530
Message-Id: <4dd4dabd2cd574dc2657c5926e8e3d1a0c8a8ae6.1579259595.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <b4f5242fdca1659b2f71e1b3290fd32194e7340a.1579259595.git.viresh.kumar@linaro.org>
References: <b4f5242fdca1659b2f71e1b3290fd32194e7340a.1579259595.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/pidfd_open
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

Add tests to check working of pidfd_open() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |  1 +
 include/lapi/pidfd_open.h                     | 21 ++++++
 runtest/syscalls                              |  3 +
 .../kernel/syscalls/pidfd_open/.gitignore     |  2 +
 testcases/kernel/syscalls/pidfd_open/Makefile |  6 ++
 .../kernel/syscalls/pidfd_open/pidfd_open01.c | 38 +++++++++++
 .../kernel/syscalls/pidfd_open/pidfd_open02.c | 68 +++++++++++++++++++
 7 files changed, 139 insertions(+)
 create mode 100644 include/lapi/pidfd_open.h
 create mode 100644 testcases/kernel/syscalls/pidfd_open/.gitignore
 create mode 100644 testcases/kernel/syscalls/pidfd_open/Makefile
 create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
 create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open02.c

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
index fa87ef63fbc1..9d6d288780a3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -846,6 +846,9 @@ pause03 pause03
 personality01 personality01
 personality02 personality02
 
+pidfd_open01 pidfd_open01
+pidfd_open02 pidfd_open02
+
 pidfd_send_signal01 pidfd_send_signal01
 pidfd_send_signal02 pidfd_send_signal02
 pidfd_send_signal03 pidfd_send_signal03
diff --git a/testcases/kernel/syscalls/pidfd_open/.gitignore b/testcases/kernel/syscalls/pidfd_open/.gitignore
new file mode 100644
index 000000000000..be218f88647d
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/.gitignore
@@ -0,0 +1,2 @@
+pidfd_open01
+pidfd_open02
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
index 000000000000..4e3417c487a6
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -0,0 +1,38 @@
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
+	int p_id, fd;
+
+	p_id = getpid();
+
+	TEST(pidfd_open(p_id, 0));
+
+	fd = TST_RET;
+	if (fd == -1) {
+		tst_res(TFAIL, "Cannot retrieve file descriptor to the current process");
+		return;
+	}
+
+	SAFE_CLOSE(fd);
+
+	tst_res(TPASS, "Retrieved file descriptor to the current process");
+}
+
+static struct tst_test test = {
+	.min_kver = "5.3",
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
new file mode 100644
index 000000000000..b67393bcafa2
--- /dev/null
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -0,0 +1,68 @@
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
+#include <unistd.h>
+
+#include "tst_test.h"
+#include "lapi/pidfd_open.h"
+#include "lapi/syscalls.h"
+
+static void run(void)
+{
+	struct pollfd pollfd;
+	int p_id, fd, ready;
+
+	TEST(fork());
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL, "fork() Failed");
+		tst_res(TBROK, "unable to continue");
+	}
+
+	if (TST_RET == 0) {
+		/* child */
+		usleep(1000);
+		exit(EXIT_SUCCESS);
+	} else {
+		/* parent */
+		p_id = TST_RET;
+
+		TEST(pidfd_open(p_id, 0));
+
+		fd = TST_RET;
+		if (fd == -1) {
+			tst_res(TFAIL, "Cannot retrieve file descriptor to the child process");
+			return;
+		}
+
+		pollfd.fd = fd;
+		pollfd.events = POLLIN;
+
+		ready = poll(&pollfd, 1, -1);
+		if (ready == -1) {
+			tst_res(TFAIL, "poll() Failed");
+			tst_res(TBROK, "unable to continue");
+		}
+
+		printf("Events (0x%x): POLLIN is %sset\n", pollfd.revents,
+				(pollfd.revents & POLLIN) ? "" : "not ");
+
+		SAFE_CLOSE(fd);
+	}
+}
+
+static struct tst_test test = {
+	.min_kver = "5.3",
+	.test_all = run,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
