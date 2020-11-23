Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC112C016C
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:32:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A22AA3C2D4E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:31:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A49173C2D45
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:31:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 787271000A13
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606120305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WwAxIfyb673bkK3+ELz4MsRzY886DScTxzF6YUYk1xk=;
 b=RTlyKY176b+2iD8MUg7nxRt3KfhZSUU7e0ngpgsUpaaEGypw4BZHrtrnnsCtTqO6pVXbIg
 zL7QyRv2eBBPkXweIoiR2DdcmAhbQQyM5DPIZ9DUpQcw1m1PqOFFxcF/KfkewUw5lBKuEv
 QS4gB8oW02i9Y1Av5LiQEi2Lr0rw9TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-_Lw-Yh7pNSipdNU6PWoYOw-1; Mon, 23 Nov 2020 03:31:41 -0500
X-MC-Unique: _Lw-Yh7pNSipdNU6PWoYOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF761005E46;
 Mon, 23 Nov 2020 08:31:40 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7AA85D9CC;
 Mon, 23 Nov 2020 08:31:38 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 23 Nov 2020 08:31:36 +0000
Message-Id: <20201123083137.11575-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls: avoid time() using __cvdso_gettimeofday
 in use-level's VDSO
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

This shmctl01 test detect the time as the number of seconds twice
(before and after) the shmget() instruction, then it verifies
whether the 'struct shmid_ds ds' gets data correctly. But here it
shows 'ds->ctime' out of the seconds range (1604298586, 1604298586),

The reason is that shmget()/msgsnd() always use ktime_get_real_second
to get real seconds, but time() on aarch64 via gettimeofday() or (it
depends on different kernel versions) clock_gettime() in use-level's
VDSO to return tv_sec.

time()
  __cvdso_gettimeofday
   ...
     do_gettimeofday
       ktime_get_real_ts64
        timespc64_add_ns

Situation can be simplify as difference between ktime_get_real_second
and ktime_get_real_ts64. As we can see ktime_get_real_second return
tk->xtime_sec directly, however

timespc64_add_ns more easily add 1 more second via "a->tv_sec +=..."
on a virtual machine, that's why we got occasional errors like:

shmctl01.c:183: TFAIL: SHM_STAT: shm_ctime=1604298585, expected <1604298586,1604298586>
...
msgsnd01.c:59: TFAIL: msg_stime = 1605730573 out of [1605730574, 1605730574]

Here we propose to use '__NR_time' to invoke syscall directly that makes
test all get real seconds via ktime_get_real_second.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Chunyu Hu <chuhu@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c | 5 +++--
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c | 5 +++--
 testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
index 5c1e317e9..6fdc47dc3 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
@@ -10,6 +10,7 @@
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
+#include "tst_timer.h"
 
 static key_t msgkey;
 static int queue_id = -1, pid;
@@ -25,13 +26,13 @@ static void verify_msgrcv(void)
 
 	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
 
-	time(&before_rcv);
+	tst_syscall(__NR_time, &before_rcv);
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgrcv failed");
 		return;
 	}
-	time(&after_rcv);
+	tst_syscall(__NR_time, &after_rcv);
 
 	if (strcmp(rcv_buf.mtext, snd_buf.mtext) == 0)
 		tst_res(TPASS, "message received(%s) = message sent(%s)",
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
index 5f5da52d2..9101f2668 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
@@ -16,6 +16,7 @@
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
+#include "tst_timer.h"
 
 static key_t msgkey;
 static int queue_id = -1, pid;
@@ -29,13 +30,13 @@ static void verify_msgsnd(void)
 	struct msqid_ds qs_buf;
 	time_t before_snd, after_snd;
 
-	time(&before_snd);
+	tst_syscall(__NR_time, &before_snd);
 	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
 		return;
 	}
-	time(&after_snd);
+	tst_syscall(__NR_time, &after_snd);
 
 	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
 
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
index 3a39a4d74..f5b8eaef9 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
@@ -19,6 +19,7 @@
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
+#include "tst_timer.h"
 
 #define NCHILD 20
 
@@ -240,9 +241,9 @@ static int get_shm_idx_from_id(int shm_id)
 
 static void setup(void)
 {
-	ctime_min = time(NULL);
+	ctime_min = tst_syscall(__NR_time, NULL);
 	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
-	ctime_max = time(NULL);
+	ctime_max = tst_syscall(__NR_time, NULL);
 
 	shm_idx = get_shm_idx_from_id(shm_id);
 
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
