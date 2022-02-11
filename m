Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49A4B2912
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 16:27:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E7143C9F07
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Feb 2022 16:27:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7B6D3C98B0
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 16:27:56 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EFC8A1401446
 for <ltp@lists.linux.it>; Fri, 11 Feb 2022 16:27:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F304A21138;
 Fri, 11 Feb 2022 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1644593275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kwKPtp1D9/Lfb3aDnpbsA6MjKJWTlbnyIHqsm1TqzuM=;
 b=aiQKFkYat2g9/MQt4+e1bRdE5zjgLHWzV5K+Wpi656nckuVfwveQsJXp1eXcCsOtTsT7cK
 cnbuLQkpqkkuqM/UI35zutTyaD9V6pP2PVSg5ZvuurTJTqD39g3nR9rUY0XZPK3icnzWjx
 O5N7sR/0NP4I1u4QTseNHlcqflxGGNs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B660213C97;
 Fri, 11 Feb 2022 15:27:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iiGDKHqABmImTgAAMHmgww
 (envelope-from <bogdan.lezhepekov@suse.com>); Fri, 11 Feb 2022 15:27:54 +0000
To: ltp@lists.linux.it
Date: Fri, 11 Feb 2022 17:27:51 +0200
Message-Id: <20220211152751.4651-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] lib/tst_memutils.c: Fix resource leak
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

File descriptor was not closed properly
before return.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 lib/tst_memutils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index 4a4974761..2e6d7d5fd 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -122,7 +122,10 @@ static int write_score(const char *path, int score)
 		return 1;
 
 	if (fprintf(f, "%d", score) <= 0)
+	{
+		fclose(f);
 		return 1;
+	}
 
 	if (fclose(f))
 		return 1;
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
