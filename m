Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7635BABB
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 09:20:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FCD53C73AF
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 09:20:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 237873C72E7
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 09:20:20 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 690451A0122C
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 09:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1618212018; i=@fujitsu.com;
 bh=P2pOoLE/HoZYXicbWvu07sxkKcshjTfsn3/Zvh5+q+k=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=NLWQiq6S1PgoPnsgyt1g+9VlqLXROVOe5Yz5WEnNfZQhvP7Is7FabfTypI3hl8zFl
 wg9m6Gx42x2OWEhBriM18wfp1y1X/iPJAdGRD+P/2QlXuI6+5xKvLmwni8pUAxYIGE
 4G8Fu+GJ1VEXnL+p10PamFHah3kuS71ym7wxSobQSvSy/uj169xCMrh22+ow8aXhSY
 8G+Hpur1d5RiwE2z+Ob254/P4mBOAPJuqFgRZUke5cpCEW3p2YiSfX2wTdisCeU1qP
 KMUJy5uYu+5SrFovl33Jz2GhkFLck9sZT1jDH0Y6DXarE1ExFrk8MYRgBGlZsF8Lch
 4Fca/4Ej5mgXw==
Received: from [100.113.0.194] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 48/CA-07430-2B4F3706;
 Mon, 12 Apr 2021 07:20:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRorvhS3G
 CwccLShYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8bF1o3sBd+kKo7+NG5g7BXrYuTiEBJoYZJY
 0/CXCcLZzSjR0fwPyOHkYBPQlHjWuYAZxBYRkJDoaHjLDmIzC6hLLJ/0C6xGWMBB4uCHdawgN
 ouAqsSGuVtZQGxeAU+JL++egdVICChITHn4HmwOp4CXxPznv4HmcAAtq5FYfjILolxQ4uTMJy
 wQ4yUkDr54wQzRqihxqeMbI4RdKdG5fgHjBEb+WUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MB
 A19DQWNdQ19DESC+xSjdRL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYjimFjH07GCe+
 +aB3iFGSg0lJlPebU3GCEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnevZ+AcoJFqempFWmZOcDYg
 ElLcPAoifAu+QCU5i0uSMwtzkyHSJ1iVJQS5637DJQQAElklObBtcHi8RKjrJQwLyMDA4MQT0
 FqUW5mCar8K0ZxDkYlYd4OkCk8mXklcNNfAS1mAlp8cWshyOKSRISUVAOTduacdXwN5cxzS1f
 Kiey0DPpapF7ZzP/Qtss1oPJmxdt9MzfMiY4sEZG7antnAcfcpsSPoUt6Pyj9yZvjpj1B9Pjv
 47N3bGPp2lvq1fXmlL27ndUDJX27ed56lwQ2yRziZ6i5I65mcO+0r5ybRWHAtvbiJS3Jj1fli
 5rI3ln7Nv2YL8+O2NYba3/2F7RNEXyrnBA1Iff9JP63+y5bxp6arugf/Y2r4dsOhk02s10efM
 h5dFIo6yX3wedlcq9WnLJpmXfk6arte7s0Hj6bel510g0tocxl3wXyTvFIHXOwff78S9A271y
 BzIunFzgFXbvyKORzLd/Jo4oPZtW4/tnduUR0d1HIfTbpuX/e16YxK7EUZyQaajEXFScCAN2C
 MtlCAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-232.messagelabs.com!1618212012!1267182!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11632 invoked from network); 12 Apr 2021 07:20:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-13.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2021 07:20:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13C7K6Gp023161
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 08:20:12 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 08:20:07 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 12 Apr 2021 16:20:13 +0800
Message-ID: <1618215614-24840-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618215614-24840-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <d1c91207-35eb-402f-566c-1289ba2c786a@oracle.com>
 <1618215614-24840-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/3] tst_safe_sysv_ipc.c: Fix wrong ret_check
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
