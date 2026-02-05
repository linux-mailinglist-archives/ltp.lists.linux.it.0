Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB4jCySKhGl43QMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:16:36 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1EAF24CB
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:16:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21EC43CD07C
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Feb 2026 13:16:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 154EE3CDE70
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:15:57 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 650D31A00147
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:15:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF48C3E7BD;
 Thu,  5 Feb 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770293749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjsEpYbt6GiKHgv/aHX1HhESSQdn8TDh+kdTOTMQ1HE=;
 b=Dn+zDtcA9MenCKoiR7pwOH78YbE9PdD4/RwSjt6/VmYQUYlzLBDbwZUt57cNsAJzFP41Ij
 TVCsDPz759+yoOq30zVJq7Dh8hvlAd8QoNKhf2D5xv1GUrhAvh9QQ0JoFnxtpOBoD4Qdpt
 cEkzIxjWO/L19caMRTRE3M33eQZ7HPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770293749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjsEpYbt6GiKHgv/aHX1HhESSQdn8TDh+kdTOTMQ1HE=;
 b=h6ebcsn6dZgC6iFxWALUlCNpwotmJOrQ1OzY+8kASUBISjYBkYPGBtz+eLJfybfTyqa32r
 XqLXB7GwriXueSCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770293749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjsEpYbt6GiKHgv/aHX1HhESSQdn8TDh+kdTOTMQ1HE=;
 b=Dn+zDtcA9MenCKoiR7pwOH78YbE9PdD4/RwSjt6/VmYQUYlzLBDbwZUt57cNsAJzFP41Ij
 TVCsDPz759+yoOq30zVJq7Dh8hvlAd8QoNKhf2D5xv1GUrhAvh9QQ0JoFnxtpOBoD4Qdpt
 cEkzIxjWO/L19caMRTRE3M33eQZ7HPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770293749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjsEpYbt6GiKHgv/aHX1HhESSQdn8TDh+kdTOTMQ1HE=;
 b=h6ebcsn6dZgC6iFxWALUlCNpwotmJOrQ1OzY+8kASUBISjYBkYPGBtz+eLJfybfTyqa32r
 XqLXB7GwriXueSCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57BE83EA65;
 Thu,  5 Feb 2026 12:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4At5E/WJhGmHXwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 05 Feb 2026 12:15:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Feb 2026 13:15:36 +0100
Message-ID: <20260205121540.329921-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205121540.329921-1-pvorel@suse.cz>
References: <20260205121540.329921-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/6] testscripts/lvmtest.sh: Replace runltp with
 kirk
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
Cc: automated-testing@lists.yoctoproject.org
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
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cleanup_lvm.sh:url,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:mid,suse.cz:email,prepare_lvm.sh:url]
X-Rspamd-Queue-Id: BF1EAF24CB
X-Rspamd-Action: no action

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
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
