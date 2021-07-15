Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E582E3C9AA7
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 674453C84B1
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CEB03C2E33
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:31:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 049831001182
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:31:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42BBD22931;
 Thu, 15 Jul 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626337859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSxC35I/J0XGXBdIhIUqI3aUqoNi/cIRhnRbrbNEUVY=;
 b=tThgkDTycynBVqYKtJ6wkt1LKTfCkfjFDCkC64z2jUkQRrIlmc9CDOE7h8WN+RHYho17kK
 i/KMV3IRsjsMnZKUJiqDabmETG9G6yuxy6r49if8BWbyV23chBpX98X4tE+ruk+KJCvlmN
 nMdkSPcID6WaFvMTNKSZdTbobokkmCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626337859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSxC35I/J0XGXBdIhIUqI3aUqoNi/cIRhnRbrbNEUVY=;
 b=Cr4nIpb7jZv4Zz3EulaFErstlrPnHwfWicFwglzl/bsRPhLuUFQzDoecHhdQngSGuV0U00
 CQ+2nu1xGZY4DoAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18F0713E79;
 Thu, 15 Jul 2021 08:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uNixA0Py72BhdAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 08:30:59 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Jul 2021 10:30:48 +0200
Message-Id: <20210715083052.7138-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715083052.7138-1-pvorel@suse.cz>
References: <20210715083052.7138-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6 1/5] lib: Print Summary: into stderr
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

to follow tst_{brk,res}() being printed to stderr.

Found with GitHub actions where stdout and stderr are probably
block buffered and flushed at different times.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
* new in v6

 lib/tst_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index f4d9f8e3b..084a83c9e 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -734,12 +734,12 @@ static void do_exit(int ret)
 		if (results->broken)
 			ret |= TBROK;
 
-		printf("\nSummary:\n");
-		printf("passed   %d\n", results->passed);
-		printf("failed   %d\n", results->failed);
-		printf("broken   %d\n", results->broken);
-		printf("skipped  %d\n", results->skipped);
-		printf("warnings %d\n", results->warnings);
+		fprintf(stderr, "\nSummary:\n");
+		fprintf(stderr, "passed   %d\n", results->passed);
+		fprintf(stderr, "failed   %d\n", results->failed);
+		fprintf(stderr, "broken   %d\n", results->broken);
+		fprintf(stderr, "skipped  %d\n", results->skipped);
+		fprintf(stderr, "warnings %d\n", results->warnings);
 	}
 
 	do_cleanup();
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
