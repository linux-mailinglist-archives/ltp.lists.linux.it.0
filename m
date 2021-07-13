Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B53C6E44
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F07453C877C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 40D013C663C
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DEF59600865
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8ACF32226B;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW8VKsHv/kFNNBGLAExZ7LOCMpQiQHfqOnZcihbWM+8=;
 b=KZx1O+xVq8fhjcBD+azLgikM8Ez8T1epo87RUcmlemOia/ZGK9u9trOBG7ruv07agTLpXD
 oONrtBEioW91n9qTy2SXDd62GcAsks5HWcuMKjmk+9GirDEY5nt7M5X1LrrVKBlER6r/rV
 ciisKRAiZtsHJ5ztXOjR03Y6iIOcdt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW8VKsHv/kFNNBGLAExZ7LOCMpQiQHfqOnZcihbWM+8=;
 b=4pwj+qVTdTN4UVJQjeO9/8UMoLHODCeJNk9TDu2vxaWBOHMZOS0AjEws8FMjw7uhGhp99C
 IIzMruyYaJxGixAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43C0713AE3;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aDcQD1ln7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:34 +0200
Message-Id: <20210713101338.6985-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/7] tst_strstatus.c: Use musl compatible status
 number
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

musl since commit 41c632824c08 ("fix definitions of WIFSTOPPED and
WIFSIGNALED to support up to signal 127") returns 1 on
WIFSIGNALED(0xff). Thus test with WIFSIGNALED(0x1ff), which is
compatible for both glibc and musl.

Suggested-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v4.

 lib/newlib_tests/tst_strstatus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/newlib_tests/tst_strstatus.c b/lib/newlib_tests/tst_strstatus.c
index aeeeb77ed..f8655fe82 100644
--- a/lib/newlib_tests/tst_strstatus.c
+++ b/lib/newlib_tests/tst_strstatus.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
  */
 
 /*
@@ -18,7 +19,7 @@ static struct tcase {
 	{0x0001, "killed by SIGHUP"},
 	{0x137f, "is stopped"},
 	{0xffff, "is resumed"},
-	{0xff, "invalid status 0xff"},
+	{0x1ff, "invalid status 0x1ff"},
 };
 
 static void do_test(unsigned int n)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
