Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C809D8091A3
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Dec 2023 20:40:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42C613CD8B8
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Dec 2023 20:40:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AC7B3C8697
 for <ltp@lists.linux.it>; Thu,  7 Dec 2023 20:40:37 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B7941603E80
 for <ltp@lists.linux.it>; Thu,  7 Dec 2023 20:40:36 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D0631FB6D;
 Thu,  7 Dec 2023 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1701978036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0AyJZPJzU8qQrExlHSfoT/33DnLmbBk/rkQlddp9Vc=;
 b=if4/TZMSf7/wSzk1o7sWoUKx72UPDfxhP8p9F+tGSvpkAPLXt083kfnLvqSsgTmZDe2HuZ
 +DPlHrSiNcPVXVv6oZZZOzKiRcQ4UoPwx1/UvNwfb3lNpH1BVW4V/Zvjs0IvzBbD+8Qh3N
 jN57Yz4jAHRtmu6HPsGG/HOlVu5L7H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1701978036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0AyJZPJzU8qQrExlHSfoT/33DnLmbBk/rkQlddp9Vc=;
 b=aOEMmdJEVyKAJK0UTZ/0SCZ8uW7H4joFliCbEUaO/jy76qS7d1FbVRW/PaGPWOyKuIND21
 Ym2SCnPkKML6mkBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1701978036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0AyJZPJzU8qQrExlHSfoT/33DnLmbBk/rkQlddp9Vc=;
 b=if4/TZMSf7/wSzk1o7sWoUKx72UPDfxhP8p9F+tGSvpkAPLXt083kfnLvqSsgTmZDe2HuZ
 +DPlHrSiNcPVXVv6oZZZOzKiRcQ4UoPwx1/UvNwfb3lNpH1BVW4V/Zvjs0IvzBbD+8Qh3N
 jN57Yz4jAHRtmu6HPsGG/HOlVu5L7H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1701978036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0AyJZPJzU8qQrExlHSfoT/33DnLmbBk/rkQlddp9Vc=;
 b=aOEMmdJEVyKAJK0UTZ/0SCZ8uW7H4joFliCbEUaO/jy76qS7d1FbVRW/PaGPWOyKuIND21
 Ym2SCnPkKML6mkBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3123E13B96;
 Thu,  7 Dec 2023 19:40:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cJhqCrMfcmVyBQAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Thu, 07 Dec 2023 19:40:35 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  7 Dec 2023 20:40:09 +0100
Message-ID: <20231207194011.273027-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207194011.273027-1-pvorel@suse.cz>
References: <20231207194011.273027-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Level: 
X-Spam-Score: -0.30
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[14];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[suse.cz,redhat.com,suse.com,fujitsu.com,linux.dev,vger.kernel.org,gmail.com];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[37.18%]
X-Spam-Flag: NO
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lib: Add Bcachefs magic
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
Cc: Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, fstests@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2

 include/tst_fs.h  | 3 +++
 lib/tst_fs_type.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index eb9841165..06f5be896 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -34,6 +34,9 @@
 #define TST_VFAT_MAGIC     0x4d44 /* AKA MSDOS */
 #define TST_EXFAT_MAGIC    0x2011BAB0UL
 
+/* fs/bcachefs/bcachefs_format.h */
+#define TST_BCACHE_MAGIC		0xca451a4e
+
 enum tst_fill_access_pattern {
 	TST_FILL_BLOCKS,
 	TST_FILL_RANDOM
diff --git a/lib/tst_fs_type.c b/lib/tst_fs_type.c
index d9c9c0817..7f0d61a8e 100644
--- a/lib/tst_fs_type.c
+++ b/lib/tst_fs_type.c
@@ -36,6 +36,8 @@ const char *tst_fs_type_name(long f_type)
 		return "9p";
 	case TST_RAMFS_MAGIC:
 		return "ramfs";
+	case TST_BCACHE_MAGIC:
+		return "bcachefs";
 	case TST_BTRFS_MAGIC:
 		return "btrfs";
 	case TST_XFS_MAGIC:
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
