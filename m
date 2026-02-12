Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EdjFVOJjWnq3wAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:03:31 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8612B171
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:03:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7316F3CF19F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 09:03:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D4D503CC23E
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 09:03:28 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 26D061A0065F
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 09:03:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C1EA25BDE6;
 Thu, 12 Feb 2026 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770883406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zuo6DHMVJeO1awCOE8SNVJ/2ecXSQAx18eVkKsTCscE=;
 b=yQM0auiRfTOgxKrPxBw2z6Jn8BY9JR3DOQRS0V/Gn8qZDWmk3Zl9SbVU8fGp6nvWSKx2M9
 XNXUkfm+iOTdzRnoq0DKieDW/xjCrJq0TVLI2254L1klQQjq6vyexS1yFFOinB5jY8Aiin
 RG/zNr1e49UBhQbjHAddX5giE3Orx9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770883406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zuo6DHMVJeO1awCOE8SNVJ/2ecXSQAx18eVkKsTCscE=;
 b=SrUZBH9mTVQ1WDsKcP/NHzxhzlttrBTpLPuc8N3LBOHQWIPmeCGe80Qnr406UYuB8kgVJ0
 dGpYDFITibnXZgDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770883406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zuo6DHMVJeO1awCOE8SNVJ/2ecXSQAx18eVkKsTCscE=;
 b=yQM0auiRfTOgxKrPxBw2z6Jn8BY9JR3DOQRS0V/Gn8qZDWmk3Zl9SbVU8fGp6nvWSKx2M9
 XNXUkfm+iOTdzRnoq0DKieDW/xjCrJq0TVLI2254L1klQQjq6vyexS1yFFOinB5jY8Aiin
 RG/zNr1e49UBhQbjHAddX5giE3Orx9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770883406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zuo6DHMVJeO1awCOE8SNVJ/2ecXSQAx18eVkKsTCscE=;
 b=SrUZBH9mTVQ1WDsKcP/NHzxhzlttrBTpLPuc8N3LBOHQWIPmeCGe80Qnr406UYuB8kgVJ0
 dGpYDFITibnXZgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90EAB3EA62;
 Thu, 12 Feb 2026 08:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cm8ZIk6JjWktegAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 12 Feb 2026 08:03:26 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Feb 2026 09:03:23 +0100
Message-ID: <20260212080323.137459-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc/requirements.txt: Add setuptools
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,suse.cz:mid,suse.cz:email];
	DMARC_NA(0.00)[suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: E5B8612B171
X-Rspamd-Action: no action

Temporary workaround until upstream fix [1] is released.

It fixes error:
Extension error:
Could not import extension linuxdoc.rstKernelDoc (exception: No module named 'pkg_resources')

[1] https://github.com/return42/linuxdoc/commit/19f5e5cbe8fec100d9135cfb7d3f183fa9dc0642

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

it might take some time to get the new release, that's why this
workaround.
https://github.com/return42/linuxdoc/pull/42#issuecomment-3871470496

Fixes CI:
https://github.com/linux-test-project/ltp/actions/runs/21937826696/job/63355843895

Kind regards,
Petr

 doc/requirements.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/requirements.txt b/doc/requirements.txt
index ed9e31601d..7a6219e241 100644
--- a/doc/requirements.txt
+++ b/doc/requirements.txt
@@ -1,5 +1,9 @@
 # Use the same sphinx as on readthedocs.org. When updated, make sure
 # sphinx-rtd-theme is compatible with sphinx.
+
+# workaround for sphinx.errors.ExtensionError: Could not import extension linuxdoc.rstKernelDoc (exception: No module named 'pkg_resources')
+setuptools==68.0.0
+
 sphinx==7.2.6
 sphinx-rtd-theme==2.0.0
 
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
