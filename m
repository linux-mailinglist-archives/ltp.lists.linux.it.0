Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22448664AB9
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 19:36:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCF003CCB36
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 19:36:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A5E3A3CB57F
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 19:36:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2D1AE1400275
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 19:36:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25154205F3;
 Tue, 10 Jan 2023 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673375762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CjgXz+b6vpnTOf0mZctcHIQCN2Onul8KXSkrAo3f0/Q=;
 b=eKKbMun4r1EXMWZumaIA8TdCewIvcxAyZdgn52F/m5aC3BEl5le5NN/QLNKqXpaZEY+HIy
 viPAq6jCTRSsShehuxxhLpuxTlFd61IfTeY/xLgwLSFlaENrTXlsXKuLZZoFT4ClKmp+KO
 4rFzP3pE6XLO6/m5Oik4c8WnCEdiHFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673375762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CjgXz+b6vpnTOf0mZctcHIQCN2Onul8KXSkrAo3f0/Q=;
 b=/vnbXZ+INUEtyVZwIxy3UuVuQ7sq6TnHMfGIAeNKLYU3trfd5j5Ug53IQ4eHb3iVrnKaij
 S3aPz3hd9/9UB1CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC49B1358A;
 Tue, 10 Jan 2023 18:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GbpqMBGwvWMVYgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 10 Jan 2023 18:36:01 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 10 Jan 2023 19:35:55 +0100
Message-Id: <20230110183555.6915-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_tmpdir: Add 'LTP_' prefix
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

Follow the approach of the shell API:

    TST_TMPDIR=$(mktemp -d "$TMPDIR/LTP_$TST_ID.XXXXXXXXXX")

Prefix helps to see directories mounted by LTP.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_tmpdir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
index d1419a1a40..b73b5c66f7 100644
--- a/lib/tst_tmpdir.c
+++ b/lib/tst_tmpdir.c
@@ -269,7 +269,7 @@ void tst_tmpdir(void)
 	 * use our default TEMPDIR.
 	 */
 	env_tmpdir = tst_get_tmpdir_root();
-	snprintf(template, PATH_MAX, "%s/%.3sXXXXXX", env_tmpdir, TCID);
+	snprintf(template, PATH_MAX, "%s/LTP_%.3sXXXXXX", env_tmpdir, TCID);
 
 	/* Make the temporary directory in one shot using mkdtemp. */
 	if (mkdtemp(template) == NULL) {
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
