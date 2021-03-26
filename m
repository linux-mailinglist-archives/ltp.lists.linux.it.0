Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B385434A2ED
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 09:05:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7527D3C27D7
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 09:05:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 046213C27AC
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 09:05:51 +0100 (CET)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 046381A01234
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 09:05:49 +0100 (CET)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6DyH4GyVzkftJ
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 16:04:07 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 16:05:36 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 26 Mar 2021 16:05:30 +0800
Message-ID: <20210326080530.11211-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clock_adjtime: fix some mistakes for commit
 135affca95dca84bc9ce6b1e2238e6db6e6b0f56
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

- change TTERRNO to TERRNO after the safe_macros interface is not used;
- delete the unnecessary tst_res(TFAIL | TTERRNO, ...), which has been
  determined in the previous logic.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c | 7 +------
 testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
index 061b2bb22..aff374a2c 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
@@ -174,11 +174,6 @@ static void verify_clock_adjtime(unsigned int i)
 			tc[i].modes);
 	}

-	if (TST_RET < 0) {
-		tst_res(TFAIL | TTERRNO, "clock_adjtime(): mode=%x, returned "
-				"error", tc[i].modes);
-	}
-
 	tst_res(TPASS, "clock_adjtime(): success (mode=%x)", tc[i].modes);
 }

@@ -201,7 +196,7 @@ static void setup(void)

 	if (rval != TIME_OK && rval != TIME_ERROR) {
 		timex_show("SAVE_STATUS", &saved);
-		tst_brk(TBROK | TTERRNO, "clock has on-going leap changes, "
+		tst_brk(TBROK | TERRNO, "clock has on-going leap changes, "
 				"returned: %i", rval);
 	}

diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
index 8ef4dadb6..2df9099d5 100644
--- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
+++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c
@@ -209,7 +209,7 @@ static void setup(void)

 	if (rval != TIME_OK && rval != TIME_ERROR) {
 		timex_show("SAVE_STATUS", &saved);
-		tst_brk(TBROK | TTERRNO, "clock has on-going leap changes, "
+		tst_brk(TBROK | TERRNO, "clock has on-going leap changes, "
 				"returned: %i", rval);
 	}

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
