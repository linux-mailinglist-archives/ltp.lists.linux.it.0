Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620572E89
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 14:16:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B04E3C1D0E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 14:16:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 51FFC3C18F7
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 14:16:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9726A1000EC4
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 14:15:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D0E2B109
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:16:01 +0000 (UTC)
Date: Wed, 24 Jul 2019 14:16:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190724121600.GB19478@rei.lan>
References: <20190723070817.637-1-camann@suse.com>
 <20190723070817.637-2-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723070817.637-2-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/3] timers/timer_settime0{2,
 3}: Ported to new library
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor enhancements, thanks.

diff --git a/testcases/kernel/timers/timer_settime/timer_settime02.c b/testcases/kernel/timers/timer_settime/timer_settime02.c
index 36d9a745f..6c431c53d 100644
--- a/testcases/kernel/timers/timer_settime/timer_settime02.c
+++ b/testcases/kernel/timers/timer_settime/timer_settime02.c
@@ -32,15 +32,14 @@ static kernel_timer_t timer;
 static struct testcase {
 	struct itimerspec	*old_ptr;
 	int			it_value_tv_sec;
-	int			it_internal_tv_sec;
-	int			check_clock_gettime;
+	int			it_interval_tv_sec;
 	int			flag;
 	char			*description;
 } tcases[] = {
-	{NULL, 5, 0, 0, 0, "general initialization"},
-	{&old_set, 5, 0, 0, 0, "setting old_value"},
-	{&old_set, 0, 5, 0, 0, "using periodic timer"},
-	{&old_set, 5, 0, 1, TIMER_ABSTIME, "using absolute time"},
+	{NULL,     5, 0, 0, "general initialization"},
+	{&old_set, 5, 0, 0, "setting old_value"},
+	{&old_set, 0, 5, 0, "using periodic timer"},
+	{&old_set, 5, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
 static void run(unsigned int n)
@@ -77,16 +76,16 @@ static void run(unsigned int n)
 		memset(&old_set, 0, sizeof(old_set));
 
 		new_set.it_value.tv_sec = tc->it_value_tv_sec;
-		new_set.it_interval.tv_sec = tc->it_internal_tv_sec;
+		new_set.it_interval.tv_sec = tc->it_interval_tv_sec;
 
-		if (tc->check_clock_gettime) {
+		if (tc->flag & TIMER_ABSTIME) {
 			if (clock_gettime(clock, &timenow) < 0) {
 				tst_res(TBROK,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
 				continue;
 			}
-			new_set.it_value.tv_sec = timenow.tv_sec + 25;
+			new_set.it_value.tv_sec += timenow.tv_sec;
 		}
 
 		TEST(tst_syscall(__NR_timer_settime, timer,
diff --git a/testcases/kernel/timers/timer_settime/timer_settime03.c b/testcases/kernel/timers/timer_settime/timer_settime03.c
index 80861995f..bc3a0f2c8 100644
--- a/testcases/kernel/timers/timer_settime/timer_settime03.c
+++ b/testcases/kernel/timers/timer_settime/timer_settime03.c
@@ -26,7 +26,8 @@
 #include "common_timers.h"
 
 static struct itimerspec new_set, old_set;
-static kernel_timer_t timer, timer_inval;
+static kernel_timer_t timer;
+static kernel_timer_t timer_inval = -1;
 
 /* separate description-array to (hopefully) improve readability */
 static const char * const descriptions[] = {
@@ -111,14 +112,8 @@ static void run(unsigned int n)
 	}
 }
 
-static void setup(void)
-{
-	timer_inval = -1;
-}
-
 static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
-	.setup = setup,
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
