Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81543244638
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 10:10:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 144143C30A7
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 10:10:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4CC3B3C307D
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 10:10:23 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6BC4D20136F
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 10:10:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,311,1592841600"; d="scan'208";a="98093052"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Aug 2020 16:10:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A85024CE38AE;
 Fri, 14 Aug 2020 16:10:15 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 Aug 2020 16:10:17 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 14 Aug 2020 16:10:40 +0800
Message-ID: <1597392640-26678-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A85024CE38AE.AFE1C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msgrcv07: Add functional test for MSG_COPY
 flag
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

When specifying MSG_COPY flag, we can read the msg but don't destory
it in msg queue and mtype is interpreted as number of the message to
copy. We check the read data whether correctly and use msgctl to
check whether we still have 2 msg in msg queue after msgrcv(MSG_COPY).

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
Hi Cyril
This patch is based on new msgrcv07.c(test different msgtyp) and also
based on MSG_COPY error test(introduced MSG_COPY flag in lapi/msg.h).
 .../kernel/syscalls/ipc/msgrcv/msgrcv07.c     | 63 +++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index f6139ba57..51dbc8951 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -3,12 +3,13 @@
  * Copyright (c) 2014-2020 Fujitsu Ltd.
  * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
  *
- * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR and different
- * msg_typ(zero,positive,negative).
+ * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR, MSG_COPY
+ * and different msg_typ(zero,positive,negative).
  */
 
 #define  _GNU_SOURCE
 #include <sys/wait.h>
+#include "lapi/msg.h"
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
@@ -19,7 +20,7 @@
 #define MSG2	"messagetype2"
 
 static key_t msgkey;
-static int queue_id = -1;
+static int queue_id = -1, msg_copy_sup;
 static struct buf {
 	long type;
 	char mtext[MSGSIZE];
@@ -141,15 +142,69 @@ static void test_negative_msgtyp(void)
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
+static void test_msg_copy(void)
+{
+	struct msqid_ds buf = {0};
+
+	if (!msg_copy_sup)
+		tst_res(TCONF, "kernel doesn't support MSG_COPY flag, skip it");
+	prepare_queue();
+
+	/*
+	 * If MSG_COPY flag was specified, then mtype is interpreted as number
+	 * of the message to copy.
+	 */
+	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 0, MSG_COPY | IPC_NOWAIT);
+	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
+		tst_res(TPASS, "msgrcv(MSG_COPY) got MSGTYPE1 msg data"
+			" correctly");
+	else
+		tst_res(TFAIL, "msgrcv(MSG_COPY) got MSGTYPE1 msg data"
+			" incorrectly");
+
+	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 1, MSG_COPY | IPC_NOWAIT);
+	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
+		tst_res(TPASS, "msgrcv(MSG_COPY) got MSGTYPE2 msg data"
+			" correctly");
+	else
+		tst_res(TFAIL, "msgrcv(MSG_COPY) got MSGTYPE2 msg data"
+			" incorrectly");
+
+	SAFE_MSGCTL(queue_id, IPC_STAT, &buf);
+	if (buf.msg_qnum == 2)
+		tst_res(TPASS, "msgrcv(MSG_COPY) succeeded, msg queue "
+			"still has 2 msg");
+	else
+		tst_res(TFAIL, "msgrcv(MSG_COPY) msg queue expected 2 msg num,"
+			" but only got %d", (int)buf.msg_qnum);
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
 
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
+	prepare_queue();
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, MSGTYPE1, MSG_COPY));
+	if (TST_RET != -1)
+		tst_res(TINFO, "msgrcv succeeded unexpectedly, kernel doesn't"
+			" support MSG_COPY flag");
+
+	if (TST_ERR == EINVAL) {
+		tst_res(TINFO, "msgrcv failed as expected when not using"
+			" MSG_COPY and IPC_NOWAIT concurrently");
+		msg_copy_sup = 1;
+	} else if (TST_ERR == ENOSYS) {
+		tst_res(TINFO, "kernel doesn't enable CONFIG_CHECKPOINT_RESTORE");
+	} else {
+		tst_res(TINFO | TTERRNO, "msgrcv failed when not using MSG_COPY"
+			"and IPC_NOWAIT concurrently, expected EINVAL but got");
+	}
+	cleanup();
 }
 
 static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror,
 				   test_zero_msgtyp, test_positive_msgtyp,
-				   test_negative_msgtyp};
+				   test_negative_msgtyp, test_msg_copy};
 
 static void verify_msgcrv(unsigned int n)
 {
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
