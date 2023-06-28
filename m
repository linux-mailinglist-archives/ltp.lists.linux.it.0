Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F77411EE
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jun 2023 15:08:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51EA53CF12E
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jun 2023 15:08:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5EAE63CB175
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 15:07:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 85B7E1A00A33
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 15:07:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E2D01F8CD;
 Wed, 28 Jun 2023 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687957666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FviAcrsqHpWS1Q3P4pqxv4ZLcM1SyoPVJJVxWOk4ks=;
 b=IF52C/UatTSqjz9aEislHCZWkXBLMUxeMgYTB6Fklw2wZjNTLg6XSSg8X5m20oPJbBLF6j
 PqFlt5n8oGRrzdXzoOS/tTmwAbxCl9zaz1NlrJJJod8bwF9tRH1RqQZDaxSZyTAfj5bCO7
 EyrGBLJqZZPSqS16Pb6AMVM2t0ws3uE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687957666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FviAcrsqHpWS1Q3P4pqxv4ZLcM1SyoPVJJVxWOk4ks=;
 b=aU6mRzpUdSGzfVeAk8KNoUP7MavfHZhuSz0exw25soISn0/8/2M49oyqPKjifXLjo6L7c5
 CIW7tOzQlduraPAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA13C138E8;
 Wed, 28 Jun 2023 13:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJ/CL6EwnGT/cgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jun 2023 13:07:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 28 Jun 2023 15:07:41 +0200
Message-Id: <20230628130742.155724-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230628130742.155724-1-pvorel@suse.cz>
References: <20230628130742.155724-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] fsstress/global.h: Use _GNU_SOURCE
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
Cc: NeilBrown <neilb@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

O_DIRECT definitions differ a lot depending on architecture,
therefore _GNU_SOURCE (which loads it) instead of fallback O_DIRECT
definition.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/fs/fsstress/global.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/testcases/kernel/fs/fsstress/global.h b/testcases/kernel/fs/fsstress/global.h
index 4ec382426..584af025d 100644
--- a/testcases/kernel/fs/fsstress/global.h
+++ b/testcases/kernel/fs/fsstress/global.h
@@ -33,7 +33,7 @@
 #ifndef GLOBAL_H
 #define GLOBAL_H
 
-/* xfs-specific includes */
+#define _GNU_SOURCE
 
 #if defined(NO_XFS)
 # include "xfscompat.h"
@@ -42,8 +42,6 @@
 # include <attr/attributes.h>
 #endif
 
-/* libc includes */
-
 #include <sys/stat.h>
 #include <sys/statvfs.h>
 #include <sys/time.h>
@@ -59,8 +57,4 @@
 #include <stdio.h>
 #include <unistd.h>
 
-#ifndef O_DIRECT
-#define O_DIRECT 040000
-#endif
-
 #endif
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
