Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF9969E2E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2024 14:47:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 532863C4E08
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2024 14:47:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE4EB3C4CA6
 for <ltp@lists.linux.it>; Tue,  3 Sep 2024 14:46:50 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 566731A00895
 for <ltp@lists.linux.it>; Tue,  3 Sep 2024 14:46:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 185C31F37C;
 Tue,  3 Sep 2024 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1725367609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lirYEZ0WEr8FsLLv2vYM46k1pipthL4DhZjZGkBjhN4=;
 b=RIvjjShzCOMnebagtE/Izp+JOAET3DXALgb9F5REpIEOuTa6m5kZcjbIsZZeN0WRjoDfil
 gqDEA8RfsLiFmdkYZbRPUUNLwrPJ65z2MS58kgHxgmJ1ckArzPAGQOD2AMJKteOto3w+aE
 mc5voi8q/SilzS+b7w4CV8f8mIf68AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1725367609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lirYEZ0WEr8FsLLv2vYM46k1pipthL4DhZjZGkBjhN4=;
 b=VXup1Ygbux+VrKY3CyE62mnlz1Ms9s/tKi7nS9M5mn3ckj2oRjVsb7/OQsO0DfBAbNFGv4
 g+HMvzlX9wrHyzBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1725367609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lirYEZ0WEr8FsLLv2vYM46k1pipthL4DhZjZGkBjhN4=;
 b=RIvjjShzCOMnebagtE/Izp+JOAET3DXALgb9F5REpIEOuTa6m5kZcjbIsZZeN0WRjoDfil
 gqDEA8RfsLiFmdkYZbRPUUNLwrPJ65z2MS58kgHxgmJ1ckArzPAGQOD2AMJKteOto3w+aE
 mc5voi8q/SilzS+b7w4CV8f8mIf68AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1725367609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lirYEZ0WEr8FsLLv2vYM46k1pipthL4DhZjZGkBjhN4=;
 b=VXup1Ygbux+VrKY3CyE62mnlz1Ms9s/tKi7nS9M5mn3ckj2oRjVsb7/OQsO0DfBAbNFGv4
 g+HMvzlX9wrHyzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAC4B13A80;
 Tue,  3 Sep 2024 12:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CMleODgF12a4OgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 03 Sep 2024 12:46:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Sep 2024 14:46:43 +0200
Message-ID: <20240903124644.757127-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid, suse.cz:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] tools/genhtml.pl: Add deprecated warning
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

Script will be removed. People which want to have statistics should use
LTP runner kirk.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 tools/genhtml.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/genhtml.pl b/tools/genhtml.pl
index 5a9256500e..79c178d014 100644
--- a/tools/genhtml.pl
+++ b/tools/genhtml.pl
@@ -87,6 +87,11 @@ sub get_background_colour_column() {
     }
 }
 
+print STDERR "-------------------------------------------------\n";
+print STDERR "INFO: genhtml.pl script is deprecated, try kirk\n";
+print STDERR "(new LTP runner which also generates JSON output)\n";
+print STDERR "https://github.com/linux-test-project/kirk\n";
+print STDERR "-------------------------------------------------\n";
 
 if ($start_tag eq "" || $end_tag eq "" || $output_tag eq "" || $execution_tag eq "") {
 	syntax();
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
