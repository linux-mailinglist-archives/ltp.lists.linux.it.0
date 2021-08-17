Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510C3EE6DD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:48:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CC4B3C5709
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:48:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A6A593C207C
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:40 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C1CCD1400E17
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:38 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GphNL3FL4zdbk9
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:44:50 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:34 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:34 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:21 +0800
Message-ID: <20210817064924.127970-5-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210817064924.127970-1-xieziyao@huawei.com>
References: <20210817064924.127970-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] epoll_create1: Add docparse formatting and
 cleanup for epoll_create1_01
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

1. Add docparse formatting.
2. Make use of ARRAY_SIZE().

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../syscalls/epoll_create1/epoll_create1_01.c | 53 +++++++++----------
 .../syscalls/epoll_create1/epoll_create1_02.c |  0
 2 files changed, 25 insertions(+), 28 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c

diff --git a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
index 41aa634e1..39e01eb8b 100644
--- a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
+++ b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
@@ -2,51 +2,48 @@
 /*
  * Copyright (c) Ulrich Drepper <drepper@redhat.com>
  * Copyright (c) International Business Machines Corp., 2009
+ */
+
+/*\
+ * [Description]
  *
- * Test system call introduced in 2.6.27.
- * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=a0998b50c3f0b8fdd265c63e0032f86ebe377dbf
- *
- * This patch adds the new epoll_create1 syscall.  It extends the old
- * epoll_create syscall by one parameter which is meant to hold a flag value.
- * In this patch the only flag support is EPOLL_CLOEXEC which causes the
- * close-on-exec flag for the returned file descriptor to be set. A new name
- * EPOLL_CLOEXEC is introduced which in this implementation must have the same
- * value as O_CLOEXEC.
+ * Verify that epoll_create1 sets the close-on-exec flag for the returned
+ * file descriptor with the only flag support, EPOLL_CLOEXEC.
  */
-#include <errno.h>
+
 #include <sys/epoll.h>
+
 #include "tst_test.h"
 #include "lapi/epoll.h"
 #include "lapi/syscalls.h"

-static void verify_epoll_create1(void)
+static struct test_case_t {
+	int flags;
+	int exp_flag;
+	const char *desc;
+} tc[] = {
+	{0, 0, "flags=0 didn't set close-on-exec flag"},
+	{EPOLL_CLOEXEC, 1, "flags=EPOLL_CLOEXEC set close-on-exec"}
+};
+
+static void run(unsigned int n)
 {
 	int fd, coe;

-	fd = tst_syscall(__NR_epoll_create1, 0);
+	fd = tst_syscall(__NR_epoll_create1, tc[n].flags);
 	if (fd == -1)
-		tst_brk(TFAIL | TERRNO, "epoll_create1(0) failed");
+		tst_brk(TFAIL | TERRNO, "epoll_create1(...) failed");

 	coe = SAFE_FCNTL(fd, F_GETFD);
-	if (coe & FD_CLOEXEC)
-		tst_brk(TFAIL, "flags=0 set close-on-exec flag");
+	if ((coe & FD_CLOEXEC) != tc[n].exp_flag)
+		tst_brk(TFAIL, "epoll_create1(...) with %s", tc[n].desc);
+	tst_res(TPASS, "epoll_create1(...) with %s", tc[n].desc);

 	SAFE_CLOSE(fd);
-
-	fd = tst_syscall(__NR_epoll_create1, EPOLL_CLOEXEC);
-	if (fd == -1)
-		tst_brk(TFAIL | TERRNO, "epoll_create1(EPOLL_CLOEXEC) failed");
-
-	coe = SAFE_FCNTL(fd, F_GETFD);
-	if ((coe & FD_CLOEXEC) == 0)
-		tst_brk(TFAIL, "flags=EPOLL_CLOEXEC didn't set close-on-exec");
-
-	SAFE_CLOSE(fd);
-
-	tst_res(TPASS, "epoll_create1(EPOLL_CLOEXEC) PASSED");
 }

 static struct tst_test test = {
 	.min_kver = "2.6.27",
-	.test_all = verify_epoll_create1,
+	.tcnt = ARRAY_SIZE(tc),
+	.test = run,
 };
diff --git a/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c b/testcases/kernel/syscalls/epoll_create1/epoll_create1_02.c
new file mode 100644
index 000000000..e69de29bb
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
