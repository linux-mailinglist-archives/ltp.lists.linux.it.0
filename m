Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D673AE83B
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35DD43C87ED
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3D523C7089
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2AA9A600068
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C2A281FD42;
 Mon, 21 Jun 2021 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624275502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoFeLKX+2Vk9lYda04sobJobttD5S5JB8ZjA7vNV8a0=;
 b=Rq1J3Rj77BehRdrqLkVj6WGXMENJyaikaj1g1FniIMoo/325HgQXfBrk7Vmyx9sGEcakJb
 3ze+QbzHh3Gs2Y3GbKbw0ZB37JeFDLjvssDJCIluBYWTP3K769NRIjpx9zTFErOpkYy95P
 lAAJZMQoQ5gc5Ag389zCZwDat8DEoqQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 8A834A3BAA;
 Mon, 21 Jun 2021 11:38:22 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 21 Jun 2021 12:38:04 +0100
Message-Id: <20210621113804.26179-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621113804.26179-1-rpalethorpe@suse.com>
References: <20210621113804.26179-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] API: Cause GCC/Clang to blow up when TEST is used
 in the library
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

As we define LTPLIB on library code, the preprocessor itself can be
used to detect when the TEST[_VOID] macros are expanded in the
library.

If an API header is not included by any library translation
units. Then this will not work. This is true at least for Fuzzy
Sync.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_test_macros.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 89dfe5a31..9017fd042 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -6,6 +6,10 @@
 #ifndef TST_TEST_MACROS_H__
 #define TST_TEST_MACROS_H__
 
+#if LTPLIB
+#define TEST(SCALL) _Pragma("GCC error \"Do not use TEST macro in library\"")
+#define TEST_VOID(SCALL) _Pragma("GCC error \"Do not use TEST_VOID macro in library\"")
+#else
 #define TEST(SCALL) \
 	do { \
 		errno = 0; \
@@ -19,6 +23,7 @@
 		SCALL; \
 		TST_ERR = errno; \
 	} while (0)
+#endif
 
 extern long TST_RET;
 extern int TST_ERR;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
