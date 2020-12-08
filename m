Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC252D2E90
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 16:45:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD73E3C4B92
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 16:45:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3AF563C4B86
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 16:45:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 783A010009DB
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 16:45:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C58FFADD7;
 Tue,  8 Dec 2020 15:45:19 +0000 (UTC)
Date: Tue, 8 Dec 2020 16:46:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <X8+fxq1wppq1SjtP@yuki.lan>
References: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1607422067-15500-3-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607422067-15500-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/ipc: msgctl06: Add a test for
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a few changes, thanks.

* Reformatted the top level description so that it's picked by the
  docparser

* Renamed the variables in the proc parsing function to make it more
  clear what they referring to

+ Fixed some typos.

Full diff:

diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
index c931bbfd3..99e44851c 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
@@ -3,7 +3,9 @@
  * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
  * Author: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
  */
-/*
+/*\
+ * [DESCRIPTION]
+ *
  * Call msgctl() with MSG_INFO flag and check that:
  *
  * * The returned index points to a valid MSG by calling MSG_STAT_ANY
@@ -16,7 +18,10 @@
  *
  * Note what we create a MSG segment in the test setup and send msg to make sure
  * that there is at least one during the testrun.
- */
+ *
+ * Also note that for MSG_INFO the members of the msginfo structure have
+ * completely different meaning than their names seems to suggest.
+\*/
 
 #include <stdio.h>
 #include <pwd.h>
@@ -40,8 +45,8 @@ static struct tcases {
 static void parse_proc_sysvipc(struct msginfo *info)
 {
 	FILE *f = fopen("/proc/sysvipc/msg", "r");
-	int used_ids = 0;
-	int queue_nums = 0;
+	int queue_cnt = 0;
+	int msg_cnt = 0;
 	int msg_bytes = 0;
 
 	/* Eat header */
@@ -52,38 +57,38 @@ static void parse_proc_sysvipc(struct msginfo *info)
 			break;
 	}
 
-	int msgid, cbytes, qnum;
+	int cbytes, msgs;
 
 	/*
 	 * Sum queue and byte for all elements listed, which should equal
 	 * the data returned in the msginfo structure.
 	 */
-	while (fscanf(f, "%*i %i %*i %i %i %*i %*i %*i %*i %*i %*i %*i %*i %*i",
-			&msgid, &cbytes, &qnum) > 0){
-		used_ids++;
-		queue_nums += qnum;
+	while (fscanf(f, "%*i %*i %*i %i %i %*i %*i %*i %*i %*i %*i %*i %*i %*i",
+	              &cbytes, &msgs) > 0){
+		queue_cnt++;
+		msg_cnt += msgs;
 		msg_bytes += cbytes;
 	}
 
-	if (info->msgpool != used_ids) {
+	if (info->msgpool != queue_cnt) {
 		tst_res(TFAIL, "msgpool = %i, expected %i",
-			info->msgpool, used_ids);
+			info->msgpool, queue_cnt);
 	} else {
-		tst_res(TPASS, "used_ids = %i", used_ids);
+		tst_res(TPASS, "queue_cnt = %i", queue_cnt);
 	}
 
-	if (info->msgmap != queue_nums) {
+	if (info->msgmap != msg_cnt) {
 		tst_res(TFAIL, "msgmap = %i, expected %i",
-			info->msgpool, queue_nums);
+			info->msgpool, msg_cnt);
 	} else {
-		tst_res(TPASS, "msgnums = %i", queue_nums);
+		tst_res(TPASS, "msg_cnt = %i", msg_cnt);
 	}
 
 	if (info->msgtql != msg_bytes) {
 		tst_res(TFAIL, "msgtql = %i, expected %i",
 			info->msgtql, msg_bytes);
 	} else {
-		tst_res(TPASS, "msgbytes = %i", msg_bytes);
+		tst_res(TPASS, "msg_bytes = %i", msg_bytes);
 	}
 
 	fclose(f);
@@ -100,7 +105,7 @@ static void verify_msgctl(unsigned int n)
 
 	SAFE_SETEUID(*tc->uid);
 
-	TEST(msgctl(0, MSG_INFO, (struct msgid_ds *)&info));
+	TEST(msgctl(0, MSG_INFO, (struct msqid_ds *)&info));
 
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgctl(0, MSG_INFO, ...)");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
