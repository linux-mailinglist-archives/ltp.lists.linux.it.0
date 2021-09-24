Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360F416ECE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 11:21:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CA373C8F4E
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 11:21:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 281E73C8F12
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 11:21:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ADC946021DF
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 11:21:34 +0200 (CEST)
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1A2F31FFE0;
 Fri, 24 Sep 2021 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1632475294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+kB/U2pu0yi3CNItwUp55Zn2jBeKdgiLdo/q34mzWc=;
 b=TsDSyMQxAYleu+1xRJ2exc5n7gJ/uXE/4N6HtMNCiHRpzkHOaxF2Hdt2SCRgRqJIX75ISB
 OHzYUacrKHx124GFFbBqWMRJd8JxwRCYql8e1nfGSRwIKuhW5V8guZ3cIxfJQmmqxtgI54
 8drORwxpUBNlXTOCcoM7X7JXkLpNUY4=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay1.suse.de (Postfix) with ESMTP id D2FA425D40;
 Fri, 24 Sep 2021 09:21:33 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 24 Sep 2021 10:21:11 +0100
Message-Id: <20210924092111.20012-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924092111.20012-1-rpalethorpe@suse.com>
References: <20210924092111.20012-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] msgrcv07: Cleanup indentation
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

make make check happy.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
index 8635ef7a4..4528f69b2 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
@@ -201,7 +201,7 @@ static void test_positive_msgtyp(void)
 
 	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2) {
 		tst_res(TPASS,
-		        "msgtyp got the first message in the queue of type msgtyp");
+			"msgtyp got the first message in the queue of type msgtyp");
 	} else {
 		tst_res(TFAIL,
 			"msgtyp didn't get the first message in the queue of type msgtyp");
@@ -226,7 +226,7 @@ static void test_negative_msgtyp(void)
 
 	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1) {
 		tst_res(TPASS,
-		        "-msgtyp got the first message in the queue with the lowest type");
+			"-msgtyp got the first message in the queue with the lowest type");
 	} else {
 		tst_res(TFAIL,
 			"-msgtyp didn't get the first message in the queue with the lowest type");
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
