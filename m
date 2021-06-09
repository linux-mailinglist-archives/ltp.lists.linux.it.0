Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358B3A0FD2
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 11:49:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16AAB3C7ABD
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 11:49:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 013193C7AE7
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 11:48:52 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 576D41A011ED
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 11:48:50 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G0Mdy4LGcz6tv6
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 17:44:54 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 17:48:46 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 17:48:46 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 9 Jun 2021 17:49:23 +0800
Message-ID: <20210609094924.145262-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609094924.145262-1-xieziyao@huawei.com>
References: <20210609094924.145262-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/chown: format output and add testcases
 for chown05
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

1. Print values not variable names in TST_EXP_PASS().
2. Add testcases that -1 does not change the value after the chown
call.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/chown/chown05.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown05.c b/testcases/kernel/syscalls/chown/chown05.c
index ebb9e9b7c..44abdc750 100644
--- a/testcases/kernel/syscalls/chown/chown05.c
+++ b/testcases/kernel/syscalls/chown/chown05.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  * 07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 /*\
@@ -20,24 +21,31 @@
 #define TESTFILE "testfile"

 struct test_case_t {
+	char *desc;
 	uid_t uid;
 	gid_t gid;
 } tc[] = {
-	{700, 701},
-	{702, 701},
-	{702, 703},
-	{704, 705}
+	{"change owner/group ids", 700, 701},
+	{"change owner id only", 702, -1},
+	{"change owner id only", 703, 701},
+	{"change group id only", -1, 704},
+	{"change group id only", 703, 705},
+	{"no change", -1, -1}
 };

 static void run(unsigned int i)
 {
 	struct stat stat_buf;
-	TST_EXP_PASS(CHOWN(TESTFILE, tc[i].uid, tc[i].gid));
+	uid_t expect_uid = tc[i].uid == (uid_t)-1 ? tc[i - 1].uid : tc[i].uid;
+	gid_t expect_gid = tc[i].gid == (uid_t)-1 ? tc[i - 1].gid : tc[i].gid;
+
+	TST_EXP_PASS(CHOWN(TESTFILE, tc[i].uid, tc[i].gid), "chown(%s, %d, %d), %s",
+		     TESTFILE, tc[i].uid, tc[i].gid, tc[i].desc);

 	SAFE_STAT(TESTFILE, &stat_buf);
-	if (stat_buf.st_uid != tc[i].uid || stat_buf.st_gid != tc[i].gid) {
+	if (stat_buf.st_uid != expect_uid || stat_buf.st_gid != expect_gid) {
 		tst_res(TFAIL, "%s: incorrect ownership set, expected %d %d",
-			TESTFILE, tc[i].uid, tc[i].gid);
+			TESTFILE, expect_uid, expect_gid);
 	}
 }

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
