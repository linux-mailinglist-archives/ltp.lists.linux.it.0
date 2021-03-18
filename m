Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612134011B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 09:41:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6F5C3C6070
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 09:41:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5D0853C1A9E
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 09:41:44 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A392420026A
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 09:41:43 +0100 (CET)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1L7568sMz19GCy
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 16:39:45 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 16:41:32 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 18 Mar 2021 16:41:17 +0800
Message-ID: <20210318084117.5663-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] cleanup: Replace libc functions with safe_macros
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

For those:
	testcases/kernel/syscalls/fanotify01.c
	testcases/kernel/syscalls/fanotify03.c
	testcases/kernel/syscalls/fanotify07.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../kernel/syscalls/fanotify/fanotify01.c      |  2 +-
 .../kernel/syscalls/fanotify/fanotify03.c      | 18 +++++++-----------
 .../kernel/syscalls/fanotify/fanotify07.c      | 15 ++++++---------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify01.c b/testcases/kernel/syscalls/fanotify/fanotify01.c
index 990bda140..2fe4a9457 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify01.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
@@ -167,7 +167,7 @@ static void test_fanotify(unsigned int n)
 			EVENT_BUF_LEN - len);
 	len += ret;

-	lseek(fd, 0, SEEK_SET);
+	SAFE_LSEEK(fd, 0, SEEK_SET);
 	/* Generate modify event to clear ignore mask */
 	SAFE_WRITE(1, fd, fname, 1);
 	event_set[tst_count] = FAN_MODIFY;
diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
index a5a384ee7..c191ed61f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify03.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
@@ -128,17 +128,13 @@ static void generate_events(void)
 	/*
 	 * Generate sequence of events
 	 */
-	if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1)
-		exit(1);
-	if (write(fd, fname, 1) == -1)
-		exit(2);
+	fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700);

-	lseek(fd, 0, SEEK_SET);
-	if (read(fd, buf, BUF_SIZE) != -1)
-		exit(3);
+	SAFE_WRITE(fd, fname, 1);
+	SAFE_LSEEK(fd, 0, SEEK_SET);

-	if (close(fd) == -1)
-		exit(4);
+	SAFE_READ(fd, buf, BUF_SIZE);
+	SAFE_CLOSE(fd);

 	if (execve(FILE_EXEC_PATH, argv, environ) != -1)
 		exit(5);
@@ -151,7 +147,7 @@ static void child_handler(int tmp)
 	 * Close notification fd so that we cannot block while reading
 	 * from it
 	 */
-	close(fd_notify);
+	SAFE_CLOSE(fd_notify);
 	fd_notify = -1;
 }

@@ -172,7 +168,7 @@ static void run_child(void)

 	if (child_pid == 0) {
 		/* Child will generate events now */
-		close(fd_notify);
+		SAFE_CLOSE(fd_notify);
 		generate_events();
 		exit(0);
 	}
diff --git a/testcases/kernel/syscalls/fanotify/fanotify07.c b/testcases/kernel/syscalls/fanotify/fanotify07.c
index 830af32b6..cd3bdb129 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify07.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
@@ -53,14 +53,12 @@ static void generate_events(void)
 	/*
 	 * generate sequence of events
 	 */
-	if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1)
-		exit(1);
+	fd = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0700);

 	/* Run until killed... */
 	while (1) {
-		lseek(fd, 0, SEEK_SET);
-		if (read(fd, buf, BUF_SIZE) == -1)
-			exit(3);
+		SAFE_LSEEK(fd, 0, SEEK_SET);
+		SAFE_READ(fd, buf, BUF_SIZE);
 	}
 }

@@ -72,7 +70,7 @@ static void run_children(void)
 		child_pid[i] = SAFE_FORK();
 		if (!child_pid[i]) {
 			/* Child will generate events now */
-			close(fd_notify);
+			SAFE_CLOSE(fd_notify);
 			generate_events();
 			exit(0);
 		}
@@ -159,9 +157,8 @@ static void test_fanotify(void)
 	 * unanswered fanotify events block notification subsystem.
 	 */
 	newfd = setup_instance();
-	if (close(newfd)) {
-		tst_brk(TBROK | TERRNO, "close(%d) failed", newfd);
-	}
+
+	SAFE_CLOSE(newfd);

 	tst_res(TPASS, "second instance destroyed successfully");

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
