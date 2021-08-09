Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 992573E41B4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:38:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FB023C7151
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:38:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 055073C676B
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:37:57 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 98D1D1400DCA
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:37:56 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GjqBF5XlPzcm9m;
 Mon,  9 Aug 2021 16:34:13 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:37:51 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:37:51 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 9 Aug 2021 16:39:00 +0800
Message-ID: <20210809083903.161596-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809083903.161596-1-xieziyao@huawei.com>
References: <20210809083903.161596-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] epoll_wait: Add docparse formatting and cleanup
 for epoll_wait01
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
 .../kernel/syscalls/epoll_wait/epoll_wait01.c | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
index ad9126aaf..1807bec8a 100644
--- a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
@@ -4,11 +4,12 @@
  * Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
  */

-/*
- * Description:
- *  Basic test for epoll_wait(2).
- *  Check that epoll_wait(2) works for EPOLLOUT and EPOLLIN events
- *  on a epoll instance and that struct epoll_event is set correctly.
+/*\
+ * [Description]
+ *
+ * Basic test for epoll_wait. Check that epoll_wait works for EPOLLOUT and
+ * EPOLLIN events on an epoll instance and that struct epoll_event is set
+ * correctly.
  */

 #include <sys/epoll.h>
@@ -226,24 +227,18 @@ static void cleanup(void)
 	}
 }

+static void (*testcase_list[])(void) = {
+	verify_epollout, verify_epollin, verify_epollio
+};
+
 static void do_test(unsigned int n)
 {
-	switch (n) {
-	case 0:
-		verify_epollout();
-	break;
-	case 1:
-		verify_epollin();
-	break;
-	case 2:
-		verify_epollio();
-	break;
-	}
+	testcase_list[n]();
 }

 static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = do_test,
-	.tcnt = 3,
+	.tcnt = ARRAY_SIZE(testcase_list),
 };
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
