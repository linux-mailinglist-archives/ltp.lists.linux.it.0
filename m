Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5119609F2D
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 12:38:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A68C63C9886
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 12:38:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FE3F3C60C9
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 12:38:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8E3231A007A2
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 12:38:46 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8BFA32215C;
 Mon, 24 Oct 2022 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666607925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6fezCTZ3NHPnR+pvozcD4rU2SvgYnZEWvJKvST2jZ+Y=;
 b=M/u8LPe5I7wuxnUmxNno4esthZRVMNYvJBjwNo6S4bnhjFeTgKfns8LXS+Nwf8fQj7nV+g
 13Pnxn4asJmiKlT1UdscnF0DNgNJRr2nyGsouSOY927XYTMGjnmtx7stSW0sax6/z2NjOq
 PX2ReK+DU3KFs/OuLpqdFDcefiCUwHU=
Received: from g78.suse.de (unknown [10.163.28.198])
 by relay2.suse.de (Postfix) with ESMTP id 380952C141;
 Mon, 24 Oct 2022 10:38:45 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 Oct 2022 11:38:35 +0100
Message-Id: <20221024103836.6394-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Revert "ptrace07: Fix compilation when not on x86"
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Empty macro could lead to confusing tests failures. This needs to be
handled differently.

This reverts commit acf485f199347fc270a7da7e33e7635f9e78b6c7.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Martin Doucha <martin.doucha@suse.com>
---
 include/lapi/cpuid.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/lapi/cpuid.h b/include/lapi/cpuid.h
index 20e977093..cd0567f92 100644
--- a/include/lapi/cpuid.h
+++ b/include/lapi/cpuid.h
@@ -16,15 +16,11 @@
  * have __cpuid_count().
  */
 #ifndef __cpuid_count
-#  if defined(__i386__) || defined(__x86_64__)
 #define __cpuid_count(level, count, a, b, c, d) ({			\
 	__asm__ __volatile__ ("cpuid\n\t"				\
 			      : "=a" (a), "=b" (b), "=c" (c), "=d" (d)	\
 			      : "0" (level), "2" (count));		\
 })
-#  else
-#define __cpuid_count(level, count, a, b, c, d)
-#  endif
 #endif
 
 #endif /* LAPI_CPUID_H__ */
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
