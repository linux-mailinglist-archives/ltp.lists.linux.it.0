Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945E3B0107
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 12:12:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 706103C7044
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 12:12:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD7343C22F1
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:12:06 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4A9BB1A00279
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624356724; i=@fujitsu.com;
 bh=ck/07TPOR4iFWZAI1K3Y1kUyLSdq+LlPa22jpV27ZUI=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=hZQ3UhcUtnAwy7wzVjYdGmoCsqu+jpHDUKphyqjrbuJ3kM7KqmLMI3BPLcIRJbOLb
 bFhk8ijVJ0bxokXZlH6avaR0+EaKAx4oTHnQw9icVBG8wNnm93oPleZ9PlxxkQfQIf
 IsbCp0DQhYBd6lq7aNhNYxxJdHqRCY4KPjJc0rRkRT1vKtY5tPRA+A4tIdVpmpMopx
 nTCwm6e25OmiGkb0/fhemfAfLhkObssV4w6OTGNs6Th/YCvIShruEjW8urMod4opsJ
 NRq0n+Gj4txbEnw3Ve9+2X0v4ccbtJtaqsoaYlTAuxow58YokyfOfzSQ0RzKfE+06w
 znnrOcL9C1mRw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 57/34-52906-477B1D06;
 Tue, 22 Jun 2021 10:12:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRolu8/WK
 CweOzRhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8aX9oVMBfNcK9aulm1gPGTTxcjFISTQwiRx
 /c8RdghnD6NEy9Z3rF2MnBxsApoSzzoXMIPYIgISEh0Nb9lBbGYBdYnlk34xgdjCAtYSvfOmg
 tWzCKhKvFh6DKyeV8BdYlfTZrC4hICCxJSH76HighInZz5hgZgjIXHwxQtmiBpFiUsd3xgh7A
 qJGTO2sU1g5J2FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11DXSNTI30Eqt0E/VSS3W
 TU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGWUsjwZwfj6jcf9A4xSnIwKYny3t56MUGILyk/
 pTIjsTgjvqg0J7X4EKMMB4eSBO+hbUA5waLU9NSKtMwcYLDDpCU4eJREeLeBtPIWFyTmFmemQ
 6ROMSpKifPGgPQJgCQySvPg2mARdolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO80kCk8mX
 klcNNfAS1mAlq8iu0cyOKSRISUVANTzdkdu65/b30qyzuN4b70yU8RDcHWwcsmBB5wXOYk1DH
 13AItveqXlxrDd+eYSl00irxdpr/w45OyLo7NR64FpOzc6CowmXvBGmWdw+6d1p/rLn7ZGXPn
 iBL7+cD1i5mYwxdNkS3qzVmZECb2+mTF207Z4jvBXSkHV3o+XfTqgssa3tkdoS33TBfM5Fwbn
 axkmysXLp58zOxFQfM9h7XpZ7oqXu8Rdth5v3G6xh2zmptfYyY6fN6aLeer3L7qqIXQ+5w1/n
 LrFE9/ZuPfOKf0dOSrkHlFrFsCpmduaNi1ff6uttlePB5LLhrNj8vMjzy49cm7opKZ0pOepDa
 9t7jd+3fX2otRL+62H9lyKlVVXomlOCPRUIu5qDgRAOiBqOwrAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-232.messagelabs.com!1624356723!34749!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11990 invoked from network); 22 Jun 2021 10:12:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-13.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2021 10:12:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15MABv17005348
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 11:12:03 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 22 Jun 2021 11:11:54 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 22 Jun 2021 18:12:17 +0800
Message-ID: <1624356737-508-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC] syscalls/ipc: Make use of TST_EXP_FAIL macro
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
Since TST_EXP_FAIL macro only recognizes sycalls succeeded when syscalls return 0,
Can we use this macro directly for the these syscalls's error test? It may result in
invalid retval value and print errno when syscall succeeded. I think it
is a nit and it can improve this api usage range. Is it right?

 testcases/kernel/syscalls/ipc/msgget/msgget02.c | 15 ++-------------
 testcases/kernel/syscalls/ipc/msgget/msgget03.c | 12 ++----------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c | 17 ++---------------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c | 12 ++----------
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c | 11 ++---------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd02.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c | 14 ++------------
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c | 14 ++------------
 9 files changed, 18 insertions(+), 105 deletions(-)

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
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 8fa620855..e1f36b3ae 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -26,16 +26,8 @@ static key_t msgkey;
 
 static void verify_msgget(void)
 {
-	TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL));
-	if (TST_RET != -1)
-		tst_res(TFAIL, "msgget() succeeded unexpectedly");
-
-	if (TST_ERR == ENOSPC) {
-		tst_res(TPASS | TTERRNO, "msgget() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
-			" expected ENOSPC");
-	}
+	TST_EXP_FAIL(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
+		"msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv02.c
index 8dd28116a..d8df401e7 100644
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
+	TST_EXP_FAIL(msgrcv(*tc->id, tc->buffer, tc->msgsz, tc->msgtyp, tc->msgflag), tc->exp_err,
+		"msgrcv(%i, %p, %i, %ld, %i)", *tc->id, tc->buffer, tc->msgsz, tc->msgtyp, tc->msgflag);
 }
 
 static void do_test(unsigned int n)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
index b578e2810..8f4b3fa52 100644
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
+	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag), tc->exp_err,
+		"msgrcv(%i, %p, %i, %i, %i)", queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv05.c
index 43581896a..6bc908aa5 100644
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
+	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0), EINTR,
+		"msgrcv(%i, %p, %d, 1, 0)", queue_id, &rcv_buf, MSGSIZE);
 }
 
 static void do_test(void)
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv06.c
index 283b4af1d..7fec0b6ad 100644
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
+	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0), EIDRM,
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
