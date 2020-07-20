Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0132258A2
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:31:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40D3B3C282A
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:31:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 464673C4E22
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:31:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 65D801A01A5C
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:31:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96607025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 15:31:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5D57D4CE1505
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 15:31:36 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 15:31:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 20 Jul 2020 15:30:25 +0800
Message-ID: <1595230227-21468-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5D57D4CE1505.AD178
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] syscalls/msgrcv: Add check for msg_lrpid and
 msg_rtime
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
 .../kernel/syscalls/ipc/msgrcv/msgrcv01.c     | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
index 204bf0575..3bdfa5b37 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
@@ -12,7 +12,8 @@
 #include "libnewipc.h"
 
 static key_t msgkey;
-static int queue_id = -1;
+static time_t creat_time, last_rcv_time;
+static int queue_id = -1, pid;
 static struct buf {
 	long type;
 	char mtext[MSGSIZE];
@@ -20,6 +21,8 @@ static struct buf {
 
 static void verify_msgrcv(void)
 {
+	struct msqid_ds qs_buf;
+
 	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
 
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
@@ -33,12 +36,35 @@ static void verify_msgrcv(void)
 	else
 		tst_res(TFAIL, "message received(%s) != message sent(%s)",
 			rcv_buf.mtext, snd_buf.mtext);
+
+	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
+	if (qs_buf.msg_cbytes == 0 && qs_buf.msg_qnum == 0)
+		tst_res(TPASS, "queue bytes and number of queues matched");
+	else
+		tst_res(TFAIL, "queue bytes or number of queues mismatched");
+	if (qs_buf.msg_lrpid == pid)
+		tst_res(TPASS, "PID of last msgrcv(2) matched");
+	else
+		tst_res(TFAIL, "PID of last msgrcv(2) mismatched");
+
+	if (qs_buf.msg_rtime >= creat_time && qs_buf.msg_rtime >= last_rcv_time)
+		tst_res(TPASS, "create time = %lu, last_snd_time = %lu, msg_stime = %lu",
+			(unsigned long)creat_time, (unsigned long)last_rcv_time,
+			(unsigned long)qs_buf.msg_rtime);
+	else
+		tst_res(TFAIL, "create time = %lu, last_rcv_time = %lu, msg_rtime = %lu",
+			(unsigned long)creat_time, (unsigned long)last_rcv_time,
+			(unsigned long)qs_buf.msg_rtime);
+
+	last_rcv_time = qs_buf.msg_rtime;
 }
 
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
 	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
+	pid = getpid();
+	time(&creat_time);
 }
 
 static void cleanup(void)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
