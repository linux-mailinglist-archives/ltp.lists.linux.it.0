Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 720262CDA1B
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:27:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 378743C4CA3
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:27:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 718213C246E
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:27:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E05E7200341
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:27:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C9BAAC65
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:27:11 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Dec 2020 16:28:04 +0100
Message-Id: <20201203152804.846-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201203152804.846-1-chrubis@suse.cz>
References: <20201203152804.846-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/ipc: Make use of get_ipc_timestamp()
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c | 4 ++--
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c | 4 ++--
 testcases/kernel/syscalls/ipc/shmctl/Makefile   | 2 +-
 testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
index 5c1e317e9..afe552c4f 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
@@ -25,13 +25,13 @@ static void verify_msgrcv(void)
 
 	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
 
-	time(&before_rcv);
+	before_rcv = get_ipc_timestamp();
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgrcv failed");
 		return;
 	}
-	time(&after_rcv);
+	after_rcv = get_ipc_timestamp();
 
 	if (strcmp(rcv_buf.mtext, snd_buf.mtext) == 0)
 		tst_res(TPASS, "message received(%s) = message sent(%s)",
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
index 5f5da52d2..432b03def 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
@@ -29,13 +29,13 @@ static void verify_msgsnd(void)
 	struct msqid_ds qs_buf;
 	time_t before_snd, after_snd;
 
-	time(&before_snd);
+	before_snd = get_ipc_timestamp();
 	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
 		return;
 	}
-	time(&after_snd);
+	after_snd = get_ipc_timestamp();
 
 	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
 
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index 106b73697..06d72d968 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -10,6 +10,6 @@ shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-shmctl02 shmctl04 shmctl06: LTPLDLIBS = -lltpnewipc
+shmctl01 shmctl02 shmctl04 shmctl06: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
index 3a39a4d74..eb5307d1e 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
@@ -240,9 +240,9 @@ static int get_shm_idx_from_id(int shm_id)
 
 static void setup(void)
 {
-	ctime_min = time(NULL);
+	ctime_min = get_ipc_timestamp();
 	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
-	ctime_max = time(NULL);
+	ctime_max = get_ipc_timestamp();
 
 	shm_idx = get_shm_idx_from_id(shm_id);
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
