Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04679FD59
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 09:41:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFCD33CE717
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 09:41:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0AF43CB242
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 09:41:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EE693640273
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 09:41:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 422311F74A
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694677271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2GY008RLgTLdpPSd59HLG9M0WCQF/GoeqjaiWkosYKU=;
 b=fIo4oFIIK/3y/B9Qb7QIuN+9NkFdI8iSUh72brdvFfKdxTge/78yqGroMBmyDhtn3+OKHw
 aV4Fv3nqv75WYJp8URLRLreQBMRbVVE0Ae4E27KdY+pbq5heFmQQAeMqeSKQta0iurMMM0
 ZNVmUHN/yRlejUriefvGRDG+33GjQeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694677271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2GY008RLgTLdpPSd59HLG9M0WCQF/GoeqjaiWkosYKU=;
 b=T+yizIqsHBbg6eH1Lc/afCDM21HOhKOBK7e7pKMnOsNwmXARk0+2lGSJdf7kjIIiX2EhGM
 IdiGBfalSvMm7hAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E56A139DB
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 07:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pvkgChe5AmU9EQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 07:41:11 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 Sep 2023 09:40:42 +0200
Message-Id: <20230914074042.27313-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] ioctl01: Fix compilation
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

openpty() needs -lutil on some systems

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ioctl/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/Makefile b/testcases/kernel/syscalls/ioctl/Makefile
index c2ff6c8e7..1d40f5e0b 100644
--- a/testcases/kernel/syscalls/ioctl/Makefile
+++ b/testcases/kernel/syscalls/ioctl/Makefile
@@ -7,6 +7,8 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 INSTALL_TARGETS		+= test_ioctl
 
+ioctl01: LDLIBS+=-lutil
+
 ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= ioctl02
 endif
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
