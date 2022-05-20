Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8FF52EC6C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 14:43:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B05433CAB0E
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 14:43:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 702013CAAE4
 for <ltp@lists.linux.it>; Fri, 20 May 2022 14:43:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CBB8C1A01174
 for <ltp@lists.linux.it>; Fri, 20 May 2022 14:43:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 801AD1FA6A;
 Fri, 20 May 2022 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653050600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScmKqEpTZgdVPTDhLMOTsiDIVr+zwJWCZu8pydW1g70=;
 b=FQUmhkl7Kt4N42gl2bnmBrFpRcvlGTsPbATdUYiu5BdRnKNrrC8mwS178epfr8LvTGpj6m
 F/5+S2eAvXNFEBEPtrhoz36lrXE5q9LeGTJ1Rs7ZqN9D65UyQ9l5qDpChI3CFN7eezvFTV
 SP97EllpOO8rYqQ1DOPmEELMGk8bhZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653050600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScmKqEpTZgdVPTDhLMOTsiDIVr+zwJWCZu8pydW1g70=;
 b=AoVPColS+QXuNNRuIjBws1BzmsrdIZhdIhnpR0+XGPVq1iuKtjvDXWou2NeA5KPpfsLk1h
 yuyhqFyxUXYO8fBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39E8A13AF4;
 Fri, 20 May 2022 12:43:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CISADOiMh2JETgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 20 May 2022 12:43:20 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 20 May 2022 14:43:13 +0200
Message-Id: <20220520124314.20251-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520124314.20251-1-pvorel@suse.cz>
References: <20220520124314.20251-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] tst_test: Check for -i >= 0
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8e258594a..34cf1333b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -618,6 +618,8 @@ static void parse_opts(int argc, char *argv[])
 			exit(0);
 		case 'i':
 			iterations = atoi(optarg);
+			if (iterations < 0)
+				tst_brk(TBROK, "Number of iterations (-i) must be >= 0");
 		break;
 		case 'I':
 			duration = atof(optarg);
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
