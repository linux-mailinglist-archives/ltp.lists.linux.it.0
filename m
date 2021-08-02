Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 042ED3DDE9A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:35:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E7663C8AFF
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:35:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D2B33C53C4
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E208E100023E
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:54 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EDF31FFDE;
 Mon,  2 Aug 2021 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVwepbJkhAajW9G9OX+Gm+reeXyQgDAPGRYW8BLD6so=;
 b=UDEDYFbRjk9TZEo00p6KMp0qd6zHR0o5kRzFeRPzxj3RX+pCkScf0H/Hd8vOvNYZ7OJdHB
 a1G98/rKOFvnXestcPtg363XIWjT8/wbOuBoYRRvTg67Nl475fR0zmsEgZrmJWsav3bExj
 v7ZiqEp+SUkyKKxAI4BrOg0VrYi4n34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVwepbJkhAajW9G9OX+Gm+reeXyQgDAPGRYW8BLD6so=;
 b=akeKe53peksvI0Lmx3LmJwrOJToPv3FmHLuu+GFvHi0jjTlGUM6umRl8O5zVnQHFarZdoo
 s9Dshx4IEzkt2UAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5A67313B47;
 Mon,  2 Aug 2021 17:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mOYeEvosCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:30 +0200
Message-Id: <20210802173536.19525-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802173536.19525-1-pvorel@suse.cz>
References: <20210802173536.19525-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 1/7] lib: Print Summary: into stderr
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
The same as in v6.

 lib/tst_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index c7c77596c..d15c8c054 100644
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
