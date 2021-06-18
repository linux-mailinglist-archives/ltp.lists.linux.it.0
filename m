Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81E3AC7D8
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71C383C2B2E
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1BA393C2462
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:01 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9423F200753
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:00 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5v4j3q7xz6v03
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 17:38:45 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 17:41:56 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 17:41:56 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 18 Jun 2021 17:42:09 +0800
Message-ID: <20210618094210.183027-7-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618094210.183027-1-xieziyao@huawei.com>
References: <20210618094210.183027-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 6/7] io_setup: Add docparse formatting and more
 detailed description
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

Add docparse formatting and more detailed description to distinguish
io_setup01 from io_setup02.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/io_setup/io_setup01.c     | 24 ++++++++++---------
 .../kernel/syscalls/io_setup/io_setup02.c     |  8 +++----
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/io_setup/io_setup01.c b/testcases/kernel/syscalls/io_setup/io_setup01.c
index 28aee7831..0377ca193 100644
--- a/testcases/kernel/syscalls/io_setup/io_setup01.c
+++ b/testcases/kernel/syscalls/io_setup/io_setup01.c
@@ -1,19 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) Crackerjack Project., 2007
- *   Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
- *   Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
  */

-/* Porting from Crackerjack to LTP is done
- * by Masatake YAMATO <yamato@redhat.com>
+/*\
+ * [Description]
  *
- * Description:
- * 1) io_setup(2) succeeds if both nr_events and ctxp are valid.
- * 2) io_setup(2) fails and returns -EINVAL if ctxp is not initialized to 0.
- * 3) io_setup(2) fails and returns -EINVAL if nr_events is invalid.
- * 4) io_setup(2) fails and returns -EFAULT if ctxp is NULL.
- * 5) io_setup(2) fails and returns -EAGAIN if nr_events exceeds the limit
+ * Test io_setup invoked via libaio:
+ *
+ * 1. io_setup succeeds if both nr_events and ctxp are valid.
+ * 2. io_setup fails and returns -EINVAL if ctxp is not initialized to 0.
+ * 3. io_setup fails and returns -EINVAL if nr_events is invalid.
+ * 4. io_setup fails and returns -EFAULT if ctxp is NULL.
+ * 5. io_setup fails and returns -EAGAIN if nr_events exceeds the limit
  *    of available events.
  */

diff --git a/testcases/kernel/syscalls/io_setup/io_setup02.c b/testcases/kernel/syscalls/io_setup/io_setup02.c
index 292b7440d..4ef0ad1a7 100644
--- a/testcases/kernel/syscalls/io_setup/io_setup02.c
+++ b/testcases/kernel/syscalls/io_setup/io_setup02.c
@@ -12,10 +12,10 @@
  *
  * Test io_setup invoked via syscall(2):
  *
- * 1. io_setup fails and returns -EFAULT if ctxp is NULL.
- * 2. io_setup fails and returns -EINVAL if ctxp is not initialized to 0.
- * 3. io_setup fails and returns -EINVAL if nr_events is -1.
- * 4. io_setup fails and returns -EAGAIN if nr_events exceeds the limit
+ * 1. io_setup fails and returns EFAULT if ctxp is NULL.
+ * 2. io_setup fails and returns EINVAL if ctxp is not initialized to 0.
+ * 3. io_setup fails and returns EINVAL if nr_events is -1.
+ * 4. io_setup fails and returns EAGAIN if nr_events exceeds the limit
  *    of available events.
  * 5. io_setup succeeds if both nr_events and ctxp are valid.
  */
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
