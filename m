Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2933FF42
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:09:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EA823C2CD2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:09:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B332B3C2CA3
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:09:01 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 423391400157
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:08:59 +0100 (CET)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1Gkt0NMBz17MnB
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:07:02 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 14:08:49 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 18 Mar 2021 14:08:34 +0800
Message-ID: <20210318060834.151128-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel/syscalls: Use SAFE_OPEN() instead of calling
 system API functions
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
  testcases/kernel/syscalls/fsconfig/fsconfig02.c
  testcases/kernel/syscalls/inotify/inotify01.c
  testcases/kernel/syscalls/memfd_create/memfd_create03.c

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fsconfig/fsconfig02.c        |  4 +---
 testcases/kernel/syscalls/inotify/inotify01.c          | 10 ++--------
 .../kernel/syscalls/memfd_create/memfd_create03.c      |  4 ++--
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
index 9ff41a7d7..6ff4380ef 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig02.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -55,9 +55,7 @@ static void setup(void)
 	if (fd == -1)
 		tst_brk(TBROK | TTERRNO, "fsopen() failed");

-	temp_fd = open("testfile", O_RDWR | O_CREAT, 01444);
-	if (temp_fd == -1)
-		tst_brk(TBROK, "Can't obtain temp_fd, open() failed");
+	fd = SAFE_OPEN("testfile", O_RDWR | O_CREAT, 01444);
 }

 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/inotify/inotify01.c b/testcases/kernel/syscalls/inotify/inotify01.c
index 8f1547d46..2d82e5970 100644
--- a/testcases/kernel/syscalls/inotify/inotify01.c
+++ b/testcases/kernel/syscalls/inotify/inotify01.c
@@ -52,10 +52,7 @@ void verify_inotify(void)
 	event_set[test_cnt] = IN_ATTRIB;
 	test_cnt++;

-	if ((fd = open(fname, O_RDONLY)) == -1) {
-		tst_brk(TBROK | TERRNO,
-			"open(%s, O_RDWR|O_CREAT,0700) failed", fname);
-	}
+	fd = SAFE_OPEN(fname, O_RDONLY);
 	event_set[test_cnt] = IN_OPEN;
 	test_cnt++;

@@ -70,10 +67,7 @@ void verify_inotify(void)
 	event_set[test_cnt] = IN_CLOSE_NOWRITE;
 	test_cnt++;

-	if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1) {
-		tst_brk(TBROK,
-			"open(%s, O_RDWR|O_CREAT,0700) failed", fname);
-	}
+	fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700);
 	event_set[test_cnt] = IN_OPEN;
 	test_cnt++;

diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create03.c b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
index ea846626a..036182f0a 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create03.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
@@ -207,7 +207,7 @@ static void setup(void)
 	SAFE_FILE_LINES_SCANF(TOTAL_HP_PATH, "%ld", &og_total_pages);
 	sprintf(buf, "%ld", og_total_pages + 1);

-	fd = open(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
+	fd = SAFE_OPEN(TOTAL_HP_PATH, O_RDWR | O_TRUNC);

 	if (write(fd, buf, strlen(buf)) == -1)
 		tst_brk(TCONF | TERRNO,
@@ -233,7 +233,7 @@ static void cleanup(void)

 	sprintf(buf, "%ld", og_total_pages);

-	fd = open(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
+	fd = SAFE_OPEN(TOTAL_HP_PATH, O_RDWR | O_TRUNC);

 	if (write(fd, buf, strlen(buf)) == -1)
 		tst_brk(TCONF | TERRNO, "Clean-up failed: write() failed");
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
