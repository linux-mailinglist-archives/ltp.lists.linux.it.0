Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 456718A806F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:12:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D757D3CFB7E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Apr 2024 12:12:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AA433CF2F9
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:12:11 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 50831609A36
 for <ltp@lists.linux.it>; Wed, 17 Apr 2024 12:12:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D9BB33AEE;
 Wed, 17 Apr 2024 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713348728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F3J4Jh81wGPpJkDdCeSOA4rH4gf8LbHo2sJFetX00dI=;
 b=gelSX9vVdWCxxudKFbXkIoCHjOYjOXiByuyXlA+mCCOQ52/HoJlmjdO2O4g+WsFbq0bPnj
 gvGR4dOH7mh3VXsyRRlB/jXVsqFiTjiRf2cugbgo3BLX49RhCIDzVK5oxvyG6KdFaj4WVb
 Bq6XzZf0L8CgpyD/CFjEm0dwZ38zQ0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713348728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F3J4Jh81wGPpJkDdCeSOA4rH4gf8LbHo2sJFetX00dI=;
 b=SHv6g1uNoRYXuOZASvWDciTWg9yyXDdwo35sz8qM1dkQEDUIPsmGtwgxzNHhVv0DReeMgL
 7MvLu8ymNYSW6WCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713348728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F3J4Jh81wGPpJkDdCeSOA4rH4gf8LbHo2sJFetX00dI=;
 b=gelSX9vVdWCxxudKFbXkIoCHjOYjOXiByuyXlA+mCCOQ52/HoJlmjdO2O4g+WsFbq0bPnj
 gvGR4dOH7mh3VXsyRRlB/jXVsqFiTjiRf2cugbgo3BLX49RhCIDzVK5oxvyG6KdFaj4WVb
 Bq6XzZf0L8CgpyD/CFjEm0dwZ38zQ0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713348728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F3J4Jh81wGPpJkDdCeSOA4rH4gf8LbHo2sJFetX00dI=;
 b=SHv6g1uNoRYXuOZASvWDciTWg9yyXDdwo35sz8qM1dkQEDUIPsmGtwgxzNHhVv0DReeMgL
 7MvLu8ymNYSW6WCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D6021384C;
 Wed, 17 Apr 2024 10:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7jISGXigH2ZaaAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Apr 2024 10:12:08 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 17 Apr 2024 12:12:01 +0200
Message-ID: <20240417101201.715518-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.77 / 50.00]; BAYES_HAM(-2.98)[99.89%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.987];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.77
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] doc: documentation: Fix typo other => older
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

Fixes: 638934e8b ("doc: Documentation usage and development")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Andrea,

I suppose you mean "older", otherwise the sentence does not make sense
to me (i.e. which versions caused problems?)

Kind regards,
Petr

 doc/developers/documentation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/developers/documentation.rst b/doc/developers/documentation.rst
index cfc8bf6f5..ba7b61a43 100644
--- a/doc/developers/documentation.rst
+++ b/doc/developers/documentation.rst
@@ -36,7 +36,7 @@ Once the procedure has been completed, documentation will be visible at
 .. warning::
 
     The current ``.readthedocs.yml`` workflow is using ``Python 3.6`` because
-    other Python versions were causing issues. No other version has been tested,
+    older Python versions were causing issues. No other version has been tested,
     but it should work anyway.
 
 Validating spelling
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
