Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E390E30D429
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:45:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44DE63C73AE
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 08:45:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 809EF3C2EDE
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:45:31 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB674200983
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 08:45:30 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5A4439F626;
 Wed,  3 Feb 2021 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1612338328; bh=9bSHB2tGjFldxrS8xoUq47nlau3P6/Ml9B9CYfqPTbQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ErHBmMMcqcXpMOQFliUjUwQaD4xOC5E6ixs5+5TLOi0oa4EqEUpk+jb5WxpV2CJNC
 MyXIq8NjsrRnSBQ0CmcQejxIpJPBgxejUSOJtcvHY/OaMV24s5+EjbUEiGbyREdHYF
 7tESbIgtbrU3PjNOIQ3u99D/nuJOKOV9v7MpnQhw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  3 Feb 2021 08:45:19 +0100
Message-Id: <20210203074520.18401-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] mq_timedreceive/5-3: Prevent override of errno
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

wait can override the errno set by mq_timedreceive and
the check for EINTR might fail or not fail if it should.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/mq_timedreceive/5-3.c           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
index e773aeb14..3f252a196 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/5-3.c
@@ -74,16 +74,17 @@ int main(void)
 		ts.tv_nsec = 0;
 
 		if (mq_timedreceive(mqdes, msgrv, BUFFER, NULL, &ts) == -1) {
-			wait(NULL);
 			if (EINTR != errno) {
 				printf("errno != EINTR\n");
 				failure = 1;
 			}
 		} else {
-			wait(NULL);
-			printf("mq_timedreceive() succeed unexpectly\n");
+			printf("mq_timedreceive() succeeded unexpectedly\n");
 			failure = 1;
 		}
+		
+		wait(NULL);
+
 		if (mq_close(mqdes) != 0) {
 			perror("mq_close() did not return success");
 			unresolved = 1;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
