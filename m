Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09FD934F
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:06:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 394513C2212
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:06:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4D7FA3C220D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:06:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 98C321A0122B
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:06:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C212307C645;
 Wed, 16 Oct 2019 14:06:02 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4837960852;
 Wed, 16 Oct 2019 14:06:01 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 16:05:54 +0200
Message-Id: <94fbf60008417c187c1d9b4640d84af6c25afa29.1571234702.git.jstancek@redhat.com>
In-Reply-To: <1321370412.6455436.1571229760838.JavaMail.zimbra@redhat.com>
References: <1321370412.6455436.1571229760838.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 16 Oct 2019 14:06:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] perf_event_open02: make test more reliable on -rt
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
 .../syscalls/perf_event_open/perf_event_open02.c      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 1cfe29bb3d8a..c2831aa20d40 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -52,6 +52,7 @@ Usage is: ./performance_counter02  [-v]
 The -v flag makes it print out the values of each counter.
 */
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stddef.h>
 #include <stdlib.h>
@@ -72,6 +73,7 @@ The -v flag makes it print out the values of each counter.
 
 #include "test.h"
 #include "safe_macros.h"
+#include "lapi/cpuset.h"
 #include "lapi/syscalls.h"
 
 char *TCID = "perf_event_open02";
@@ -222,6 +224,23 @@ static void setup(void)
 	int i;
 	struct perf_event_attr tsk_event, hw_event;
 
+#ifdef HAVE_SCHED_GETCPU
+	int cpu = sched_getcpu();
+	size_t mask_size;
+	cpu_set_t *mask;
+
+	if (cpu == -1)
+		tst_brkm(TBROK | TERRNO, NULL, "sched_getcpu() failed");
+
+	mask = CPU_ALLOC(cpu + 1);
+	mask_size = CPU_ALLOC_SIZE(cpu + 1);
+	CPU_ZERO_S(mask_size, mask);
+	CPU_SET(cpu, mask);
+	if (sched_setaffinity(0, mask_size, mask) == -1)
+		tst_brkm(TBROK | TERRNO, NULL, "sched_setaffinity() failed");
+	CPU_FREE(mask);
+#endif
+
 	/*
 	 * According to perf_event_open's manpage, the official way of
 	 * knowing if perf_event_open() support is enabled is checking for
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
