Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F825FC89
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:02:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D47CC3C5458
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:02:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F3FCC3C5421
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7B12D200C98
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E73ACB6C9
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 15:01:31 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 17:01:54 +0200
Message-Id: <20200907150157.23886-8-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907150157.23886-1-chrubis@suse.cz>
References: <20200907150157.23886-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/10] syscalls/ipc: Add shmctl() IPC_INFO test
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
 .../kernel/syscalls/ipc/shmctl/shmctl03.c     | 40 +++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 557fa7155..35770e6db 100644
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
index a40ff083f..e6837414c 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -51,6 +51,7 @@ shmat02 shmat02
 
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
index 000000000..8868ab1cb
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
@@ -0,0 +1,40 @@
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
+	if (TST_RET < 0) {
+		tst_res(TFAIL | TTERRNO,
+		        "shmctl(0, IPC_INFO, ...) returned %li",
+		        TST_RET);
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
