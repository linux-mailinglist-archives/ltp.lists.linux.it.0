Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1B359C67
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 936663C7F36
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1445B3C7359
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:11 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CE2F760151A
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617965710; i=@fujitsu.com;
 bh=P2pOoLE/HoZYXicbWvu07sxkKcshjTfsn3/Zvh5+q+k=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=YyL+1KBDQrYQ6i4CNXwJi2UwwQSfGBsHZJuX7zgPhakShqM1OOceI8AqN9/7Bvwj1
 zKy5nqCGOHVk/4yD0velftk9bLXj42yozBJJy4aVwuKg4bjUPKCh1OPhNZxvBoxB6j
 Qk8WRxgBHr2X1y3jdONno1eHrXsTgfjTF9SWF61/N1zyPYrSvsgMIqjGAveTuHkX52
 DQOIUiA8c2gKVapwfRnJPgg9F+IgIb+wioJTXQUJigNKzFVhCoBlcytUsp94CL/mTk
 NlLKNJfBiv/xAxZSXrKQIRanNfWM2in5efao2InvJJWhhzpjwXuXsf/BE8FpUbWN8N
 FpkBWCX6QxSMQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id BF/06-23163-D8230706;
 Fri, 09 Apr 2021 10:55:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxRbfXqCD
 BYMdjVYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNeNi60b2gm9SFUd/Gjcw9op1MXJxCAnMY5I4
 fHwNC4Szm1Hi2Nx97F2MnBxsApoSzzoXMIPYIgISEh0Nb8HizALqEssn/WLqYuTgEBZwkLh6n
 wPEZBFQkXjf5wRSwSvgIXHs5GRWEFtCQEFiysP3YFM4BTwlXn47xwJiCwkkShzqmcQEUS8ocX
 LmExaI6RISB1+8YIboVZS41PGNEcKukuj8cJxtAiP/LCQts5C0LGBkWsVomVSUmZ5RkpuYmaN
 raGCga2horGsOZJnqJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAoMxpZA9cwfj
 5Dcf9A4xSnIwKYny/mIqSBDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwWtpCJQTLEpNT61Iy8wBR
 gZMWoKDR0mE97A+UJq3uCAxtzgzHSJ1ilFRSpz3FEifAEgiozQPrg0WjZcYZaWEeRkZGBiEeA
 pSi3IzS1DlXzGKczAqCfNyg0zhycwrgZv+CmgxE9DikoO5IItLEhFSUg1MpzV33ZhqkfNcwNd
 k4o+Pvzbzp6SWiG5w7xEV6Wg4yWm6caHUhqOnnK4/0itW3Pdn3f6LPpt0rn/e+VSV70iF2tmC
 puk3OU4Kn371c3Xiip2Smw5NZurPEbPi+9mgbXnZ9Fwb70/DVyU/ba/E7t2/N+/SdK6a3TwNi
 t9OFpotPRSwy0bUJnfTnKbEGZUWpiv9v546OG+diJTLcev87yGvz3zvquCw9e7+u5HNqW1Jur
 ty/rLAK0KGHhEv4m24Kxb6Opsd878bvCB4zb5fT04XT9kZLT5/RWLidrt5Nyts3bgXnlvu+79
 GT5xv6p1fzHHLM4/9OM5c8mPOjiOqCxsnMbHUXtlRF2riccO2ZPM0NyWW4oxEQy3mouJEAIL/
 WKlBAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-31.tower-248.messagelabs.com!1617965709!624525!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13057 invoked from network); 9 Apr 2021 10:55:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-31.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Apr 2021 10:55:09 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 139At2nf005832
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 9 Apr 2021 11:55:08 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 11:55:03 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 9 Apr 2021 19:55:04 +0800
Message-ID: <1617969305-2237-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <YHAoQooWArsl2rgD@yuki>
 <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] tst_safe_sysv_ipc.c: Fix wrong ret_check
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

Since commit e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check"),
we added these cmds(SHM_LOCK, SHM_UNLOCK,SETALL,SETVAL) commands into this check.

It is wrong because these flags are defined in different system headers, the same value
can represent different meaning in differnent headers. ie. SHM_LOCK is 11, GETPID is
also 11. SHM_LOCK only returns 0 and -1 but GETPID returns -1 and postive num. ret_check will
idenity it fail even we call semctl with GETPID successfully.

Fix this regression by using different ret check for msg/shm/sem.

Fixes: e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check")
Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/tst_safe_sysv_ipc.c | 44 ++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index 012f5ba38..5eaa82539 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -13,13 +13,24 @@
 #include "lapi/sem.h"
 
 /*
- * The IPC_STAT, IPC_SET, IPC_RMID, SHM_LOCK, SHM_UNLOCK, SETALL and SETVAL
- * can return either 0 or -1.
- *
- * Linux specific cmds either returns -1 on failure or positive integer
- * either index into an kernel array or shared primitive indentifier.
+ * The IPC_STAT, IPC_SET, IPC_RMID can return either 0 or -1.
  */
-static int ret_check(int cmd, int ret)
+static int msg_ret_check(int cmd, int ret)
+{
+	switch (cmd) {
+	case IPC_STAT:
+	case IPC_SET:
+	case IPC_RMID:
+		return ret != 0;
+	default:
+		return ret < 0;
+	}
+}
+
+/*
+ * The IPC_STAT, IPC_SET, IPC_RMID, SHM_LOCK, SHM_UNLOCK can return either 0 or -1.
+ */
+static int shm_ret_check(int cmd, int ret)
 {
 	switch (cmd) {
 	case IPC_STAT:
@@ -27,6 +38,21 @@ static int ret_check(int cmd, int ret)
 	case IPC_RMID:
 	case SHM_LOCK:
 	case SHM_UNLOCK:
+		return ret != 0;
+	default:
+		return ret < 0;
+	}
+}
+
+/*
+ * The IPC_STAT, IPC_SET, IPC_RMID, SETALL, SETVAL can return either 0 or -1.
+ */
+static int sem_ret_check(int cmd, int ret)
+{
+	switch (cmd) {
+	case IPC_STAT:
+	case IPC_SET:
+	case IPC_RMID:
 	case SETALL:
 	case SETVAL:
 		return ret != 0;
@@ -103,7 +129,7 @@ int safe_msgctl(const char *file, const int lineno, int msqid, int cmd,
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"msgctl(%i, %i, %p) failed", msqid, cmd, buf);
-	} else if (ret_check(cmd, rval)) {
+	} else if (msg_ret_check(cmd, rval)) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Invalid msgctl(%i, %i, %p) return value %d", msqid,
 			cmd, buf, rval);
@@ -173,7 +199,7 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"shmctl(%i, %i, %p) failed", shmid, cmd, buf);
-	} else if (ret_check(cmd, rval)) {
+	} else if (shm_ret_check(cmd, rval)) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Invalid shmctl(%i, %i, %p) return value %d", shmid,
 			cmd, buf, rval);
@@ -219,7 +245,7 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 		"semctl(%i, %i, %i,...) failed", semid, semnum, cmd);
-	} else if (ret_check(cmd, rval)) {
+	} else if (sem_ret_check(cmd, rval)) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Invalid semctl(%i, %i, %i,...) return value %d", semid,
 			semnum, cmd, rval);
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
