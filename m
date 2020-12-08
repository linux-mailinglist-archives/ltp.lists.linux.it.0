Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6F2D2873
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3317D3C4B88
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3FFDB3C2E49
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 01C1D100093F
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,402,1599494400"; d="scan'208";a="102176862"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 18:07:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2EBC54CE6000
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 18:07:50 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 18:07:49 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Dec 2020 05:07:47 -0500
Message-ID: <1607422067-15500-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2EBC54CE6000.A876E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/ipc: msgctl06: Add a test for
 MSG_STAT_ANY
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

Validate the content of the msginfo structure and the return value.

The return value is highest used index to a kernel table, so we call
msgctl() with MSG_STAT_ANY which shouldn't fail if the value is correct.

We also parse /proc/sysvipc/msg and check that the information is
consistent with the content of msginfo structure.

It refers to shmctl04.

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 runtest/syscalls                                |   1 +
 runtest/syscalls-ipc                            |   1 +
 testcases/kernel/syscalls/ipc/msgctl/.gitignore |   1 +
 testcases/kernel/syscalls/ipc/msgctl/msgctl06.c | 156 ++++++++++++++++++++++++
 4 files changed, 159 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/msgctl/msgctl06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 08ffd04..409800d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -800,6 +800,7 @@ msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
 msgctl05 msgctl05
+msgctl06 msgctl06
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 57878b4..9524b1a 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -3,6 +3,7 @@ msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
 msgctl05 msgctl05
+msgctl06 msgctl06
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/testcases/kernel/syscalls/ipc/msgctl/.gitignore b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
index 0157f46..ed10a8d 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
@@ -3,4 +3,5 @@
 /msgctl03
 /msgctl04
 /msgctl05
+/msgctl06
 /msgctl12
diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
new file mode 100644
index 0000000..8d44e3a
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
+ */
+/*
+ * Call msgctl() with MSG_INFO flag and check that:
+ *
+ * * The returned index points to a valid MSG by calling MSG_STAT_ANY
+ * * Also count that valid indexes < returned max index sums up to used_ids
+ * * And the data are consistent with /proc/sysvipc/msg
+ *
+ * There is a possible race between the call to the msgctl() and read from the
+ * proc file so this test cannot be run in parallel with any IPC testcases that
+ * adds or removes MSG queues.
+ *
+ * Note what we create a MSG segment in the test setup and send msg to make sure
+ * that there is at least one during the testrun.
+ */
+
+#include <stdio.h>
+#include <pwd.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+#include "lapi/msg.h"
+
+static int msg_id = -1;
+static struct passwd *ltpuser;
+static uid_t nobody_uid, root_uid;
+
+static struct tcases {
+	uid_t *uid;
+	char *desc;
+} tests[] = {
+	{&nobody_uid, "with nobody user"},
+	{&root_uid, "with root user"}
+};
+
+static void parse_proc_sysvipc(struct msginfo *info)
+{
+	FILE *f = fopen("/proc/sysvipc/msg", "r");
+	int used_ids = 0;
+	int queue_nums = 0;
+	int msg_bytes = 0;
+
+	/* Eat header */
+	for (;;) {
+		int c = fgetc(f);
+
+		if (c == '\n' || c == EOF)
+			break;
+	}
+
+	int msgid, cbytes, qnum;
+
+	/*
+	 * Sum queue and byte for all elements listed, which should equal
+	 * the data returned in the msginfo structure.
+	 */
+	while (fscanf(f, "%*i %i %*i %i %i %*i %*i %*i %*i %*i %*i %*i %*i %*i",
+			&msgid, &cbytes, &qnum) > 0){
+		used_ids++;
+		queue_nums += qnum;
+		msg_bytes += cbytes;
+	}
+
+	if (info->msgpool != used_ids) {
+		tst_res(TFAIL, "msgpool = %i, expected %i",
+			info->msgpool, used_ids);
+	} else {
+		tst_res(TPASS, "used_ids = %i", used_ids);
+	}
+
+	if (info->msgmap != queue_nums) {
+		tst_res(TFAIL, "msgmap = %i, expected %i",
+			info->msgpool, queue_nums);
+	} else {
+		tst_res(TPASS, "msgnums = %i", queue_nums);
+	}
+
+	if (info->msgtql != msg_bytes) {
+		tst_res(TFAIL, "msgtql = %i, expected %i",
+			info->msgtql, msg_bytes);
+	} else {
+		tst_res(TPASS, "msgbytes = %i", msg_bytes);
+	}
+
+	fclose(f);
+}
+
+static void verify_msgctl(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+	int i, msgid, cnt = 0;
+	struct msqid_ds buf;
+	struct msginfo info;
+
+	tst_res(TINFO, "Test MSG_STAT_ANY %s", tc->desc);
+
+	SAFE_SETEUID(*tc->uid);
+
+	TEST(msgctl(0, MSG_INFO, (struct msgid_ds *)&info));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgctl(0, MSG_INFO, ...)");
+		return;
+	}
+
+	msgid = msgctl(TST_RET, MSG_STAT_ANY, &buf);
+
+	if (msgid == -1) {
+		tst_res(TFAIL | TTERRNO, "MSG_INFO haven't returned a valid index");
+	} else {
+		tst_res(TPASS, "MSG_INFO returned valid index %li to msgid %i",
+			TST_RET, msgid);
+	}
+
+	for (i = 0; i <= TST_RET; i++) {
+		if (msgctl(i, MSG_STAT_ANY, &buf) != -1)
+			cnt++;
+	}
+
+	if (cnt == info.msgpool) {
+		tst_res(TPASS, "Counted used = %i", cnt);
+	} else {
+		tst_res(TFAIL, "Counted used = %i, msgpool = %i",
+			cnt, info.msgpool);
+	}
+
+	parse_proc_sysvipc(&info);
+}
+
+static void setup(void)
+{
+	ltpuser = SAFE_GETPWNAM("nobody");
+	nobody_uid = ltpuser->pw_uid;
+	root_uid = 0;
+
+	msg_id = SAFE_MSGGET(IPC_PRIVATE, IPC_CREAT | MSG_RW);
+	SAFE_MSGSND(msg_id, "abcd", 4, 0);
+}
+
+static void cleanup(void)
+{
+	if (msg_id >= 0)
+		SAFE_MSGCTL(msg_id, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_msgctl,
+	.tcnt = ARRAY_SIZE(tests),
+	.needs_root = 1,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
