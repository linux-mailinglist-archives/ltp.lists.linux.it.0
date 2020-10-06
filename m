Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952B2848D5
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Oct 2020 10:53:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D7B83C4AF2
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Oct 2020 10:53:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AB7D93C13DB
 for <ltp@lists.linux.it>; Tue,  6 Oct 2020 10:53:40 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C40FC60090E
 for <ltp@lists.linux.it>; Tue,  6 Oct 2020 10:53:39 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kPij4-0006bG-9u; Tue, 06 Oct 2020 08:53:38 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: ltp@lists.linux.it
Date: Tue,  6 Oct 2020 05:53:09 -0300
Message-Id: <20201006085309.32227-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/timer_settime01: adjust for rounding from
 nsec to usec
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
Cc: Kelsey Skunberg <kelsey.skunberg@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When using TIMER_ABSTIME, the value is added to the current clock time.
However, usecs is used instead of nsecs, leading to a possible rounding up from
tst_ts_to_us.

That rounding can lead to up to 500 nsecs of difference between the current
time and the absolute time used for setting the timer. When reading the timer
back, that same difference can be found, which leads to a test failure.

Accounting for that possible difference in the time allows the test to pass.

This can be easily reproducible by booting linux with clocksource=jiffies.

Fixes: b34e243e85dd (syscalls/timer_settime01: Make sure the timer fires)
Reported-by: Kelsey Skunberg <kelsey.skunberg@canonical.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 testcases/kernel/syscalls/timer_settime/timer_settime01.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 67143e8f88b2..7ecf0c18d1c4 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -149,10 +149,15 @@ static void run(unsigned int n)
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "timer_gettime(%s) failed",
 				get_clock_str(clock));
+		/*
+		 * With TIMER_ABSTIME, we add to the current clock after
+		 * rounding up by 500 ns to the value. Do the same here after
+		 * reading the timer back.
+		 */
 		} else if ((tst_its_get_interval_nsec(new_set) !=
 				tc->it_interval_tv_usec * 1000) ||
 			   (tst_its_get_value_nsec(new_set) >
-				MAX(tc->it_value_tv_usec * 1000, tc->it_interval_tv_usec * 1000))) {
+				MAX(tc->it_value_tv_usec * 1000 + 500, tc->it_interval_tv_usec * 1000))) {
 			tst_res(TFAIL | TTERRNO,
 				"timer_gettime(%s) reported bad values (%llu: %llu)",
 				get_clock_str(clock),
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
