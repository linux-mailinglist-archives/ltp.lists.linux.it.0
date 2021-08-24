Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8143F6009
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 16:18:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55BC93C9DEF
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 16:18:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0ABC03C0234
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 16:18:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7DA5C1400FA9
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 16:18:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CFA152005C
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629814693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w1jh1LZeTUK+aqwl9c07KP2tfMo6S0P/UuuysqMkWhQ=;
 b=a3svJ8nNItWv7J25VE17Ju7m/r+eLtkP4ojxvtvk6Hpo5sQ298zWHYZJ/838lWbuoz4jcQ
 PVKDnQ6//1j50ZODHnxoGSAOTIB1vpL9BcezWPbx4Gohk6HzL1NF6ck4SzfodqgPeQx3xR
 xEweCX+nfTCnYi4wcipWEc+a7vEPKS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629814693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w1jh1LZeTUK+aqwl9c07KP2tfMo6S0P/UuuysqMkWhQ=;
 b=Cl+LwK6syLS8pp5hFevMrAUP0NYVl1IsQbGsJ7S9uJcAdRD0FhU90UuYdJj7NQNhjuAJET
 v4SX584ZcogY39Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B478813AC6
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:18:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KnauK6X/JGHsBwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:18:13 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Aug 2021 16:18:20 +0200
Message-Id: <20210824141820.8685-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/sync_file_range02: Rewrite the
 decription
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

Into a docparse format.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../syscalls/sync_file_range/sync_file_range02.c       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index f9693089b..5da751c70 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -4,12 +4,12 @@
  * Author: Sumit Garg <sumit.garg@linaro.org>
  */
 
-/*
- * sync_file_range02
+/*\
+ * [Description]
  *
- * It basically tests sync_file_range() to sync test file range having large
- * dirty file pages to block device. Also, it tests all supported filesystems
- * on a test block device.
+ * Tests if sync_file_range() does sync a test file range with a many dirty pages
+ * to a block device. Also, it tests all supported filesystems on a test block
+ * device.
  */
 
 #define _GNU_SOURCE
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
