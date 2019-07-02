Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F575D1ED
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 16:41:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4725C3C1D97
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 16:41:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4EF873C1D54
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 16:41:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 760D910002B2
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 16:41:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCB73B88A;
 Tue,  2 Jul 2019 14:41:30 +0000 (UTC)
Date: Tue, 2 Jul 2019 16:41:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20190702144129.GA20468@rei.lan>
References: <1561114271-8351-1-git-send-email-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561114271-8351-1-git-send-email-ice_yangxiao@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/futex_cmp_requeue01.c: Add new
 test
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
Pushed with following changes, thanks.

There was no point to repeat the numbers in the test structure three
times, so I simplified the code with:

diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
index cdd59a15c..f5264c2ba 100644
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
@@ -25,17 +25,14 @@ static struct tcase {
 	int num_waiters;
 	int set_wakes;
 	int set_requeues;
-	int exp_ret;
-	int exp_wakes;
-	int exp_requeues;
 } tcases[] = {
-	{10, 3, 7, 10, 3, 7},
-	{10, 0, 10, 10, 0, 10},
-	{10, 2, 6, 8, 2, 6},
-	{100, 50, 50, 100, 50, 50},
-	{100, 0, 70, 70, 0, 70},
-	{1000, 100, 900, 1000, 100, 900},
-	{1000, 300, 500, 800, 300, 500},
+	{10, 3, 7},
+	{10, 0, 10},
+	{10, 2, 6},
+	{100, 50, 50},
+	{100, 0, 70},
+	{1000, 100, 900},
+	{1000, 300, 500},
 };
 
 static void do_child(void)
@@ -56,6 +53,7 @@ static void verify_futex_cmp_requeue(unsigned int n)
 	int i, status;
 	struct tcase *tc = &tcases[n];
 	int pid[tc->num_waiters];
+	int exp_ret = tc->set_wakes + tc->set_requeues;
 
 	for (i = 0; i < tc->num_waiters; i++) {
 		pid[i] = SAFE_FORK();
@@ -68,9 +66,9 @@ static void verify_futex_cmp_requeue(unsigned int n)
 
 	TEST(futex_cmp_requeue(&futexes[0], futexes[0], &futexes[1],
 	     tc->set_wakes, tc->set_requeues, 0));
-	if (TST_RET != tc->exp_ret) {
+	if (TST_RET != exp_ret) {
 		tst_res(TFAIL, "futex_cmp_requeue() returned %ld, expected %d",
-			TST_RET, tc->exp_ret);
+			TST_RET, exp_ret);
 	}
 
 	num_requeues = futex_wake(&futexes[1], tc->num_waiters, 0);
@@ -88,24 +86,24 @@ static void verify_futex_cmp_requeue(unsigned int n)
 		return;
 	}
 
-	if (num_requeues != tc->exp_requeues) {
+	if (num_requeues != tc->set_requeues) {
 		tst_res(TFAIL,
 			"futex_cmp_requeue() requeues %d waiters, expected %d",
-			num_requeues, tc->exp_requeues);
+			num_requeues, tc->set_requeues);
 		return;
 	}
 
-	if (tc->num_waiters - num_requeues - num_waits != tc->exp_wakes) {
+	if (tc->num_waiters - num_requeues - num_waits != tc->set_wakes) {
 		tst_res(TFAIL,
 			"futex_cmp_requeue() woke up %d waiters, expected %d",
 			tc->num_waiters - num_requeues - num_waits,
-			tc->exp_wakes);
+			tc->set_wakes);
 		return;
 	}
 
 	tst_res(TPASS,
 		"futex_cmp_requeue() woke up %d waiters and requeued %d waiters",
-		tc->exp_wakes, tc->exp_requeues);
+		tc->set_wakes, tc->set_requeues);
 }
 
 static void setup(void)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
