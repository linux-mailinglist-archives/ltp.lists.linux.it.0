Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376BAB6651
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 10:45:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25A7A3CC38A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 10:45:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 26B5B3C8F93
 for <ltp@lists.linux.it>; Wed, 14 May 2025 10:45:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03C021A00FA7
 for <ltp@lists.linux.it>; Wed, 14 May 2025 10:45:16 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E919E1F391;
 Wed, 14 May 2025 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747212316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=A9LeI/l13ItW2osbyoT+cgU6a5vqX5UOnl8hCSpb8w8=;
 b=SaPUAIjlrZNGt60/Fi7wCYwst3aL9RobObPCA2Xm91FktR0WAiQG/hy5sfldxAN+Ht8wup
 ioyN0aUtNAPq5t39oB87dTZxFDEzRoPz814AEJV6NEXkMF9xvjBXssBVfap1kTJYQLWv1o
 baL43tWPazthZP57VT6UVFSqe1Fs2Dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747212316;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=A9LeI/l13ItW2osbyoT+cgU6a5vqX5UOnl8hCSpb8w8=;
 b=We9OK/6K8XtlgTrq315Yq9BJbVcx2oP+aWGNHSoNliQTSF8ltM2oxhmVSO+FHPiYrFVkOi
 ph37Pbq1ncTxn6Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747212315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=A9LeI/l13ItW2osbyoT+cgU6a5vqX5UOnl8hCSpb8w8=;
 b=Aw6j1djmnYOXwG/a5g1Wvy33K1P0QJMcxjprPOWms8cgsySyKCRRbPreKQ2Egfnx9bm9YO
 Qnwyf749tT3HqNhKpHdE+LmIiBrO8S1ptLz5prdp/qnOVLhfds4qga75lcV5AOvK3x5MqS
 ct6s7yd9T8zx8vCzh+3eAzQa3060xqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747212315;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=A9LeI/l13ItW2osbyoT+cgU6a5vqX5UOnl8hCSpb8w8=;
 b=eUypUZo/DMdN5WINJjuHM8bLP7MCjwtoITXd57YU/8D6QWSNb5M+CAsaBM/FZMzZ3Tmsxj
 xW9AeyTHXobsEIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C24F2137E8;
 Wed, 14 May 2025 08:45:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K8a9LRtYJGhvGgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 14 May 2025 08:45:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 May 2025 10:44:51 +0200
Message-ID: <20250514084451.397659-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] doc: ltp_release_procedure: Add valgrind-developers ML
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
Cc: valgrind-developers@lists.sourceforge.net, Mark Wielaard <mark@klomp.org>,
 Martin Cermak <mcermak@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add valgrind-developers at sourceware.org based on their request.
While at it, also note which ML need a subscription.

[1] https://lore.kernel.org/ltp/3c55aaf36ed4312cdfd603808db295ac09617412.camel@klomp.org/

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/maintainers/ltp_release_procedure.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/doc/maintainers/ltp_release_procedure.rst b/doc/maintainers/ltp_release_procedure.rst
index 6259afe0ea..6dbafa4f81 100644
--- a/doc/maintainers/ltp_release_procedure.rst
+++ b/doc/maintainers/ltp_release_procedure.rst
@@ -154,9 +154,10 @@ Send release announcement
 
 The announcement is sent to:
 
-* ltp at lists.linux.it
+* ltp at lists.linux.it (requires a subscription)
 * linux-kernel at vger.kernel.org
-* libc-alpha at sourceware.org
+* libc-alpha at sourceware.org (requires a subscription)
+* valgrind-developers at lists.sourceforge.net (requires a subscription)
 
 CCed to:
 
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
