Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEAF346067
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:56:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE6203C71EA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:56:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D6C0B3C54D7
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:56:32 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AE5E0200BB2
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:56:30 +0100 (CET)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4XsG6FnLznTsZ
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 21:53:54 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 21:56:16 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Mar 2021 21:56:04 +0800
Message-ID: <20210323135604.24504-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

In busybox, send SIGUSR1 to the init process will trigger shutdown.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 lib/tst_test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 45753d1ca..91dfc6bf9 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1156,7 +1156,15 @@ static void heartbeat(void)
 	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");

-	kill(getppid(), SIGUSR1);
+	if (getppid() == 1) {
+		tst_res(TFAIL, "Main test process might have exit!");
+		/*
+		 * We need kill the task group immediately since the
+		 * main process has exit.
+		 */
+		kill(0, SIGKILL);
+	} else
+		kill(getppid(), SIGUSR1);
 }

 static void testrun(void)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
