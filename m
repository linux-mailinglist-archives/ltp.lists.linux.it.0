Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626C26304A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 17:15:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E584E3C2C0D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 17:15:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 75F0E3C24E4
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 17:15:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F2DD01000AE6
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 17:15:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0416AACA0;
 Wed,  9 Sep 2020 15:15:22 +0000 (UTC)
Date: Wed, 9 Sep 2020 17:15:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200909151536.GC3241@yuki.lan>
References: <20200908140838.GB17482@yuki.lan>
 <1599640046-10135-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599640046-10135-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/msgrcv07: Add functional test for
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

Hi!
Pushed with a minor cleanup, thanks.

The diff:

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index d4568956f..82b119d39 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -106,9 +106,10 @@ static void test_msg_copy(void)
 	struct msqid_ds buf = {0};
 
 	if (!msg_copy_sup) {
-		tst_res(TCONF, "MSG_COPY was not supported, skip it");
+		tst_res(TCONF, "MSG_COPY not supported");
 		return;
 	}
+
 	prepare_queue();
 
 	/*
@@ -124,10 +125,11 @@ static void test_msg_copy(void)
 		} else {
 			tst_res(TFAIL | TTERRNO, "msgrcv(0, MSG_COPY) failed");
 		}
-		cleanup();
-		return;
+		goto exit;
 	}
+
 	tst_res(TPASS, "msgrcv(0, MSG_COPY) succeeded");
+
 	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
 		tst_res(TPASS, "MSG_COPY got MSGTYPE1 data correctly");
 	else
@@ -137,21 +139,25 @@ static void test_msg_copy(void)
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, MSG_COPY | IPC_NOWAIT));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgrcv(1, MSG_COPY) failed");
-		cleanup();
-		return;
+		goto exit;
 	}
+
 	tst_res(TPASS, "msgrcv(1, MSG_COPY) succeeded");
+
 	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
 		tst_res(TPASS, "MSG_COPY got MSGTYPE2 data correctly");
 	else
 		tst_res(TFAIL, "MSG_COPY got MSGTYPE2 data incorrectly");
 
 	SAFE_MSGCTL(queue_id, IPC_STAT, &buf);
-	if (buf.msg_qnum == 2)
+	if (buf.msg_qnum == 2) {
 		tst_res(TPASS, "Two messages still in queue");
-	else
+	} else {
 		tst_res(TFAIL, "Expected 2 msgs in queue got %d",
 		       (int)buf.msg_qnum);
+	}
+
+exit:
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 }
 
@@ -218,11 +224,8 @@ static void setup(void)
 {
 	msgkey = GETIPCKEY();
 
-	if (tst_kvercmp(3, 8, 0) < 0) {
-		tst_res(TCONF, "MSG_COPY needs Linux 3.8 or newer");
-		return;
-	}
-	msg_copy_sup = 1;
+	if (tst_kvercmp(3, 8, 0) >= 0)
+		msg_copy_sup = 1;
 }
 
 static void (*testfunc[])(void) = {test_msg_except, test_msg_noerror,

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
