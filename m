Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F66F86BA
	for <lists+linux-ltp@lfdr.de>; Fri,  5 May 2023 18:28:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D1713CB6F5
	for <lists+linux-ltp@lfdr.de>; Fri,  5 May 2023 18:28:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B77C23CB67E
 for <ltp@lists.linux.it>; Fri,  5 May 2023 18:28:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 168A2601BC5
 for <ltp@lists.linux.it>; Fri,  5 May 2023 18:28:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 554F321C38;
 Fri,  5 May 2023 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683304112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ftM8YDWYSazkNgAt3x2BvHZq+FBZcGXJuzP/Ysk5W4s=;
 b=f832s8dUKOLCDWgNOBeeGpoaO8E1C+2IvIC1xD116mV6VsBOx7aTlBPSR0cZuX4E28gn4F
 KxdDyJJn1/5TmFDcX1I+6FU6JkTFnDEQYrd5c9oXFTGRmgi+MpXeLinISherc7Xc3yEjdj
 VUF6a0bPSkhunPMSHBozjWTkt1AsGqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683304112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ftM8YDWYSazkNgAt3x2BvHZq+FBZcGXJuzP/Ysk5W4s=;
 b=q1UmR6kR1O7urHPc+cFF3qeRqzeG28zEysl4EDFzJAbm+mIPHrc2xXLBfq/WwK7mYvbgri
 AB9GW80FeOBc0EAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F53313488;
 Fri,  5 May 2023 16:28:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nd4UALAuVWR/KgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 05 May 2023 16:28:32 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 May 2023 18:28:22 +0200
Message-Id: <20230505162822.15676-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] endian_switch01: Add HAVE_GETAUXVAL guarder
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

From: Petr Vorel <petr.vorel@gmail.com>

This fixes compilation on uClibc / uClibc-ng (and also older glibc),
which does not provide this header.

Fixes: 03b76a20c ("endian_switch01.c: drop unused main4()")
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi Jan,

can you please have a look, I'd prefer to merge this before release
(build fix on Buildroot).

Kind regards,
Petr

 testcases/kernel/syscalls/switch/endian_switch01.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/switch/endian_switch01.c b/testcases/kernel/syscalls/switch/endian_switch01.c
index d965aed56..fac9e2382 100644
--- a/testcases/kernel/syscalls/switch/endian_switch01.c
+++ b/testcases/kernel/syscalls/switch/endian_switch01.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) International Business Machines Corp., 2008
  * Copyright (c) Paul Mackerras, IBM Corp., 2008
- * Copyright (c) 2018 Linux Test Project
+ * Copyright (c) 2018-2023 Linux Test Project
  */
 
 /*
@@ -15,16 +15,20 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <elf.h>
-#include <sys/auxv.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+
 #include "tst_test.h"
 
 #if defined(__powerpc64__) || defined(__powerpc__)
+
 # ifndef PPC_FEATURE_TRUE_LE
-# define PPC_FEATURE_TRUE_LE              0x00000002
+#  define PPC_FEATURE_TRUE_LE              0x00000002
 # endif
 
+# ifdef HAVE_GETAUXVAL
+#  include <sys/auxv.h>
+
 /*
  * Make minimal call to 0x1ebe. If we get ENOSYS then syscall is not
  * available, likely because of:
@@ -98,6 +102,10 @@ static struct tst_test test = {
 	.forks_child = 1,
 };
 
+# else
+TST_TEST_TCONF("Toolchain does not have <sys/auxv.h>");
+# endif /* HAVE_GETAUXVAL */
+
 #else /* defined (__powerpc64__) || (__powerpc__) */
 TST_TEST_TCONF("This system does not support running of switch() syscall");
 #endif
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
