Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EnSOjpkcmnfjQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 18:54:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 753796BC2D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 18:54:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AF143CB5AE
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 18:54:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 202093CB3F9
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 18:53:59 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 880871400425
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 18:53:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B27D5336D1;
 Thu, 22 Jan 2026 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769104438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+fG002mzVdbfCy9zW8g/LnZDfVfi7pB8lr4GFwf+dSY=;
 b=B+fEx0P8co6coWJ2KjmArSou/wpWQw7z/3zXRChjh2w/HpzBvW3UctvkCGSc+HT75+e+oG
 FznyAGumi4qsLMt80Kqi0RNBfNMRDbUKVgXnKFv5z54DX82pNTmyWAzW54EPUjQ/MX7547
 bYGrGHem/HotRnYc6WyPJsNF2FpKz+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769104438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+fG002mzVdbfCy9zW8g/LnZDfVfi7pB8lr4GFwf+dSY=;
 b=D6OfnLfDC7HZ3fTjdp+Uz1r4jNp0vGfXDxSFEAo29EksWtJdjfj5VJv2Wt7Na/s3p4FxKx
 GbvYn0ol4XdD5rBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=B+fEx0P8;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=D6OfnLfD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769104438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+fG002mzVdbfCy9zW8g/LnZDfVfi7pB8lr4GFwf+dSY=;
 b=B+fEx0P8co6coWJ2KjmArSou/wpWQw7z/3zXRChjh2w/HpzBvW3UctvkCGSc+HT75+e+oG
 FznyAGumi4qsLMt80Kqi0RNBfNMRDbUKVgXnKFv5z54DX82pNTmyWAzW54EPUjQ/MX7547
 bYGrGHem/HotRnYc6WyPJsNF2FpKz+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769104438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+fG002mzVdbfCy9zW8g/LnZDfVfi7pB8lr4GFwf+dSY=;
 b=D6OfnLfDC7HZ3fTjdp+Uz1r4jNp0vGfXDxSFEAo29EksWtJdjfj5VJv2Wt7Na/s3p4FxKx
 GbvYn0ol4XdD5rBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6426313533;
 Thu, 22 Jan 2026 17:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YdrcFTZkcmlVawAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jan 2026 17:53:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 22 Jan 2026 18:53:54 +0100
Message-ID: <20260122175354.83833-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] lapi/tls.h: Cleanup ifdefs
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.665];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:mid,suse.cz:email]
X-Rspamd-Queue-Id: 753796BC2D
X-Rspamd-Action: no action

fe24196ce3 added .supported_archs into clone10. Therefore there is no
need to keep architecture check also in lapi/tls.h.

Moreover "Unsupported architecture for TLS" was misleading as it looked
as a missing arch support in kernel, but it's our allocate_tls_area()
implementation which does support only 3 architectures.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

based on a recent discussion on ML
https://lore.kernel.org/ltp/20260122130634.GA71214@pevik/

Kind regards,
Petr

 include/lapi/tls.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/lapi/tls.h b/include/lapi/tls.h
index f7e2f483fe..468fe3086d 100644
--- a/include/lapi/tls.h
+++ b/include/lapi/tls.h
@@ -52,22 +52,16 @@ static inline void *allocate_tls_area(void)
 
 static inline void init_tls(void)
 {
-#if defined(__x86_64__) || defined(__aarch64__) || defined(__s390x__)
 	tls_ptr = allocate_tls_area();
-#else
-	tst_brk(TCONF, "Unsupported architecture for TLS");
-#endif
 }
 
 static inline void free_tls(void)
 {
 	usleep(10000);
-#if defined(__x86_64__) || defined(__aarch64__) || defined(__s390x__)
 	if (tls_ptr) {
 		free(tls_ptr);
 		tls_ptr = NULL;
 	}
-#endif
 }
 
 #endif /* LAPI_TLS_H__ */
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
