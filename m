Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 255073A2C03
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 14:52:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2A3E3C4D85
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 14:52:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B36B3C2192
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 14:52:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14D521001424
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 14:52:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 651841FD37;
 Thu, 10 Jun 2021 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623329556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yhI7jxi3TYelAW+IPBV6pzY423rDaa9+iFemtTZi8G8=;
 b=egFkQAROI5PXaKkc5q9ic4YPFUzx1MHJIRtDUcw8BVWkNxrpaT0pQkdvK5ew1D07PVI3EE
 sKuwwyNTEbPObVy0Xe9XbReg1qUPUwAWvC1TyjsGASYqnKS4gKv+qsWYU8/BoDAWCHmC1V
 Eac6fSYOYOEYMl2nAZ7nzHRZFBOBBOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623329556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yhI7jxi3TYelAW+IPBV6pzY423rDaa9+iFemtTZi8G8=;
 b=/LGsE9fm7EnWFArl8LbdjI0jbLBApsDBmK2XEhGw43QO/dr/VWYImWDIQk+1+DHZZ4D3mN
 /VNDIk7DAPfi9eCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2DD38118DD;
 Thu, 10 Jun 2021 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623329556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yhI7jxi3TYelAW+IPBV6pzY423rDaa9+iFemtTZi8G8=;
 b=egFkQAROI5PXaKkc5q9ic4YPFUzx1MHJIRtDUcw8BVWkNxrpaT0pQkdvK5ew1D07PVI3EE
 sKuwwyNTEbPObVy0Xe9XbReg1qUPUwAWvC1TyjsGASYqnKS4gKv+qsWYU8/BoDAWCHmC1V
 Eac6fSYOYOEYMl2nAZ7nzHRZFBOBBOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623329556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yhI7jxi3TYelAW+IPBV6pzY423rDaa9+iFemtTZi8G8=;
 b=/LGsE9fm7EnWFArl8LbdjI0jbLBApsDBmK2XEhGw43QO/dr/VWYImWDIQk+1+DHZZ4D3mN
 /VNDIk7DAPfi9eCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id CZFoCRQLwmBULAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 10 Jun 2021 12:52:36 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Jun 2021 14:52:29 +0200
Message-Id: <20210610125229.24140-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] newlib_tests: Fix build dependency on lib
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

this fixes build error:

$ cd lib && make clean && cd newlib_tests && make
ld: cannot find -lltp

Fixes: bbdb9f783 ("lib: Add new test library API")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index 30ca6810c..a263d7db5 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 top_srcdir		?= ../..
 
-include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/testcases.mk
 
 CFLAGS			+= -W -Wall
 LDLIBS			+= -lltp
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
