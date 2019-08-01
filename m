Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ECF7D88D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A9703C1E28
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 11:27:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4A68C3C1E00
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 34E856013CB
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 11:26:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCF4CAFF9
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 09:26:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  1 Aug 2019 11:26:15 +0200
Message-Id: <20190801092616.30553-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190801092616.30553-1-chrubis@suse.cz>
References: <20190801092616.30553-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 8/9] syscalls/clock_settime01: Make use of guarded
 buffers.
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../syscalls/clock_settime/clock_settime01.c  | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime01.c b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
index c68fe59a1..62d349154 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime01.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
@@ -23,23 +23,24 @@
 #define DELTA_US (long long) (DELTA_SEC * 1000000)
 #define DELTA_EPS (long long) (DELTA_US * 0.1)
 
+static struct timespec *begin, *change, *end;
+
 static void verify_clock_settime(void)
 {
 	long long elapsed;
-	struct timespec begin, change, end;
 
 	/* test 01: move forward */
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &begin);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, begin);
 
-	change = tst_timespec_add_us(begin, DELTA_US);
+	*change = tst_timespec_add_us(*begin, DELTA_US);
 
-	if (clock_settime(CLOCK_REALTIME, &change) != 0)
+	if (clock_settime(CLOCK_REALTIME, change) != 0)
 		tst_brk(TBROK | TTERRNO, "could not set realtime change");
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &end);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, end);
 
-	elapsed = tst_timespec_diff_us(end, begin);
+	elapsed = tst_timespec_diff_us(*end, *begin);
 
 	if (elapsed >= DELTA_US && elapsed < (DELTA_US + DELTA_EPS))
 		tst_res(TPASS, "clock_settime(2): was able to advance time");
@@ -48,16 +49,16 @@ static void verify_clock_settime(void)
 
 	/* test 02: move backward */
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &begin);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, begin);
 
-	change = tst_timespec_sub_us(begin, DELTA_US);
+	*change = tst_timespec_sub_us(*begin, DELTA_US);
 
-	if (clock_settime(CLOCK_REALTIME, &change) != 0)
+	if (clock_settime(CLOCK_REALTIME, change) != 0)
 		tst_brk(TBROK | TTERRNO, "could not set realtime change");
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, &end);
+	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, end);
 
-	elapsed = tst_timespec_diff_us(end, begin);
+	elapsed = tst_timespec_diff_us(*end, *begin);
 
 	if (~(elapsed) <= DELTA_US && ~(elapsed) > (DELTA_US - DELTA_EPS))
 		tst_res(TPASS, "clock_settime(2): was able to recede time");
@@ -69,4 +70,10 @@ static struct tst_test test = {
 	.test_all = verify_clock_settime,
 	.needs_root = 1,
 	.restore_wallclock = 1,
+	.bufs = (struct tst_buffers []) {
+		{&begin, .size = sizeof(*begin)},
+		{&change, .size = sizeof(*change)},
+		{&end, .size = sizeof(*end)},
+		{},
+	}
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
