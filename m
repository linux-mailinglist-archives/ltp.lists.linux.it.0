Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAGwFN1YcWkNEwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 23:53:17 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF25F18B
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 23:53:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 521F13CB237
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 23:53:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 637B43C6491
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 23:53:07 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7C8E810009A4
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 23:53:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B56F5BCF5;
 Wed, 21 Jan 2026 22:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769035985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qzz5E+oMZOuSX3x+y/9pIFL1mWy46e5ZT6/j/9dXKMA=;
 b=Lb5rzpfF0ytVuqHURJvbBqZI86aSukD+BUW0v6yqmAtUrq9PP+2aqDENu/5P7KXf1b+0a7
 eaczhfWhDRwjxVBoUlSEo0JvE3Jn01RE6/GmaUFuuZpFGR1MgSgSkss5UlLxhr2aNimBpf
 eNgx/stlk3TLdsjaeENVQvaJh6rCWwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769035985;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qzz5E+oMZOuSX3x+y/9pIFL1mWy46e5ZT6/j/9dXKMA=;
 b=oP9IA24BYW2o5IF0LF2h+q+9H2QwmlrzuKLF+GYXxg0u/OAYlspiqNBeJNboCI+c4vKrpb
 7N7JXahsC3m4gDAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=IaHB99Fp;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=EWQegRJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769035984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qzz5E+oMZOuSX3x+y/9pIFL1mWy46e5ZT6/j/9dXKMA=;
 b=IaHB99Fprtvmkdm8HL00skXIaq8TyMVnooP+IhFjg3sJ9LeEcdi3t+53pHnN8HaEKnH9wT
 zQGBg4f2yrtFDf64+xKPwIxD0UQ6ik10G8CfTCJxzzgYBAoY6RYZwPuF3iM3bg+ypWrAns
 z106kjR5ubVItbFr5RAlZB0cI1HL+7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769035984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qzz5E+oMZOuSX3x+y/9pIFL1mWy46e5ZT6/j/9dXKMA=;
 b=EWQegRJdq+lfb/cHn6ERRFSU4637UyY2JdzoiEgQjxm5/XddTX+S0cFtDd+8AqDvs8CnHM
 SrWacQhlO7OG8ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D92133EA63;
 Wed, 21 Jan 2026 22:53:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h7K+M89YcWlIUAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 21 Jan 2026 22:53:03 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 21 Jan 2026 23:52:58 +0100
Message-ID: <20260121225258.15820-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc/setup_mailinglist: Improve title, mention b4
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
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: E3EF25F18B
X-Rspamd-Action: no action

Title was misleading (we setup git, not the mailing list).
While at it, mention also b4.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/developers/setup_mailinglist.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/doc/developers/setup_mailinglist.rst b/doc/developers/setup_mailinglist.rst
index 80d5cb95a1..dd5fa27df1 100644
--- a/doc/developers/setup_mailinglist.rst
+++ b/doc/developers/setup_mailinglist.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
 
-Setting up the Mailing list
-===========================
+Setting up git for the LTP mailing list
+=======================================
 
 Before using :manpage:`git-send-email(1)`, you need to set up your email client
 to send emails from the command line. This typically involves configuring an
@@ -48,3 +48,7 @@ For any corner case, please take a look at the
     This method still works in most of the cases, but nowadays we often
     require to setup a two factor authentication. If this is the case, please
     consider setting up Git accordingly.
+
+    Instead of :manpage:`git-send-email(1)` you may want to use
+    `b4 tool <https://b4.docs.kernel.org/en/latest/contributor/send.html>`_.
+    See LTP ``b4`` configuration: :master:`.b4-config`.
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
