Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63A777FB5
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Aug 2023 19:59:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11F1D3CD608
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Aug 2023 19:59:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 624AF3CD087
 for <ltp@lists.linux.it>; Thu, 10 Aug 2023 19:59:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A7711400981
 for <ltp@lists.linux.it>; Thu, 10 Aug 2023 19:59:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C336A21845;
 Thu, 10 Aug 2023 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691690369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eg6PJjSUf7aesI0hkz9rVAmwG86jYgVjLiKeqq/Vfj4=;
 b=XPmAeFETalUnxrYlJVv8Mx0HsLYKpgXqZ6iqCE0/vIUrkCjwhxbpxGvtyDgBd3zCJ1LB2f
 +NxwzmJcQ3cMfo95nM0dlkUD0UHbxfZfzBfmC4KeScQjmeflJ7A2EvBs+V0HNcnEyEAfdJ
 PGnb2gN6Jz4DtuCfS4Gt+oIGH2bFKKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691690369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eg6PJjSUf7aesI0hkz9rVAmwG86jYgVjLiKeqq/Vfj4=;
 b=Cni+3nwYfI79xDXS0HiZRSCL3cwR2+KT/t8WVZ5lkS4z0hwIsSAG5wTnO8jAYbZ8LlLVXm
 DEnjKtEGUvtlSMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A66B8138E2;
 Thu, 10 Aug 2023 17:59:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4CilKIEl1WSvXQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 10 Aug 2023 17:59:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id F269DA076F; Thu, 10 Aug 2023 19:59:28 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Aug 2023 19:59:26 +0200
Message-Id: <20230810175926.6205-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] fanotify23: Make evictable marks tests more
 reliable
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
Cc: Jan Kara <jack@suse.cz>, petr.vorel@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It has been observed that when fanotify23 test is run in a loop, it
eventually fails as:

fanotify23.c:112: TPASS: FAN_MARK_ADD failed with EEXIST as expected when trying to downgrade to evictable mark
fanotify23.c:75: TPASS: FAN_MARK_REMOVE failed with ENOENT as expected after empty mask
fanotify23.c:156: TPASS: Got no events as expected
fanotify23.c:81: TFAIL: FAN_MARK_REMOVE did not fail with ENOENT as expected after drop_caches: SUCCESS (0)

This is because repeated evictions of caches done by the test reclaim
all freeable slab objects in the system. So when the test calls drop
caches, only the dentry and inode of the test file are there to reclaim.
But for inode to be reclaimed, dentry (which holds inode reference) has
to be freed first and for dentry to be freed it has to first cycle
through the LRU which takes two slab reclaim calls.

Call drop caches twice to make sure dentry has chance to pass through
the LRU and be reclaimed.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify23.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify23.c b/testcases/kernel/syscalls/fanotify/fanotify23.c
index 89fd4f36a09b..fb812c51e34e 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify23.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify23.c
@@ -160,10 +160,16 @@ static void test_fanotify(void)
 	}
 
 	/*
-	 * drop_caches should evict inode from cache and remove evictable mark
+	 * drop_caches should evict inode from cache and remove evictable mark.
+	 * We call drop_caches twice as once the dentries will just cycle
+	 * through the LRU without being reclaimed and if there are no other
+	 * objects to reclaim, the slab reclaim will just stop instead of
+	 * retrying. Note that this relies on how reclaim of fs objects work
+	 * for the filesystem but this test is restricted to ext2...
 	 */
 	fsync_file(TEST_FILE);
 	SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
+	SAFE_FILE_PRINTF(DROP_CACHES_FILE, "3");
 
 	verify_mark_removed(TEST_FILE, "after drop_caches");
 
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
