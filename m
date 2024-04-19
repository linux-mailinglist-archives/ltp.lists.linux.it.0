Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAC8AAEBA
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Apr 2024 14:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D6D73CFD74
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Apr 2024 14:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C5B013CE3F6
 for <ltp@lists.linux.it>; Fri, 19 Apr 2024 14:42:26 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0B52320473B
 for <ltp@lists.linux.it>; Fri, 19 Apr 2024 14:42:26 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8EBA921AF1;
 Fri, 19 Apr 2024 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713530545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cy5da7Emu9VyX+JYMp2sJi0lKcVJzo+O+VYTNobPnI=;
 b=DhqFQg4Q/fdu1JLoZK2wHxYbD9vs3awU6kPcPgNDH7r2G4rMwY522hPHPPska5LdHt1k0q
 SmUpvZxlcVAPSrHpipBPsr/pSN5CqubDWyk/8ruzm5rXq20RDaDemTJnweaRvIPbMI99V0
 fAPxb3Ryd5YMb9Tz2Jwk3cye/0W/h3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713530545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cy5da7Emu9VyX+JYMp2sJi0lKcVJzo+O+VYTNobPnI=;
 b=LelKcXZSBMMOhbQoyjZiokLosF4421MwZvHChunKV9XDPG4+MHHMfnb4nOKWvDJhTgSLV5
 DSvjf9M4BdLLrNCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713530545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cy5da7Emu9VyX+JYMp2sJi0lKcVJzo+O+VYTNobPnI=;
 b=DhqFQg4Q/fdu1JLoZK2wHxYbD9vs3awU6kPcPgNDH7r2G4rMwY522hPHPPska5LdHt1k0q
 SmUpvZxlcVAPSrHpipBPsr/pSN5CqubDWyk/8ruzm5rXq20RDaDemTJnweaRvIPbMI99V0
 fAPxb3Ryd5YMb9Tz2Jwk3cye/0W/h3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713530545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cy5da7Emu9VyX+JYMp2sJi0lKcVJzo+O+VYTNobPnI=;
 b=LelKcXZSBMMOhbQoyjZiokLosF4421MwZvHChunKV9XDPG4+MHHMfnb4nOKWvDJhTgSLV5
 DSvjf9M4BdLLrNCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AE0A13687;
 Fri, 19 Apr 2024 12:42:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cH7fE7FmImZNRQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 19 Apr 2024 12:42:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Apr 2024 14:42:21 +0200
Message-ID: <20240419124221.207445-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419124221.207445-1-pvorel@suse.cz>
References: <20240419124221.207445-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 3/3] doc: Update building docs section
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

* Use python3 as a binary (most of distros still have python reserved for
  python2).
* Mention sphinx can be used from package.
* While at it, replace 'source' with '.' (shorter, although most of the
  developers use shell which support source bashism, let's not encourage
  to use it).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/developers/documentation.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/doc/developers/documentation.rst b/doc/developers/documentation.rst
index 825495c50..0fbf5d49b 100644
--- a/doc/developers/documentation.rst
+++ b/doc/developers/documentation.rst
@@ -21,10 +21,10 @@ command as following:
     cd doc
 
     # prepare virtual enviroment
-    python -m virtualenv .venv
-    source .venv/bin/activate
+    python3 -m virtualenv .venv
+    . .venv/bin/activate
 
-    pip install sphinx
+    pip install sphinx # usually packaged in distros
     pip install -r requirements.txt
 
     # build documentation
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
