Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D75243465
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 09:08:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4317E3C30F8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 09:08:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3A51E3C08AB
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 09:08:21 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C6FED600568
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 09:08:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,307,1592841600"; d="scan'208";a="98057142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Aug 2020 15:08:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1F6384CE34F6
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 15:08:13 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 Aug 2020 15:08:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 13 Aug 2020 15:08:36 +0800
Message-ID: <1597302516-6495-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1F6384CE34F6.AD809
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msgget05: Add test when the id of
 msg_next_id has existed
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

When message queue identifier that msg_next_id has existed, msgget() with
different key will return the another msg id. But kernel doesn't guarantee
desired id, I just compare with existed id, if not equal, the test succeeded.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/msgget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/msgget/msgget05.c     | 68 +++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/msgget/msgget05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 41cd8a159..860c5c36d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -811,6 +811,7 @@ msgget01 msgget01
 msgget02 msgget02
 msgget03 msgget03
 msgget04 msgget04
+msgget05 msgget05
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index d4baaa262..e6837414c 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -13,6 +13,7 @@ msgget01 msgget01
 msgget02 msgget02
 msgget03 msgget03
 msgget04 msgget04
+msgget05 msgget05
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
diff --git a/testcases/kernel/syscalls/ipc/msgget/.gitignore b/testcases/kernel/syscalls/ipc/msgget/.gitignore
index 7a9d5e340..3372016ea 100644
--- a/testcases/kernel/syscalls/ipc/msgget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgget/.gitignore
@@ -2,3 +2,4 @@
 /msgget02
 /msgget03
 /msgget04
+/msgget05
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget05.c b/testcases/kernel/syscalls/ipc/msgget/msgget05.c
new file mode 100644
index 000000000..e282d559c
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget05.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * It is a basic test about msg_next_id.
+ * When the message queue identifier that msg_next_id stored has existed,
+ * call msgget with different key just use another unused value in range
+ * [0,INT_MAX]. kernel doesn't guarantee the desired id.
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
+
+static int queue_id[2], pid;
+static key_t msgkey[2];
+
+static void verify_msgget(void)
+{
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", queue_id[0]);
+
+	queue_id[1] = SAFE_MSGGET(msgkey[1], IPC_CREAT | MSG_RW);
+	if (queue_id[1] == queue_id[0])
+		tst_res(TFAIL, "msg id %d has existed, msgget() returns the"
+			" same msg id unexpectedly", queue_id[0]);
+	else
+		tst_res(TPASS, "msg id %d has existed, msgget() returns the"
+			" new msgid %d", queue_id[0], queue_id[1]);
+
+	SAFE_MSGCTL(queue_id[1], IPC_RMID, NULL);
+}
+
+static void setup(void)
+{
+	msgkey[0] = GETIPCKEY();
+	msgkey[1] = GETIPCKEY();
+	pid = getpid();
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
+	queue_id[0] = SAFE_MSGGET(msgkey[0], IPC_CREAT | MSG_RW);
+	tst_res(TINFO, "Test msg_next_id effects on msgget(different key) "
+		"when this message queue identifier has existed");
+}
+
+static void cleanup(void)
+{
+	for (int i = 0; i < 2; i++)
+		if (queue_id[i] != -1)
+			SAFE_MSGCTL(queue_id[i], IPC_RMID, NULL);
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
