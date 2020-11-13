Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55682B1946
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:44:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77C703C5FCB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:44:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id ECFF63C2ED7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F8CD6011F9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87EBDABD1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:44:35 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 11:44:25 +0100
Message-Id: <20201113104431.17808-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/7] Unify error handling in lib/tst_safe_sysv_ipc.c
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

- Properly format caller file:line locations
- Pedantically check for invalid syscall return values, don't ignore silently

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Added missing "else" keyword

 lib/tst_safe_sysv_ipc.c | 80 ++++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index 30b5f6ec7..155e03b5e 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -25,7 +25,7 @@ static int ret_check(int cmd, int ret)
 	case IPC_RMID:
 		return ret != 0;
 	default:
-		return ret == -1;
+		return ret < 0;
 	}
 }
 
@@ -34,9 +34,14 @@ int safe_msgget(const char *file, const int lineno, key_t key, int msgflg)
 	int rval;
 
 	rval = msgget(key, msgflg);
+
 	if (rval == -1) {
-		tst_brk(TBROK | TERRNO, "%s:%d: msgget(%i, %x) failed",
-			file, lineno, (int)key, msgflg);
+		tst_brk_(file, lineno, TBROK | TERRNO, "msgget(%i, %x) failed",
+			(int)key, msgflg);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid msgget(%i, %x) return value %d", (int)key,
+			msgflg, rval);
 	}
 
 	return rval;
@@ -48,10 +53,15 @@ int safe_msgsnd(const char *file, const int lineno, int msqid, const void *msgp,
 	int rval;
 
 	rval = msgsnd(msqid, msgp, msgsz, msgflg);
+
 	if (rval == -1) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: msgsnd(%i, %p, %zu, %x) failed",
-			file, lineno, msqid, msgp, msgsz, msgflg);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"msgsnd(%i, %p, %zu, %x) failed", msqid, msgp, msgsz,
+			msgflg);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid msgsnd(%i, %p, %zu, %x) return value %d",
+			msqid, msgp, msgsz, msgflg, rval);
 	}
 
 	return rval;
@@ -63,10 +73,15 @@ ssize_t safe_msgrcv(const char *file, const int lineno, int msqid, void *msgp,
 	ssize_t rval;
 
 	rval = msgrcv(msqid, msgp, msgsz, msgtyp, msgflg);
+
 	if (rval == -1) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: msgrcv(%i, %p, %zu, %li, %x) failed",
-			file, lineno, msqid, msgp, msgsz, msgtyp, msgflg);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"msgrcv(%i, %p, %zu, %li, %x) failed",
+			msqid, msgp, msgsz, msgtyp, msgflg);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid msgrcv(%i, %p, %zu, %li, %x) return value %ld",
+			msqid, msgp, msgsz, msgtyp, msgflg, rval);
 	}
 
 	return rval;
@@ -78,12 +93,15 @@ int safe_msgctl(const char *file, const int lineno, int msqid, int cmd,
 	int rval;
 
 	rval = msgctl(msqid, cmd, buf);
-	if (ret_check(cmd, rval)) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: msgctl(%i, %i, %p) = %i failed",
-			file, lineno, msqid, cmd, buf, rval);
-	}
 
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"msgctl(%i, %i, %p) failed", msqid, cmd, buf);
+	} else if (ret_check(cmd, rval)) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid msgctl(%i, %i, %p) return value %d", msqid,
+			cmd, buf, rval);
+	}
 
 	return rval;
 }
@@ -94,9 +112,14 @@ int safe_shmget(const char *file, const int lineno, key_t key, size_t size,
 	int rval;
 
 	rval = shmget(key, size, shmflg);
+
 	if (rval == -1) {
-		tst_brk(TBROK | TERRNO, "%s:%d: shmget(%i, %zu, %x) failed",
-			file, lineno, (int)key, size, shmflg);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"shmget(%i, %zu, %x) failed", (int)key, size, shmflg);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid shmget(%i, %zu, %x) return value %d",
+			(int)key, size, shmflg, rval);
 	}
 
 	return rval;
@@ -108,9 +131,10 @@ void *safe_shmat(const char *file, const int lineno, int shmid,
 	void *rval;
 
 	rval = shmat(shmid, shmaddr, shmflg);
+
 	if (rval == (void *)-1) {
-		tst_brk(TBROK | TERRNO, "%s:%d: shmat(%i, %p, %x) failed",
-			file, lineno, shmid, shmaddr, shmflg);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"shmat(%i, %p, %x) failed", shmid, shmaddr, shmflg);
 	}
 
 	return rval;
@@ -121,9 +145,13 @@ int safe_shmdt(const char *file, const int lineno, const void *shmaddr)
 	int rval;
 
 	rval = shmdt(shmaddr);
+
 	if (rval == -1) {
-		tst_brk(TBROK | TERRNO, "%s:%d: shmdt(%p) failed",
-			file, lineno, shmaddr);
+		tst_brk_(file, lineno, TBROK | TERRNO, "shmdt(%p) failed",
+			shmaddr);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid shmdt(%p) return value %d", shmaddr, rval);
 	}
 
 	return rval;
@@ -135,10 +163,14 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
 	int rval;
 
 	rval = shmctl(shmid, cmd, buf);
-	if (ret_check(cmd, rval)) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: shmctl(%i, %i, %p) = %i failed",
-			file, lineno, shmid, cmd, buf, rval);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"shmctl(%i, %i, %p) failed", shmid, cmd, buf);
+	} else if (ret_check(cmd, rval)) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid shmctl(%i, %i, %p) return value %d", shmid,
+			cmd, buf, rval);
 	}
 
 	return rval;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
