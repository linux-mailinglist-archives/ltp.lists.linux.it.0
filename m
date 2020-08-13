Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82442243391
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 07:24:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38FBA3C30BF
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 07:24:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EAB7A3C04C3
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 07:24:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E0D891A009B9
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 07:24:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,307,1592841600"; d="scan'208";a="98054482"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Aug 2020 13:24:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id CAD474CE34E3
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 13:23:58 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 Aug 2020 13:23:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 13 Aug 2020 13:24:12 +0800
Message-ID: <1597296252-4978-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CAD474CE34E3.A0179
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/msgget04: Add test for
 /proc/sys/kernel/msg_next_id
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v2->v3:
1.use SAFE_MSGGET Macro
2.add kconfig check
3.Remove resetting value in cleanup because only successful msgget can
reset value to -1, we only set value from[0,int_max]
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/msgget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/msgget/msgget04.c     | 63 +++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/msgget/msgget04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 98d79271d..41cd8a159 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -810,6 +810,7 @@ msgctl12 msgctl12
 msgget01 msgget01
 msgget02 msgget02
 msgget03 msgget03
+msgget04 msgget04
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 41d54d939..d4baaa262 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -12,6 +12,7 @@ msgctl12 msgctl12
 msgget01 msgget01
 msgget02 msgget02
 msgget03 msgget03
+msgget04 msgget04
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
diff --git a/testcases/kernel/syscalls/ipc/msgget/.gitignore b/testcases/kernel/syscalls/ipc/msgget/.gitignore
index 3b2dfb518..7a9d5e340 100644
--- a/testcases/kernel/syscalls/ipc/msgget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgget/.gitignore
@@ -1,3 +1,4 @@
 /msgget01
 /msgget02
 /msgget03
+/msgget04
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget04.c b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
new file mode 100644
index 000000000..72cd4497b
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * It is a basic test about msg_next_id.
+ * msg_next_id specifies desired id for next allocated IPC message. By default
+ * they are equal to -1, which means generic allocation logic. Possible values
+ * to set are in range {0..INT_MAX}.
+ * Toggle with non-default value will be set back to -1 by kernel after
+ * successful IPC object allocation.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/msg.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+
+#define NEXT_ID_PATH "/proc/sys/kernel/msg_next_id"
+static int queue_id, pid;
+static key_t msgkey;
+
+static void verify_msgget(void)
+{
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
+
+	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | MSG_RW);
+	if (queue_id == pid)
+		tst_res(TPASS, "msg_next_id succeeded, queue id %d", pid);
+	else
+		tst_res(TFAIL, "msg_next_id failed, expected id %d, but got %d", pid, queue_id);
+
+	TST_ASSERT_INT(NEXT_ID_PATH, -1);
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+	pid++;
+}
+
+static void setup(void)
+{
+	msgkey = GETIPCKEY();
+	pid = getpid();
+}
+
+static void cleanup(void)
+{
+	if (queue_id != -1)
+		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_msgget,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_CHECKPOINT_RESTORE=y",
+		NULL
+	},
+	.needs_root = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
