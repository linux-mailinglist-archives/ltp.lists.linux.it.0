Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6542255D2
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 04:16:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 904853C4E35
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 04:16:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C03F53C097D
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 04:16:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5282560092F
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 04:14:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; d="scan'208";a="96590442"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 10:16:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B4DF84CE4B09
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:16:05 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 10:16:08 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 20 Jul 2020 10:16:32 +0800
Message-ID: <1595211392-17141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B4DF84CE4B09.AE481
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msgsnd01: Add check for msg_lspid and
 msg_stime
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
 .../kernel/syscalls/ipc/msgsnd/msgsnd01.c     | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
index fca7c6789..6368690de 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
@@ -18,7 +18,8 @@
 #include "libnewipc.h"
 
 static key_t msgkey;
-static int queue_id = -1;
+static time_t creat_time, last_snd_time;
+static int queue_id = -1, pid;
 static struct buf {
 	long type;
 	char text[MSGSIZE];
@@ -40,15 +41,30 @@ static void verify_msgsnd(void)
 		tst_res(TPASS, "queue bytes and number of queues matched");
 	else
 		tst_res(TFAIL, "queue bytes or number of queues mismatched");
+	if (qs_buf.msg_lspid == pid)
+		tst_res(TPASS, "PID of last msgsnd(2) matched");
+	else
+		tst_res(TFAIL, "PID of last msgsnd(2) mismatched");
+
+	if (qs_buf.msg_stime >= creat_time && qs_buf.msg_stime >= last_snd_time)
+		tst_res(TPASS, "create time = %lu, last_snd_time = %lu, msg_stime = %lu",
+			(unsigned long)creat_time, (unsigned long)last_snd_time,
+			(unsigned long)qs_buf.msg_stime);
+	else
+		tst_res(TFAIL, "create time = %lu, last_snd_time = %lu, msg_stime = %lu",
+			(unsigned long)creat_time, (unsigned long)last_snd_time,
+			(unsigned long)qs_buf.msg_stime);
 
 	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 1, 0);
+	last_snd_time = qs_buf.msg_stime;
 }
 
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
-
 	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
+	pid = getpid();
+	time(&creat_time);
 }
 
 static void cleanup(void)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
