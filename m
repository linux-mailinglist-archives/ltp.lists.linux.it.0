Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAB2F9190
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:09:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DA993C2600
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:09:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6F37D3C25F5
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:09:00 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 67F27602749
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573567736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tybAkRJem05W8GffdgUjzwbL7kbi7TkewJq6dDKk8Dc=;
 b=O4dXYoQQSC2Swfcy3uwcWaaoySG2h2wNU8DJopCahg7+J805PHaVoPr+uaBTpQC8wrCcwH
 +5zgy/pIeHqcFZN48jeFnojuTh8WWb4gDZJ3nFjArNQlOfnIkE8NlVeEn3IiGNHM7ovNg2
 M2nVuzkSZSmPW+p5+Exl1TvLK63MEOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-lpcv_6aAO3iaEfqD08zdog-1; Tue, 12 Nov 2019 09:08:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31CA3800686
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 14:08:54 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8FE5E1AD
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 14:08:53 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 12 Nov 2019 15:08:45 +0100
Message-Id: <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
In-Reply-To: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lpcv_6aAO3iaEfqD08zdog-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] futex_cmp_requeue01: fix test expectations
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

2. Test doesn't expect possibility of spurious wakeups.

3. Test is expecting to get exact values of woken/requeued processes.
Man page wording like "at most" or "maximum of" does not guarantee
exact numbers.

Change futex value before requeue, so child processes can observe
spurious wakeups.

Change child process, such that it always sleeps, to guarantee that
TST_PROCESS_STATE_WAIT() will always succeed finding sleeping process.

Change default timeout to 5 seconds. Spawning 1000 process on slower
systems was getting close to 1 second. This doesn't affect runtime in
PASS-ing case.

Change checks such that they reflect wording in man page, and don't
test for absolute values (see comments in code). One exception is
that we assume futex_wake(tc->num_waiters) will always wake up all
remaining processes.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/futex/futex_cmp_requeue01.c    | 105 +++++++++++++++------
 1 file changed, 78 insertions(+), 27 deletions(-)

v2 changes:
- use tst_multiply_timeout()
- remove tst_atomic_store from loop
- shared variables moved to single struct

diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
index f5264c2ba26f..1711861ef298 100644
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
@@ -37,14 +44,30 @@ static struct tcase {
 
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
@@ -55,6 +78,8 @@ static void verify_futex_cmp_requeue(unsigned int n)
 	int pid[tc->num_waiters];
 	int exp_ret = tc->set_wakes + tc->set_requeues;
 
+	tst_atomic_store(0, &sd->spurious);
+	tst_atomic_store(0, &sd->test_done);
 	for (i = 0; i < tc->num_waiters; i++) {
 		pid[i] = SAFE_FORK();
 		if (!pid[i])
@@ -64,61 +89,87 @@ static void verify_futex_cmp_requeue(unsigned int n)
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
 
+	tst_res(TINFO, "children woken, futex0: %d, futex1: %d, "
+		"spurious wakeups: %d",
+		num_waits, num_requeues, tst_atomic_load(&sd->spurious));
+
+	/* Fail if any waiter timed out */
 	if (num_total != tc->num_waiters) {
 		tst_res(TFAIL, "%d waiters were not woken up normally",
 			tc->num_waiters - num_total);
 		return;
 	}
 
-	if (num_requeues != tc->set_requeues) {
+	/* Fail if more than upper limit of tc->set_requeues is at futex1 */
+	if (num_requeues > tc->set_requeues) {
 		tst_res(TFAIL,
-			"futex_cmp_requeue() requeues %d waiters, expected %d",
+			"requeued %d waiters, expected <= %d",
 			num_requeues, tc->set_requeues);
 		return;
 	}
 
-	if (tc->num_waiters - num_requeues - num_waits != tc->set_wakes) {
-		tst_res(TFAIL,
-			"futex_cmp_requeue() woke up %d waiters, expected %d",
-			tc->num_waiters - num_requeues - num_waits,
-			tc->set_wakes);
+	/* Fail if more than tc->set_wakes were woken up by requeue */
+	exp_ret = tc->num_waiters - TST_RET - tst_atomic_load(&sd->spurious);
+	if (num_waits < exp_ret) {
+		tst_res(TFAIL, "woken up %d on futex0, expected >= %d",
+			num_waits, exp_ret);
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
