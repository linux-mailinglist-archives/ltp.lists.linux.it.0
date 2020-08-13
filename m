Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E5243C64
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 17:21:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4B973C30C6
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 17:20:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 74B9C3C136B
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 17:20:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 36A3B201341
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 17:20:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,308,1592841600"; d="scan'208";a="98068245"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Aug 2020 23:20:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 53C364CE34E3;
 Thu, 13 Aug 2020 23:20:54 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 Aug 2020 23:20:56 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 13 Aug 2020 23:21:18 +0800
Message-ID: <1597332078-13006-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200813141104.GE13292@yuki.lan>
References: <20200813141104.GE13292@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 53C364CE34E3.AAC6F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/msgrcv07: Add different msgtyp test
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

After lookging msgcrv(2) man-page, the different msgtyp has the following effect:
1) If msgtyp is 0, then the first message in the queue is read.
2) If msgtyp is greater than 0, then the first message in the queue of type msgtyp is read.
3) If msgtyp is less than 0, then the first message in the queue with the lowest type less
 than or equal to the absolute value of msgtyp will be read.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1-v2:
1.remove useless change
2.add prepare_queque() function to make code more simple
 .../kernel/syscalls/ipc/msgrcv/msgrcv07.c     | 75 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index bb321c645..f6139ba57 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -3,7 +3,8 @@
  * Copyright (c) 2014-2020 Fujitsu Ltd.
  * Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
  *
- * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR
+ * Basic test for msgrcv(2) using MSG_EXCEPT, MSG_NOERROR and different
+ * msg_typ(zero,positive,negative).
  */
 
 #define  _GNU_SOURCE
@@ -33,13 +34,18 @@ static void cleanup(void)
 		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
-static void test_msg_except(void)
+static void prepare_queue(void)
 {
 	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
 	SAFE_MSGSND(queue_id, &snd_buf[0], MSGSIZE, 0);
 	SAFE_MSGSND(queue_id, &snd_buf[1], MSGSIZE, 0);
-
 	memset(&rcv_buf, 0, sizeof(rcv_buf));
+}
+
+static void test_msg_except(void)
+{
+	prepare_queue();
+
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, MSGTYPE2, MSG_EXCEPT));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgrcv(MSG_EXCEPT) failed");
@@ -77,12 +83,73 @@ static void test_msg_noerror(void)
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
+static void test_zero_msgtyp(void)
+{
+	prepare_queue();
+
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 0, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgrcv(zero_msgtyp) failed");
+		cleanup();
+		return;
+	}
+	tst_res(TPASS, "msgrcv(zero_msgtyp) succeeded");
+	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
+		tst_res(TPASS, "msgrcv(zero_msgtyp) got the first message");
+	else
+		tst_res(TFAIL, "msgrcv(zero_msgtyp) didn't get the first message");
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
+static void test_positive_msgtyp(void)
+{
+	prepare_queue();
+
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, MSGTYPE2, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgrcv(positive_msgtyp) failed");
+		cleanup();
+		return;
+	}
+	tst_res(TPASS, "msgrcv(positive_msgtyp) succeeded");
+	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
+		tst_res(TPASS, "msgrcv(positive_msgtyp) got the first message"
+			       " in the queue of type msgtyp");
+	else
+		tst_res(TFAIL, "msgrcv(positive_msgtyp) didn't get the first "
+			       "message in the queue of type msgtyp");
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
+static void test_negative_msgtyp(void)
+{
+	prepare_queue();
+
+	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE2, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "msgrcv(negative_msgtyp) failed");
+		cleanup();
+		return;
+	}
+	tst_res(TPASS, "msgrcv(negative_msgtyp) succeeded");
+	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
+		tst_res(TPASS, "msgrcv(negative_msgtyp) got the first message"
+				" in the queue with the lowest type");
+	else
+		tst_res(TFAIL, "msgrcv(negative_msgtyp) didn't get the first "
+				"message in the queue with the lowest type");
+	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
+}
+
+
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
 }
 
-static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror};
+static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror,
+				   test_zero_msgtyp, test_positive_msgtyp,
+				   test_negative_msgtyp};
 
 static void verify_msgcrv(unsigned int n)
 {
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
