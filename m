Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A967D38A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jan 2023 18:53:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E64703CC765
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jan 2023 18:53:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3CDA3CC747
 for <ltp@lists.linux.it>; Thu, 26 Jan 2023 18:53:08 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E41E1000A00
 for <ltp@lists.linux.it>; Thu, 26 Jan 2023 18:53:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 590A51F8A8;
 Thu, 26 Jan 2023 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674755586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wng6wqHl0ngMWQsuXZqq1xgWVkzs9amsGEjxX5v3G2I=;
 b=ki4T/ADl/g/IixPCq8KKsXxrWU++dj64T9a4Q1Ht6fqesSKBM0tZMaQmLrmNn0GGKLZi3X
 +vB7A9mX8M07lCr/YrkMlYievbMNfwcnKMX32TOR33Ko5SA19v5y4R38jE/nJA6cp0h8f6
 NGxYvSz5Q9hhYvpb8FbZNFgepMfe8nY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674755586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wng6wqHl0ngMWQsuXZqq1xgWVkzs9amsGEjxX5v3G2I=;
 b=rr0ALVgk15hTxUrtKfsaHCyYU3YQzDkFn+rE0lR4R5Qv3k3m2iiom6inH18X9lUcCqeQl7
 vSlty9L+wosCYGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00448139B3;
 Thu, 26 Jan 2023 17:53:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ke9yNwG+0mP7bwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 26 Jan 2023 17:53:05 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Jan 2023 18:53:02 +0100
Message-Id: <20230126175302.12558-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_minmax.h: Include <sys/param.h>
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

It's always good to first include header which defines macros/structures
before define fallback. In this case it's needed to avoid redefinition:

$ make check-hugemmap15
CHECK testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
hugemmap15.c: note: in included file:
/usr/include/sys/param.h:102:9: warning: preprocessor token MIN redefined
hugemmap15.c: note: in included file (through ../../../../../include/tst_test.h, testcases/kernel/mem/hugetlb/hugemmap/../lib/hugetlb.h):
../../../../../include/tst_minmax.h:9:10: this was the original definition
hugemmap15.c: note: in included file:
/usr/include/sys/param.h:103:9: warning: preprocessor token MAX redefined
hugemmap15.c: note: in included file (through ../../../../../include/tst_test.h, testcases/kernel/mem/hugetlb/hugemmap/../lib/hugetlb.h):
../../../../../include/tst_minmax.h:18:10: this was the original definition

Redefinitions is done because hugemmap15.c needs tst_test.h for
TST_TEST_TCONF(), but <sys/param.h> which defines MIN/MAX() is later
included.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

another trivial fix, which can wait till the release.

Kind regards,
Petr

 include/tst_minmax.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/tst_minmax.h b/include/tst_minmax.h
index 9d7d596fce..1597fbc978 100644
--- a/include/tst_minmax.h
+++ b/include/tst_minmax.h
@@ -1,10 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later
  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) Linux Test Project, 2020-2023
  */
 
 #ifndef TST_MINMAX_H__
 #define TST_MINMAX_H__
 
+#include <sys/param.h>
+
 #ifndef MIN
 # define MIN(a, b) ({ \
 	typeof(a) _a = (a); \
-- 
2.39.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
