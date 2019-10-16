Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8424D8CEF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 11:51:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C37083C22AC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 11:51:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 90EA63C1865
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 11:51:37 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CBF8A1A00F20
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 11:51:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D388F300D20C;
 Wed, 16 Oct 2019 09:51:34 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6225D70D;
 Wed, 16 Oct 2019 09:51:33 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 11:51:30 +0200
Message-Id: <81c89bbde27ede0ef4291df60186bdcd293a3db5.1571219422.git.jstancek@redhat.com>
In-Reply-To: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
References: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 16 Oct 2019 09:51:35 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] timer_getoverrun/2-3: increase tolerance for overshoot
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
Cc: joerg.vehlow@aox-tech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Joerg reports that test fails on systems with low timer precision (qemu-arm64,
4ms timer precision) due to way we calculate maximum number of overruns.
If the expected overruns is less than 200, there is no tollerance.

Allow up to ~50ms of extra overruns.

Reported-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Acked-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../conformance/interfaces/timer_getoverrun/2-3.c             | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
index 96b7d01e6ffe..66f8b583a5a6 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
@@ -94,11 +94,17 @@ int main(void)
 
 	valuensec = tsres.tv_nsec;
 	intervalnsec = 2 * valuensec;
-	//expectedoverruns = (1000000000 - valuensec) / intervalnsec;
 	expectedoverruns = 1000000000 / intervalnsec - 1;
 
+	/*
+	 * waking up from sleep isn't instant, we can overshoot.
+	 * Allow up to ~50ms worth of extra overruns.
+	 */
+	fudge = 50000000 / intervalnsec + 1;
+
 	printf("value = %d sec, interval = %d nsec, "
-	       "expected overruns = %d\n", 1, intervalnsec, expectedoverruns);
+	       "expected overruns = %d, fudge = %d\n", 1,
+	       intervalnsec, expectedoverruns, fudge);
 
 	its.it_interval.tv_sec = 0;
 	its.it_interval.tv_nsec = intervalnsec;
@@ -146,7 +152,6 @@ int main(void)
 	 * extra expiries after the nanosleep completes so do
 	 * a range check.
 	 */
-	fudge = expectedoverruns / 100;
 	if (overruns >= expectedoverruns && overruns < expectedoverruns + fudge) {
 		printf("Test PASSED\n");
 		return PTS_PASS;
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
