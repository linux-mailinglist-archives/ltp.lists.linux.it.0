Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A61453EE6E4
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B0263C56B2
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 08:49:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3DC773C5722
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:58 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C89620074F
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 08:48:55 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GphST18g5zYqBN
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 14:48:25 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 14:48:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Aug 2021 14:49:18 +0800
Message-ID: <20210817064924.127970-2-xieziyao@huawei.com>
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
Subject: [LTP] [PATCH 1/7] epoll_ctl: Add docparse formatting and cleanup
 for epoll_ctl01
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

Add docparse formatting and fix warnings from checkpatch.pl for
epoll_ctl01.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/epoll_ctl/epoll_ctl01.c   | 28 +++++++++----------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
index e199ac6ac..099a0f8dd 100644
--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
@@ -4,25 +4,22 @@
  * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
  */

-/*
- * Test Name: epoll_ctl01.c
+/*\
+ * [Description]
  *
- * Description:
- *    Testcase to check the basic functionality of the epoll_ctl(2).
- * 1) when epoll_ctl(2) succeeds to register fd on the epoll instance and
- *    associates event with fd, epoll_wait(2) will get registered fd and
- *    event correctly.
- * 2) when epoll_ctl(2) succeeds to chage event which is related to fd,
- *    epoll_wait(2) will get chaged event correctly.
- * 3) when epoll_ctl(2) succeeds to deregister fd from the epoll instance
- *    epoll_wait(2) won't get deregistered fd and event.
+ * Check the basic functionality of the epoll_ctl:
  *
+ * - When epoll_ctl succeeds to register fd on the epoll instance and associates
+ * event with fd, epoll_wait will get registered fd and event correctly.
+ * - When epoll_ctl succeeds to change event which is related to fd, epoll_wait
+ * will get changed event correctly.
+ * - When epoll_ctl succeeds to deregister fd from the epoll instance epoll_wait
+ * won't get deregistered fd and event.
  */

-#include <sys/epoll.h>
 #include <poll.h>
-#include <string.h>
-#include <errno.h>
+#include <sys/epoll.h>
+
 #include "tst_test.h"

 static int epfd;
@@ -88,9 +85,10 @@ static void check_epoll_ctl(int opt, int exp_num)

 	while (events) {
 		int events_matched = 0;
-		memset(res_evs, 0, sizeof(res_evs));

+		memset(res_evs, 0, sizeof(res_evs));
 		res = epoll_wait(epfd, res_evs, 2, -1);
+
 		if (res <= 0) {
 			tst_res(TFAIL | TERRNO, "epoll_wait() returned %i",
 				res);
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
