Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48832900664
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2024 16:24:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12AA03D0AA4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2024 16:24:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A5C8D3CFBD1
 for <ltp@lists.linux.it>; Fri,  7 Jun 2024 16:24:31 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E2D75600F2F
 for <ltp@lists.linux.it>; Fri,  7 Jun 2024 16:24:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07B0221B55;
 Fri,  7 Jun 2024 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1717770270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhyqkrRwYAsNw1QQ+q7dWClBFjN0K+umflMxjQCIyGc=;
 b=1mxYOOF07a47nZLbpYAx2nCupG9eDE/jFkGx+KwtkZ9TgeTohdn8SeC3TumivzWkPgqkKq
 iPPmpVMiVAYXaKcNavpSC4iGnQLWYpL+0kmxLdigdXZqgsadx9kkS9UzWHpw52PId0rEDR
 aJZwxKYcy90QGy9J59VeDhoXo74UC9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1717770270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhyqkrRwYAsNw1QQ+q7dWClBFjN0K+umflMxjQCIyGc=;
 b=R84OBRUDuFvo5DNh393CLNaW8cqhDyzjc/jPEn4aLUhEnm2aEPTikaIq5Swx1w138qRJmz
 6JHIvy4Wc2ctLgAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1717770270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhyqkrRwYAsNw1QQ+q7dWClBFjN0K+umflMxjQCIyGc=;
 b=1mxYOOF07a47nZLbpYAx2nCupG9eDE/jFkGx+KwtkZ9TgeTohdn8SeC3TumivzWkPgqkKq
 iPPmpVMiVAYXaKcNavpSC4iGnQLWYpL+0kmxLdigdXZqgsadx9kkS9UzWHpw52PId0rEDR
 aJZwxKYcy90QGy9J59VeDhoXo74UC9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1717770270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhyqkrRwYAsNw1QQ+q7dWClBFjN0K+umflMxjQCIyGc=;
 b=R84OBRUDuFvo5DNh393CLNaW8cqhDyzjc/jPEn4aLUhEnm2aEPTikaIq5Swx1w138qRJmz
 6JHIvy4Wc2ctLgAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C826413A42;
 Fri,  7 Jun 2024 14:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iGt4Lx0YY2a0CAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 07 Jun 2024 14:24:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Jun 2024 16:24:21 +0200
Message-ID: <20240607142423.116285-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240607142423.116285-1-pvorel@suse.cz>
References: <20240607142423.116285-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.79
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-2.99)[99.94%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC PATCH 1/3] runltp: Deprecate, add info about kirk
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

kirk is not perfect but already much better than old runltp script.
Let's deprecate runltp and propagate kirk.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runltp | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/runltp b/runltp
index 62ab66871..4b0bd08f1 100755
--- a/runltp
+++ b/runltp
@@ -68,9 +68,19 @@
 #################################################################################
 
 
+deprecated()
+{
+    echo "-------------------------------------------"
+    echo "INFO: runltp script is deprecated, try kirk"
+    echo "https://github.com/linux-test-project/kirk"
+    echo "-------------------------------------------"
+}
+
 
 setup()
 {
+    deprecated
+
     cd `dirname $0` || \
     {
         echo "FATAL: unable to change directory to $(dirname $0)"
@@ -921,6 +931,9 @@ EOF
 
 	EOF
     }
+
+    deprecated
+
     exit $VALUE
 }
 
-- 
2.45.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
