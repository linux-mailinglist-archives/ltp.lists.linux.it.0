Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 985173B70EA
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:44:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E2533C8D8F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:44:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B235A3C6CF1
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:44:40 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE4AC200B8B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624963478; i=@fujitsu.com;
 bh=JXlOolSCDSshYfYqUQr55vRaPMs5ugisADLKDy+Omoc=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=XdojJcbxcpxH+GLJ8ys2vctrtuLtT6fUoTxknJluW8Kpd8y/lsnwTxq/iXTEL7Or+
 jOwslMRAwyHLpLJt0nhRulflFs0d+qedreqCQXTxJsHZ9aJ0uLd3k+lcEBhC9+M3Mh
 Ex6uyTe+hHCNmDYOINR8FlnU0f8mpamAhv3nLbra180TFsUSG8UPHHO3YFl3zyIJuM
 r5BFBZleIVfdccDmfw1gdvdPVIzeCYTUg62eTGOvfNkBSGrcd4SbVW4UNbqs2TiRQ9
 q39E/BJ/fZ1WKsWCkIQg5k5MYJRS34y5Jzu2HOmpZALBH3o8qQMeLkYLaeiyLq1xE8
 sJMUjcXZw//wQ==
Received: from [100.112.199.118] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 02/7E-64908-699FAD06;
 Tue, 29 Jun 2021 10:44:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MRojvt560
 Eg+9n+S2mvzjKZrHi+w5GByaPfb/XsXqcWXCEPYApijUzLym/IoE1Y/7WnYwFDTYV71b8Zmtg
 PGnSxcjJISTwmlHi6AHrLkYuIHsPo8Tz33OYQBJsApoSzzoXMIPYIgKiEp+nnwOzmQVsJZ4/v
 MQGYgsLhEqs/n2LFcRmEVCV2H7rCFgvr4CHxKOWm2BxCQEFiSkP34P1cgp4Smy9t5sRYnGixI
 1vx5kh6gUlTs58wgIxX0Li4IsXzBC9ihKXOr4xQtgVEjNmbGObwMg/C0nLLCQtCxiZVjGaJxV
 lpmeU5CZm5ugaGhjoGhoa6RpamumameglVukm6aWW6panFpfoGuollhfrFVfmJuek6OWllmxi
 BAZoSsERhx2M919/0DvEKMnBpCTKO//4rQQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEry634Fyg
 kWp6akVaZk5wGiBSUtw8CiJ8O4DSfMWFyTmFmemQ6ROMSpKifMagiQEQBIZpXlwbbAIvcQoKy
 XMy8jAwCDEU5BalJtZgir/ilGcg1FJmFfmB9AUnsy8Erjpr4AWMwEtXvTkJsjikkSElFQD07q
 3yU82/Jhb4v1r4sPwPVtZZD57/TV4/Uvu15U7LVpOWU1/07f41B0uvvB2R+vcnVYn7jw5znBh
 1pFH+Wdua6W0rop84FARqLDy3bL54a/q360vbG5elr70gfw1piq15m9Jzn8P589axPoiUP+b5
 X+2RPbZXeUNIQ5pIuyyngr9qYwrXxjoiOapcvsVSU3d/NRkpl6T8sMs+wqDoDVtnwVOvTy1Z/
 ddrsbN3Se6CxQCHELsqy2VXoZf/bzK8M+X0N7Abovv/fkaOccZJv9RiPjKfr60tso0eiKb+Yx
 A4Y3+Fq3y0SJW9ZNPZ58yYvixzTGg6u6LjoidAipSK216Xb3j9JrfK5asitv4OE1eiaU4I9FQ
 i7moOBEAxtrEBksDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-17.tower-287.messagelabs.com!1624963477!3499!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10402 invoked from network); 29 Jun 2021 10:44:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-17.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 10:44:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TAiVd3025873
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 29 Jun 2021 11:44:36 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 11:44:27 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 29 Jun 2021 18:44:46 +0800
Message-ID: <1624963486-6614-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <YNHCQ8qWSBdHIAra@yuki>
 <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/ipc: Make use of TST_EXP_FAIL or
 TST_EXP_FAIL2 macro
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/msgget/msgget02.c | 15 ++-------------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c | 17 ++---------------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c | 12 ++----------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c | 11 ++---------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c | 14 ++------------
 8 files changed, 16 insertions(+), 95 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget02.c b/testcases/kernel/syscalls/ipc/msgget/msgget02.c
index a8fac930b..de139790b 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget02.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget02.c
@@ -46,19 +46,8 @@ static struct tcase {
 
 static void verify_msgget(struct tcase *tc)
 {
-	TEST(msgget(*tc->key, tc->flags));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgget() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "msgget() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
-			" expected %s", tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL(msgget(*tc->key, tc->flags), tc->exp_err, "msgget(%i, %i)",
+		*tc->key, tc->flags);
 }
 
 static void do_test(unsigned int n)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c
index 8dd28116a..cfb7d7446 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c
@@ -59,18 +59,8 @@ static struct tcase {
 
 static void verify_msgrcv(struct tcase *tc)
 {
-	TEST(msgrcv(*tc->id, tc->buffer, tc->msgsz, tc->msgtyp, tc->msgflag));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "smgrcv() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgrcv() failed unexpectedly,"
-			" expected %s but got", tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL2(msgrcv(*tc->id, tc->buffer, tc->msgsz, tc->msgtyp, tc->msgflag), tc->exp_err,
+		"msgrcv(%i, %p, %i, %ld, %i)", *tc->id, tc->buffer, tc->msgsz, tc->msgtyp, tc->msgflag);
 }
 
 static void do_test(unsigned int n)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
index b578e2810..ebc583b3e 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
@@ -59,21 +59,8 @@ static void verify_msgrcv(unsigned int n)
 
 	tst_res(TINFO, "%s", tc->message);
 
-	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgrcv() succeeded unexpectedly");
-		SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
-		return;
-	}
-
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
-		return;
-	}
-
-	tst_res(TFAIL | TTERRNO,
-		"msgrcv() failed unexpectedly, expected %s got",
-		tst_strerrno(tc->exp_err));
+	TST_EXP_FAIL2(msgrcv(queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag), tc->exp_err,
+		"msgrcv(%i, %p, %i, %i, %i)", queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c
index 43581896a..cc385ee6e 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c
@@ -30,16 +30,8 @@ static void sighandler(int sig)
 
 static void verify_msgrcv(void)
 {
-	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgrcv() succeeded unexpectedly");
-		return;
-	}
-	if (TST_ERR == EINTR)
-		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "msgrcv() failed expected EINTR but got");
+	TST_EXP_FAIL2(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0), EINTR,
+		"msgrcv(%i, %p, %d, 1, 0)", queue_id, &rcv_buf, MSGSIZE);
 }
 
 static void do_test(void)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c
index 283b4af1d..f14526df9 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c
@@ -24,15 +24,8 @@ static struct buf {
 
 static void verify_msgrcv(void)
 {
-	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgrcv() succeeded unexpectedly");
-		return;
-	}
-	if (TST_ERR == EIDRM)
-		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "msgrcv() failed expected EIDRM but got");
+	TST_EXP_FAIL2(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0), EIDRM,
+		"msgrcv(%i, %p, %d, 1, 0)", queue_id, &rcv_buf, MSGSIZE);
 }
 
 static void do_test(void)
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c
index 24ef6c562..eca660605 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c
@@ -61,18 +61,8 @@ static struct tcase {
 
 static void verify_msgsnd(struct tcase *tc)
 {
-	TEST(msgsnd(*tc->id, tc->buffer, tc->msgsz, 0));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "smgsnd() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "msgsnd() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgsnd() failed unexpectedly,"
-			" expected %s", tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL(msgsnd(*tc->id, tc->buffer, tc->msgsz, 0), tc->exp_err,
+		"msgsnd(%i, %p, %i, 0)", *tc->id, tc->buffer, tc->msgsz);
 }
 
 static void do_test(unsigned int n)
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
index ace32cdaa..f048fa698 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
@@ -41,18 +41,8 @@ static struct tcase {
 
 static void verify_msgsnd(struct tcase *tc)
 {
-	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, tc->flag));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgsnd() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == tc->exp_err) {
-		tst_res(TPASS | TTERRNO, "msgsnd() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgsnd() failed unexpectedly,"
-			" expected %s", tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL(msgsnd(queue_id, &snd_buf, MSGSIZE, tc->flag), tc->exp_err,
+		"msgsnd(%i, %p, %i, %i)", queue_id, &snd_buf, MSGSIZE, tc->flag);
 }
 
 static void sighandler(int sig)
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
index 9f462b672..8fc665e68 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
@@ -28,18 +28,8 @@ static struct buf {
 
 static void verify_msgsnd(void)
 {
-	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "msgsnd() succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == EIDRM) {
-		tst_res(TPASS | TTERRNO, "msgsnd() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO,
-			"msgsnd() failed unexpectedly, expected EIDRM");
-	}
+	TST_EXP_FAIL(msgsnd(queue_id, &snd_buf, MSGSIZE, 0), EIDRM,
+		"msgsnd(%i, %p, %i, 0)", queue_id, &snd_buf, MSGSIZE);
 }
 
 static void do_test(void)
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
