Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C301375EA7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 04:05:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7338A3C67D3
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 04:05:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D2DD3C5758
 for <ltp@lists.linux.it>; Fri,  7 May 2021 04:05:35 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31806601E24
 for <ltp@lists.linux.it>; Fri,  7 May 2021 04:05:33 +0200 (CEST)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fbty70j6lz1BJWs
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:02:55 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 10:05:03 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 10:04:16 +0800
Message-ID: <20210507020416.29792-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/mlockall03: Bugfix for running with option
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
report "mlockall03.c:144: mlockall() Failed while setup
for checking error tried to lock more memory than the
limit permitted"

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/mlockall/mlockall03.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/mlockall/mlockall03.c b/testcases/kernel/syscalls/mlockall/mlockall03.c
index 5e8e55648..7418dd64d 100644
--- a/testcases/kernel/syscalls/mlockall/mlockall03.c
+++ b/testcases/kernel/syscalls/mlockall/mlockall03.c
@@ -231,7 +231,7 @@ int setup_test(int i)
 		rl.rlim_cur = 7;

 		if (setrlimit(RLIMIT_MEMLOCK, &rl) != 0) {
-			tst_resm(TWARN, "setrlimit failed to set the "
+			tst_resm(TWARN | TERRNO, "setrlimit failed to set the "
 				 "resource for RLIMIT_MEMLOCK to check "
 				 "for mlockall() error %s\n", TC[i].edesc);
 			return 1;
@@ -268,6 +268,7 @@ void cleanup_test(int i)

 	switch (i) {
 	case 0:
+	case 1:
 		SAFE_SETEUID(cleanup, 0);

 		rl.rlim_max = -1;
@@ -280,11 +281,6 @@ void cleanup_test(int i)
 				 "checking for mlockall() error %s\n",
 				 TC[i].edesc);
 		}
-
-		return;
-
-	case 1:
-		SAFE_SETEUID(cleanup, 0);
 		return;

 	}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
