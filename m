Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D128E3D7541
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:45:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 649393C9119
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 14:45:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57C133C9120
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:34 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B3A80200CE0
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 14:44:32 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GYxGx0GNDzZtQn;
 Tue, 27 Jul 2021 20:40:57 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 20:44:24 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 20:44:24 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 27 Jul 2021 20:45:07 +0800
Message-ID: <20210727124507.28356-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727124507.28356-1-xieziyao@huawei.com>
References: <20210727124507.28356-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] epoll_pwait: Add test variants for epoll_pwait2
 in epoll_pwait01
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

Add test variants to switch between epoll_pwait and epoll_pwait2.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../syscalls/epoll_pwait/epoll_pwait01.c      | 234 ++++++------------
 1 file changed, 80 insertions(+), 154 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c
index 1f08112ad..08e36ee92 100644
--- a/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c
+++ b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait01.c
@@ -1,202 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Fujitsu Ltd.
  * Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-/*
- * Description:
- *  Basic test for epoll_pwait(2).
- *  1) epoll_pwait(2) with sigmask argument allows the caller to
- *     safely wait until either a file descriptor becomes ready
- *     or the timeout expires.
- *  2) epoll_pwait(2) with NULL sigmask argument fails if
- *     interrupted by a signal handler, epoll_pwait(2) should
- *     return -1 and set errno to EINTR.
+/*\
+ * [Description]
+ *
+ * Basic test for epoll_pwait and epoll_pwait2. Verify that,
+ *
+ * 1. epoll_pwait or epoll_pwait2 with sigmask argument allows the caller to
+ * safely wait until either a file descriptor becomes ready or the timeout
+ * expires.
+ * 2. epoll_pwait or epoll_pwait2 with NULL sigmask argument fails if
+ * interrupted by a signal handler. It should return -1 and set errno to EINTR.
  */

+#include <stdlib.h>
 #include <sys/epoll.h>
-#include <sys/types.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-
-#include "test.h"
-#include "epoll_pwait.h"
-#include "safe_macros.h"

-char *TCID = "epoll_pwait01";
-int TST_TOTAL = 2;
+#include "tst_test.h"
+#include "epoll_pwait_var.h"

-static int epfd, fds[2];
+static int efd, sfd[2];
+static struct epoll_event e;
 static sigset_t signalset;
-static struct epoll_event epevs;
 static struct sigaction sa;

-static void setup(void);
-static void verify_sigmask(void);
-static void verify_nonsigmask(void);
-static void sighandler(int sig LTP_ATTRIBUTE_UNUSED);
-static void do_test(sigset_t *);
-static void do_child(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		do_test(&signalset);
-		do_test(NULL);
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	if ((tst_kvercmp(2, 6, 19)) < 0) {
-		tst_brkm(TCONF, NULL, "This test can only run on kernels "
-			 "that are 2.6.19 or higher");
-	}
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	if (sigemptyset(&signalset) == -1)
-		tst_brkm(TFAIL | TERRNO, NULL, "sigemptyset() failed");
-
-	if (sigaddset(&signalset, SIGUSR1) == -1)
-		tst_brkm(TFAIL | TERRNO, NULL, "sigaddset() failed");
-
-	sa.sa_flags = 0;
-	sa.sa_handler = sighandler;
-	if (sigemptyset(&sa.sa_mask) == -1)
-		tst_brkm(TFAIL | TERRNO, NULL, "sigemptyset() failed");
-
-	if (sigaction(SIGUSR1, &sa, NULL) == -1)
-		tst_brkm(TFAIL | TERRNO, NULL, "sigaction() failed");
-
-	SAFE_PIPE(NULL, fds);
-
-	epfd = epoll_create(1);
-	if (epfd == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "failed to create epoll instance");
-	}
-
-	epevs.events = EPOLLIN;
-	epevs.data.fd = fds[0];
-
-	if (epoll_ctl(epfd, EPOLL_CTL_ADD, fds[0], &epevs) == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "failed to register epoll target");
-	}
-}
+static void sighandler(int sig LTP_ATTRIBUTE_UNUSED) {}

 static void verify_sigmask(void)
 {
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "epoll_pwait() failed");
-		return;
-	}
+	TEST(do_epoll_pwait(efd, &e, 1, -1, &signalset));

-	if (TEST_RETURN != 1) {
-		tst_resm(TFAIL, "epoll_pwait() returned %li, expected 1",
-			 TEST_RETURN);
+	if (TST_RET != 1) {
+		tst_res(TFAIL, "do_epoll_pwait() returned %li, expected 1",
+			TST_RET);
 		return;
 	}

-	tst_resm(TPASS, "epoll_pwait(sigmask) blocked signal");
+	tst_res(TPASS, "do_epoll_pwait() with sigmask blocked signal");
 }

 static void verify_nonsigmask(void)
 {
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "epoll_wait() succeeded unexpectedly");
-		return;
-	}
-
-	if (TEST_ERRNO == EINTR) {
-		tst_resm(TPASS | TTERRNO, "epoll_wait() failed as expected");
-	} else {
-		tst_resm(TFAIL | TTERRNO, "epoll_wait() failed unexpectedly, "
-				 "expected EINTR");
-	}
+	TST_EXP_FAIL(do_epoll_pwait(efd, &e, 1, -1, NULL), EINTR,
+		     "do_epoll_pwait() without sigmask");
 }

-static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
+static void epoll_pwait_support(void)
 {
-
+	if (tst_variant == 0)
+		epoll_pwait_supported();
+	else
+		epoll_pwait2_supported();
 }

-static void do_test(sigset_t *sigmask)
+static void (*testcase_list[])(void) = {verify_sigmask, verify_nonsigmask};
+
+static void run(unsigned int n)
 {
-	pid_t cpid;
 	char b;

-	cpid = tst_fork();
-	if (cpid < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "fork() failed");
+	epoll_pwait_support();

-	if (cpid == 0)
-		do_child();
+	if (!SAFE_FORK()) {
+		if (tst_process_state_wait2(getppid(), 'S') != 0)
+			tst_brk(TBROK | TERRNO,
+				"failed to wait for parent process's state");

-	TEST(epoll_pwait(epfd, &epevs, 1, -1, sigmask));
-
-	if (sigmask != NULL)
-		verify_sigmask();
-	else
-		verify_nonsigmask();
+		SAFE_KILL(getppid(), SIGUSR1);
+		usleep(10000);
+		SAFE_WRITE(1, sfd[1], "w", 1);
+		exit(0);
+	}

-	SAFE_READ(cleanup, 1, fds[0], &b, 1);
+	testcase_list[n]();

-	tst_record_childstatus(cleanup, cpid);
+	SAFE_READ(1, sfd[0], &b, 1);
+	tst_reap_children();
 }

-static void do_child(void)
+static void setup(void)
 {
-	if (tst_process_state_wait2(getppid(), 'S') != 0) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "failed to wait for parent process's state");
-	}
+	SAFE_SIGEMPTYSET(&signalset);
+	SAFE_SIGADDSET(&signalset, SIGUSR1);

-	SAFE_KILL(cleanup, getppid(), SIGUSR1);
-	usleep(10000);
-	SAFE_WRITE(cleanup, 1, fds[1], "w", 1);
+	sa.sa_flags = 0;
+	sa.sa_handler = sighandler;
+	SAFE_SIGEMPTYSET(&sa.sa_mask);
+	SAFE_SIGACTION(SIGUSR1, &sa, NULL);
+
+	epoll_pwait_info();

-	cleanup();
-	tst_exit();
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_STREAM, 0, sfd);
+
+	efd = epoll_create(1);
+	if (efd == -1)
+		tst_brk(TBROK | TERRNO, "epoll_create()");
+
+	e.events = EPOLLIN;
+	if (epoll_ctl(efd, EPOLL_CTL_ADD, sfd[0], &e))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
 }

 static void cleanup(void)
 {
-	if (epfd > 0 && close(epfd))
-		tst_resm(TWARN | TERRNO, "failed to close epfd");
+	if (efd > 0)
+		SAFE_CLOSE(efd);

-	if (close(fds[0]))
-		tst_resm(TWARN | TERRNO, "close(fds[0]) failed");
+	if (sfd[0] > 0)
+		SAFE_CLOSE(sfd[0]);

-	if (close(fds[1]))
-		tst_resm(TWARN | TERRNO, "close(fds[1]) failed");
+	if (sfd[1] > 0)
+		SAFE_CLOSE(sfd[1]);
 }
+
+static struct tst_test test = {
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.min_kver = "2.6.19",
+	.test_variants = TEST_VARIANTS,
+	.tcnt = ARRAY_SIZE(testcase_list),
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
