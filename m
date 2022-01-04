Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5D484199
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 13:21:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0F4B3C90A8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 13:20:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07F863C2A4D
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 13:20:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C78C200224
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 13:20:36 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3BACB212BD;
 Tue,  4 Jan 2022 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641298836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urqIU9LZWt+RSQOk+rkNVQ7hWLKQKIPOFHYmB/NqHCk=;
 b=EQek/TUtVAxZjNdKmJJ+tSR39J3SDQd1s7sV0BirJmeGaJWn4e/YWhv+lynZZsjSPke5f6
 2HYKnvS1Rlyf9cFzsXlnpRL70caxkoPB8kNV06W1O1R46lm0KYC99jVpZFrWs+DXC6opmJ
 P2PRyybVe4H/WK71X6Fyn/McZe+4EK4=
Received: from g78.suse.de (unknown [10.163.24.42])
 by relay2.suse.de (Postfix) with ESMTP id 037B0A3B84;
 Tue,  4 Jan 2022 12:20:35 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 12:20:09 +0000
Message-Id: <20220104122010.23069-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104122010.23069-1-rpalethorpe@suse.com>
References: <20220104122010.23069-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] API: Add TST_EXP_EXPR macro
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

Simplifies evaluating an arbitrary expression or statement which is
not a syscall.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_test_macros.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 5dea1aabd..ec8c38523 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -195,4 +195,7 @@ extern void *TST_RET_PTR;
 
 #define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, #SCALL, ERRNO, ##__VA_ARGS__)
 
+#define TST_EXP_EXPR(EXPR, FMT, ...)						\
+	tst_res_(__FILE__, __LINE__, (EXPR) ? TPASS : TFAIL, "Expect: " FMT, ##__VA_ARGS__);
+
 #endif	/* TST_TEST_MACROS_H__ */
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
