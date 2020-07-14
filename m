Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280B21F414
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 16:28:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B9463C4F77
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 16:28:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 31C5F3C2992
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 16:28:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C90F76010F3
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 16:27:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CBF4AC85;
 Tue, 14 Jul 2020 14:28:26 +0000 (UTC)
Date: Tue, 14 Jul 2020 16:28:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200714142843.GA14905@yuki.lan>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

Among other fixes I've moved the signal check from the signal handler to
the clear_signal() function, since the tst_res() function is not
signal-async-safe...

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index f9d1456da..76f283b81 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -10,7 +10,7 @@
 /*
  * This tests the timer_settime(2) syscall under various conditions:
  *
- * 1) General initialization: No old_value, no flags, 5-second-timer
+ * 1) General initialization: No old_value, no flags
  * 2) Setting a pointer to a itimerspec struct as old_set parameter
  * 3) Using a periodic timer
  * 4) Using absolute time
@@ -38,10 +38,10 @@ static struct testcase {
 	int			flag;
 	char			*description;
 } tcases[] = {
-	{NULL, 100000, 0, 0, "general initialization"},
-	{&old_set, 100000, 0, 0, "setting old_value"},
-	{&old_set, 100000, 100000, 0, "using periodic timer"},
-	{&old_set, 100000, 0, TIMER_ABSTIME, "using absolute time"},
+	{NULL, 50000, 0, 0, "general initialization"},
+	{&old_set, 50000, 0, 0, "setting old_value"},
+	{&old_set, 50000, 50000, 0, "using periodic timer"},
+	{&old_set, 50000, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
 static struct test_variants {
@@ -71,15 +71,17 @@ static void clear_signal(void)
 	 */
 	while (!caught_signal);
 
+	if (caught_signal != SIGALRM) {
+		tst_res(TFAIL, "Received incorrect signal: %s",
+			tst_strsig(caught_signal));
+	}
+
 	caught_signal = 0;
 }
 
 static void sighandler(int sig)
 {
-	if (sig != SIGALRM)
-		tst_res(TFAIL, "Received incorrect signal: %d", sig);
-
-	caught_signal = 1;
+	caught_signal = sig;
 }
 
 static void setup(void)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
