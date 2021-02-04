Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B377030EF8C
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 10:22:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58A273C7116
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 10:22:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 07BCC3C2EDD
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 10:22:21 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 56D87601419
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 10:22:20 +0100 (CET)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DWY205BkRzjH6X
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 17:20:56 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Feb 2021 17:22:04 +0800
From: zhao gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 4 Feb 2021 17:21:14 +0800
Message-ID: <20210204092114.8726-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] bugfix for lib/tst_capability.c
 sched_setaffinity/sched_setaffinity01.c timerfd/timerfd04.c
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

Use TERRNO because we're not using the TEST() macro.

Signed-off-by: zhao gongyi <zhaogongyi@huawei.com>
---
 lib/tst_capability.c                                        | 2 +-
 .../kernel/syscalls/sched_setaffinity/sched_setaffinity01.c | 6 +++---
 testcases/kernel/syscalls/timerfd/timerfd04.c               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/tst_capability.c b/lib/tst_capability.c
index 1fa0e49c5..cb0502e2e 100644
--- a/lib/tst_capability.c
+++ b/lib/tst_capability.c
@@ -57,7 +57,7 @@ void tst_cap_action(struct tst_cap *cap)
 	uint32_t mask = CAP_TO_MASK(cap->id);

 	if (tst_capget(&hdr, cur))
-		tst_brk(TBROK | TTERRNO, "tst_capget()");
+		tst_brk(TBROK | TERRNO, "tst_capget()");

 	memcpy(new, cur, sizeof(new));

diff --git a/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c b/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
index d9d6530e2..a56ae1f50 100644
--- a/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
+++ b/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
@@ -95,16 +95,16 @@ static void setup(void)

 	mask = CPU_ALLOC(ncpus);
 	if (!mask)
-		tst_brk(TBROK | TTERRNO, "CPU_ALLOC() failed");
+		tst_brk(TBROK | TERRNO, "CPU_ALLOC() failed");

 	mask_size = CPU_ALLOC_SIZE(ncpus);

 	if (sched_getaffinity(0, mask_size, mask) < 0)
-		tst_brk(TBROK | TTERRNO, "sched_getaffinity() failed");
+		tst_brk(TBROK | TERRNO, "sched_getaffinity() failed");

 	emask = CPU_ALLOC(ncpus + 1);
 	if (!emask)
-		tst_brk(TBROK | TTERRNO, "CPU_ALLOC() failed");
+		tst_brk(TBROK | TERRNO, "CPU_ALLOC() failed");

 	emask_size = CPU_ALLOC_SIZE(ncpus + 1);
 	CPU_ZERO_S(emask_size, emask);
diff --git a/testcases/kernel/syscalls/timerfd/timerfd04.c b/testcases/kernel/syscalls/timerfd/timerfd04.c
index 798d95e60..4af91d6f8 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd04.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd04.c
@@ -64,7 +64,7 @@ static void verify_timerfd(unsigned int n)
 	                 tc->clk_off, tc->off);

 	if (tv->clock_gettime(tc->clk_id, tst_ts_get(&start))) {
-		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+		tst_res(TFAIL | TERRNO, "clock_gettime(2) failed for clock %s",
 			tst_clock_name(tc->clk_id));
 		return;
 	}
@@ -95,7 +95,7 @@ static void verify_timerfd(unsigned int n)
 	SAFE_WAIT(NULL);

 	if (tv->clock_gettime(CLOCK_MONOTONIC, tst_ts_get(&end))) {
-		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+		tst_res(TFAIL | TERRNO, "clock_gettime(2) failed for clock %s",
 			tst_clock_name(CLOCK_MONOTONIC));
 		return;
 	}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
