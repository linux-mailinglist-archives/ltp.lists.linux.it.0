Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C72E25CA
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EB663C2FD6
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 687873C568F
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8C6E0200B12
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,444,1599494400"; d="scan'208";a="102906700"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Dec 2020 17:58:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B03554CE5CCA
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 17:58:21 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 24 Dec 2020 17:58:21 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 24 Dec 2020 04:58:15 -0500
Message-ID: <1608803896-17634-2-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B03554CE5CCA.A8CDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] Add SAFE_SEMCTL() and SAFE_SEMGET() macro
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

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/tst_safe_sysv_ipc.h | 14 ++++++++++++++
 lib/tst_safe_sysv_ipc.c     | 47 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/tst_safe_sysv_ipc.h b/include/tst_safe_sysv_ipc.h
index 3e0e50e..bb65326 100644
--- a/include/tst_safe_sysv_ipc.h
+++ b/include/tst_safe_sysv_ipc.h
@@ -9,6 +9,7 @@
 #include <sys/ipc.h>
 #include <sys/msg.h>
 #include <sys/shm.h>
+#include <sys/sem.h>
 
 int safe_msgget(const char *file, const int lineno, key_t key, int msgflg);
 #define SAFE_MSGGET(key, msgflg) \
@@ -51,4 +52,17 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
 	(shmid) = ((cmd) == IPC_RMID ? -1 : (shmid)); \
 	tst_ret_;})
 
+int safe_semget(const char *file, const int lineno, key_t key, int nsems,
+		int semflg);
+#define SAFE_SEMGET(key, nsems, semflg) \
+	safe_semget(__FILE__, __LINE__, (key), (nsems), (semflg))
+
+int safe_semctl(const char *file, const int lineno, int semid, int semnum,
+		int cmd, ...);
+#define SAFE_SEMCTL(semid, semnum, cmd, ...) ({ \
+	int tst_ret_ = safe_semctl(__FILE__, __LINE__, (semid), (semnum), \
+				(cmd), ##__VA_ARGS__); \
+	(semid) = ((cmd) == IPC_RMID ? -1 : (semid)); \
+	tst_ret_; })
+
 #endif /* TST_SAFE_SYSV_IPC_H__ */
diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index 155e03b..70f2568 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -10,6 +10,7 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
+#include "lapi/sem.h"
 
 /*
  * The IPC_STAT, IPC_SET and IPC_RMID can return either 0 or -1.
@@ -175,3 +176,49 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
 
 	return rval;
 }
+
+int safe_semget(const char *file, const int lineno, key_t key, int nsems,
+		int semflg)
+{
+	int rval;
+
+	rval = semget(key, nsems, semflg);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"semget(%i, %i, %x) failed", (int)key, nsems, semflg);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid semget(%i, %i, %x) return value %d",
+			(int)key, nsems, semflg, rval);
+	}
+
+	return rval;
+}
+
+int safe_semctl(const char *file, const int lineno, int semid, int semnum,
+		int cmd, ...)
+{
+	int rval;
+	va_list va;
+	union semun un;
+
+	va_start(va, cmd);
+
+	un = va_arg(va, union semun);
+
+	va_end(va);
+
+	rval = semctl(semid, semnum, cmd, un);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		"semctl(%i, %i, %i,...) failed", semid, semnum, cmd);
+	} else if (ret_check(cmd, rval)) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid semctl(%i, %i, %i,...) return value %d", semid,
+			semnum, cmd, rval);
+	}
+
+	return rval;
+}
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
