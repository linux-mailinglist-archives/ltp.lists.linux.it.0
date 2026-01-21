Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KUDIH+PcGlQYgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:34:07 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C731953A2B
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:34:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DA583CB2B9
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:34:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E05113CAE38
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 09:33:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E886600197
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 09:33:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C1625BCCA;
 Wed, 21 Jan 2026 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768984427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uQj0f+/QN03dC/eYu6Fg/ITkQHWLd4xoBtkVWH4L9Lw=;
 b=0S6hmIt+GnQHvRdwaZf0glG0ISNIyycRXB9ZFweeAK4RNVUTYASgUlP8RFg/dCTLNx9/FW
 q72adeQaKmoIr+KTL0hEfz56vumwZCUAiP0/Y+0jNxJ+7+J0oFgGqulBoMTQtIXdaB2MJl
 Z559rzVUfNTigsLzypUoZ4t90j3DssU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768984427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uQj0f+/QN03dC/eYu6Fg/ITkQHWLd4xoBtkVWH4L9Lw=;
 b=2rzGd4gwZBY2zwFXW+DYPIqTf95Yve2gKs3ndP48CIz4OLoWK9rl3OpCXnsZyAdGtId8lh
 FukNsM1KEZ8b7WBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768984426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uQj0f+/QN03dC/eYu6Fg/ITkQHWLd4xoBtkVWH4L9Lw=;
 b=23fXL1ZSErSUtPCztOTn/PgPGUwDKMrGdLAXrkhsiniPzs9urEB3ANPAqpgrlnleQ13yyi
 4jTKCKKLlTYPI9kuuqW9a6CdaukCVKTXhfeUrGDK+BoR0vpTsc2AlSH6VAl5xZIR3cZBD8
 fDEePmi4fz668aTmqZmBQHVxxvrgook=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768984426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uQj0f+/QN03dC/eYu6Fg/ITkQHWLd4xoBtkVWH4L9Lw=;
 b=ZmLuIxeKl3E3IoN5HUePvCGpEI3cUyQAuaqR8BcEfx6hgRXwHJq5uqLXQ+oAvUdK4R+j89
 dFv2pDE6aBjSUfAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CB253EA63;
 Wed, 21 Jan 2026 08:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZQteEWqPcGlWBAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 21 Jan 2026 08:33:46 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 21 Jan 2026 09:33:43 +0100
Message-ID: <20260121083343.127613-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] ima_setup.sh: Fix check of signed policy requirement
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
Cc: linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,picard.linux.it:rdns,picard.linux.it:helo];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: C731953A2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kernel code in arch_get_ima_policy() depends also on
CONFIG_IMA_ARCH_POLICY added in v5.0:
d958083a8f640 ("x86/ima: define arch_get_ima_policy() for x86")

Fixes: c38b528783 ("ima_{conditionals, policy}: Handle policy required to be signed")
Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Mimi, all,

FYI I'd like to merge it this week to get it into LTP release.

Kind regards,
Petr

 testcases/kernel/security/integrity/ima/tests/ima_setup.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 1bce78d425..df0b8d1532 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -466,10 +466,11 @@ require_evmctl()
 }
 
 # 56dc986a6b20b ("ima: require signed IMA policy when UEFI secure boot is enabled") # v6.5-rc4
+# d958083a8f640 ("x86/ima: define arch_get_ima_policy() for x86") # v5.0
 check_need_signed_policy()
 {
 	tst_secureboot_enabled && tst_kvcmp -ge '6.5' && tst_require_kconfigs \
-		'CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY'
+		'CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY,CONFIG_IMA_ARCH_POLICY'
 }
 
 # loop device is needed to use only for tmpfs
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
