Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADA40B5A0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 422793CA4DC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 444D13C2308
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:08:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7765F600548
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:08:57 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9CDB51FE0A;
 Tue, 14 Sep 2021 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631639336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=97kF3d5JzGHyevbvlvTN/uA78c92o8UsUBLc3rI/Dpw=;
 b=rRHxPVCF6Ubm5pYZ9awRthdQaKHZunfSCaUsWzcXfTuoeN7Zy2np8n+UmD13Ic7zHWgPaf
 pQniTPH0al3V7EMK41bxU7IfscAo0RnA3aIE1Wyh/fO7skuBd4Is/VA7T5lj3CllwbOgjz
 Frw0AQpaZe/na0jLjQjfYrk5FonXkrU=
Received: from localhost.suse.de (blezhepekov.udp.ovpn2.nue.suse.de
 [10.163.45.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 69198A3B99;
 Tue, 14 Sep 2021 17:08:56 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 20:08:46 +0300
Message-Id: <20210914170851.22931-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/6] realtime:async_handler_jk: return actual exit
 code
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The original version always returned 0.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/realtime/func/async_handler/async_handler_jk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/realtime/func/async_handler/async_handler_jk.c b/testcases/realtime/func/async_handler/async_handler_jk.c
index 4d8721822..8b40a474a 100644
--- a/testcases/realtime/func/async_handler/async_handler_jk.c
+++ b/testcases/realtime/func/async_handler/async_handler_jk.c
@@ -137,6 +137,7 @@ int main(int argc, char *argv[])
 {
 	int aes_id;		// asynchronous event server id
 	int user_id;		// User thread - that fires the event
+	int result;
 	long delta;
 	struct thread *server;
 	setup();
@@ -155,10 +156,11 @@ int main(int argc, char *argv[])
 	join_thread(user_id);
 	join_threads();
 	delta = (end - start) / NS_PER_US;
+	result = delta > pass_criteria ? 1 : 0;
 
 	printf("delta = %ld us\n", delta);
 	printf("\nCriteria: latencies < %d\n", (int)pass_criteria);
-	printf("Result: %s\n", delta > pass_criteria ? "FAIL" : "PASS");
+	printf("Result: %s\n",  result ? "FAIL" : "PASS");
 
-	return 0;
+	return result;
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
