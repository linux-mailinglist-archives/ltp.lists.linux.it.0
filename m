Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AC540B5A2
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 639EE3CA4A1
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9F9B3C9268
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:09:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66687200935
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:09:01 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F0A7E1FE0F;
 Tue, 14 Sep 2021 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631639340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/wmXs/qsrs1yy5yGMgGCtVsLIrPg3vnPFIrKFS6pAU=;
 b=IFJgg5RC/xJg831c0xgwkNrYis04c6q/f5jo1HJYMI4FqW7xLU3jdHwS7uAvHXefZBnBAe
 /XuNAiUs4E7/QeAvgIxNHiiE8N0uStRF9A4OTmhzyzyBgRx71H27CrWd89WgqlKCOuJcDq
 76XKGPQnK0Wpc/EI7dMgtdrkl3/30rA=
Received: from localhost.suse.de (blezhepekov.udp.ovpn2.nue.suse.de
 [10.163.45.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id BC83AA3B91;
 Tue, 14 Sep 2021 17:09:00 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 20:08:48 +0300
Message-Id: <20210914170851.22931-3-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914170851.22931-1-bogdan.lezhepekov@suse.com>
References: <20210914170851.22931-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 3/6] rt:pi-tests:testpi-0: return actual exit code
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
 testcases/realtime/func/pi-tests/testpi-0.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/realtime/func/pi-tests/testpi-0.c b/testcases/realtime/func/pi-tests/testpi-0.c
index fd8ad0717..64797c899 100644
--- a/testcases/realtime/func/pi-tests/testpi-0.c
+++ b/testcases/realtime/func/pi-tests/testpi-0.c
@@ -94,8 +94,10 @@ int main(int argc, char *argv[])
 	printf("LIBPTHREAD_VERSION: %s\n", pathbuf);
 	free(pathbuf);
 
-	if (sysconf(_SC_THREAD_PRIO_INHERIT) == -1)
+	if (sysconf(_SC_THREAD_PRIO_INHERIT) == -1) {
 		printf("No Prio inheritance support\n");
+		exit(1);
+	}
 
 	printf("Prio inheritance support present\n");
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
