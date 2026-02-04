Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI0wAG0zg2kwjAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 12:54:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90430E55BC
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 12:54:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F2813CE11D
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 12:54:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF2173CE1D0
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 12:53:56 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 497C06008AF
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 12:53:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 037473E710;
 Wed,  4 Feb 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770206024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sVIOluZuM7ZocuLXfbqv8t/wTDTYCS8RD+Eq3g1bDg=;
 b=KQQQ2oCN2dBLPW6A7/M6lBfTQ8R7g5jeZUpjrunLJjZ/R3ghK6Ukcifjv1m+v8XKC1yfCu
 5fB3qXlpPZkHYeUXyRXd21gtsx5IMjQ2+n7NEDbi2yNV4sqj3Lu/idj1f+0VHGLlGuxVoh
 Vg8WzbSfwzTbuJf6WANot8sPaLBcATE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770206024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sVIOluZuM7ZocuLXfbqv8t/wTDTYCS8RD+Eq3g1bDg=;
 b=nkAH05V6Ab9fCo2ePA79WB80Z2KJQ99AJX7Xmb7rlUmU7ETFsyyNmIMdZcJbcVzbb0dYsy
 amfzvk4+huggJQBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770206024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sVIOluZuM7ZocuLXfbqv8t/wTDTYCS8RD+Eq3g1bDg=;
 b=KQQQ2oCN2dBLPW6A7/M6lBfTQ8R7g5jeZUpjrunLJjZ/R3ghK6Ukcifjv1m+v8XKC1yfCu
 5fB3qXlpPZkHYeUXyRXd21gtsx5IMjQ2+n7NEDbi2yNV4sqj3Lu/idj1f+0VHGLlGuxVoh
 Vg8WzbSfwzTbuJf6WANot8sPaLBcATE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770206024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sVIOluZuM7ZocuLXfbqv8t/wTDTYCS8RD+Eq3g1bDg=;
 b=nkAH05V6Ab9fCo2ePA79WB80Z2KJQ99AJX7Xmb7rlUmU7ETFsyyNmIMdZcJbcVzbb0dYsy
 amfzvk4+huggJQBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B334B3EA65;
 Wed,  4 Feb 2026 11:53:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aNlNKkczg2kcCwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 04 Feb 2026 11:53:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Feb 2026 12:53:37 +0100
Message-ID: <20260204115339.224261-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204115339.224261-1-pvorel@suse.cz>
References: <20260204115339.224261-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/4] testscripts/lvmtest.sh: Replace runltp with kirk
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:mid,suse.cz:email]
X-Rspamd-Queue-Id: 90430E55BC
X-Rspamd-Action: no action

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Martin,

is this safe enough, right?

Kind regards,
Petr

 testscripts/lvmtest.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testscripts/lvmtest.sh b/testscripts/lvmtest.sh
index 8407a22272..198495df2c 100755
--- a/testscripts/lvmtest.sh
+++ b/testscripts/lvmtest.sh
@@ -14,5 +14,5 @@ fi
 
 export PATH="${PATH}:${LTPROOT}:${LTPROOT}/bin:${LTPROOT}/testcases/bin"
 
-generate_lvm_runfile.sh && prepare_lvm.sh && runltp -f lvm.local
+generate_lvm_runfile.sh && prepare_lvm.sh && kirk -f lvm.local
 cleanup_lvm.sh
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
