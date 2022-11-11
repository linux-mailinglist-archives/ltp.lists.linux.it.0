Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDD625FFA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 18:04:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 934643CD5A7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 18:04:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C35203CBBE1
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 18:04:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43153600543
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 18:04:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CBBE1FD4A;
 Fri, 11 Nov 2022 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668186256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S88NvkQ379LBdIapssSYHUeXqE7y2RGKMX+xopfuInk=;
 b=kWGQoeqJI+maJ9xVAeO2MMHyj43yO6y4C4bt8uEuH1ut/ZZRCUUwVx36yDHzeea0URsBBw
 9lQoGJ3jgbxeL1etmEB94vn4Py+bJD7nFAtAB6/jHIQO1U44rgZeXcaGLuoPVxHHZ4IluC
 s0p0ni1VUheK6KLUBUmTh3atUVwW8iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668186256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S88NvkQ379LBdIapssSYHUeXqE7y2RGKMX+xopfuInk=;
 b=7fYsEZGoDDTf85KriEmJYMDkhSmoe9H59lSNhZs0rlRNFaOlXbe1HHv1v7hJT/JzB3LCDc
 XZ8+0xkgX9W/u0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB0FD13357;
 Fri, 11 Nov 2022 17:04:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /irZJo+AbmM6ZwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Nov 2022 17:04:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Nov 2022 18:04:10 +0100
Message-Id: <20221111170410.16350-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] runtest/mm: Use the default value for -p
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test rewrite in 88321bfff introduced reasonable default value for -p
option "number of mapping children" (nproc -1 in range <1, 20>), let's
use it, instead of forcing -p 20.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/mm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runtest/mm b/runtest/mm
index 51302258a..f288fed36 100644
--- a/runtest/mm
+++ b/runtest/mm
@@ -41,7 +41,7 @@ shmt10 shmt10
 shm_test01	shm_test -l 10 -t 2
 mallocstress01	mallocstress
 
-mmapstress01 mmapstress01 -p 20
+mmapstress01 mmapstress01
 mmapstress02 mmapstress02
 mmapstress03 mmapstress03
 mmapstress04 mmapstress04
-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
