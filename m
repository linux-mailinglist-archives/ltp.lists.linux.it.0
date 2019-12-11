Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9111AB0F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 13:37:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 905FD3C1CA2
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 13:37:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E17A43C18F7
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 13:37:27 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 534DE6005D7
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 13:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576067845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bwzV0W9lR8GpNbqWsQgBtDujlctSFPirUqsfzr//Y3Q=;
 b=BSl7BF8MCZE07zw1hfnMnxPjSTDi9kIsn7pr/mMbyD+9o5cbLEMpBs6B6B+sltLH/VsjXS
 A/DZrctFcVo1UGd08zM6aWKgMFC4SdgHIGtM7Czki/4Q/FCJRbAA9X9Q4qsd6OK5kW0tVR
 03IkADR7EQqrVb9iQt8ktyRagPM9yRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-mF8tlbo7Pzyj7MK1SeGnEQ-1; Wed, 11 Dec 2019 07:37:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63AE61883527;
 Wed, 11 Dec 2019 12:37:21 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B684D63BA9;
 Wed, 11 Dec 2019 12:37:20 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 11 Dec 2019 13:37:14 +0100
Message-Id: <ebbe6cc68c39a619b6ea4a1e217c52c5d3e8b525.1576067278.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mF8tlbo7Pzyj7MK1SeGnEQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] futex_cmp_requeue01: cope with spurious wakeups
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

There are couple problems:

1. Keeping same uaddr1 value across requeue leads to a side-effect.
If there is a signal or spurious wakeup, futex_wait() operation can
be restarted (by kernel) with same input parameters. Which means that
process requeued for uaddr2, goes back to queueing for uaddr1. Such
use case is currently not valid as it is expected that uaddr1 value
changes, so that any late waiter can notice it and goes back with
-EWOULDBLOCK (-EAGAIN).

2. Test doesn't expect possibility of spurious wakeups, which can
impact how many processes end up on futex0/futex1.

Change futex value before requeue, so child processes can observe
spurious wakeups.

Change child process, such that it always sleeps, to guarantee that
TST_PROCESS_STATE_WAIT() will always succeed finding it.

Change default timeout to 5 seconds. Spawning 1000 process on slower
systems was getting close to 1 second. This doesn't affect runtime in
PASS-ing case.

Count spurious wakeups and relax test conditions which can be affected.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/futex/futex_cmp_requeue01.c    | 128 ++++++++++++++++-----
 1 file changed, 100 insertions(+), 28 deletions(-)

Changes in v3:
- following the discussion, check also lower limits of requeued
  and woken up processes.
  Expected range for num_requeues is:
    (tc->set_requeues - spurious, tc->set_requeues)
  Expected range for woken up processes is:
    (tc->set_wakes - spurious, tc->set_wakes + spurious)

diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
index f5264c2ba26f..a2e899b8d441 100644
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
@@ -19,7 +19,14 @@
 #include "tst_test.h"
 #include "futextest.h"
 
-static futex_t *futexes;
+struct shared_data {
+	futex_t futexes[2];
+	int spurious;
+	int test_done;
+};
+
+static struct shared_data *sd;
+static int max_sleep_ms;
 
 static struct tcase {
 	int num_waiters;
@@ -37,24 +44,42 @@ static struct tcase {
 
 static void do_child(void)
 {
-	struct timespec usec = tst_ms_to_timespec(2000);
+	int slept_for_ms = 0;
+	struct timespec usec = tst_ms_to_timespec(max_sleep_ms);
 	int pid = getpid();
+	int ret = 0;
+
+	if (futex_wait(&sd->futexes[0], sd->futexes[0], &usec, 0) == -1) {
+		if (errno == EAGAIN) {
+			/* spurious wakeup or signal */
+			tst_atomic_inc(&sd->spurious);
+		} else {
+			tst_res(TFAIL | TERRNO, "process %d wasn't woken up",
+				pid);
+			ret = 1;
+		}
+	}
 
-	if (!futex_wait(&futexes[0], futexes[0], &usec, 0))
-		exit(0);
+	/* make sure TST_PROCESS_STATE_WAIT() can always succeed */
+	while (!tst_atomic_load(&sd->test_done)
+		&& (slept_for_ms < max_sleep_ms)) {
+		usleep(50000);
+		slept_for_ms += 50;
+	}
 
-	tst_res(TINFO | TERRNO, "process %d wasn't woken up", pid);
-	exit(1);
+	exit(ret);
 }
 
 static void verify_futex_cmp_requeue(unsigned int n)
 {
 	int num_requeues = 0, num_waits = 0, num_total = 0;
-	int i, status;
+	int i, status, spurious, woken_up;
 	struct tcase *tc = &tcases[n];
 	int pid[tc->num_waiters];
 	int exp_ret = tc->set_wakes + tc->set_requeues;
 
+	tst_atomic_store(0, &sd->spurious);
+	tst_atomic_store(0, &sd->test_done);
 	for (i = 0; i < tc->num_waiters; i++) {
 		pid[i] = SAFE_FORK();
 		if (!pid[i])
@@ -64,61 +89,108 @@ static void verify_futex_cmp_requeue(unsigned int n)
 	for (i = 0; i < tc->num_waiters; i++)
 		TST_PROCESS_STATE_WAIT(pid[i], 'S');
 
-	TEST(futex_cmp_requeue(&futexes[0], futexes[0], &futexes[1],
-	     tc->set_wakes, tc->set_requeues, 0));
-	if (TST_RET != exp_ret) {
-		tst_res(TFAIL, "futex_cmp_requeue() returned %ld, expected %d",
+	tst_res(TINFO, "Test %d: waiters: %d, wakes: %d, requeues: %d",
+		n, tc->num_waiters, tc->set_wakes, tc->set_requeues);
+
+	/*
+	 * change futex value, so any spurious wakeups or signals after
+	 * this point get bounced back to userspace.
+	 */
+	sd->futexes[0]++;
+	sd->futexes[1]++;
+
+	/*
+	 * Wakes up a maximum of tc->set_wakes waiters. tc->set_requeues
+	 * specifies an upper limit on the number of waiters that are requeued.
+	 * Returns the total number of waiters that were woken up or requeued.
+	 */
+	TEST(futex_cmp_requeue(&sd->futexes[0], sd->futexes[0], &sd->futexes[1],
+		tc->set_wakes, tc->set_requeues, 0));
+
+	/* Fail if more than requested wakes + requeues were returned */
+	if (TST_RET > exp_ret) {
+		tst_res(TFAIL, "futex_cmp_requeue() returned %ld, expected <= %d",
 			TST_RET, exp_ret);
+	} else {
+		tst_res(TINFO, "futex_cmp_requeue() returned %ld", TST_RET);
 	}
 
-	num_requeues = futex_wake(&futexes[1], tc->num_waiters, 0);
-	num_waits = futex_wake(&futexes[0], tc->num_waiters, 0);
+	num_requeues = futex_wake(&sd->futexes[1], tc->num_waiters, 0);
+	num_waits = futex_wake(&sd->futexes[0], tc->num_waiters, 0);
 
+	tst_atomic_store(1, &sd->test_done);
 	for (i = 0; i < tc->num_waiters; i++) {
 		SAFE_WAITPID(pid[i], &status, 0);
 		if (WIFEXITED(status) && !WEXITSTATUS(status))
 			num_total++;
 	}
 
+	spurious = tst_atomic_load(&sd->spurious);
+	tst_res(TINFO, "children woken, futex0: %d, futex1: %d, "
+		"spurious wakeups: %d",
+		num_waits, num_requeues, spurious);
+
+	/* Fail if any waiter timed out */
 	if (num_total != tc->num_waiters) {
 		tst_res(TFAIL, "%d waiters were not woken up normally",
 			tc->num_waiters - num_total);
 		return;
 	}
 
-	if (num_requeues != tc->set_requeues) {
+	/*
+	 * num_requeues should be in range:
+	 *     (tc->set_requeues - spurious, tc->set_requeues)
+	 *
+	 * Fewer processes than requested can be requeued at futex1
+	 * if some woke up spuriously. Finding more processes than
+	 * requested at futex1 is always a failure.
+	 */
+	if ((num_requeues < tc->set_requeues - spurious)
+		|| (num_requeues > tc->set_requeues)) {
 		tst_res(TFAIL,
-			"futex_cmp_requeue() requeues %d waiters, expected %d",
-			num_requeues, tc->set_requeues);
+			"requeued %d waiters, expected range: (%d, %d)",
+			num_requeues, tc->set_requeues - spurious,
+			tc->set_requeues);
 		return;
 	}
 
-	if (tc->num_waiters - num_requeues - num_waits != tc->set_wakes) {
+	/*
+	 * woken_up = (TST_RET - num_requeues) should be in range:
+	 *     (tc->set_wakes - spurious, tc->set_wakes + spurious)
+	 *
+	 * Fewer processes than requested can be woken up, if some of
+	 * them woke up spuriously before requeue. More processes than
+	 * requested may appear to be woken up, if some woke up
+	 * spuriously after requeue.
+	 */
+	woken_up = TST_RET - num_requeues;
+	if ((woken_up < tc->set_wakes - spurious)
+		|| (woken_up > tc->set_wakes + spurious)) {
 		tst_res(TFAIL,
-			"futex_cmp_requeue() woke up %d waiters, expected %d",
-			tc->num_waiters - num_requeues - num_waits,
-			tc->set_wakes);
+			"woken up %d, expected range (%d, %d)",
+			woken_up, tc->set_wakes - spurious,
+			tc->set_wakes + spurious);
 		return;
 	}
 
-	tst_res(TPASS,
-		"futex_cmp_requeue() woke up %d waiters and requeued %d waiters",
-		tc->set_wakes, tc->set_requeues);
+	tst_res(TPASS, "futex_cmp_requeue()");
 }
 
 static void setup(void)
 {
-	futexes = SAFE_MMAP(NULL, sizeof(futex_t) * 2, PROT_READ | PROT_WRITE,
+	max_sleep_ms = tst_multiply_timeout(5000);
+
+	sd = SAFE_MMAP(NULL, sizeof(*sd), PROT_READ | PROT_WRITE,
 			    MAP_ANONYMOUS | MAP_SHARED, -1, 0);
 
-	futexes[0] = FUTEX_INITIALIZER;
-	futexes[1] = FUTEX_INITIALIZER + 1;
+	sd->futexes[0] = FUTEX_INITIALIZER;
+	sd->futexes[1] = FUTEX_INITIALIZER + 1000;
 }
 
 static void cleanup(void)
 {
-	if (futexes)
-		SAFE_MUNMAP((void *)futexes, sizeof(futex_t) * 2);
+	if (sd)
+		SAFE_MUNMAP((void *)sd, sizeof(*sd));
 }
 
 static struct tst_test test = {
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
