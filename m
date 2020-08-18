Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7546247D11
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 05:43:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C25D3C58D1
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 05:43:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B1DE03C24E2
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 05:43:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 09535600724
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 05:43:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,325,1592841600"; d="scan'208";a="98209048"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 11:43:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E051D4CE34F9;
 Tue, 18 Aug 2020 11:43:41 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 11:43:31 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 18 Aug 2020 11:43:28 +0800
Message-ID: <1597722208-3672-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200813152536.GH13292@yuki.lan>
References: <20200813152536.GH13292@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E051D4CE34F9.AE444
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/msgrcv03: Add error test for MSG_COPY flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The MSG_COPY flag was added in 3.8 for the implementation of the kernel
checkpoint-restore facility and is available only if the kernel was
built with the CONFIG_CHECKPOINT_RESTORE option.

On old kernel without this support, it only ignores this flag and doesn't
report ENOSYS/EINVAL error, so I add kconfig and min_kver check.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2:
1.Rename msgrcv09->msgrcv03
2.add comment on top level for why we both need min_kernel and kconfig check
 include/lapi/msg.h                            |  15 +++
 runtest/syscalls                              |   1 +
 runtest/syscalls-ipc                          |   1 +
 .../kernel/syscalls/ipc/msgrcv/.gitignore     |   1 +
 .../kernel/syscalls/ipc/msgrcv/msgrcv03.c     | 102 ++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 include/lapi/msg.h
 create mode 100644 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c

diff --git a/include/lapi/msg.h b/include/lapi/msg.h
new file mode 100644
index 000000000..d649f3318
--- /dev/null
+++ b/include/lapi/msg.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#ifndef LAPI_MSG_H
+#define LAPI_MSG_H
+
+#include <sys/msg.h>
+
+#ifndef MSG_COPY
+# define MSG_COPY  040000  /* copy (not remove) all queue messages */
+#endif
+
+#endif
diff --git a/runtest/syscalls b/runtest/syscalls
index 860c5c36d..20bbc022b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -815,6 +815,7 @@ msgget05 msgget05
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
+msgrcv03 msgrcv03
 msgrcv05 msgrcv05
 msgrcv06 msgrcv06
 msgrcv07 msgrcv07
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index e6837414c..94d1e4001 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -17,6 +17,7 @@ msgget05 msgget05
 
 msgrcv01 msgrcv01
 msgrcv02 msgrcv02
+msgrcv03 msgrcv03
 msgrcv05 msgrcv05
 msgrcv06 msgrcv06
 msgrcv07 msgrcv07
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/.gitignore b/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
index 0596ee00f..8ab91e763 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
@@ -1,5 +1,6 @@
 /msgrcv01
 /msgrcv02
+/msgrcv03
 /msgrcv05
 /msgrcv06
 /msgrcv07
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
new file mode 100644
index 000000000..84456c1cf
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * This is a basic test about MSG_COPY flag.
+ * This flag was added in 3.8 for the implementation of the kernel checkpoint
+ * restore facility and is available only if the kernel was built with the
+ * CONFIG_CHECKPOINT_RESTORE option.
+ * On old kernel without this support, it only ignores this flag and doesn't
+ * report ENOSYS/EINVAL error. The CONFIG_CHECKPOINT_RESTORE has existed
+ * before kernel 3.8.
+ * So for using this flag, kernel should greater than 3.8 and enable
+ * CONFIG_CHECKPOINT_RESTORE together.
+ *
+ * 1)msgrcv(2) fails and sets errno to EINVAL if IPC_NOWAIT was not specified
+ *   in msgflag.
+ * 2)msgrcv(2) fails and sets errno to EINVAL if IPC_EXCEPT was specified
+ *   in msgflag.
+ * 3)msgrcv(2) fails and set errno to ENOMSG if IPC_NOWAIT and MSG_COPY were
+ *  specified in msgflg and the queue contains less than msgtyp messages.
+ */
+
+#define  _GNU_SOURCE
+#include <string.h>
+#include <sys/wait.h>
+#include <sys/msg.h>
+#include <pwd.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+#include "lapi/msg.h"
+
+static key_t msgkey;
+static int queue_id = -1;
+static struct buf {
+	long type;
+	char mtext[MSGSIZE];
+} rcv_buf, snd_buf = {MSGTYPE, "hello"};
+
+static struct tcase {
+	int exp_err;
+	int msg_flag;
+	int msg_type;
+	char *message;
+} tcases[] = {
+	{EINVAL, 0, MSGTYPE,
+	"Test EINVAL error when msgflg specified MSG_COPY, but not IPC_NOWAIT"},
+
+	{EINVAL, MSG_EXCEPT, MSGTYPE,
+	"Test EINVAL error when msgflg specified both MSG_COPY and MSG_EXCEPT"},
+
+	{ENOMSG, IPC_NOWAIT, 2,
+	"Test ENOMSG error when using IPC_NOWAIT and MSG_COPY but not have"
+	" corresponding msgtype msg"},
+};
+
+static void verify_msgrcv(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	tst_res(TINFO, "%s", tc->message);
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "msgrcv() succeeded unexpectedly");
+		SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
+		return;
+	}
+
+	if (TST_ERR == tc->exp_err)
+		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "msgrcv() failed unexpectedly,"
+			" expected %s but got", tst_strerrno(tc->exp_err));
+}
+
+static void setup(void)
+{
+	msgkey = GETIPCKEY();
+	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
+	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
+}
+
+static void cleanup(void)
+{
+	if (queue_id != -1)
+		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_CHECKPOINT_RESTORE",
+		NULL
+	},
+	.min_kver = "3.8.0",
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_msgrcv,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
