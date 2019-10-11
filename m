Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8102D38B2
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 07:31:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC27A3C2207
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 07:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1130E3C1410
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 07:31:42 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DA5C42009E0
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 07:31:41 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 097109F66F;
 Fri, 11 Oct 2019 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570771900; bh=8VQpyL7LqoZ8hHKMYcnH0Uyc3TauPFCc85aZGaZdkok=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=b+OedWc3KzCfEEXglQxGxNwEgfiGhkxxPSe8QWTIFH3uCMQTeZJKeKbeCE0q34Ch8
 Q3oFRW6/9VXvBYv3aePtardxaww9tmc5Xpi7I92pmUkSwKwB0VmR6F+gns4t5EsaLZ
 2JtdHBOm1ZB2APHAdm5/Ef4O74f9gTWuqVNPhfs8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 07:31:34 +0200
Message-Id: <20191011053134.18416-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] open_posix/timer_getoverrun/2-3: Fix test for systems
 with low timer precision
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

On systems with low timer precision the test always fails, because the allowed
maximum number of overruns is calculated from the expected overruns + 10%.
If the expected overruns is less than 200, there is no tollerance.
This happens, if the precision of the timer is less than or equal to 4ms.
E.g. qemu-arm64 without high resolution timer the accuracy is only 4ms.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/timer_getoverrun/2-3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
index 96b7d01e6..3df3a9f01 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
@@ -55,6 +55,7 @@ int main(void)
 	int overruns;
 	int valuensec, intervalnsec, expectedoverruns;
 	int fudge;
+	int duration;
 
 	if (sigemptyset(&set) != 0) {
 		perror("sigemptyset() did not return success\n");
@@ -94,11 +95,15 @@ int main(void)
 
 	valuensec = tsres.tv_nsec;
 	intervalnsec = 2 * valuensec;
-	//expectedoverruns = (1000000000 - valuensec) / intervalnsec;
-	expectedoverruns = 1000000000 / intervalnsec - 1;
+	expectedoverruns = 0;
+	duration = 0;
+	while (expectedoverruns < 1000) {
+		duration++;
+		expectedoverruns = duration * (1000000000 / intervalnsec - 1);
+	}
 
-	printf("value = %d sec, interval = %d nsec, "
-	       "expected overruns = %d\n", 1, intervalnsec, expectedoverruns);
+	printf("duration = %d sec, interval = %d nsec, "
+	       "expected overruns = %d\n", duration, intervalnsec, expectedoverruns);
 
 	its.it_interval.tv_sec = 0;
 	its.it_interval.tv_nsec = intervalnsec;
@@ -113,7 +118,7 @@ int main(void)
 	}
 	//tssleep.tv_nsec = valuensec + (expectedoverruns*intervalnsec);
 	tssleep.tv_nsec = 0;
-	tssleep.tv_sec = 2;
+	tssleep.tv_sec = duration + 1;
 	if (nanosleep(&tssleep, NULL) != 0) {
 		perror("nanosleep() did not return success\n");
 		return PTS_UNRESOLVED;
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
