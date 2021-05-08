Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A00376FDD
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:51:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96BC93C5552
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:51:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33FC43C5553
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:24 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B000B1001454
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620453081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xaIDvTNGlw7Q1swoaxCpUfyeVUFaWCnu5uol/FsPbaE=;
 b=TaIVjuwv4Du6g7uH/WXh1AZu8ReX7j5sAgIgOOlBbvbYLMP1Uv4EEDJgrhUVuVY8W8ErAY
 Cca5ADZeIxIT2Nk5UrJILDsSzYmzGKj6+PUXFRi/PVVO7dPTl5PnWcUSC2fPL0PkQ/9+8d
 ON6YG4fsjQVZ48Q4WDXXFTw2rS9F0x8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-cl7c78v7MrSBs1Wqx37Rzg-1; Sat, 08 May 2021 01:51:19 -0400
X-MC-Unique: cl7c78v7MrSBs1Wqx37Rzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160E08015A8;
 Sat,  8 May 2021 05:51:18 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF171897F;
 Sat,  8 May 2021 05:51:16 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 May 2021 13:51:08 +0800
Message-Id: <20210508055109.16914-4-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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

We have to guarantee _tst_kill_test alive for a while to check if
the target test eixst or not, so ignore SIGINT in _tst_kill_test
is necessary, otherwise it will be stopped by the SIGINT sending
by itself.

The timeout03.sh verify this mechanism proccess well in output:

  timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
  timeout03 1 TBROK: test interrupted or timed out
  timeout03 1 TPASS: test run cleanup after timeout
  timeout03 1 TINFO: Test is still running, waiting 10s
  timeout03 1 TINFO: Test is still running, waiting 9s
  timeout03 1 TINFO: Test is still running, waiting 8s
  timeout03 1 TINFO: Test is still running, waiting 7s
  timeout03 1 TINFO: Test is still running, waiting 6s
  timeout03 1 TINFO: Test is still running, waiting 5s
  timeout03 1 TINFO: Test is still running, waiting 4s
  timeout03 1 TINFO: Test is still running, waiting 3s
  timeout03 1 TINFO: Test is still running, waiting 2s
  timeout03 1 TINFO: Test is still running, waiting 1s
  timeout03 1 TBROK: Test still running, sending SIGKILL
  Killed

(This one based on Joerg's improvement work, better apply this after the two patches)

Fixes: 25ad54dbaea6("tst_test.sh: Run cleanup also after test timeout")
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Joerg Vehlow <lkml@jv-coder.de>
Acked-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index ed2699175..b6ca0cb26 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -439,6 +439,7 @@ _tst_kill_test()
 {
 	local i=10
 
+	trap '' INT
 	tst_res TBROK "Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
 	kill -INT -$pid
 	tst_sleep 100ms
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
