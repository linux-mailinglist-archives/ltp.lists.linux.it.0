Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FFE225DBB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:46:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AE773C4E18
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 13:46:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 53F243C0886
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:46:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id DDE5B200C7B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 13:46:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96621174"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 19:46:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id ABD9F4CE4BDF
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:46:27 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 19:46:31 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 20 Jul 2020 19:46:54 +0800
Message-ID: <1595245614-24814-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ABD9F4CE4BDF.A2B90
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msgget04: Add test for
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
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/msgget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/msgget/msgget04.c     | 66 +++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/msgget/msgget04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9d927935b..4cdb123bd 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -808,6 +808,7 @@ msgctl12 msgctl12
 msgget01 msgget01
 msgget02 msgget02
 msgget03 msgget03
+msgget04 msgget04
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 153e827cf..64d6b1c90 100644
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
index 000000000..3791f331a
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
@@ -0,0 +1,66 @@
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
+static int queue_id = 1, pid;
+static key_t msgkey;
+
+static void verify_msgget(void)
+{
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
+
+	TEST(msgget(msgkey, IPC_CREAT | MSG_RW));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgget() failed");
+		return;
+	}
+
+	queue_id = TST_RET;
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
+	SAFE_FILE_SCANF(NEXT_ID_PATH, "-1");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_msgget,
+	.needs_root = 1,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
