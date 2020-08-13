Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F267C2439CD
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 14:30:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A72993C30C8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 14:30:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8CF403C04C3
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 14:30:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C807C10014BB
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 14:30:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52A39AFE6;
 Thu, 13 Aug 2020 12:30:39 +0000 (UTC)
Date: Thu, 13 Aug 2020 14:30:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200813123038.GC13292@yuki.lan>
References: <1595211392-17141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595211392-17141-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/msgsnd01: Add check for msg_lspid and
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
I've changed how we do the timestamp check and pushed, thanks.

The timestamp check now takes time before the call and after the call
and checks that the timestamp is between these two, which in 99.9999% of
cases would be the same numbers so this is much stronger assertion than
you had there before.

See diff:

diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
index 6368690de..5f5da52d2 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
@@ -18,7 +18,6 @@
 #include "libnewipc.h"
 
 static key_t msgkey;
-static time_t creat_time, last_snd_time;
 static int queue_id = -1, pid;
 static struct buf {
 	long type;
@@ -28,12 +27,15 @@ static struct buf {
 static void verify_msgsnd(void)
 {
 	struct msqid_ds qs_buf;
+	time_t before_snd, after_snd;
 
+	time(&before_snd);
 	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
 		return;
 	}
+	time(&after_snd);
 
 	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
 
@@ -41,22 +43,23 @@ static void verify_msgsnd(void)
 		tst_res(TPASS, "queue bytes and number of queues matched");
 	else
 		tst_res(TFAIL, "queue bytes or number of queues mismatched");
+
 	if (qs_buf.msg_lspid == pid)
 		tst_res(TPASS, "PID of last msgsnd(2) matched");
 	else
 		tst_res(TFAIL, "PID of last msgsnd(2) mismatched");
 
-	if (qs_buf.msg_stime >= creat_time && qs_buf.msg_stime >= last_snd_time)
-		tst_res(TPASS, "create time = %lu, last_snd_time = %lu, msg_stime = %lu",
-			(unsigned long)creat_time, (unsigned long)last_snd_time,
-			(unsigned long)qs_buf.msg_stime);
-	else
-		tst_res(TFAIL, "create time = %lu, last_snd_time = %lu, msg_stime = %lu",
-			(unsigned long)creat_time, (unsigned long)last_snd_time,
-			(unsigned long)qs_buf.msg_stime);
+	if (qs_buf.msg_stime >= before_snd && qs_buf.msg_stime <= after_snd) {
+		tst_res(TPASS, "msg_stime = %lu in [%lu, %lu]",
+			(unsigned long)qs_buf.msg_stime,
+			(unsigned long)before_snd, (unsigned long)after_snd);
+	} else {
+		tst_res(TFAIL, "msg_stime = %lu out of [%lu, %lu]",
+			(unsigned long)qs_buf.msg_stime,
+			(unsigned long)before_snd, (unsigned long)after_snd);
+	}
 
 	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 1, 0);
-	last_snd_time = qs_buf.msg_stime;
 }
 
 static void setup(void)
@@ -64,7 +67,6 @@ static void setup(void)
 	msgkey = GETIPCKEY();
 	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
 	pid = getpid();
-	time(&creat_time);
 }
 
 static void cleanup(void)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
