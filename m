Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DC1007C7
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1E7D3C23E7
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5F5B33C18FE
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:14 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C2C801A008A3
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574089212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxpCu1Te7wN3c5pwsMKz5BjXPSX1uGgrdXO4StBaHSg=;
 b=cIwXd5Ai1sdcSWVa6mZtLLMxt1hDYSfaRue4o7Wm58r8ElRtcHZ1ebMMNtBtXae0IQugXD
 RMZaBI0WiJb8mERvkIS1/yNoNeJ2bP4AuMfPcEzP2iAhM5ZFwuORoCfTsbkMkdLt2bSn3+
 /35f5X26VBfEfDh2tF3cIHUlhFnH5uQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-4meSmLIMMISoC0KW2MZ45Q-1; Mon, 18 Nov 2019 10:00:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7096B1E33
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:09 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47A37646A6
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:09 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 18 Nov 2019 15:59:56 +0100
Message-Id: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
In-Reply-To: <cover.1574087532.git.jstancek@redhat.com>
References: <cover.1574087532.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 4meSmLIMMISoC0KW2MZ45Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] perf_event_open02: make do_work() run for
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
number of iterations. Set a timer and run for at least specified
time. We don't need fine accuracy, just some coarse runtime
across all systems. verify() function is using larger value to
get more precision for "ratio" calculation.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../syscalls/perf_event_open/perf_event_open02.c   | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 584487de8255..5891694eb894 100644
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
@@ -67,6 +68,7 @@ static struct tst_option options[] = {
 
 static int ntotal, nhw;
 static int tsk0 = -1, hwfd[MAX_CTRS], tskfd[MAX_CTRS];
+static int volatile work_done;
 
 static int perf_event_open(struct perf_event_attr *event, pid_t pid,
 	int cpu, int group_fd, unsigned long flags)
@@ -98,14 +100,34 @@ static void all_counters_set(int state)
 		tst_brk(TBROK | TERRNO, "prctl(%d) failed", state);
 }
 
-static void do_work(void)
+void alarm_handler(int sig LTP_ATTRIBUTE_UNUSED)
+{
+	work_done = 1;
+}
+
+static void do_work(int time_ms)
 {
 	int i;
+	struct sigaction sa;
+	struct itimerval val;
 
-	for (i = 0; i < LOOPS; ++i)
-		asm volatile (""::"g" (i));
-}
+	work_done = 0;
+	memset(&val, 0, sizeof(val));
+	val.it_value.tv_sec = time_ms / 1000;
+	val.it_value.tv_usec = (time_ms % 1000) * 1000;
 
+	sa.sa_handler = alarm_handler;
+	sa.sa_flags = SA_RESETHAND;
+	SAFE_SIGACTION(SIGALRM, &sa, NULL);
+
+	if (setitimer(ITIMER_REAL, &val, NULL))
+		tst_brk(TBROK | TERRNO, "setitimer");
+
+	while (!work_done) {
+		for (i = 0; i < 100000; ++i)
+			asm volatile (""::"g" (i));
+	}
+}
 
 #ifndef __s390__
 static int count_hardware_counters(void)
@@ -128,7 +150,7 @@ static int count_hardware_counters(void)
 		fdarry[i] = perf_event_open(&hw_event, 0, -1, -1, 0);
 
 		all_counters_set(PR_TASK_PERF_EVENTS_ENABLE);
-		do_work();
+		do_work(500);
 		all_counters_set(PR_TASK_PERF_EVENTS_DISABLE);
 
 		if (read(fdarry[i], &buf, sizeof(buf)) != sizeof(buf))
@@ -261,7 +283,7 @@ static void verify(void)
 	}
 
 	all_counters_set(PR_TASK_PERF_EVENTS_ENABLE);
-	do_work();
+	do_work(4000);
 	/* stop groups with hw counters first before tsk0 */
 	for (i = 0; i < ntotal; i++) {
 		ioctl(hwfd[i], PERF_EVENT_IOC_DISABLE);
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
