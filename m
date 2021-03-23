Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714B345C60
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 11:57:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C392C3C71F1
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 11:57:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6E24C3C2A18
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 11:57:25 +0100 (CET)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 079511400747
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 11:57:24 +0100 (CET)
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 1B/17-38244-499C9506;
 Tue, 23 Mar 2021 10:57:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRqjv5ZGS
 CwZkWK4sV33cwOjB67Pu9jjWAMYo1My8pvyKBNeP/jKfMBS0yFTcnbmBsYPwq1sXIxSEkMJdJ
 YuuFx4wQzh5Gic9LPrB1MXJwsAnoSEycLtDFyMkhIiAh0dHwlh3EZhZQl1g+6RcTiC0sYCsxa
 9VcZhCbRUBV4vvdKWBxXgEfiR23L7KB2BICChJTHr4Hq+EU8JVY8eEgK4gtBFQz48RTNoh6QY
 mTM5+wQMyXkDj44gUzRK+ixKWOb4wQdpXEmo5pbBMY+WchaZmFpGUBI9MqRsukosz0jJLcxMw
 cXUMDA11DQ2NdQ10jYzO9xCrdRL3UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYECmFDK+
 2cH49fUHvUOMkhxMSqK8VkcjE4T4kvJTKjMSizPii0pzUosPMcpwcChJ8P44DpQTLEpNT61Iy
 8wBRgdMWoKDR0mE1+AAUJq3uCAxtzgzHSJ1ilFRSpx3wQmghABIIqM0D64NFpGXGGWlhHkZGR
 gYhHgKUotyM0tQ5V8xinMwKgnzvgTZzpOZVwI3/RXQYiagxR+Yw0AWlyQipKQamGLrH658YVk
 lvfGs6beX+v/nvnf81s0jt2eG/oU/nE4PLmosfuF+89fSjiXLuje9Y/TTW6fEbLj3baX3mTni
 S3e4M53Kl9lzLUZK5ph+bN0Wr+375J+mZGvMWXO7RfmPivHP1uXFb0ou/TzfaJPFGy6e133dS
 n/y1uQ3Xo7vtQ871+XPWBP7mMdicVYgh+v8l95dzDM35/DY7tnQkL8iaK0Yj5J0JtemNmPJy2
 GXrpS8OZk75X2iqr/g5utrWo8s22ptUy5g8fnESo+J7/Z6iaw54tbdqPudd5uTes/qgtiy15J
 J514cK7cVe9ll0KG9Z45ZsS+b5K3ZyWsXhd7xW7n8ibvQ9G8fYr56u6SIdCuxFGckGmoxFxUn
 AgCPN+JNQwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-10.tower-228.messagelabs.com!1616497043!330054!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27184 invoked from network); 23 Mar 2021 10:57:23 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-10.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Mar 2021 10:57:23 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com
 [10.182.185.116])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12NAvD5i031109
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 10:57:23 GMT
Received: from localhost.localdomain (10.167.220.84) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 10:57:15 +0000
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Mar 2021 18:57:16 +0800
Message-ID: <1616497037-19158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] tst_safe_sysv_ipc.c: Fix wrong ret_check
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

From: Yang Xu <xuyang2018.jy@fujitsu.com>

Since commit e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check"),
we added these cmds(SHM_LOCK, SHM_UNLOCK,SETALL,SETVAL) commands into this check.

It is wrong because these flags are defined in different system headers, the same value
can represent different meaning in differnent headers. ie. SHM_LOCK is 11, GETPID is
also 11. SHM_LOCK only returns 0 and -1 but GETPID returns -1 and postive num. ret_check will
idenity it fail even we call semctl with GETPID successfully.

Fix this regression by using different ret check for msg/shm/sem.

Fixes: e9e508aad1("lib/tst_safe_sysv_ipc.c: add other cmds in ret_check")
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/tst_safe_sysv_ipc.c | 52 ++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index 012f5ba38..7a3c515e6 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -13,28 +13,54 @@
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
 {
 	switch (cmd) {
 	case IPC_STAT:
 	case IPC_SET:
 	case IPC_RMID:
-	case SHM_LOCK:
-	case SHM_UNLOCK:
-	case SETALL:
-	case SETVAL:
 		return ret != 0;
 	default:
 		return ret < 0;
 	}
 }
 
+/*
+ * The IPC_STAT, IPC_SET, IPC_RMID, SHM_LOCK, SHM_UNLOCK can return either 0 or -1.
+ */
+static int shm_ret_check(int cmd, int ret)
+{
+	switch (cmd) {
+	case IPC_STAT:
+	case IPC_SET:
+	case IPC_RMID:
+	case SHM_LOCK:
+	case SHM_UNLOCK:
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
+	case SETALL:
+	case SETVAL:
+		return ret != 0;
+	default:
+		return ret < 0;
+	}
+}
+
 int safe_msgget(const char *file, const int lineno, key_t key, int msgflg)
 {
 	int rval;
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
