Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8739A10B
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 14:33:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 704473C5419
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 14:33:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF2D63C2873
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:33:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 728DA600A4A
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:33:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A82C71FD5F
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622723622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tGerQjfLqw9ELgSwOT2/QoG2J8CWBnu4nW5arPmmSTo=;
 b=qE8atVIeKTYchFWkFB797Vwi86DMXtxXphB9evguOxE/BAH8iJ/YAdiWy/7gcU6vyzgK0m
 dG5QdJ0HGSzGya84PMaxkOXOc6JYtre4VjmMM+p9XP9TIpbw5C0nWaWTLiF7b3Nhadn1fq
 5uJakQgoedbvYOnVLIudGrERKomvePA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622723622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tGerQjfLqw9ELgSwOT2/QoG2J8CWBnu4nW5arPmmSTo=;
 b=/EgQVWejLOSOSulG87Eux1Io48wq76Ncb2NygMSV7ftqST5fMC/fRqByNy5T/GgTcLCbLk
 ck8PXNmmDS7HntCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 81B25118DD
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622723622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tGerQjfLqw9ELgSwOT2/QoG2J8CWBnu4nW5arPmmSTo=;
 b=qE8atVIeKTYchFWkFB797Vwi86DMXtxXphB9evguOxE/BAH8iJ/YAdiWy/7gcU6vyzgK0m
 dG5QdJ0HGSzGya84PMaxkOXOc6JYtre4VjmMM+p9XP9TIpbw5C0nWaWTLiF7b3Nhadn1fq
 5uJakQgoedbvYOnVLIudGrERKomvePA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622723622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tGerQjfLqw9ELgSwOT2/QoG2J8CWBnu4nW5arPmmSTo=;
 b=/EgQVWejLOSOSulG87Eux1Io48wq76Ncb2NygMSV7ftqST5fMC/fRqByNy5T/GgTcLCbLk
 ck8PXNmmDS7HntCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oZW4HSbMuGBYGQAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 03 Jun 2021 12:33:42 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 14:07:52 +0200
Message-Id: <20210603120752.9110-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/fchown04: Make output nicer
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

Print values not variable names in the TST_EXP_PASS()

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/fchown/fchown04.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fchown/fchown04.c b/testcases/kernel/syscalls/fchown/fchown04.c
index b2dbbc2cb..a7af3aae7 100644
--- a/testcases/kernel/syscalls/fchown/fchown04.c
+++ b/testcases/kernel/syscalls/fchown/fchown04.c
@@ -62,7 +62,8 @@ static void run(unsigned int i)
 	UID16_CHECK((uid = geteuid()), "fchown");
 	GID16_CHECK((gid = getegid()), "fchown");
 
-	TST_EXP_FAIL(FCHOWN(*tc[i].fd, uid, gid), tc[i].exp_errno);
+	TST_EXP_FAIL(FCHOWN(*tc[i].fd, uid, gid), tc[i].exp_errno,
+	             "fchown(%i, %i, %i)", *tc[i].fd, uid, gid);
 }
 
 static void cleanup(void)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
