Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4601262A95
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:40:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 492553C5372
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 10:40:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 335783C2C27
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:40:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 1A7FD200B27
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 10:40:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,409,1592841600"; d="scan'208";a="99051913"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Sep 2020 16:40:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C16E04CE72FE;
 Wed,  9 Sep 2020 16:38:05 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 9 Sep 2020 16:27:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 9 Sep 2020 16:27:26 +0800
Message-ID: <1599640046-10135-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599640046-10135-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200908140838.GB17482@yuki.lan>
 <1599640046-10135-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C16E04CE72FE.A0789
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] syscalls/msgrcv07: improve and short message
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ipc/msgrcv/msgrcv07.c     | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index d4568956f..04257d257 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -72,9 +72,9 @@ static void test_msg_except(void)
 	}
 	tst_res(TPASS, "msgrcv(MSG_EXCEPT) succeeded");
 	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
-		tst_res(TPASS, "msgrcv(MSG_EXCEPT) excepted MSGTYPE2 and only got MSGTYPE1");
+		tst_res(TPASS, "MSG_EXCEPT excepted MSGTYPE2 and got MSGTYPE1");
 	else
-		tst_res(TFAIL, "msgrcv(MSG_EXCEPT) didn't get MSGTYPE1 message");
+		tst_res(TFAIL, "MSG_EXCEPT didn't get MSGTYPE1 message");
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
@@ -95,9 +95,9 @@ static void test_msg_noerror(void)
 	}
 	tst_res(TPASS, "msgrcv(MSG_NOERROR) succeeded");
 	if (strncmp(rcv_buf.mtext, MSG1, msg_len) == 0 && rcv_buf.type == MSGTYPE1)
-		tst_res(TPASS, "msgrcv(MSG_NOERROR) truncated message text correctly");
+		tst_res(TPASS, "MSG_NOERROR truncated message correctly");
 	else
-		tst_res(TFAIL, "msgrcv(MSG_NOERROR) truncated message text incorrectly");
+		tst_res(TFAIL, "MSG_NOERROR truncated message incorrectly");
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
@@ -167,9 +167,9 @@ static void test_zero_msgtyp(void)
 	}
 	tst_res(TPASS, "msgrcv(zero_msgtyp) succeeded");
 	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
-		tst_res(TPASS, "msgrcv(zero_msgtyp) got the first message");
+		tst_res(TPASS, "zero_msgtyp got the first message");
 	else
-		tst_res(TFAIL, "msgrcv(zero_msgtyp) didn't get the first message");
+		tst_res(TFAIL, "zero_msgtyp didn't get the first message");
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
@@ -185,11 +185,11 @@ static void test_positive_msgtyp(void)
 	}
 	tst_res(TPASS, "msgrcv(positive_msgtyp) succeeded");
 	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
-		tst_res(TPASS, "msgrcv(positive_msgtyp) got the first message"
-			       " in the queue of type msgtyp");
+		tst_res(TPASS, "positive_msgtyp got the first message "
+				"in the queue of type msgtyp");
 	else
-		tst_res(TFAIL, "msgrcv(positive_msgtyp) didn't get the first "
-			       "message in the queue of type msgtyp");
+		tst_res(TFAIL, "positive_msgtyp didn't get the first "
+				"message in the queue of type msgtyp");
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
@@ -205,15 +205,14 @@ static void test_negative_msgtyp(void)
 	}
 	tst_res(TPASS, "msgrcv(negative_msgtyp) succeeded");
 	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
-		tst_res(TPASS, "msgrcv(negative_msgtyp) got the first message"
+		tst_res(TPASS, "negative_msgtyp got the first message"
 				" in the queue with the lowest type");
 	else
-		tst_res(TFAIL, "msgrcv(negative_msgtyp) didn't get the first "
+		tst_res(TFAIL, "negative_msgtyp didn't get the first "
 				"message in the queue with the lowest type");
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
-
 static void setup(void)
 {
 	msgkey = GETIPCKEY();
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
