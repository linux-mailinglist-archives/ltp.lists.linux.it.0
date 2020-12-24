Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3B2E25C9
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17AC03C303C
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Dec 2020 10:58:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8D1A33C2B62
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:26 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0AB6E20076A
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 10:58:24 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,444,1599494400"; d="scan'208";a="102906699"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Dec 2020 17:58:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0875B4CE5CCA
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 17:58:21 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 24 Dec 2020 17:58:21 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 24 Dec 2020 04:58:14 -0500
Message-ID: <1608803896-17634-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0875B4CE5CCA.AB321
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lapi/sem.h: Add SEM_STAT_ANY
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

1) Rename semun.h to sem.h and apply it
2) Add SEM_STAT_ANY

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/ipcsem.h                                |  2 +-
 include/lapi/sem.h                              | 28 +++++++++++++++++++++++++
 include/lapi/semun.h                            | 22 -------------------
 testcases/kernel/containers/sysvipc/sem_comm.c  |  3 +--
 testcases/kernel/ipc/pipeio/pipeio.c            |  3 +--
 testcases/kernel/ipc/semaphore/sem01.c          |  3 +--
 testcases/kernel/ipc/semaphore/sem02.c          |  3 +--
 testcases/kernel/sched/process_stress/process.c |  3 +--
 testcases/kernel/syscalls/ipc/semctl/semctl08.c |  2 +-
 testcases/kernel/syscalls/ipc/semop/semop01.c   |  3 +--
 testcases/kernel/syscalls/ipc/semop/semop02.c   |  3 +--
 testcases/kernel/syscalls/ipc/semop/semop03.c   |  3 +--
 testcases/kernel/syscalls/sendmsg/sendmsg02.c   |  3 +--
 13 files changed, 39 insertions(+), 42 deletions(-)
 create mode 100644 include/lapi/sem.h
 delete mode 100644 include/lapi/semun.h

diff --git a/include/ipcsem.h b/include/ipcsem.h
index 6a37672..09a0b3c 100644
--- a/include/ipcsem.h
+++ b/include/ipcsem.h
@@ -29,7 +29,7 @@
 #include <sys/sem.h>
 
 #include "test.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 void cleanup(void);
 void setup(void);
diff --git a/include/lapi/sem.h b/include/lapi/sem.h
new file mode 100644
index 0000000..7cef3d5
--- /dev/null
+++ b/include/lapi/sem.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2015 Linux Test Project
+ */
+
+#include <sys/sem.h>
+
+#ifndef LAPI_SEM_H
+#define LAPI_SEM_H
+
+#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
+/* union semun is defined by including <sys/sem.h> */
+#else
+/* according to X/OPEN we have to define it ourselves */
+union semun {
+	int val;                /* value for SETVAL */
+	struct semid_ds *buf;   /* buffer for IPC_STAT, IPC_SET */
+	unsigned short *array;  /* array for GETALL, SETALL */
+	/* Linux specific part: */
+	struct seminfo *__buf;  /* buffer for IPC_INFO */
+};
+#endif
+
+#ifndef SEM_STAT_ANY
+# define SEM_STAT_ANY 20
+#endif
+
+#endif /* LAPI_SEM_H */
diff --git a/include/lapi/semun.h b/include/lapi/semun.h
deleted file mode 100644
index 1a9dc98..0000000
--- a/include/lapi/semun.h
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2015 Linux Test Project
- */
-
-#ifndef SEMUN_H__
-#define SEMUN_H__
-
-#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
-/* union semun is defined by including <sys/sem.h> */
-#else
-/* according to X/OPEN we have to define it ourselves */
-union semun {
-	int val;                /* value for SETVAL */
-	struct semid_ds *buf;   /* buffer for IPC_STAT, IPC_SET */
-	unsigned short *array;  /* array for GETALL, SETALL */
-	/* Linux specific part: */
-	struct seminfo *__buf;  /* buffer for IPC_INFO */
-};
-#endif
-
-#endif /* SEMUN_H__ */
diff --git a/testcases/kernel/containers/sysvipc/sem_comm.c b/testcases/kernel/containers/sysvipc/sem_comm.c
index 09cc163..a2c354a 100644
--- a/testcases/kernel/containers/sysvipc/sem_comm.c
+++ b/testcases/kernel/containers/sysvipc/sem_comm.c
@@ -27,7 +27,6 @@
 
 #define _GNU_SOURCE
 #include <sys/ipc.h>
-#include <sys/sem.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <stdio.h>
@@ -35,7 +34,7 @@
 #include "ipcns_helper.h"
 #include "test.h"
 #include "safe_macros.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 #define TESTKEY 124426L
 char *TCID	= "sem_comm";
diff --git a/testcases/kernel/ipc/pipeio/pipeio.c b/testcases/kernel/ipc/pipeio/pipeio.c
index b9421cb..ab5c2cf 100644
--- a/testcases/kernel/ipc/pipeio/pipeio.c
+++ b/testcases/kernel/ipc/pipeio/pipeio.c
@@ -47,13 +47,12 @@
 #include <string.h>
 #include <signal.h>
 #include <sys/stat.h>
-#include <sys/sem.h>
 
 #include "tlibio.h"
 
 #include "test.h"
 #include "safe_macros.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 char *TCID = "pipeio";
 int TST_TOTAL = 1;
diff --git a/testcases/kernel/ipc/semaphore/sem01.c b/testcases/kernel/ipc/semaphore/sem01.c
index 5a45238..582624d 100644
--- a/testcases/kernel/ipc/semaphore/sem01.c
+++ b/testcases/kernel/ipc/semaphore/sem01.c
@@ -40,8 +40,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/ipc.h>
-#include <sys/sem.h>
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 int verbose = 0;
 int loops = 100;
diff --git a/testcases/kernel/ipc/semaphore/sem02.c b/testcases/kernel/ipc/semaphore/sem02.c
index 81e77d6..34b714b 100644
--- a/testcases/kernel/ipc/semaphore/sem02.c
+++ b/testcases/kernel/ipc/semaphore/sem02.c
@@ -45,12 +45,11 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include <sys/sem.h>
 #include <errno.h>
 #include <pthread.h>
 #include <sys/types.h>
 #include <sys/ipc.h>
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 #include "test.h"
 
 #define KEY IPC_PRIVATE
diff --git a/testcases/kernel/sched/process_stress/process.c b/testcases/kernel/sched/process_stress/process.c
index f23dcbb..a5ff809 100644
--- a/testcases/kernel/sched/process_stress/process.c
+++ b/testcases/kernel/sched/process_stress/process.c
@@ -40,11 +40,10 @@
 #include <sys/msg.h>
 #include <sys/resource.h>
 #include <sys/select.h>
-#include <sys/sem.h>
 #include <sys/shm.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 /* indexes into environment variable array */
 #define ADBG 0
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
index 40c2e17..1878bd4 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
@@ -6,7 +6,7 @@
  * Cross verify the _high fields being set to 0 by the kernel.
  */
 #include "lapi/sembuf.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 #include "tst_test.h"
 #include "libnewipc.h"
 
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index b20eef4..2072635 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -8,10 +8,9 @@
  */
 
 #include <stdlib.h>
-#include <sys/sem.h>
 #include "tst_test.h"
 #include "libnewipc.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 #include "semop.h"
 
 #define NSEMS 4
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 2c3ec2c..d8181db 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -22,10 +22,9 @@
 #define _GNU_SOURCE
 #include <pwd.h>
 #include <sys/ipc.h>
-#include <sys/sem.h>
 #include "tst_test.h"
 #include "libnewipc.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 #include "semop.h"
 
 static int valid_sem_id = -1;
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 3a79ed3..636b715 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -11,10 +11,9 @@
 #include <stdlib.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-#include <sys/sem.h>
 #include "tst_test.h"
 #include "libnewipc.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 #include "semop.h"
 
 static key_t semkey;
diff --git a/testcases/kernel/syscalls/sendmsg/sendmsg02.c b/testcases/kernel/syscalls/sendmsg/sendmsg02.c
index aa3c88d..f72e9db 100644
--- a/testcases/kernel/syscalls/sendmsg/sendmsg02.c
+++ b/testcases/kernel/syscalls/sendmsg/sendmsg02.c
@@ -34,7 +34,6 @@
 #define _GNU_SOURCE
 #include <sys/ipc.h>
 #include <sys/stat.h>
-#include <sys/sem.h>
 #include <sys/socket.h>
 #include <sys/types.h>
 #include <sys/un.h>
@@ -45,7 +44,7 @@
 #include "config.h"
 #include "test.h"
 #include "safe_macros.h"
-#include "lapi/semun.h"
+#include "lapi/sem.h"
 
 char *TCID = "sendmsg02";
 
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
