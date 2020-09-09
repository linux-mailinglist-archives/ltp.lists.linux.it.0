Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE4262A96
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:40:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6530D3C2CE0
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:40:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DA5AB3C2CAD
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:40:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B2AAA200B1B
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:40:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,409,1592841600"; d="scan'208";a="99051916"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Sep 2020 16:40:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id AC9B34CE72FD;
 Wed,  9 Sep 2020 16:38:05 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 9 Sep 2020 16:27:16 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 9 Sep 2020 16:27:25 +0800
Message-ID: <1599640046-10135-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200908140838.GB17482@yuki.lan>
References: <20200908140838.GB17482@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AC9B34CE72FD.A286F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] syscalls/msgrcv07: Add functional test for
 MSG_COPY flag
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

When specifying MSG_COPY flag, we can read the msg but don't destroy
it in msg queue and mtype is interpreted as number of the message to
copy. We check the read data whether correctly and use msgctl to
check whether we still have 2 msg in msg queue after msgrcv(MSG_COPY).

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v2-v3:
1.modify the detection way about MSG_COPY flag
2.make messages short and to the point
3.zero rcv_buf when call msgrcv the second time

 .../kernel/syscalls/ipc/msgrcv/msgrcv07.c     | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index 8005a9acd..d4568956f 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -2,9 +2,10 @@
 /*
  * Copyright (c) 2014-2020 Fujitsu Ltd.
  * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  *
- * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR and different
- * msg_typ(zero,positive,negative).
+ * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR, MSG_COPY and
+ * different msg_typ(zero,positive,negative).
  *
  * * With MSG_EXCEPT flag any message type but the one passed to the function
  *   is received.
@@ -12,6 +13,9 @@
  * * With MSG_NOERROR and buffer size less than message size only part of the
  *   buffer is received.
  *
+ * * With MSG_COPY and IPC_NOWAIT flag read the msg but don't destroy it in
+ *   msg queue.
+ *
  * * With msgtyp is 0, then the first message in the queue is read.
  *
  * * With msgtyp is greater than 0, then the first message in the queue of type
@@ -33,7 +37,7 @@
 #define MSG2	"messagetype2"
 
 static key_t msgkey;
-static int queue_id = -1;
+static int queue_id = -1, msg_copy_sup;
 static struct buf {
 	long type;
 	char mtext[MSGSIZE];
@@ -97,6 +101,60 @@ static void test_msg_noerror(void)
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
+static void test_msg_copy(void)
+{
+	struct msqid_ds buf = {0};
+
+	if (!msg_copy_sup) {
+		tst_res(TCONF, "MSG_COPY was not supported, skip it");
+		return;
+	}
+	prepare_queue();
+
+	/*
+	 * If MSG_COPY flag was specified, then mtype is interpreted as number
+	 * of the message to copy.
+	 */
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 0, MSG_COPY | IPC_NOWAIT));
+	if (TST_RET == -1) {
+		if (TST_ERR == ENOSYS) {
+			tst_res(TCONF,
+				"MSG_COPY needs CONFIG_CHECKPORINT_RESTORE");
+			msg_copy_sup = 0;
+		} else {
+			tst_res(TFAIL | TTERRNO, "msgrcv(0, MSG_COPY) failed");
+		}
+		cleanup();
+		return;
+	}
+	tst_res(TPASS, "msgrcv(0, MSG_COPY) succeeded");
+	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
+		tst_res(TPASS, "MSG_COPY got MSGTYPE1 data correctly");
+	else
+		tst_res(TFAIL, "MSG_COPY got MSGTYPE1 data incorrectly");
+
+	memset(&rcv_buf, 0, sizeof(rcv_buf));
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, MSG_COPY | IPC_NOWAIT));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgrcv(1, MSG_COPY) failed");
+		cleanup();
+		return;
+	}
+	tst_res(TPASS, "msgrcv(1, MSG_COPY) succeeded");
+	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
+		tst_res(TPASS, "MSG_COPY got MSGTYPE2 data correctly");
+	else
+		tst_res(TFAIL, "MSG_COPY got MSGTYPE2 data incorrectly");
+
+	SAFE_MSGCTL(queue_id, IPC_STAT, &buf);
+	if (buf.msg_qnum == 2)
+		tst_res(TPASS, "Two messages still in queue");
+	else
+		tst_res(TFAIL, "Expected 2 msgs in queue got %d",
+		       (int)buf.msg_qnum);
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
 static void test_zero_msgtyp(void)
 {
 	prepare_queue();
@@ -159,11 +217,17 @@ static void test_negative_msgtyp(void)
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
+
+	if (tst_kvercmp(3, 8, 0) < 0) {
+		tst_res(TCONF, "MSG_COPY needs Linux 3.8 or newer");
+		return;
+	}
+	msg_copy_sup = 1;
 }
 
 static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror,
-				   test_zero_msgtyp, test_positive_msgtyp,
-				   test_negative_msgtyp};
+				   test_msg_copy, test_zero_msgtyp,
+				   test_positive_msgtyp, test_negative_msgtyp};
 
 static void verify_msgcrv(unsigned int n)
 {
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
