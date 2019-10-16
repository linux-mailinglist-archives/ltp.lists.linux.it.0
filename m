Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2DAD8F58
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:25:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42B653C2214
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:25:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7E54B3C22BC
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:24:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B8D4A2010B1
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:24:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3EBD2308FE8F
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 11:24:54 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92AC45C1D8;
 Wed, 16 Oct 2019 11:24:53 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 13:24:45 +0200
Message-Id: <51dce875f4ad2c234031101cd5c7a85eace53caa.1571225074.git.jstancek@redhat.com>
In-Reply-To: <9c5134dc4b39f870f6e6cfab55c193f05b204b78.1571225074.git.jstancek@redhat.com>
References: <9c5134dc4b39f870f6e6cfab55c193f05b204b78.1571225074.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 16 Oct 2019 11:24:54 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] perf_event_open02: make test more reliable on -rt
 kernels
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
Cc: jlelli@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test is failing on -rt kernels quite reliably as reported here:
  https://lkml.org/lkml/2019/8/14/714

Suspected cause is extra time spend in scheduler, which counts towards
test process hw counters.

Pin test process to single CPU (doesn't matter which one) to lessen
effects from scheduling:

ratio     Before        After
mean      5.02582       4.99844
stdev     0.0090435     0.0000272
          95+% FAIL     100% PASS

Tested with "perf_event_open02: stop groups with hw counters first" patch
on RHEL8 kernel-rt 4.18.0-147.rt24.93.el8.x86_64 (HP dl380g7).

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/perf_event_open/perf_event_open02.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 1cfe29bb3d8a..6fc6f4afa119 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -52,6 +52,7 @@ Usage is: ./performance_counter02  [-v]
 The -v flag makes it print out the values of each counter.
 */
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stddef.h>
 #include <stdlib.h>
@@ -222,6 +223,20 @@ static void setup(void)
 	int i;
 	struct perf_event_attr tsk_event, hw_event;
 
+#ifdef HAVE_SCHED_GETCPU
+	cpu_set_t mask;
+	int cpu = sched_getcpu();
+
+	if (cpu == -1)
+		tst_brkm(TBROK | TERRNO, NULL, "sched_getcpu() failed");
+
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+
+	if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)
+		tst_brkm(TBROK | TERRNO, NULL, "sched_setaffinity() failed");
+#endif
+
 	/*
 	 * According to perf_event_open's manpage, the official way of
 	 * knowing if perf_event_open() support is enabled is checking for
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
