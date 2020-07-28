Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C432300D1
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 06:40:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36A033C4C17
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 06:40:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9D0213C2236
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 06:39:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9642E1A00FB7
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 06:39:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; d="scan'208";a="96972741"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 12:39:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 40C574CE2808
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 12:39:43 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 12:39:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 28 Jul 2020 12:40:23 +0800
Message-ID: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 40C574CE2808.AB244
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/2] libs/libltpnewipc: Use safe macros
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 libs/libltpnewipc/libnewipc.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index b909cb7e6..3734040b7 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -21,6 +21,8 @@
 
 #include "tst_test.h"
 #include "libnewipc.h"
+#include "tst_safe_stdio.h"
+#include "tst_safe_sysv_ipc.h"
 
 #define BUFSIZE 1024
 
@@ -31,7 +33,7 @@ key_t getipckey(const char *file, const int lineno)
 	int id;
 	static int count;
 
-	SAFE_GETCWD(buf, BUFSIZE);
+	safe_getcwd(file, lineno, NULL, buf, BUFSIZE);
 
 	id = count % 26 + (int) 'a';
 	count++;
@@ -51,11 +53,7 @@ int get_used_queues(const char *file, const int lineno)
 	int used_queues = -1;
 	char buf[BUFSIZE];
 
-	fp = fopen("/proc/sysvipc/msg", "r");
-	if (fp == NULL) {
-		tst_brk(TBROK | TERRNO,
-			"fopen() failed at %s:%d", file, lineno);
-	}
+	fp = safe_fopen(file, lineno, NULL, "/proc/sysvipc/msg", "r");
 
 	while (fgets(buf, BUFSIZE, fp) != NULL)
 		used_queues++;
@@ -78,19 +76,11 @@ void *probe_free_addr(const char *file, const int lineno)
 
 	probe_key = GETIPCKEY();
 
-	shm_id = shmget(probe_key, SHMLBA * 2, SHM_RW | IPC_CREAT | IPC_EXCL);
-	if (shm_id == -1)
-		tst_brk(TBROK, "probe: shmget() failed at %s:%d", file, lineno);
-
-	addr = shmat(shm_id, NULL, 0);
-	if (addr == (void *) -1)
-		tst_brk(TBROK, "probe: shmat() failed at %s:%d", file, lineno);
-
-	if (shmdt(addr) == -1)
-		tst_brk(TBROK, "probe: shmdt() failed at %s:%d", file, lineno);
-
-	if (shmctl(shm_id, IPC_RMID, NULL) == -1)
-		tst_brk(TBROK, "probe: shmctl() failed at %s:%d", file, lineno);
+	shm_id = safe_shmget(file, lineno, probe_key, SHMLBA * 2,
+			     SHM_RW | IPC_CREAT | IPC_EXCL);
+	addr = safe_shmat(file, lineno, shm_id, NULL, 0);
+	safe_shmdt(file, lineno, addr);
+	safe_shmctl(file, lineno, shm_id, IPC_RMID, NULL);
 
 	addr = (void *)(((unsigned long)(addr) + (SHMLBA - 1)) & ~(SHMLBA - 1));
 
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
