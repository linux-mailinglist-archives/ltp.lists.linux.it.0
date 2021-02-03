Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2230D42A
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:45:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55AAC3C73A8
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:45:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 325963C4F55
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:45:33 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4672420092A
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:45:33 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 02A7F9F626;
 Wed,  3 Feb 2021 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612338332; bh=TnrMvJ2iqxXnyxfOy6Q7A8e2hdwJBy01kE/usnJiawQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=QfTmodxids6qvXKIqvc3ynk1enS+fJMeZ4NMaleACW/lRQf0+yBc9sTEDkZlwVyju
 HazwYmeMvpYOPrsr9QjdGhei3y47c4OnmdTkcELm6asA32IjVn6FdBVCqg4XrtUosn
 7iY447dLwGE/P8giIN/5XpFN0LQ+5GQahI5B2+SQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  3 Feb 2021 08:45:20 +0100
Message-Id: <20210203074520.18401-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203074520.18401-1-lkml@jv-coder.de>
References: <20210203074520.18401-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] mq_timedreceive_5-3: Fix test for timestamp after
 INT32_MAX
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

The timeout for mq_timedreceive is absolute. Using INT32_MAX
breaks this test after 2038-01-19.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/mq_timedreceive/5-3.c               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
index 3f252a196..89d40721e 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
@@ -28,6 +28,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <time.h>
 #include "posixtest.h"
 
 #define TEST "5-3"
@@ -70,7 +71,7 @@ int main(void)
 		sigemptyset(&act.sa_mask);
 		sigaction(SIGABRT, &act, 0);
 
-		ts.tv_sec = INT32_MAX;
+		ts.tv_sec = time(NULL) + 5;
 		ts.tv_nsec = 0;
 
 		if (mq_timedreceive(mqdes, msgrv, BUFFER, NULL, &ts) == -1) {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
