Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E47F5259
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Nov 2023 22:13:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A4B43CE0C4
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Nov 2023 22:13:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C24C13CBF03
 for <ltp@lists.linux.it>; Wed, 22 Nov 2023 22:13:32 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9284B1A01943
 for <ltp@lists.linux.it>; Wed, 22 Nov 2023 22:13:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E93D218EE;
 Wed, 22 Nov 2023 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1700687610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=K5F3Nf1FLbrFWVtIq2uDQPMol4SUnqL1qALIFzBqJrE=;
 b=s89OQkQEE9Y55GGrhm2qUYMzMcyzh+GyjgblexMLb9H7ZI6nB63afCC0/JsDxiciQKxa1X
 v1h2D/dPLcx6svfIcSbQyS1yAeiYXfesSMcQTbceuutYE8v4acI5W2divVRWXY0nUgybK3
 qBceaAvpAJdWcKpsJ92GTJKKfJbUWLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1700687610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=K5F3Nf1FLbrFWVtIq2uDQPMol4SUnqL1qALIFzBqJrE=;
 b=n11g3or4fOM3GSkrLslNqSWq/AjKuGV6S2qF/8XmfLpjZBehdrvJfWPWb0O1a/Nkyl+nwF
 c4Zy6aTzN/kRfbDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 436CD13461;
 Wed, 22 Nov 2023 21:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BUMZD/luXmXTKQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Nov 2023 21:13:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 22 Nov 2023 22:13:18 +0100
Message-ID: <20231122211318.31358-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.94
X-Spamd-Result: default: False [0.94 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[6];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.76)[98.98%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] diotest4: Skip test 3 and 14 for tmpfs
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Hugh Dickins <hughd@google.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tmpfs in kernel v6.6 got support for O_DIRECT in e88e0d366f9c ("tmpfs:
trivial support for direct IO"). There is no reason for tmpfs to reject
direct IO of any size therefore follow the approach already used for
Btrfs, NFS and FUSE: skipping test 3 (odd count of read and write)
and 14 (read, write with non-aligned buffer).

Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/io/direct_io/diotest4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
index 45c677b5b..ad00fa3e0 100644
--- a/testcases/kernel/io/direct_io/diotest4.c
+++ b/testcases/kernel/io/direct_io/diotest4.c
@@ -270,6 +270,7 @@ int main(int argc, char *argv[])
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
 	case TST_FUSE_MAGIC:
+	case TST_TMPFS_MAGIC:
 		tst_resm(TCONF, "%s supports odd count IO",
 			 tst_fs_type_name(fs_type));
 	break;
@@ -443,6 +444,7 @@ int main(int argc, char *argv[])
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
 	case TST_FUSE_MAGIC:
+	case TST_TMPFS_MAGIC:
 		tst_resm(TCONF, "%s supports non-aligned buffer",
 			 tst_fs_type_name(fs_type));
 	break;
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
