Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD48376E71
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 04:15:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BC323C9454
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 04:15:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20E1A3C1A29
 for <ltp@lists.linux.it>; Sat,  8 May 2021 04:15:52 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C3FFF1A006F2
 for <ltp@lists.linux.it>; Sat,  8 May 2021 04:15:51 +0200 (CEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FcW7X0dG4zkWw4
 for <ltp@lists.linux.it>; Sat,  8 May 2021 10:13:12 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 10:15:38 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sat, 8 May 2021 10:14:48 +0800
Message-ID: <20210508021448.7390-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/bind03: Bugfix for running with option
 "-i"
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

When run the test with option "-i 2", test will fail and
report EADDRINUSE.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v1->v2:replace unlink() with SAFE_UNLINK()
 testcases/kernel/syscalls/bind/bind03.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/bind/bind03.c b/testcases/kernel/syscalls/bind/bind03.c
index ebde19591..879ce1bc6 100644
--- a/testcases/kernel/syscalls/bind/bind03.c
+++ b/testcases/kernel/syscalls/bind/bind03.c
@@ -62,16 +62,14 @@ void run(void)
 	 */
 	TST_EXP_FAIL(bind(sock2, (struct sockaddr *)&sun1, sizeof(sun1)),
 	             EADDRINUSE, "bind() with bound pathname");
-}

-static void cleanup(void)
-{
+	SAFE_UNLINK(sun1.sun_path);
+	SAFE_UNLINK(sun2.sun_path);
 	SAFE_CLOSE(sock1);
 	SAFE_CLOSE(sock2);
 }

 static struct tst_test test = {
-	.cleanup = cleanup,
 	.test_all = run,
 	.needs_tmpdir = 1,
 };
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
