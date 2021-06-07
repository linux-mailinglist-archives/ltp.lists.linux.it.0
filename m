Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DCD39D6BE
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:07:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8239B3C7C07
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:07:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C6E593C0BB1
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:07:10 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87E4260096B
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:07:08 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fz5SQ1Bp0z1BKFy
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:02:14 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:07:02 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:07:02 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 7 Jun 2021 16:07:42 +0800
Message-ID: <20210607080742.21377-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fchown: Make output nicer and add checks
 before SAFE_CLOSE(fd)
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
2. Check if the fd has been opened in cleanup().

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fchown/fchown01.c | 2 +-
 testcases/kernel/syscalls/fchown/fchown02.c | 8 +++++---
 testcases/kernel/syscalls/fchown/fchown03.c | 4 +++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/fchown/fchown01.c b/testcases/kernel/syscalls/fchown/fchown01.c
index 77913ce32..16e1f677b 100644
--- a/testcases/kernel/syscalls/fchown/fchown01.c
+++ b/testcases/kernel/syscalls/fchown/fchown01.c
@@ -28,7 +28,7 @@ static gid_t gid;

 static void run(void)
 {
-	TST_EXP_PASS(FCHOWN(fd, uid, gid));
+	TST_EXP_PASS(FCHOWN(fd, uid, gid), "fchown(%i, %i, %i)", fd, uid, gid);
 }

 static void setup(void)
diff --git a/testcases/kernel/syscalls/fchown/fchown02.c b/testcases/kernel/syscalls/fchown/fchown02.c
index d541f0450..ec04b5c01 100644
--- a/testcases/kernel/syscalls/fchown/fchown02.c
+++ b/testcases/kernel/syscalls/fchown/fchown02.c
@@ -53,7 +53,7 @@ static void run(unsigned int i)

 	SAFE_CHMOD(tc[i].filename, tc[i].set_mode);

-	TST_EXP_PASS(FCHOWN(*tc[i].fd, uid, gid));
+	TST_EXP_PASS(FCHOWN(*tc[i].fd, uid, gid), "fchown(%i, %i, %i)", *tc[i].fd, uid, gid);

 	SAFE_STAT(tc[i].filename, &stat_buf);

@@ -78,8 +78,10 @@ static void cleanup(void)
 {
 	unsigned int i;

-	for (i = 0; i < ARRAY_SIZE(tc); i++)
-		SAFE_CLOSE(*tc[i].fd);
+	for (i = 0; i < ARRAY_SIZE(tc); i++) {
+		if (*tc[i].fd > 0)
+			SAFE_CLOSE(*tc[i].fd);
+	}
 }

 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/fchown/fchown03.c b/testcases/kernel/syscalls/fchown/fchown03.c
index 752d9c394..97d6c9d34 100644
--- a/testcases/kernel/syscalls/fchown/fchown03.c
+++ b/testcases/kernel/syscalls/fchown/fchown03.c
@@ -85,7 +85,9 @@ static void cleanup(void)
 {
 	SAFE_SETEGID(0);
 	SAFE_SETEUID(0);
-	SAFE_CLOSE(fd);
+
+	if (fd > 0)
+		SAFE_CLOSE(fd);
 }

 static struct tst_test test = {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
