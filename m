Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734F1FADC5
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DF5D3C5FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6C8B13C2D0C
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:36 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A1E3A629819
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:35 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id g12so8179461pll.10
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgxRB4WNbjPqWnUp4sX/XQVRpZsseiDDkCAbdUxYvJU=;
 b=S3iHWCUyGksSbicV7INn32lOC+NhIdoAi0sSbBqSOjmNRDD6YWirnK6Ra1/yUvmckY
 YBYRN66STbriIfA5+7GZTE5gVfCRpXyeBkyLCoP1euFkC4xq84ZWM0JT52Orpw5MszuJ
 C3/TLJNFmydsN4G4gSZNJ9vwygM9hvjwv8pfxs0zDGk9hdoAHfdzxKazQ7RTtSIJZusu
 +t6hS5kHNN+y7AIgqivWzA15nhvyr3ahIoYZhppUl4NOONy0WF+ZqU70AZvTSsRuW/fa
 GfEjG2Id97FoE6xGoPFuITOIL9KNvhQ8dkZy7oX3xUwCvvLf3HZmo0qqeRaPTqzZbV+1
 mq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgxRB4WNbjPqWnUp4sX/XQVRpZsseiDDkCAbdUxYvJU=;
 b=sfP+sF0fPpRpEP6mtceD/X5I/kkCay6fQ6a8kLeqDHw/u9IlFR/2/grDtvuOTncFXu
 m63VxVt3ThhiDXEuhgnY2YcRs2YDS3FrXlcEGHrCgNiC2TRrjckavXyG5jy3iRuhmWZM
 TlJO3dSZ9tRXpOcYC2Qv/Vd6JLY5ByVuh7QWBZdiOZyTvAfU+0646omhRRwopWCSwHmN
 +XGz9nbFq7H8Saduwr0vL2f8keZaulK8LMfQOI7cqDNVja/pCANEijC7PC7qe1YFphcf
 JVoaJ/KNEKvD3Hp88tP1dEtJUGKJtrv9vacXIeo0nh3piIyLylSutA81ddruqXkdBg6N
 fEWw==
X-Gm-Message-State: AOAM53318+DKneaurbjCZGP6zmj9mfgue0/212mIgoRYo1/9YhUgOlV2
 Eg0P89cmSIP979UFcR5FDDqz2MEMQMI=
X-Google-Smtp-Source: ABdhPJxLNoCmHL+wmKr1ytOjgiITuZdLa5hDAENwsVHSp5PFwmS9aaV9ohj/h+0QUVkJAxwaHlQd3Q==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr2307874pjb.156.1592302833894; 
 Tue, 16 Jun 2020 03:20:33 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id h6sm16725630pfq.214.2020.06.16.03.20.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:20 +0530
Message-Id: <e8b57475b403a2936828305aee56fe03f285dfc8.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1592302358.git.viresh.kumar@linaro.org>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/6] syscalls: semctl: Add new test to verify the
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
 .../kernel/syscalls/ipc/semctl/.gitignore     |  1 +
 testcases/kernel/syscalls/ipc/semctl/Makefile |  5 +-
 .../kernel/syscalls/ipc/semctl/semctl08.c     | 52 +++++++++++++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semctl/semctl08.c

diff --git a/runtest/syscalls b/runtest/syscalls
index bee03e93f765..eedd727fb617 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1157,6 +1157,7 @@ semctl04 semctl04
 semctl05 semctl05
 semctl06 semctl06
 semctl07 semctl07
+semctl08 semctl08
 
 semget01 semget01
 semget02 semget02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 54d8622d4223..f912cb067f74 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -33,6 +33,7 @@ semctl04 semctl04
 semctl05 semctl05
 semctl06 semctl06
 semctl07 semctl07
+semctl08 semctl08
 
 semget01 semget01
 semget02 semget02
diff --git a/testcases/kernel/syscalls/ipc/semctl/.gitignore b/testcases/kernel/syscalls/ipc/semctl/.gitignore
index b6899acf5da6..6189a04cc3c6 100644
--- a/testcases/kernel/syscalls/ipc/semctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/semctl/.gitignore
@@ -5,3 +5,4 @@
 /semctl05
 /semctl06
 /semctl07
+/semctl08
diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index f62cd1f481d9..99971a7dbb32 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -3,10 +3,11 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
+semctl08: LDLIBS += -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
new file mode 100644
index 000000000000..40c2e1741d3a
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Cross verify the _high fields being set to 0 by the kernel.
+ */
+#include "lapi/sembuf.h"
+#include "lapi/semun.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+
+#ifdef HAVE_SEMID64_DS_TIME_HIGH
+
+static void run(void)
+{
+	struct semid64_ds buf_ds = {
+		.sem_otime_high = 0x0A0A,
+		.sem_ctime_high = 0x0A0A,
+	};
+	int semid;
+	union semun arg;
+	key_t key;
+
+	/* get an IPC resource key */
+	key = GETIPCKEY();
+
+	semid = semget(key, 1, SEM_RA | IPC_CREAT);
+	if (semid == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore");
+
+	arg.buf = (struct semid_ds *)&buf_ds;
+	TEST(semctl(semid, 0, IPC_STAT, arg));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "semctl() failed");
+
+	if (buf_ds.sem_otime_high || buf_ds.sem_ctime_high)
+		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
+	else
+		tst_res(TPASS, "time_high fields cleared by the kernel");
+
+	if (semctl(semid, 0, IPC_RMID, arg) == -1)
+		tst_res(TINFO, "WARNING: semaphore deletion failed.");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+#else
+TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
+#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
