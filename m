Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1A1FADC9
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 696CB3C2CFC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6587F3C2D13
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:42 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7BA88279906
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:41 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id k6so3228721pll.9
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TCgZGlw8LvJNPKWi3J4FTFnvZSBcvJzFsCHe17Stetg=;
 b=moDIfzOa/JjhAl5Vzn5A7I3yDNMu/wjRU1Yqhz2mynKvtRmIkhBDezTZcxD5ig53Ao
 zUKXs9uKgO3FZNJYIq/fUBUbE3OfW8VDUI7Xfj9j/Srxo9ouHo2sQTVnKXHAFmEWwo6m
 eBFtLBKlBd5SR6NvcQTJgC+VncDN+wNdwEvNt5BEIes2VBNlnLsuhwXSpISnsablmh0n
 BUfhwSc/yWkXiEyv+NrZQ0fv+uOLu0fgSaBxHQBhbtRkdEXWxGXmEKWsrScLjfhrG5fq
 iSEyvqYj93osOAghAX2reg9dKUhiS1Rq7AP60tY+etL1nKGHNJ6y3rOC3MfgP+Ce96lm
 uLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TCgZGlw8LvJNPKWi3J4FTFnvZSBcvJzFsCHe17Stetg=;
 b=JZME0jpU5rfVh8uI3fCuuXCud8PfasT3ap4IvdN5+dt8XXnXVkXBIVp3M8mEYp82io
 YXUYgD4jhr/QtTjpHFey5fT7Cqwiv8yEkW9Zzgd23Y/OmiOldjgGBp/nuqs/pqoJP7la
 vajYAjhmJdEoCcWBqTsNC6oteqTkjSKa9DsZJaqhemY3VpBtog9BLf1jXdgC70YCeGIu
 qavALLX2it/2RkpF19EqIkppQYDaE2cutuKztIpzyV0j5L2gEh2NHdE9y5FIfTTdHDfB
 4ZdiHR/RA9uOfRieJI3CXygR5FSK8TkUX3IBmVAD6IR5V/QmNneoLC2NBZI273ii7P4L
 kESw==
X-Gm-Message-State: AOAM532gPVEPjvVirpDuc2Vze63Tf5OifqBs1SIyVNaghsFaTet0jLei
 RykuL9pe1cVgA64o2zjMoubQh5eXPqw=
X-Google-Smtp-Source: ABdhPJz3e+Wg4RocNNoDLO6BO26in4pY38/KyOQ9aTX8lpIpBFVgBVcYcRxIYh5sFTZhbd83C7suRA==
X-Received: by 2002:a17:902:599a:: with SMTP id
 p26mr1546626pli.322.1592302839649; 
 Tue, 16 Jun 2020 03:20:39 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id y7sm17052421pfq.43.2020.06.16.03.20.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:22 +0530
Message-Id: <7ed60e87527647505a71844b540a21db77ddae78.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1592302358.git.viresh.kumar@linaro.org>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 4/6] syscalls: shmctl: Add new test to verify the
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
 .../kernel/syscalls/ipc/shmctl/.gitignore     |  1 +
 testcases/kernel/syscalls/ipc/shmctl/Makefile |  5 +-
 .../kernel/syscalls/ipc/shmctl/shmctl06.c     | 51 +++++++++++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index eedd727fb617..f8b2277e0eda 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1355,6 +1355,7 @@ shmctl02 shmctl02
 shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
+shmctl06 shmctl06
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index f912cb067f74..5ba3b1449a6c 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -55,6 +55,7 @@ shmctl02 shmctl02
 shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
+shmctl06 shmctl06
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index d6777e3b8f1b..46b107344cf4 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -3,3 +3,4 @@
 /shmctl03
 /shmctl04
 /shmctl05
+/shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index cfa5d6e76489..252c11058bc5 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -3,13 +3,16 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpipc ltpnewipc
 
 shmctl05: CFLAGS += -pthread
 shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
+shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
+shmctl06: LDLIBS += -lltpnewipc
+
 LDLIBS  += -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c
new file mode 100644
index 000000000000..368759980b74
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Cross verify the _high fields being set to 0 by the kernel.
+ */
+#include <sys/shm.h>
+#include "lapi/shmbuf.h"
+#include "libnewipc.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+
+#ifdef HAVE_SHMID64_DS_TIME_HIGH
+
+static void run(void)
+{
+	struct shmid64_ds buf_ds = {
+		.shm_atime_high = 0x0A0A,
+		.shm_dtime_high = 0x0A0A,
+		.shm_ctime_high = 0x0A0A,
+	};
+	int shmid;
+	key_t key;
+
+	/* get an IPC resource key */
+	key = GETIPCKEY();
+
+	shmid = shmget(key, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
+	if (shmid == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create shared memory segment");
+
+	TEST(shmctl(shmid, IPC_STAT, (struct shmid_ds *)&buf_ds));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "shmctl() failed");
+
+	if (buf_ds.shm_atime_high || buf_ds.shm_dtime_high || buf_ds.shm_ctime_high)
+		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
+	else
+		tst_res(TPASS, "time_high fields cleared by the kernel");
+
+	SAFE_SHMCTL(shmid, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+#else
+TST_TEST_TCONF("test requires struct shmid64_ds to have the time_high fields");
+#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
