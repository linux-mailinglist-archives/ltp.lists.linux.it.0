Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C916B5B67CC
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 08:21:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C6403CAB0A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 08:21:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC85D3CAAE0
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 08:21:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1D2781000D06
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 08:21:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 320625BDE0;
 Tue, 13 Sep 2022 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663050067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CO2iItC2gTvpCcMSDG3HYPaH7fOJyiAkEITb6GjNiZg=;
 b=WVEtY34QnLuUcNiPUuD9VVKgtvBxnnYmmzilh7hLkf5VMRdAcLJdYGNQS0ckchaWDvSCye
 DX6sgpPCdDOXwpc0qp84j0bD2KYPSkXMjkT+8/32S6qZU1fjS9CZ8CY1yurp12ERL8SyzF
 UvyqMO7/I+ltDmg1n2G2hdA75el+UHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663050067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CO2iItC2gTvpCcMSDG3HYPaH7fOJyiAkEITb6GjNiZg=;
 b=9GXSs5jklNU+dpBm8RiJaK/rOdo20nuVNRxdQqZ58thc2rcKJJ0VfBV6bBcHoS2syesYJA
 T+ur2MyZus0lyrDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 142BE139B3;
 Tue, 13 Sep 2022 06:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wCWeA1MhIGNKZwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Sep 2022 06:21:07 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Sep 2022 08:21:01 +0200
Message-Id: <20220913062103.3910-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913062103.3910-1-pvorel@suse.cz>
References: <20220913062103.3910-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] tst_test_macros: Add TST_EXP_FD_OR_FAIL() macro
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

It calls TST_EXP_FD() or TST_EXP_FAIL().

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_test_macros.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 2e7b7871c..231c04951 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015-2020 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) Linux Test Project, 2021-2022
  */
 
 #ifndef TST_TEST_MACROS_H__
@@ -93,6 +94,15 @@ extern void *TST_RET_PTR;
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
+#define TST_EXP_FD_OR_FAIL(SCALL, ERRNO, ...)                                    \
+	do {                                                                   \
+		if (ERRNO)                                                     \
+			TST_EXP_FAIL(SCALL, ERRNO, ##__VA_ARGS__);             \
+		else                                                           \
+			TST_EXP_FD(SCALL, ##__VA_ARGS__);                      \
+		                                                               \
+	} while (0)
+
 #define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__)
 
 #define TST_EXP_PID(SCALL, ...)                                                \
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
