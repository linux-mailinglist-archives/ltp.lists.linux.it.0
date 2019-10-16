Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB51D8F54
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:24:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B3073C22BC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:24:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5352A3C2214
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:24:53 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1417600D6D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:24:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 610BE307D90E
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 11:24:51 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B38C15C1D6;
 Wed, 16 Oct 2019 11:24:50 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 13:24:44 +0200
Message-Id: <9c5134dc4b39f870f6e6cfab55c193f05b204b78.1571225074.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 16 Oct 2019 11:24:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] perf_event_open02: stop groups with hw counters
 first
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

Nick reports that prctl(PR_TASK_PERF_EVENTS_DISABLE) doesn't stop tsk0
as last one, which sometimes causes test to fail, because of way test
calculates 'ratio' value and very low tolerance.

Looking at implementation, prctl() walks the list and does appear to
disable events in order they were created (tsk0 first).

Stop groups with hw counters before tsk0.

ratio     Before        After
mean      4.99921       4.99871
stdev     0.00006315    0.0000746

Fixes: #588
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/perf_event_open/perf_event_open02.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
index 95e30519fe42..1cfe29bb3d8a 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
@@ -324,6 +324,12 @@ static void verify(void)
 
 	do_work();
 
+	/* stop groups with hw counters first before tsk0 */
+	for (i = 0; i < n; i++) {
+		ioctl(hwfd[i], PERF_EVENT_IOC_DISABLE);
+		ioctl(tskfd[i], PERF_EVENT_IOC_DISABLE);
+	}
+
 	if (prctl(PR_TASK_PERF_EVENTS_DISABLE) == -1) {
 		tst_brkm(TBROK | TERRNO, cleanup,
 			 "prctl(PR_TASK_PERF_EVENTS_DISABLE) failed");
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
