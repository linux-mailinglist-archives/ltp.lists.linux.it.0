Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A30BDAFF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94CD43C2082
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:30:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 79B603C180F
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:30:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C99B71A014CF
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:30:08 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 89C2F9F837;
 Wed, 25 Sep 2019 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1569403807; bh=RWoka+Nx3PUblvEox6B97+7Ay4Gmn1tD6pFf55LuBtM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ctJImu6cO53dardlvao8E40K3i/luxFCNuj2PklX8kC63g+SG0DBU5vjbmfXNxxyA
 +a8qU+Wnjek9ZWFb9Ic2t1tTgmRRcOKFOO3kAY+BCSwi1xZYOAhGsrrnOv/Z8XVN3u
 sKd1lsLq2mXwrVgWhD4p0VZSFit6RSX0Y5Kfj668=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed, 25 Sep 2019 11:29:58 +0200
Message-Id: <20190925092958.125325-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] open_posix/conformance/clock/1.1: Deterministic timing
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

On some systems the loop with 8 million iterations takes a very long time.
This patches changes it to busy loop for five seconds.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/clock/1-1.c                 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
index 9c48cd979..cce5beea9 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
@@ -17,20 +17,22 @@
 #include <time.h>
 #include <stdio.h>
 #include <unistd.h>
+#include <time.h>
 #include "posixtest.h"
 
-#define LARGENUMBER 8000000
+#define BUSY_LOOP_SECONDS 5
 int main(void)
 {
 	clock_t c1, c2;
 	double sec1, sec2;
-	int i;
+	time_t end;
 
 	c1 = clock();
 	sec1 = c1 / CLOCKS_PER_SEC;
 
-	for (i = 0; i < LARGENUMBER; i++) {
-		// keep busy so CPU time increases
+	end = time(NULL) + BUSY_LOOP_SECONDS;
+
+	while (end >= time(NULL)) {
 		clock();
 	}
 
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
