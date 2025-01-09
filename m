Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E4A0792D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 15:29:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3710B3C2573
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 15:29:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 565CE3C189A
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 15:29:00 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5B4E36331FC
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 15:28:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C3B61F393;
 Thu,  9 Jan 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736432938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cr8rd7EJXAxcLRXtrrJq8uCmU1MC3NNejeJ+uYE/ycg=;
 b=vy9cA7vnFPEfNU4Q7aB0x7n9hxmUewkD9NDs8oZojom4OqEJv86yOW9FOd59Z9J2c0Ri8u
 vAeyHR6dPiGgRc0DXjmmi2mFHk7OzceDuB3FhMlhYn5w6shB6P34XHARbXUt51VxoersFZ
 +fVH48i0zXSjIHiUMrM1RFfnW3Kdw7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736432938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cr8rd7EJXAxcLRXtrrJq8uCmU1MC3NNejeJ+uYE/ycg=;
 b=W4rrI/imBT0KdGk99bw+bZWEDtqTeeVrK85g/Lrs8ydda7h/t7kwPrhdySVMnydZJ4Mlsc
 xlUMIxb+dQ0aUKCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736432938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cr8rd7EJXAxcLRXtrrJq8uCmU1MC3NNejeJ+uYE/ycg=;
 b=vy9cA7vnFPEfNU4Q7aB0x7n9hxmUewkD9NDs8oZojom4OqEJv86yOW9FOd59Z9J2c0Ri8u
 vAeyHR6dPiGgRc0DXjmmi2mFHk7OzceDuB3FhMlhYn5w6shB6P34XHARbXUt51VxoersFZ
 +fVH48i0zXSjIHiUMrM1RFfnW3Kdw7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736432938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cr8rd7EJXAxcLRXtrrJq8uCmU1MC3NNejeJ+uYE/ycg=;
 b=W4rrI/imBT0KdGk99bw+bZWEDtqTeeVrK85g/Lrs8ydda7h/t7kwPrhdySVMnydZJ4Mlsc
 xlUMIxb+dQ0aUKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EC2C139AB;
 Thu,  9 Jan 2025 14:28:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0iIcFCrdf2cEYAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jan 2025 14:28:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Jan 2025 15:28:47 +0100
Message-ID: <20250109142847.326936-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] testinfo.pl: Properly handle NULL
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

While at it, add missing comma to the arguments.

Fixes: 946d20bdaf ("metadata: metaparse: Better array parsing.")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: if we don't want to have NULL in the docs (see e.g. hugemmap10),
we can simply filer it:

$content .= paragraph(table_escape(join(', ', grep defined, @$v2)));

 docparse/testinfo.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 78433c40a3..487b7d5f22 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -408,7 +408,11 @@ sub content_all_tests
 				# two dimensional array
 				if (ref(@$v[0]) eq 'ARRAY') {
 					for my $v2 (@$v) {
-						$content .= paragraph(table_escape(join(' ', @$v2)));
+						# convert NULL to "NULL" string to be printed
+						for my $v3 (@$v2) {
+							$v3 = "NULL" if (!defined $v3);
+						}
+						$content .= paragraph(table_escape(join(', ', @$v2)));
 					}
 				} else {
 					# one dimensional array
-- 
2.47.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
