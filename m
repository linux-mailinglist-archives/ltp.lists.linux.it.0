Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DA2240B2
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 633AE3C63D4
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:35:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BF57B3C4EA1
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4F1D4601D96
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:33:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94642ACF3
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 16:34:42 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jul 2020 18:34:52 +0200
Message-Id: <20200717163453.9587-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
References: <20200717163453.9587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 8/9] syscalls/ipc: Add shmctl IPC_SET test
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
 runtest/syscalls                              |   1 +
 runtest/syscalls-ipc                          |   1 +
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
 .../kernel/syscalls/ipc/shmctl/shmctl08.c     | 101 ++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl08.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 1dc4973e7..00c8d6d66 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1360,6 +1360,7 @@ shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
 shmctl07 shmctl07
+shmctl08 shmctl08
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 613987589..d3d477741 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -58,6 +58,7 @@ shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
 shmctl07 shmctl07
+shmctl08 shmctl08
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index 4322d03b7..f3f88ee17 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -5,3 +5,4 @@
 /shmctl05
 /shmctl06
 /shmctl07
+/shmctl08
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
new file mode 100644
index 000000000..2c83e9901
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+/*
+ * Test for a SHM_SET.
+ *
+ * The test clears the group and others bits from the shm_perm.mode and checks
+ * the result as well as if the ctime was updated correctly.
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
+static int test_ipc_set(struct shmid_ds *ds)
+{
+	TEST(shmctl(shm_id, IPC_SET, ds));
+
+	if (TST_RET != 0) {
+		tst_res(TFAIL, "shmctl(%i, IPC_SET, ...)", shm_id);
+		return 1;
+	}
+
+	tst_res(TPASS, "shmctl(%i, IPC_SET, {shm_perm.mode=%i})",
+		shm_id, ds->shm_perm.mode);
+	return 0;
+}
+
+static void check_mode(struct shmid_ds *ds, short exp_mode)
+{
+	if (ds->shm_perm.mode == exp_mode) {
+		tst_res(TPASS, "shm_perm.mode=%i was updated", exp_mode);
+		return;
+	}
+
+	tst_res(TFAIL, "shm_perm.mode=%i wasn't updated, expected %i",
+	        ds->shm_perm.mode, exp_mode);
+}
+
+static void verify_shmset(void)
+{
+	struct shmid_ds ds;
+	unsigned short old_mode;
+	time_t old_ctime;
+
+	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
+
+	old_mode = ds.shm_perm.mode;
+	old_ctime = ds.shm_ctime;
+
+	sleep(1);
+
+	ds.shm_perm.mode &= ~0066;
+
+	if (test_ipc_set(&ds))
+		return;
+
+	memset(&ds, 0, sizeof(ds));
+	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
+	check_mode(&ds, old_mode & ~0066);
+
+	if (ds.shm_ctime - old_ctime > 10) {
+		tst_res(TFAIL, "shm_ctime not updated old %li new %li",
+		        (long)old_ctime, (long)ds.shm_ctime);
+	} else {
+		tst_res(TPASS, "shm_ctime updated correctly diff=%li",
+		        (long)(ds.shm_ctime - old_ctime));
+	}
+
+	ds.shm_perm.mode = old_mode;
+	if (test_ipc_set(&ds))
+		return;
+
+	memset(&ds, 0, sizeof(ds));
+	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
+	check_mode(&ds, old_mode & MODE_MASK);
+}
+
+static void setup(void)
+{
+	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | 0666);
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
+	.test_all = verify_shmset,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
