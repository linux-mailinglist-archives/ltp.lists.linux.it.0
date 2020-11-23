Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB462C016B
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:31:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CE3B3C2D6E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:31:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 989F33C2D3E
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:31:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 88C606009BE
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606120305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8ntLS879Wgl3+9A2Sjx9SzmuLrUoqk8lsq0aQA2kjE=;
 b=YUlO73scqlZgUNWOND23LzFpH7amSp4LIQU7akO/ZkTdoa6zBjqO4soEOOighQJd1uO3zP
 nJDZRtXzxwKpxWwsVRqMLmetkBVv/ejfAP3QoqP/hQ49yHN02yZvsQOj+fiXzxOBoK5ENK
 lCw7JSZTSyCjJkCZtvhZ0VW1MoCaLdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-OAvemTH8OF-0ksEOko3_bg-1; Mon, 23 Nov 2020 03:31:42 -0500
X-MC-Unique: OAvemTH8OF-0ksEOko3_bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BDB6805BF1;
 Mon, 23 Nov 2020 08:31:42 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7AF35D9CC;
 Mon, 23 Nov 2020 08:31:40 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 23 Nov 2020 08:31:37 +0000
Message-Id: <20201123083137.11575-2-liwang@redhat.com>
In-Reply-To: <20201123083137.11575-1-liwang@redhat.com>
References: <20201123083137.11575-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls: shift to time() if __NR_time not support
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

On some platforms(aarch64) __NR_time is not supported, if that happens,
go back to invoke time() and relax 1-second in low bound for comparing.

This also to fix:
  TFAIL: msg_stime = 1605730573 out of [1605730574, 1605730574]

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Chunyu Hu <chuhu@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c | 14 ++++++++++++--
 testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c | 14 ++++++++++++--
 testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 14 ++++++++++++--
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
index 6fdc47dc3..9dc778ca7 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
@@ -26,13 +26,23 @@ static void verify_msgrcv(void)
 
 	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
 
-	tst_syscall(__NR_time, &before_rcv);
+	before_rcv = syscall(__NR_time, NULL);
+	if (before_rcv == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		before_rcv = time(NULL) - 1;
+	}
+
 	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgrcv failed");
 		return;
 	}
-	tst_syscall(__NR_time, &after_rcv);
+
+	after_rcv = syscall(__NR_time, NULL);
+	if (after_rcv == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		after_rcv = time(NULL);
+	}
 
 	if (strcmp(rcv_buf.mtext, snd_buf.mtext) == 0)
 		tst_res(TPASS, "message received(%s) = message sent(%s)",
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
index 9101f2668..27464e79f 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
@@ -30,13 +30,23 @@ static void verify_msgsnd(void)
 	struct msqid_ds qs_buf;
 	time_t before_snd, after_snd;
 
-	tst_syscall(__NR_time, &before_snd);
+	before_snd = syscall(__NR_time, NULL);
+	if (before_snd == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		before_snd = time(NULL) - 1;
+	}
+
 	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
 		return;
 	}
-	tst_syscall(__NR_time, &after_snd);
+
+	after_snd = syscall(__NR_time, NULL);
+	if (after_snd == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		after_snd = time(NULL);
+	}
 
 	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
 
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
index f5b8eaef9..356513726 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
@@ -241,9 +241,19 @@ static int get_shm_idx_from_id(int shm_id)
 
 static void setup(void)
 {
-	ctime_min = tst_syscall(__NR_time, NULL);
+	ctime_min = syscall(__NR_time, NULL);
+	if (ctime_min == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		ctime_min = time(NULL) - 1;
+	}
+
 	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
-	ctime_max = tst_syscall(__NR_time, NULL);
+
+	ctime_max = syscall(__NR_time, NULL);
+	if (ctime_max == -1 && errno == ENOSYS) {
+		tst_res(TINFO, "__NR_time not supported");
+		ctime_max = time(NULL);
+	}
 
 	shm_idx = get_shm_idx_from_id(shm_id);
 
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
