Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB5105A4E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 20:21:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B2063C22C4
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 20:21:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 363CF3C1C8D
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 20:21:39 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 03972617614
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 20:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574364097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuJHaVrN5SoU0+j9cClz660o7GbbkQSjWbVUiqMNnbA=;
 b=P6wvRvgBCbrkEfuH5WaIEHvk/tyr2LIUKt9UI9+Jh5zmyX/P3r6+i24dZLcNKRx0y0PCo9
 JxNA5DN5R+T/Iwn3Hz30kEHpZLFCs3odVrns/88p7whNl8pOY/CuIeHAMlKhpOxb1z4/S8
 +5irTaqFHKAw3HQCEnCnLCrWMhEsQ58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-mB-IsubGOxOgI-GErFfu3w-1; Thu, 21 Nov 2019 14:21:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98EEF801E58;
 Thu, 21 Nov 2019 19:21:32 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C24F6FEE5;
 Thu, 21 Nov 2019 19:21:31 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Thu, 21 Nov 2019 20:21:23 +0100
Message-Id: <219b1b89de51fda28a0af02f6b15e6da8c73ab7c.1574363475.git.jstancek@redhat.com>
In-Reply-To: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
References: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: mB-IsubGOxOgI-GErFfu3w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] perf_event_open02: make do_work() run for
 specified time
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

do_work() runtime varies a lot, because it's based on a fixed
number of iterations. Use a timer and measure how many iterations
are needed to run for specified time. We don't need fine accuracy,
just some coarse runtime across all systems. verify() function is
using larger value to get more precision for "ratio" calculation.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../syscalls/perf_event_open/perf_event_open02.c   | 52 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 7 deletions(-)

Notes for v2
--------------

Problem with v1 is that it hangs on -rt kernel. With FIFO scheduling
signal handler never runs and there's nothing to stop do_work().
Adding sched_yield() to periodically call in do_work() is problem too,
because test spends more time in kernel and it breaks the expectation
for 'ratio'.

So in v2, use timer only to estimate number of (100 thousands) loops
needed to run for specified time. Actual test will use the estimated
number (or multiple of it).

Tested with: 5.3.0-0.rc6.git0.1.fc31.x86_64
	     4.18.0-143.el8.x86_64
	     4.18.0-147.rt24.93.el8.x86_64

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 2f0caab56c08..87ed7f3d4abe 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -31,12 +31,14 @@
 #include <errno.h>
 #include <inttypes.h>
 #include <sched.h>
+#include <signal.h>
 #include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <sys/prctl.h>
+#include <sys/time.h>
 #include <sys/types.h>
 
 #include "config.h"
@@ -49,7 +51,6 @@
 #include <linux/perf_event.h>
 
 #define MAX_CTRS	1000
-#define LOOPS		100000000
 
 struct read_format {
 	unsigned long long value;
@@ -67,6 +68,8 @@ static struct tst_option options[] = {
 
 static int ntotal, nhw;
 static int tsk0 = -1, hwfd[MAX_CTRS], tskfd[MAX_CTRS];
+static int volatile work_done;
+static unsigned int est_loops;
 
 static int perf_event_open(struct perf_event_attr *event, pid_t pid,
 	int cpu, int group_fd, unsigned long flags)
@@ -98,14 +101,47 @@ static void all_counters_set(int state)
 		tst_brk(TBROK | TERRNO, "prctl(%d) failed", state);
 }
 
-static void do_work(void)
+static void alarm_handler(int sig LTP_ATTRIBUTE_UNUSED)
 {
-	int i;
+	work_done = 1;
+}
+
+static void bench_work(int time_ms)
+{
+	unsigned int i;
+	struct itimerval val;
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = alarm_handler;
+	sa.sa_flags = SA_RESETHAND;
+	SAFE_SIGACTION(SIGALRM, &sa, NULL);
+
+	work_done = 0;
+	memset(&val, 0, sizeof(val));
+	val.it_value.tv_sec = time_ms / 1000;
+	val.it_value.tv_usec = (time_ms % 1000) * 1000;
+
+	if (setitimer(ITIMER_REAL, &val, NULL))
+		tst_brk(TBROK | TERRNO, "setitimer");
+
+	while (!work_done) {
+		for (i = 0; i < 100000; ++i)
+			asm volatile (""::"g" (i));
+		est_loops++;
+	}
 
-	for (i = 0; i < LOOPS; ++i)
-		asm volatile (""::"g" (i));
+	tst_res(TINFO, "bench_work estimated loops = %u in %d ms", est_loops, time_ms);
 }
 
+static void do_work(int mult)
+{
+	unsigned long i, j, loops = mult * est_loops;
+
+	for (j = 0; j < loops; j++)
+		for (i = 0; i < 100000; i++)
+			asm volatile (""::"g" (i));
+}
 
 #ifndef __s390__
 static int count_hardware_counters(void)
@@ -128,7 +164,7 @@ static int count_hardware_counters(void)
 		fdarry[i] = perf_event_open(&hw_event, 0, -1, -1, 0);
 
 		all_counters_set(PR_TASK_PERF_EVENTS_ENABLE);
-		do_work();
+		do_work(1);
 		all_counters_set(PR_TASK_PERF_EVENTS_DISABLE);
 
 		if (read(fdarry[i], &buf, sizeof(buf)) != sizeof(buf))
@@ -195,6 +231,8 @@ static void setup(void)
 		tskfd[i] = -1;
 	}
 
+	bench_work(500);
+
 	/*
 	 * According to perf_event_open's manpage, the official way of
 	 * knowing if perf_event_open() support is enabled is checking for
@@ -268,7 +306,7 @@ static void verify(void)
 	}
 
 	all_counters_set(PR_TASK_PERF_EVENTS_ENABLE);
-	do_work();
+	do_work(8);
 	/* stop groups with hw counters first before tsk0 */
 	for (i = 0; i < ntotal; i++) {
 		ioctl(hwfd[i], PERF_EVENT_IOC_DISABLE);
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
