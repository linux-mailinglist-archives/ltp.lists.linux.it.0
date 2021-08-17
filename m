Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7E3EE6DE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:48:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B09803C5764
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C3DB3C56B2
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:40 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC11D20076E
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:39 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GphN23qy4z88Mh
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:44:34 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:19 +0800
Message-ID: <20210817064924.127970-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210817064924.127970-1-xieziyao@huawei.com>
References: <20210817064924.127970-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] epoll_ctl: Add docparse formatting and cleanup
 for epoll_ctl02
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
2. Make use of TST_EXP_FAIL(...).
3. Add test for events=NULL.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/epoll_ctl/epoll_ctl02.c   | 87 +++++++------------
 1 file changed, 32 insertions(+), 55 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
index 280fd6724..f477625a6 100644
--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
@@ -4,34 +4,23 @@
  * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
  */

-/*
- * Test Name: epoll_ctl02.c
- *
- * Description:
- * 1) epoll_ctl(2) fails if epfd is a invalid file descriptor.
- * 2) epoll_ctl(2) fails if fd is a invalid file descriptor.
- * 3) epoll_ctl(2) fails if op is not supported by this interface.
- * 4) epoll_ctl(2) fails if fd is the same as epfd.
- * 5) epoll_ctl(2) fails with EPOLL_CTL_DEL if fd is not registered
- *    with this epoll instance.
- * 6) epoll_ctl(2) fails with EPOLL_CTL_MOD if fd is not registered
- *    with this epoll instance.
- * 7) epoll_ctl(2) fails with EPOLL_CTL_ADD if fd is already registered
- *    with this epoll instance.
- *
- * Expected Result:
- * 1) epoll_ctl(2) should return -1 and set errno to EBADF.
- * 2) epoll_ctl(2) should return -1 and set errno to EBADF.
- * 3) epoll_ctl(2) should return -1 and set errno to EINVAL.
- * 4) epoll_ctl(2) should return -1 and set errno to EINVAL.
- * 5) epoll_ctl(2) should return -1 and set errno to ENOENT.
- * 6) epoll_ctl(2) should return -1 and set errno to ENOENT.
- * 7) epoll_ctl(2) should return -1 and set errno to EEXIST.
+/*\
+ * [Description]
  *
+ * Verify that,
+ * - epoll_ctl fails with EBADF if epfd is an invalid fd.
+ * - epoll_ctl fails with EBADF if fd is an invalid fd.
+ * - epoll_ctl fails with EINVAL if op is not supported.
+ * - epoll_ctl fails with EINVAL if fd is the same as epfd.
+ * - epoll_ctl fails with EINVAL if events is NULL.
+ * - epoll_ctl fails with ENOENT if fd is not registered with EPOLL_CTL_DEL.
+ * - epoll_ctl fails with ENOENT if fd is not registered with EPOLL_CTL_MOD.
+ * - epoll_ctl fails with EEXIST if fd is already registered with EPOLL_CTL_ADD.
  */
-#include <sys/epoll.h>
+
 #include <poll.h>
-#include <errno.h>
+#include <sys/epoll.h>
+
 #include "tst_test.h"

 static int epfd;
@@ -44,19 +33,21 @@ static struct epoll_event events[2] = {
 };

 static struct testcase {
-	int *epfds;
+	int *epfd;
 	int opt;
-	int *fds;
-	struct epoll_event *ts_event;
+	int *fd;
+	struct epoll_event *event;
 	int exp_err;
-} tcases[] = {
-	{&inv, EPOLL_CTL_ADD, &fd[1], &events[1], EBADF},
-	{&epfd, EPOLL_CTL_ADD, &inv, &events[1], EBADF},
-	{&epfd, -1, &fd[1], &events[1], EINVAL},
-	{&epfd, EPOLL_CTL_ADD, &epfd, &events[1], EINVAL},
-	{&epfd, EPOLL_CTL_DEL, &fd[1], &events[1], ENOENT},
-	{&epfd, EPOLL_CTL_MOD, &fd[1], &events[1], ENOENT},
-	{&epfd, EPOLL_CTL_ADD, &fd[0], &events[0], EEXIST}
+	const char *desc;
+} tc[] = {
+	{&inv, EPOLL_CTL_ADD, &fd[1], &events[1], EBADF, "epfd is an invalid fd"},
+	{&epfd, EPOLL_CTL_ADD, &inv, &events[1], EBADF, "fd is an invalid fd"},
+	{&epfd, -1, &fd[1], &events[1], EINVAL, "op is not supported"},
+	{&epfd, EPOLL_CTL_ADD, &epfd, &events[1], EINVAL, "fd is the same as epfd"},
+	{&epfd, EPOLL_CTL_ADD, &fd[1], NULL, EFAULT, "events is NULL"},
+	{&epfd, EPOLL_CTL_DEL, &fd[1], &events[1], ENOENT, "fd is not registered with EPOLL_CTL_DEL"},
+	{&epfd, EPOLL_CTL_MOD, &fd[1], &events[1], ENOENT, "fd is not registered with EPOLL_CTL_MOD"},
+	{&epfd, EPOLL_CTL_ADD, &fd[0], &events[0], EEXIST, "fd is already registered with EPOLL_CTL_ADD"}
 };

 static void setup(void)
@@ -70,9 +61,8 @@ static void setup(void)
 	events[0].data.fd = fd[0];
 	events[1].data.fd = fd[1];

-	TEST(epoll_ctl(epfd, EPOLL_CTL_ADD, fd[0], &events[0]));
-	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "epoll_ctl() fails to init");
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, fd[0], &events[0]))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
 }

 static void cleanup(void)
@@ -89,25 +79,12 @@ static void cleanup(void)

 static void verify_epoll_ctl(unsigned int n)
 {
-	struct testcase *tc = &tcases[n];
-
-	TEST(epoll_ctl(*tc->epfds, tc->opt, *tc->fds,  tc->ts_event));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "epoll_ctl() succeeds unexpectedly");
-		return;
-	}
-
-	if (tc->exp_err == TST_ERR) {
-		tst_res(TPASS | TTERRNO, "epoll_ctl() fails as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO,
-			"epoll_ctl() fails unexpectedly, expected %i: %s",
-			tc->exp_err, tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL(epoll_ctl(*tc[n].epfd, tc[n].opt, *tc[n].fd, tc[n].event),
+		     tc[n].exp_err, "epoll_clt(...) if %s", tc[n].desc);
 }

 static struct tst_test test = {
-	.tcnt = ARRAY_SIZE(tcases),
+	.tcnt = ARRAY_SIZE(tc),
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_epoll_ctl,
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
