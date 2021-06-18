Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D13AC7DB
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AAA03C2B09
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 11:42:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 538683C2462
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:01 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BCFFD14012BF
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 11:42:00 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5v2X2XmrzXfSG
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 17:36:52 +0800 (CST)
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
Date: Fri, 18 Jun 2021 17:42:05 +0800
Message-ID: <20210618094210.183027-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618094210.183027-1-xieziyao@huawei.com>
References: <20210618094210.183027-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] io_cancel01: Add .needs_kconfigs and more
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

Add .needs_kconfigs and more detailed description to distinguish it from io_cancel02.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/io_cancel/io_cancel01.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/io_cancel/io_cancel01.c b/testcases/kernel/syscalls/io_cancel/io_cancel01.c
index 11f789b78..8bd65bd4a 100644
--- a/testcases/kernel/syscalls/io_cancel/io_cancel01.c
+++ b/testcases/kernel/syscalls/io_cancel/io_cancel01.c
@@ -8,8 +8,8 @@
 /*\
  * [Description]
  *
- * Calls io_cancel() with one of the data structures points to invalid data and
- * expects it to return EFAULT.
+ * Test io_cancel invoked via syscall(2) with one of the data structures
+ * points to invalid data and expects it to return EFAULT.
  */

 #include <linux/aio_abi.h>
@@ -21,10 +21,15 @@
 static void run(void)
 {
 	aio_context_t ctx;
+
 	memset(&ctx, 0, sizeof(ctx));
 	TST_EXP_FAIL(tst_syscall(__NR_io_cancel, ctx, NULL, NULL), EFAULT);
 }

 static struct tst_test test = {
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_AIO=y",
+		NULL
+	},
 	.test_all = run,
 };
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
