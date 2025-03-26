Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9CA7185F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Mar 2025 15:23:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4BED3C9B0F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Mar 2025 15:23:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4F1C3C8FA3
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 15:23:07 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CFF7B100047C
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 15:23:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04B4821166;
 Wed, 26 Mar 2025 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742998986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PdOr7rGK/wk0jL7t4owEczU1sTa9fKw0ihkMTMCvgZo=;
 b=kspSGFVSkghwUWiqnR+1Rb5aB008HIJY3+EzG0lotvpvI8WtVXWRmLFuanwv2g2d7Dd53E
 lQHjzS9cfIxo+rt4oMYlTcodHngDvCEf9O/KsYjwECBlx4pFfYiQ7URtW8CgmCbtUHh1BI
 smM0+pNJ24uT/yB+F5MPXPeNi28dFsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742998986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PdOr7rGK/wk0jL7t4owEczU1sTa9fKw0ihkMTMCvgZo=;
 b=sqX0ssX9+gck8iebXiNEQfSP8JVoFN+60jSwmKFUkx8dqPy9lKrYPXiPiNpqwbHJImvsBF
 YfDCmF7sgNcjy1Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742998986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PdOr7rGK/wk0jL7t4owEczU1sTa9fKw0ihkMTMCvgZo=;
 b=kspSGFVSkghwUWiqnR+1Rb5aB008HIJY3+EzG0lotvpvI8WtVXWRmLFuanwv2g2d7Dd53E
 lQHjzS9cfIxo+rt4oMYlTcodHngDvCEf9O/KsYjwECBlx4pFfYiQ7URtW8CgmCbtUHh1BI
 smM0+pNJ24uT/yB+F5MPXPeNi28dFsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742998986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PdOr7rGK/wk0jL7t4owEczU1sTa9fKw0ihkMTMCvgZo=;
 b=sqX0ssX9+gck8iebXiNEQfSP8JVoFN+60jSwmKFUkx8dqPy9lKrYPXiPiNpqwbHJImvsBF
 YfDCmF7sgNcjy1Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D133613927;
 Wed, 26 Mar 2025 14:23:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vUCkMckN5GfvRQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 26 Mar 2025 14:23:05 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 Mar 2025 15:22:59 +0100
Message-ID: <20250326142259.50981-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.997];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] ioctl_ficlone03.c: Support test on more
 filesystems
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

ext[2-4] don't support immutable.

vfat, exfat and ntfs would fail, therefore not supported:
ioctl_ficlone03.c:80: TBROK: ioctl(7,((((1U) << (((0+8)+8)+14)) | ((('f')) << (0+8)) | (((2)) << 0) | ((((sizeof(long)))) << ((0+8)+8)))),...) failed: EINVAL (22)
ioctl_ficlone03.c:95: TWARN: ioctl(7,((((2U) << (((0+8)+8)+14)) | ((('f')) << (0+8)) | (((1)) << 0) | ((((sizeof(long)))) << ((0+8)+8)))),...) failed: EINVAL (22)
ioctl_ficlone03.c:97: TWARN: ioctl(7,((((1U) << (((0+8)+8)+14)) | ((('f')) << (0+8)) | (((2)) << 0) | ((((sizeof(long)))) << ((0+8)+8)))),...) failed: EINVAL (22)
ioctl_ficlone03.c:104: TWARN: close(-1) failed: EBADF (9)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Based on Andrea's patch which fixes 32bit failure on Bcachefs:

https://patchwork.ozlabs.org/project/ltp/patch/20250326-fix_ioctl_ficlone03_32bit_bcachefs-v1-1-554a0315ebf5@suse.com/

NOTE: if found useful I'll recheck whether test works on older kernels.

 .../kernel/syscalls/ioctl/ioctl_ficlone03.c    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
index 6716423d9c..f4e7bf2906 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
@@ -43,16 +43,22 @@ static struct tcase {
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
+	int errno_exp = tc->errno_exp;
+	long fs_type = tst_fs_type(MNTPOINT);
+
+	/* ext[234] and tmpfs does not support immutable destination */
+	if (errno_exp == EPERM &&
+		(fs_type == TST_EXT234_MAGIC || fs_type == TST_TMPFS_MAGIC)) {
+		errno_exp = EOPNOTSUPP;
+	}
 
 	TST_EXP_FAIL(ioctl(*tc->dst_fd, FICLONE, *tc->src_fd),
-		tc->errno_exp,
-		"%s", tc->msg);
+		errno_exp, "%s", tc->msg);
 
 	clone_range->src_fd = *tc->src_fd;
 
 	TST_EXP_FAIL(ioctl(*tc->dst_fd, FICLONERANGE, clone_range),
-		tc->errno_exp,
-		"%s", tc->msg);
+		errno_exp, "%s", tc->msg);
 }
 
 static void setup(void)
@@ -117,6 +123,10 @@ static struct tst_test test = {
 			.mkfs_ver = "mkfs.xfs >= 1.5.0",
 			.mkfs_opts = (const char *const []) {"-m", "reflink=1", NULL},
 		},
+		{.type = "ext2"},
+		{.type = "ext3"},
+		{.type = "ext4"},
+		{.type = "tmpfs"},
 		{}
 	},
 	.bufs = (struct tst_buffers []) {
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
