Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D041F1007C8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D4D13C078F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 59F5C3C2337
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:17 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C76AC1A01185
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574089215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aw5iBfUAgcGkSEvNlt+EADhDrokz6p6+D/HixO4ykQ4=;
 b=G45OWboAPEtWD+26N8tyvBJbapPp278Bs2VrrSBvbRKClLOg3hFzHP2LDHD34IcM8Mo1Kg
 nTI/7phqC219coOXuOXvDjje8dV6Km1Nykkk/YtZ/KRW75R3TolHfSBwgOmyndbbLSIRvP
 eSY2MFiUOdHWKJrewXymY60mkvwoFho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-hWGVjr7bOMyk_IB4MKWk1A-1; Mon, 18 Nov 2019 10:00:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733BF8E2474
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:12 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF21646DA
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:11 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 18 Nov 2019 15:59:57 +0100
Message-Id: <2d3bb4bc702e3fee3d356340a9384d68a4297f33.1574087532.git.jstancek@redhat.com>
In-Reply-To: <cover.1574087532.git.jstancek@redhat.com>
References: <cover.1574087532.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: hWGVjr7bOMyk_IB4MKWk1A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] perf_event_open02: workaround for Pentium4
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

perf_event_open02 has been observed to fail reliably on Pentium4,
because it detects wrong number of HW counters. This is because
time_enabled and time_running differ by a small value.

On Pentium4, p4_pmu_schedule_events() appears to be called repeatedly
for a group, for example when hwc pointer is being reused by different
cpu [1]. So, a group can fail to get scheduled on pmu on first attempt,
but *sched_in/*sched_out actions still happen. Event state changes
between ACTIVE/INACTIVE couple times, ctx->timestamp is updated as well.
Every time state changes a __perf_update_times() function is called,
which updates time_enabled and time_running. If state is INACTIVE,
only time_enabled is updated.

To workaround that, don't look at/compare absolute values. Instead
let process run for a bit and then look at increments. If both
are of same value, assume that no multiplexing happened and increase
"hwctrs" value.

Also always print time_enabled/time_running values. Number of HW
counters should be low and this data might come handy if a failure
is observed.

[1] 13beacee817d ("perf/x86/p4: Fix counter corruption when using lots of perf groups")

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../syscalls/perf_event_open/perf_event_open02.c   | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 5891694eb894..e89726dbcfdd 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -135,7 +135,7 @@ static int count_hardware_counters(void)
 	struct perf_event_attr hw_event;
 	int i, hwctrs = 0;
 	int fdarry[MAX_CTRS];
-	struct read_format buf;
+	struct read_format buf, buf2, diff;
 
 	memset(&hw_event, 0, sizeof(struct perf_event_attr));
 
@@ -151,16 +151,20 @@ static int count_hardware_counters(void)
 
 		all_counters_set(PR_TASK_PERF_EVENTS_ENABLE);
 		do_work(500);
+		if (read(fdarry[i], &buf, sizeof(buf)) != sizeof(buf))
+			tst_brk(TBROK | TERRNO, "error reading counter(s) #1");
+		do_work(500);
 		all_counters_set(PR_TASK_PERF_EVENTS_DISABLE);
+		if (read(fdarry[i], &buf2, sizeof(buf2)) != sizeof(buf2))
+			tst_brk(TBROK | TERRNO, "error reading counter(s) #2");
 
-		if (read(fdarry[i], &buf, sizeof(buf)) != sizeof(buf))
-			tst_brk(TBROK | TERRNO, "error reading counter(s)");
+		diff.value = buf2.value - buf.value;
+		diff.time_enabled = buf2.time_enabled - buf.time_enabled;
+		diff.time_running = buf2.time_running - buf.time_running;
 
-		if (verbose) {
-			tst_res(TINFO, "[%d] value:%lld time_enabled:%lld "
-			       "time_running:%lld", i, buf.value,
-			       buf.time_enabled, buf.time_running);
-		}
+		tst_res(TINFO, "[%d] value:%lld time_enabled:%lld "
+		       "time_running:%lld", i, diff.value,
+		       diff.time_enabled, diff.time_running);
 
 		/*
 		 * Normally time_enabled and time_running are the same value.
@@ -174,7 +178,7 @@ static int count_hardware_counters(void)
 		 * multiplexing happens and the number of the opened events
 		 * are the number of max available hardware counters.
 		 */
-		if (buf.time_enabled != buf.time_running) {
+		if (diff.time_enabled != diff.time_running) {
 			hwctrs = i;
 			break;
 		}
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
