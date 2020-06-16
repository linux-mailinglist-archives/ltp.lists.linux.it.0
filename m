Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3A1FADCD
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC3C93C5FC9
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3CDD73C2D07
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:47 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8536A1BD2118
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:46 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id u128so2124588pgu.13
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C79LupuzJfAylHY/PoPF0aGRQrANOqNq/v2t8YecEUM=;
 b=TYaeWPj8kY+JEmDxLLqGMtjj3e/K86WW+9F3rrsqvBfkxYTeavhMwsKsh5uYWKY518
 DXAKMZZoKmUUiWXmdLZS53nFBj+UG+2652O6vFBoFq+PpExD9E0DkaFDLxczGkJDpsj0
 KBvJKy511qLQWWXw9ejwYhaIEJbb8iaKMcOfTh6/7sA53/JR5a7yxk+J0yV3WQJO9IjQ
 Pw+rLU8Is46o1VBU1x/pjjaT+EOQm+ESj1OhdmQx2f2UaQ9XMKMpEI5XAKUlKxIajt2u
 0o6VxOvb/Ytkw2Gwy/ps6/4jGHpYTgXajxy2HlsycVrIGCgDRbYJz2sO1O5tdSyRGKLX
 38Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C79LupuzJfAylHY/PoPF0aGRQrANOqNq/v2t8YecEUM=;
 b=FrVCJR4CQszn+ZFJqU0Lgi0FD0DhzytjGiMv8l6TfAYzenZwdaNX6dipRyJNnvYcMd
 P9ZP/GfuEYNfE55/PsFlb6tQjAvZYNK26YvFsDZgg33rFW+wEXd8yi3hTCgIgq34c2Ol
 DhSFTBwY4O0+VVTBFYd1H32G6V4nFgdtiA4ufrzDYOeWVxm0QNeYEOwxRH13nmE5wUPm
 E0EH36Z7DDnQnuOOG3PQlt+ZIDSOedtu5I9ljaRrvE+q5ak7+WFi3S/zcowRldHsUgIe
 9P9cYowIFsuoTqx5PJlRx8WWR0Omk0KmEHs1wioMZj21v4wa2zq2uzrUg/S5pM5QrYyz
 jS0g==
X-Gm-Message-State: AOAM533iSJhyj1CHVfrsEei1SZqw+mY2tHcf8cDEeSgQ0iZfpUA1tbAe
 1nTzMDJePubirJjP62/GXw5jilL6bBU=
X-Google-Smtp-Source: ABdhPJzNnFyrK+RKr52L8fbrdJ3god7nMpeQZjxyE7JF2UnJVOOFmTFUhgS+1YT67ku3pDV1y7BY6g==
X-Received: by 2002:a63:1114:: with SMTP id g20mr1535815pgl.3.1592302844753;
 Tue, 16 Jun 2020 03:20:44 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id l83sm16861101pfd.150.2020.06.16.03.20.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:24 +0530
Message-Id: <64c024464dbc063afebdc76c8f691380067873b9.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1592302358.git.viresh.kumar@linaro.org>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 6/6] syscalls: msgctl: Add new test to verify the
 _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The _time_high fields must be reset by the kernel, add a test to verify
that.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/msgctl/.gitignore     |  1 +
 .../kernel/syscalls/ipc/msgctl/msgctl05.c     | 48 +++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/msgctl/msgctl05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f8b2277e0eda..ee7e2a0d217d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -797,6 +797,7 @@ msgctl01 msgctl01
 msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
+msgctl05 msgctl05
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 5ba3b1449a6c..c3a35896c5a8 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -2,6 +2,7 @@ msgctl01 msgctl01
 msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
+msgctl05 msgctl05
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/testcases/kernel/syscalls/ipc/msgctl/.gitignore b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
index f179f2606a3e..0157f4611bdf 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
@@ -2,4 +2,5 @@
 /msgctl02
 /msgctl03
 /msgctl04
+/msgctl05
 /msgctl12
diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
new file mode 100644
index 000000000000..cd2643bc1ead
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Cross verify the _high fields being set to 0 by the kernel.
+ */
+#include <sys/msg.h>
+#include "lapi/msgbuf.h"
+#include "libnewipc.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+
+#ifdef HAVE_MSQID64_DS_TIME_HIGH
+
+static void run(void)
+{
+	struct msqid64_ds buf_ds = {
+		.msg_stime_high = 0x0A0A,
+		.msg_rtime_high = 0x0A0A,
+		.msg_ctime_high = 0x0A0A,
+	};
+	int msqid;
+	key_t key;
+
+	key = GETIPCKEY();
+
+	msqid = SAFE_MSGGET(key, IPC_CREAT | IPC_EXCL | MSG_RW | 0600);
+
+	TEST(msgctl(msqid, IPC_STAT, (struct msqid_ds *)&buf_ds));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "msqctl() failed");
+
+	if (buf_ds.msg_stime_high || buf_ds.msg_rtime_high || buf_ds.msg_ctime_high)
+		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
+	else
+		tst_res(TPASS, "time_high fields cleared by the kernel");
+
+	SAFE_MSGCTL(msqid, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+#else
+TST_TEST_TCONF("test requires struct msqid64_ds to have the time_high fields");
+#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
