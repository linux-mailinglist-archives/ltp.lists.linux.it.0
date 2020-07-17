Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39B2240B1
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A3E53C4EAD
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4B8823C4E9B
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4D03601D96
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:33:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29266B8B8
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 16:34:42 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jul 2020 18:34:51 +0200
Message-Id: <20200717163453.9587-8-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
References: <20200717163453.9587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 7/9] syscalls/ipc: Add shmctl07 test
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

A new test for SHM_LOCK and SHM_UNLOCK.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmctl/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmctl/shmctl07.c     | 66 +++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl07.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 819e8d8ee..1dc4973e7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1359,6 +1359,7 @@ shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
+shmctl07 shmctl07
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index c3a35896c..613987589 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -57,6 +57,7 @@ shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
+shmctl07 shmctl07
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index 46b107344..4322d03b7 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -4,3 +4,4 @@
 /shmctl04
 /shmctl05
 /shmctl06
+/shmctl07
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
new file mode 100644
index 000000000..409203db7
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+/*
+ * Test for a SHM_LOCK and SHM_UNLOCK.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+
+#define SHM_SIZE 2048
+
+static int shm_id = -1;
+
+static void verify_shmlock(void)
+{
+	struct shmid_ds ds;
+
+	TEST(shmctl(shm_id, SHM_LOCK, NULL));
+
+	if (TST_RET != 0)
+		tst_res(TFAIL | TTERRNO, "shmctl(%i, SHM_LOCK, NULL)", shm_id);
+	else
+		tst_res(TPASS, "shmctl(%i, SHM_LOCK, NULL)", shm_id);
+
+
+	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
+
+	if (ds.shm_perm.mode & SHM_LOCKED)
+		tst_res(TPASS, "SMH_LOCKED bit is on in shm_perm.mode");
+	else
+		tst_res(TFAIL, "SHM_LOCKED bit is off in shm_perm.mode");
+
+	TEST(shmctl(shm_id, SHM_UNLOCK, NULL));
+
+	if (TST_RET != 0)
+		tst_res(TFAIL | TTERRNO, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
+	else
+		tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
+
+	if (ds.shm_perm.mode & SHM_LOCKED)
+		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
+	else
+		tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
+}
+
+static void setup(void)
+{
+	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
+}
+
+static void cleanup(void)
+{
+	if (shm_id >= 0)
+		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_shmlock,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
