Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AB324C4F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 09:58:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 620FD3C5A3E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 09:58:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 20B293C0E16
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 09:58:51 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 13F4F14011A7
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 09:58:48 +0100 (CET)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmRVJ2WFbzMcMp
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 16:56:40 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 16:58:35 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 25 Feb 2021 16:58:05 +0800
Message-ID: <20210225085805.5146-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalss/timer_settime03.c: Add kconfig requirement
 info in file header.
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

Test will fail when CONFIG_HIGH_RES_TIMERS is not set to y, because the return value of
timer_getoverrun is equal to expiry_time_values/interval. When CONFIG_HIGH_RES_TIMERS is set to y,
interval is equal to 1.
When CONFIG_HIGH_RES_TIMERS is not set to y, interval is equal to HZ*1000000, and the
return value of timer_getoverrun will not be greater than or equal to {DELAYTIMER_MAX} in this
testcase. See https://nvd.nist.gov/vuln/detail/CVE-2018-12896.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/timer_settime/timer_settime03.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime03.c b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
index 4cc1f8bd8..fbc3587e4 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime03.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
@@ -19,6 +19,8 @@
  *  Date:   Tue Jun 26 15:21:32 2018 +0200
  *
  *  posix-timers: Sanitize overrun handling
+ *
+ *  Kconfig requirement: CONFIG_HIGH_RES_TIMERS
  */

 #include <unistd.h>
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
