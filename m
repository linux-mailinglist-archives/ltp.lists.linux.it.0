Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 409722240AF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED37F3C4E8B
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 33A6C3C4E9A
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5FE15601CDB
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:33:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA8DDB8BB
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 16:34:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jul 2020 18:34:50 +0200
Message-Id: <20200717163453.9587-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
References: <20200717163453.9587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 6/9] syscalls/ipc: Add shmctl() IPC_INFO test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmctl/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmctl/shmctl03.c     | 38 +++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 5ce482dc7..819e8d8ee 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1355,6 +1355,7 @@ shmat03 shmat03
 
 shmctl01 shmctl01
 shmctl02 shmctl02
+shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 10cb92c7d..c3a35896c 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -53,6 +53,7 @@ shmat02 shmat02
 
 shmctl01 shmctl01
 shmctl02 shmctl02
+shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index 08aa83c19..46b107344 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -1,5 +1,6 @@
 /shmctl01
 /shmctl02
+/shmctl03
 /shmctl04
 /shmctl05
 /shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
new file mode 100644
index 000000000..7df8c12ce
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+/*
+ * Call shmctl() with IPC_INFO flag and check that the data are consistent with
+ * /proc/sys/kernel/shm*.
+ */
+
+#define _GNU_SOURCE
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+
+static void verify_ipcinfo(void)
+{
+	struct shminfo info;
+
+	TEST(shmctl(0, IPC_INFO, (struct shmid_ds *)&info));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "shmctl(0, IPC_INFO, ...)");
+		return;
+	}
+
+	if (info.shmmin != 1)
+		tst_res(TFAIL, "shmmin = %li, expected 1", info.shmmin);
+	else
+		tst_res(TPASS, "shmmin = 1");
+
+	TST_ASSERT_ULONG("/proc/sys/kernel/shmmax", info.shmmax);
+	TST_ASSERT_ULONG("/proc/sys/kernel/shmmni", info.shmmni);
+	TST_ASSERT_ULONG("/proc/sys/kernel/shmall", info.shmall);
+}
+
+static struct tst_test test = {
+	.test_all = verify_ipcinfo,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
