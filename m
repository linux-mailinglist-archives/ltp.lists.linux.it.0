Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729F43131F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Oct 2021 11:17:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7050E3C2A9C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Oct 2021 11:17:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D03083C0CB6
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 11:17:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2BEEB1400042
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 11:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E4OL3Z+DrDqZ2bG76BqfZsPBXpnyyp6jCMhrib6K0e0=;
 b=b1eEOcBEx0AgO72hjDBdnyHwSy7m0LPqJ2pXwO7gNkXrA/kIvI62/uw1sucN/RiEKUx24P
 Pgz0ufOrz+RxNnZU7mQt+n+A+Ouo+a0XIKOUy8k4z8XW+JfM2kOk98yz8tNCXPRhdsQnbO
 EwumJG8hgxOpQCIzGsEYvFyftwLZpyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-L_cwfgjhPw-nyuiGUeiZ0Q-1; Mon, 18 Oct 2021 05:17:52 -0400
X-MC-Unique: L_cwfgjhPw-nyuiGUeiZ0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6069B1023F4E
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 09:17:51 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAC1D100EA05
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 09:17:50 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 18 Oct 2021 11:17:24 +0200
Message-Id: <ddffbf17d3b5fd2d7812a18435d5cc49b848de8d.1634548566.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] open_posix/conformance/clock/1.1: check PASS
 condition periodically
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP commit 61312c62a392 ("open_posix/conformance/clock/1.1:
Deterministic timing") changed test to busy loop for 5 seconds.
This made the test sometimes fail in environments with high steal
time.

Move PASS condition inside loop, so in ideal case test can finish
as soon as it has spent >1 sec of CPU time. Also drop the wrap-around
check, since that takes order of minutes to happen.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../conformance/interfaces/clock/1-1.c        | 49 +++++++------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
index 384be0648f0b..e255720df6b1 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
@@ -20,45 +20,32 @@
 #include <time.h>
 #include "posixtest.h"
 
-#define BUSY_LOOP_SECONDS 5
+#define MAX_RUNTIME_SECONDS 15
 
 int main(void)
 {
 	clock_t c1, c2;
 	double sec1, sec2;
-	time_t end;
+	time_t end = time(NULL) + MAX_RUNTIME_SECONDS;
 
 	c1 = clock();
-	sec1 = c1 / CLOCKS_PER_SEC;
-
-	end = time(NULL) + BUSY_LOOP_SECONDS;
-
-	while (end >= time(NULL)) {
-		clock();
+	if (c1 == (clock_t)-1) {
+		printf("processor time not available\n");
+		return PTS_UNRESOLVED;
 	}
-
-	c2 = clock();
-	sec2 = c2 / CLOCKS_PER_SEC;
-
-	if (sec2 > sec1) {
-		printf("Times T1=%.2f, T2=%.2f\n", sec1, sec2);
-		printf("Test PASSED\n");
-		return PTS_PASS;
-	} else {
-		if (sec2 < sec1) {
-			/*
-			 * probably wrapping happened; however, since
-			 * we do not know the wrap value, results are
-			 * undefined
-			 */
-			printf("TEST AGAIN:  Times probably wrapped\n");
-			return PTS_UNRESOLVED;
-		} else {
-			printf("Error with processor times T1=%.2f, T2=%.2f\n",
-			       sec1, sec2);
-			return PTS_FAIL;
+	sec1 = (double) c1 / CLOCKS_PER_SEC;
+
+	do {
+		c2 = clock();
+		sec2 = (double) c2 / CLOCKS_PER_SEC;
+		if (sec2 - sec1 > 1) {
+			printf("Times T1=%.2lf, T2=%.2lf\n", sec1, sec2);
+			printf("Test PASSED\n");
+			return PTS_PASS;
 		}
-	}
+	} while (end >= time(NULL));
 
-	return PTS_UNRESOLVED;
+	printf("Error with processor times T1=%.2lf, T2=%.2lf\n",
+	       sec1, sec2);
+	return PTS_FAIL;
 }
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
