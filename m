Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD62343F7
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 12:11:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A15C3C264D
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 12:11:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EF5DF3C0131
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:11:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 36C1B1A01111
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:10:02 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; d="scan'208";a="97217231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 18:09:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E47274CE5449
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 18:09:43 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 18:09:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 31 Jul 2020 18:09:44 +0800
Message-ID: <1596190184-15381-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E47274CE5449.ADA01
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/timer_settime01: Add linux git tag
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

When running this case on old kernel like 3.10.0-1136.el7.x86_64,
it will fail as below when testing CLOCK_BOOTTIME_ALARM/CLOCK_REALTIME_ALARM
clockid

timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) reported
bad values (0: 678013000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) reported
bad values (0: 358240000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed

It fails because old kernel without this kernel patch returns the wrong remaining time(
the time at which it is scheduled to expire). If the timer has already expired
or it is not currently scheduled, the it_value's members should be set to zero.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/timer_settime/timer_settime01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 48b37d8e7..74423f343 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -19,6 +19,7 @@
  *
  * This is also regression test for commit:
  * f18ddc13af98 ("alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP")
+ * d78c9300c51d ("alarmtimer: Return relative times in timer_gettime")
  */
 
 #include <stdlib.h>
@@ -187,6 +188,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f18ddc13af98"},
+		{"linux-git", "d78c9300c51d"},
 		{}
 	}
 };
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
