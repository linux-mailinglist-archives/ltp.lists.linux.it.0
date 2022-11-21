Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DC63269A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Nov 2022 15:45:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C6E93CCBB3
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Nov 2022 15:45:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2EBB3CCB9B
 for <ltp@lists.linux.it>; Mon, 21 Nov 2022 15:45:11 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E5E6B102C5B5
 for <ltp@lists.linux.it>; Mon, 21 Nov 2022 15:45:10 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 323CA220F2;
 Mon, 21 Nov 2022 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1669041910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VespTLuKgl7YLW7PdN+PczFVoRk+jhxBV8/t2PrU8XI=;
 b=RAAj4nDIoBTbRWAhUObjRpgCVaKNUICHOEfwrZJbKd0hZKijC3rgopHIspueeRLmqQfG4L
 PE7Nj1VylKzOKtjdOtBNocSjZtvBGEW5/IYRtdAbPdfxkXE+Eo9byotqA6m0zrmAF6Ig0Z
 h90yt4xCNGYy5fvaJl+0ZXyErOrNPVA=
Received: from g78.cable.virginm.net (unknown [10.163.28.198])
 by relay2.suse.de (Postfix) with ESMTP id E103E2C143;
 Mon, 21 Nov 2022 14:45:09 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 21 Nov 2022 14:45:05 +0000
Message-Id: <20221121144505.1496-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] config: Explicitly set gnu99
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use the GNU variant of the C99 language to stop GCC 4.8.5 defaulting
to C90.

We can't use C99 because LTP is far from compliant.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Jan Kara <jack@suse.com>
---
 include/mk/config.mk.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 674843563..22301e126 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -80,8 +80,10 @@ OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
 
 WCFLAGS			?= -Wall -W @GCC_WARN_OLDSTYLE@
 
+STDCFLAGS		?= -std=gnu99
+
 LDFLAGS			+= $(WLDFLAGS)
-CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
+CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS) $(STDCFLAGS)
 
 LTP_CFLAGS_NOPIE	:= @LTP_CFLAGS_NOPIE@
 
-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
