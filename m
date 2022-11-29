Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B663C08D
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Nov 2022 14:04:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B2E93C714A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Nov 2022 14:04:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDE333CC5C1
 for <ltp@lists.linux.it>; Tue, 29 Nov 2022 14:04:04 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D99FF600733
 for <ltp@lists.linux.it>; Tue, 29 Nov 2022 14:04:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67B0AD6E;
 Tue, 29 Nov 2022 05:04:08 -0800 (PST)
Received: from e129169.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01F2F3F73D;
 Tue, 29 Nov 2022 05:04:00 -0800 (PST)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Tue, 29 Nov 2022 13:03:50 +0000
Message-Id: <20221129130350.219082-4-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129130350.219082-1-tudor.cretu@arm.com>
References: <20221129130350.219082-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] safe_semctl: Fix undefined behaviour in vararg
 handling
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

Accessing elements in an empty va_list is undefined behaviour.
Therefore, remove the variadicness from safe_semctl as it always calls
semctl with the union semun argument included.

Adapt the SAFE_SEMCTL macro to handle the change by passing a
zero-initialised union semun if it's omitted.

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 include/tst_safe_sysv_ipc.h | 14 +++++++++-----
 lib/tst_safe_sysv_ipc.c     | 10 +---------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/include/tst_safe_sysv_ipc.h b/include/tst_safe_sysv_ipc.h
index 7804ce192..976a30409 100644
--- a/include/tst_safe_sysv_ipc.h
+++ b/include/tst_safe_sysv_ipc.h
@@ -10,6 +10,7 @@
 #include <sys/msg.h>
 #include <sys/shm.h>
 #include <sys/sem.h>
+#include "lapi/sem.h"
 
 int safe_msgget(const char *file, const int lineno, key_t key, int msgflg);
 #define SAFE_MSGGET(key, msgflg) \
@@ -58,11 +59,14 @@ int safe_semget(const char *file, const int lineno, key_t key, int nsems,
 	safe_semget(__FILE__, __LINE__, (key), (nsems), (semflg))
 
 int safe_semctl(const char *file, const int lineno, int semid, int semnum,
-		int cmd, ...);
-#define SAFE_SEMCTL(semid, semnum, cmd, ...) ({ \
-	int tst_ret_ = safe_semctl(__FILE__, __LINE__, (semid), (semnum), \
-				(cmd), ##__VA_ARGS__); \
-	(semid) = ((cmd) == IPC_RMID ? -1 : (semid)); \
+		int cmd, union semun un);
+#define __SAFE_SEMCTL(semid, semnum, cmd, un, ...) \
+	safe_semctl(__FILE__, __LINE__, (semid), (semnum), (cmd), (un))
+
+#define SAFE_SEMCTL(semid, semnum, cmd, ...) ({					\
+	int tst_ret_ = __SAFE_SEMCTL((semid), (semnum), (cmd), ##__VA_ARGS__,	\
+				     (union semun){0});				\
+	(semid) = ((cmd) == IPC_RMID ? -1 : (semid));				\
 	tst_ret_; })
 
 int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
index 5eaa82539..f99f6db5e 100644
--- a/lib/tst_safe_sysv_ipc.c
+++ b/lib/tst_safe_sysv_ipc.c
@@ -228,17 +228,9 @@ int safe_semget(const char *file, const int lineno, key_t key, int nsems,
 }
 
 int safe_semctl(const char *file, const int lineno, int semid, int semnum,
-		int cmd, ...)
+		int cmd, union semun un)
 {
 	int rval;
-	va_list va;
-	union semun un;
-
-	va_start(va, cmd);
-
-	un = va_arg(va, union semun);
-
-	va_end(va);
 
 	rval = semctl(semid, semnum, cmd, un);
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
