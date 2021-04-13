Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F048735DE18
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:54:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 444913C7211
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:54:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C4FE3C1DBD
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:54:39 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 40DA81000643
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:54:36 +0200 (CEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKP8Y1CDKzNvRK
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 19:51:41 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 19:54:26 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 13 Apr 2021 19:54:22 +0800
Message-ID: <20210413115422.4087-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
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

When main process has been killed, its son process will be reaped by
init, and son process will send SIGUSR1 to the init process.

In busybox, send SIGUSR1 to the init process will trig shutdown.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v1->v2: add exit(TBROK) after kill
---
 lib/tst_test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 45753d1ca..446887c31 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1156,6 +1156,16 @@ static void heartbeat(void)
 	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");

+	if (getppid() == 1) {
+		tst_res(TFAIL, "Main test process might have exit!");
+		/*
+		 * We need kill the task group immediately since the
+		 * main process has exit.
+		 */
+		kill(0, SIGKILL);
+		exit(TBROK);
+	}
+
 	kill(getppid(), SIGUSR1);
 }

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
