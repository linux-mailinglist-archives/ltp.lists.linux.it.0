Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C9A6B870
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Mar 2025 11:03:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 046453CAF00
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Mar 2025 11:03:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F7B13CAE68
 for <ltp@lists.linux.it>; Fri, 21 Mar 2025 11:03:28 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 12F7C100034A
 for <ltp@lists.linux.it>; Fri, 21 Mar 2025 11:03:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 787D121C29;
 Fri, 21 Mar 2025 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742551405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R14WN9kq4S6B1MuMjXKGLmRt+ArJv1VCUUhguggjFGY=;
 b=utcnofUM/dXiNC4zYtzKtm/NY3YX4f+/vCQwSchidq2kdaM0Eji798dGT96O+88IbbF5cr
 FzkK483Y0Az1+fKqVZBQNFT1cN06VCH/eKdphscLHBgZpVtIAWRV+ON9YYc4PFo3aS5Wyl
 50ka8M7ADwnEdq/dLtN/S1nqIH1EWcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742551405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R14WN9kq4S6B1MuMjXKGLmRt+ArJv1VCUUhguggjFGY=;
 b=7K4tJWzkssqhGbqhSTtBAaBnmLm8xFTwQNXh8YXEOhwC531enwmpdc6v/rOpzfRspw8E3v
 1XC618uPmnW1A7BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mzPOvm1X;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=XPXvjCjy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1742551403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R14WN9kq4S6B1MuMjXKGLmRt+ArJv1VCUUhguggjFGY=;
 b=mzPOvm1XYKzWSXhZssTvfiwVK9umJXZG5FjmKMubT0E3p7nrj0VhGWpFIIgV0d356/Vrbi
 uGXQbjPZFnanwT6j9E9RcFk2+oPKre+Y2D7vUM+4BCUYMeBigXZ4LGsRHJ4ecDBT7mNwvy
 e9Lq8qYAQ8j1pO3pnsi7uzhQWX0/kig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1742551403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R14WN9kq4S6B1MuMjXKGLmRt+ArJv1VCUUhguggjFGY=;
 b=XPXvjCjySsWM/nGSA3V5VI7nP7kwjo+rRBj7Ie206vaVEF1zCEQ90re50cUZdw/HwRaov1
 wNos3spEHFhztrDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23ADD13A2C;
 Fri, 21 Mar 2025 10:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fzxZB2s53Wd7JgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 21 Mar 2025 10:03:23 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Mar 2025 11:03:20 +0100
Message-ID: <20250321100320.162107-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: 787D121C29
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_CC(0.00)[suse.cz,redhat.com,suse.com,oracle.com,gmail.com,lst.de,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC PATCH 1/1] ioctl_ficlone03: Require 5.10 for XFS
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
Cc: linux-xfs@vger.kernel.org, Gao Xiang <hsiangkao@redhat.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, fstests@vger.kernel.org,
 Allison Collins <allison.henderson@oracle.com>,
 Dave Chinner <dchinner@redhat.com>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test fails on XFS on kernel older than 5.10:

    # ./ioctl_ficlone03
	...
    tst_test.c:1183: TINFO: Mounting /dev/loop0 to /tmp/LTP_ioc6ARHZ7/mnt fstyp=xfs flags=0
    [   10.122070] XFS (loop0): Superblock has unknown incompatible features (0x8) enabled.
    [   10.123035] XFS (loop0): Filesystem cannot be safely mounted by this kernel.
    [   10.123916] XFS (loop0): SB validate failed with error -22.
    tst_test.c:1183: TBROK: mount(/dev/loop0, mnt, xfs, 0, (nil)) failed: EINVAL (22)

This also causes Btrfs testing to be skipped due TBROK on XFS. With increased version we get on 5.4 LTS:

    # ./ioctl_ficlone03
    tst_test.c:1904: TINFO: Tested kernel: 5.4.291 #194 SMP Fri Mar 21 10:18:02 CET 2025 x86_64
    ...
    tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
    tst_test.c:1833: TINFO: === Testing on xfs ===
    tst_cmd.c:281: TINFO: Parsing mkfs.xfs version
    tst_test.c:969: TCONF: The test requires kernel 5.10 or newer
    tst_test.c:1833: TINFO: === Testing on btrfs ===
    tst_test.c:1170: TINFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
    [   30.143670] BTRFS: device fsid 1a6d250c-0636-11f0-850f-c598bdcd84c4 devid 1 transid 6 /dev/loop0
    tst_test.c:1183: TINFO: Mounting /dev/loop0 to /tmp/LTP_iocjwzyal/mnt fstyp=btrfs flags=0
    [   30.156563] BTRFS info (device loop0): using crc32c (crc32c-generic) checksum algorithm
    [   30.157363] BTRFS info (device loop0): flagging fs with big metadata feature
    [   30.158061] BTRFS info (device loop0): using free space tree
    [   30.158620] BTRFS info (device loop0): has skinny extents
    [   30.159911] BTRFS info (device loop0): enabling ssd optimizations
    [   30.160652] BTRFS info (device loop0): checking UUID tree
    ioctl_ficlone03_fix.c:49: TPASS: invalid source : EBADF (9)
    ioctl_ficlone03_fix.c:55: TPASS: invalid source : EBADF (9)

Fixing commit is 29887a2271319 ("xfs: enable big timestamps").

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

I suppose we aren't covering a test bug with this and test is really
wrong expecting 4.16 would work on XFS. FYI this affects 5.4.291
(latest 5.4 LTS which is still supported) and would not be fixed due a
lot of missing functionality from 5.10.

Kind regards,
Petr

 testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
index 6a9d270d9f..e2ab10cba1 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
@@ -113,7 +113,7 @@ static struct tst_test test = {
 		{.type = "bcachefs"},
 		{
 			.type = "xfs",
-			.min_kver = "4.16",
+			.min_kver = "5.10",
 			.mkfs_ver = "mkfs.xfs >= 1.5.0",
 			.mkfs_opts = (const char *const []) {"-m", "reflink=1", NULL},
 		},
-- 
2.47.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
