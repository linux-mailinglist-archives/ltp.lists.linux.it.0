Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A055C357A64
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:30:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 136613C80D3
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 04:29:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 657293C2CA2
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:29:43 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 949D4140015A
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 04:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617848981; i=@fujitsu.com;
 bh=P2pOoLE/HoZYXicbWvu07sxkKcshjTfsn3/Zvh5+q+k=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=C2BYBIC3vbGusYRU4NMGZ2jqt7j4GjrojbGYoz6dSKR6ZsbhxY3AN2duhWfDhHjmU
 8or0V1fl8D1FTjtHsRtEXbtRLOPlK9QO40swhj+6elidOnVv3Fq/NDwQSdGLZZ73J9
 QY0Ym0vo9fLeTdxCbl1PV+Ceo7I8ieGl1eTbEZEqCqf6m7MzqIi00ZrV2JegnvKIzn
 T7206WIhU+I+uOP8uyXsYZ6D7waf+x8mXAwbg55grUTChApGgXomtfKeVg7rlK97h3
 L/9Nr0H8KkTLrsR7MXuErZrFWD45GppUqG5oGh4Ry4KhHczDZIZKqhNhHmVffj+Gqd
 q6UE5Vyj/426Q==
Received: from [100.113.2.232] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id F0/96-55623-59A6E606;
 Thu, 08 Apr 2021 02:29:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MRqjs1Ky/
 B4NhkNov3VycwWaz4voPRgclj3+91rB4fn95iCWCKYs3MS8qvSGDNuNi6kb3gm1TF0Z/GDYy9
 Yl2MXBxCAq1MEp9fHmTsYuQEcnYzShx/6QpiswloSjzrXMDcxcjBISIgL3Fhdg1ImFnAVuL5w
 0tsILawgIPElIf7wGwWARWJHe/eg9m8Ap4SV3rms4DYEgIKQDXvmUFsTgEviY7lL1kgVtVIHF
 30lwWiXlDi5MwnLBDzJSQOvnjBDNGrKHGp4xsjhF0l0fnhONsERv5ZSFpmIWlZwMi0itEiqSg
 zPaMkNzEzR9fQwEDX0NBY11DX1FAvsUo3US+1VDc5Na+kKBEoqZdYXqxXXJmbnJOil5dasokR
 GJ4phYzGOxgPvv6gd4hRkoNJSZTX7klughBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3oaMvAQhw
 aLU9NSKtMwcYKzApCU4eJREeN+nA6V5iwsSc4sz0yFSpxgVpcR5vTOBEgIgiYzSPLg2WHxeYp
 SVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wsyhSczrwRu+iugxUxAi0sO5oIsLklESEk1MHG
 vuBfP/O28C+uCvWE904VCixN8VnEJ1rGz+aw/n6S1tL9vpvB0Hxb2OLbfNoK5d9Yr1acHrmK+
 fkxayEro0PvrfK51/w79+d4Zu2F/9ZXlwdf5ndvPTVi2oPHW0dqJXvcrmpc+M/4plzDZ/+eRz
 8IHvi5x5Pc9n9imsbMk6bfo8YiX+w9tazzfce/81IIdeb69M645rVazTmn+kmhptmQKy1qeKf
 H9r4pXzNszz04hcPn8ptMmr9k3ep43kvhT9UEweNHi2RdqChn1Q8tYBbPvGy57GWy+1Ela1X4
 /6zKJ29Lbjxw6KrTHYt2ey7Gv72dMZ+Oz51l3S+5e+4K/ayQuLmrQS9o0//viextEP/AosRRn
 JBpqMRcVJwIAKQBBhUoDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-14.tower-228.messagelabs.com!1617848980!929052!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4640 invoked from network); 8 Apr 2021 02:29:41 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-14.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Apr 2021 02:29:41 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1382TXSV022670
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 8 Apr 2021 03:29:40 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 03:29:38 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <alexey.kodanev@oracle.com>
Date: Thu, 8 Apr 2021 11:29:30 +0800
Message-ID: <1617852571-20874-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617852571-20874-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
 <1617852571-20874-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] tst_safe_sysv_ipc.c: Fix wrong ret_check
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
