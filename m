Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB77D34E149
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 08:32:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 605453C2560
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 08:32:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD0F83C2457
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 08:32:20 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD5826009FC
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 08:32:18 +0200 (CEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8fh152Hhz93cv
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:30:09 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 14:32:06 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 30 Mar 2021 14:32:00 +0800
Message-ID: <20210330063200.23654-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/ipc: Check that whether if kernel
 supports *_STAT_ANY
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

SHM_STAT_ANY,SEM_STAT_ANY and MSG_STAT_ANY are imported to linux
in v4.17, and some linux distribution such as centos7.8 has
backported this feature, so we should call SHM_STAT_ANY directly
to detect whether kernel supports *_STAT_ANY.

Also fix wrong TTERRNO usage.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v2->v3:
        1) modify git msg
        2) check that whether if errno is equal to EFAULT

 testcases/kernel/syscalls/ipc/msgctl/msgctl06.c | 14 +++++++++++++-
 testcases/kernel/syscalls/ipc/semctl/semctl09.c | 17 ++++++++++++++++-
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 12 ++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
index 722a0cca0..badbaaede 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl06.c
@@ -115,7 +115,7 @@ static void verify_msgctl(unsigned int n)
 	msgid = msgctl(TST_RET, MSG_STAT_ANY, &buf);

 	if (msgid == -1) {
-		tst_res(TFAIL | TTERRNO, "MSG_INFO haven't returned a valid index");
+		tst_res(TFAIL | TERRNO, "MSG_INFO haven't returned a valid index");
 	} else {
 		tst_res(TPASS, "MSG_INFO returned valid index %li to msgid %i",
 			TST_RET, msgid);
@@ -138,12 +138,24 @@ static void verify_msgctl(unsigned int n)

 static void setup(void)
 {
+	struct msqid_ds temp_buf;
 	ltpuser = SAFE_GETPWNAM("nobody");
 	nobody_uid = ltpuser->pw_uid;
 	root_uid = 0;

 	msg_id = SAFE_MSGGET(IPC_PRIVATE, IPC_CREAT | MSG_RW);
 	SAFE_MSGSND(msg_id, "abcd", 4, 0);
+
+	TEST(msgctl(msg_id, MSG_STAT_ANY, &temp_buf));
+	if (TST_RET == -1) {
+		if (TST_ERR == EINVAL)
+			tst_brk(TCONF, "kernel doesn't support MSG_STAT_ANY");
+		else
+			tst_brk(TBROK | TTERRNO,
+					"Current environment doesn't permit "
+					"MSG_STAT_ANY");
+	}
+
 }

 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
index 5a81f778c..b40f5ba8b 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -158,7 +158,7 @@ static void verify_semctl(unsigned int n)
 				"specified by the caller to kernel");
 		return;
 	} else if (semid == -1) {
-		tst_res(TFAIL | TTERRNO, "SEM_INFO haven't returned a valid index");
+		tst_res(TFAIL | TERRNO, "SEM_INFO haven't returned a valid index");
 	} else {
 		tst_res(TPASS, "SEM_INFO returned valid index %li to semid %i",
 			TST_RET, semid);
@@ -193,6 +193,21 @@ static void setup(void)
 #endif

 	sem_id = SAFE_SEMGET(IPC_PRIVATE, 2, IPC_CREAT | 0600);
+
+	TEST(do_semctl(sem_id, 0, SEM_STAT_ANY));
+	if (TST_RET == -1) {
+		if (errno == EFAULT)
+			tst_brk(TFAIL, "SEM_STAT_ANY doesn't pass the buffer "
+					"specified by the caller to kernel");
+		if (TST_ERR == EINVAL)
+			tst_brk(TCONF, "kernel doesn't support "
+					"SEM_STAT_ANY");
+		else
+			tst_brk(TBROK | TTERRNO,
+					"Current environment doesn't permit "
+					"SEM_STAT_ANY");
+	}
+
 }

 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 9e8ec4199..9a60c5170 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -155,10 +155,22 @@ static void verify_shminfo(unsigned int n)
 static void setup(void)
 {
 	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+	struct shmid_ds temp_ds;
 	nobody_uid = ltpuser->pw_uid;
 	root_uid = 0;

 	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
+
+	TEST(shmctl(shm_id, SHM_STAT_ANY, &temp_ds));
+	if (TST_RET == -1) {
+		if (TST_ERR == EINVAL)
+			tst_brk(TCONF, "kernel doesn't support "
+					"SHM_STAT_ANY");
+		else
+			tst_brk(TBROK | TTERRNO,
+					"Current environment doesn't permit "
+					"SHM_STAT_ANY");
+	}
 }

 static void cleanup(void)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
