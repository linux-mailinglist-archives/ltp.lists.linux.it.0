Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC93878A7
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 14:26:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09E253CA688
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 14:26:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5E6C3CA3DB
 for <ltp@lists.linux.it>; Tue, 18 May 2021 14:26:18 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9742F600693
 for <ltp@lists.linux.it>; Tue, 18 May 2021 14:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621340776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QBIaTS9oKLrgq/cAY4kqDCv70GchpWNI3COKrQ39GM8=;
 b=jH32YoTEq64N0Yf1uqOYSLBUTsKWZy+dLxkNVf4HSCISm1Lqy9sQ7fDs7RmBxrF6oX3b4b
 SxPngdOpOZoOIp8KByGp9ox+8nIrZ+Yc3cUgVyCThn8oUlrttQN1phycFtWGGeL2TD3uxH
 adFC04woWJwbxp4YGLsgUYBBLPMm9kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-8MW6P1o-NuuzvRG9OHMpsA-1; Tue, 18 May 2021 08:26:14 -0400
X-MC-Unique: 8MW6P1o-NuuzvRG9OHMpsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D39802940
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:26:13 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B807518E2E
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:26:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 18 May 2021 20:26:09 +0800
Message-Id: <20210518122610.17171-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_test: discard the stderr output
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

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    We can merge this before the new release.

 testcases/lib/tst_test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 28c2052d6..3a5651c01 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -444,13 +444,13 @@ _tst_kill_test()
 	kill -INT -$pid
 	tst_sleep 100ms
 
-	while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
+	while kill -0 $pid >/dev/null 2>&1 && [ $i -gt 0 ]; do
 		tst_res TINFO "Test is still running, waiting ${i}s"
 		sleep 1
 		i=$((i-1))
 	done
 
-	if kill -0 $pid 2>&1 > /dev/null; then
+	if kill -0 $pid >/dev/null 2>&1; then
 		tst_res TBROK "Test still running, sending SIGKILL"
 		kill -KILL -$pid
 	fi
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
