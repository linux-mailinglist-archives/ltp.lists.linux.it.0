Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1F487E22
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 22:21:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6761F3C903D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 22:21:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0674A3C8839
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 22:21:20 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 05B0D600564
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 22:21:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5318D1F3A9;
 Fri,  7 Jan 2022 21:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641590479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGPVC3NU8lKJL5V05GAvSTQvuGkI7J06g7XyusVutg4=;
 b=sPWsPzbf1Uvy+9CTnaYjMq9Lc2Izzj4maQiUYpAlnfXHj9G8Dx/qd7rwEqfC1PcwfGdc9t
 1PuQRnJxAUAiE7ksBXL7N5W6v7Yjp+B4i1MspZoLhCspy9FCw43iQ9jzzqHClIVuu8C3QC
 GfVh8loGtFhivUUIDTa3022cwr621m8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641590479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGPVC3NU8lKJL5V05GAvSTQvuGkI7J06g7XyusVutg4=;
 b=Rw3jNgL8C539mTzdhmghJwqxxHQmiQ5Aevy4VA0qcujL5lpxr8douq9MfdOcl1ChHnEaFo
 +Ot6b1vbWR+l6yBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22B6813D44;
 Fri,  7 Jan 2022 21:21:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFaCBs+u2GEHFwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 07 Jan 2022 21:21:19 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri,  7 Jan 2022 22:20:48 +0100
Message-Id: <20220107212058.19768-2-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107212058.19768-1-andrea.cervesato@suse.de>
References: <20220107212058.19768-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 01/11] Add KEYCTL_WATCH_KEY to lapi/keyctl.h
 fallback
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 include/lapi/keyctl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/keyctl.h b/include/lapi/keyctl.h
index d899345c9..3be782494 100644
--- a/include/lapi/keyctl.h
+++ b/include/lapi/keyctl.h
@@ -140,6 +140,10 @@ static inline key_serial_t keyctl_join_session_keyring(const char *name) {
 # define KEYCTL_INVALIDATE 21
 #endif
 
+#ifndef KEYCTL_WATCH_KEY
+# define KEYCTL_WATCH_KEY 32
+#endif
+
 /* key permissions */
 #ifndef KEY_POS_VIEW
 # define KEY_POS_VIEW    0x01000000
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
