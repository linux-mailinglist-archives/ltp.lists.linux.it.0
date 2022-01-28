Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E14A00BC
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 20:16:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51C073C975D
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 20:16:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 703CF3C9744
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 20:16:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8EDAF600CC7
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 20:16:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B50831F385;
 Fri, 28 Jan 2022 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643397397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+rq8JBZ5qSU07O2EMJbdJifJcO5Yz8erWhWjFSD3qAA=;
 b=t98udLzxXhrS5xqJyIbPukhVYn3+12EUbT7mWAKDQwF3Ie/bo4+ATsd8pCR47WOLuj0R5d
 EDIcfw9bIgZkU/dfXqbtRPmRspDxneyfyO+7rdHphvVDN5o+26NISUabAG99XmDoiYVAvs
 CEy0xCDuiiUhyFicTBnQX79o7Wu+V/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643397397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+rq8JBZ5qSU07O2EMJbdJifJcO5Yz8erWhWjFSD3qAA=;
 b=VpfBCkg48JfKQmfXbg2MiipXweW72ofIlm83Zk0XP25j4yoVbKr8AQF4a00QjIqmiy8hK8
 5MthKbbnqICVM4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78F3113A92;
 Fri, 28 Jan 2022 19:16:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sltzGRVB9GGrOQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 28 Jan 2022 19:16:37 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 Jan 2022 20:16:31 +0100
Message-Id: <20220128191631.9153-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 6/6] doc: Add missing shell variables
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

belongs to https://patchwork.ozlabs.org/project/ltp/list/?series=282990

Linking like this could work.

Kind regards,
Petr

 doc/shell-test-api.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index 41878004fb..3a43824357 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -196,11 +196,17 @@ simply by setting right '$TST_FOO'.
 | Variable name            | Action done
 | 'TST_DEV_EXTRA_OPTS'     | Pass additional 'mkfs' options when use 'TST_FORMAT_DEVICE'.
 | 'TST_DEV_FS_OPTS'        | Pass extra 'mkfs' options after the device name
+| 'TST_DEVICE'             | See
+|                          | https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#mounting-and-unmounting-filesystems[Mounting and unmounting filesystems]
 |                          | when use 'TST_FORMAT_DEVICE'.
 | 'TST_FORMAT_DEVICE'      | Format a block device with a filesystem. See also
 |                          | 'TST_DEV_EXTRA_OPTS', 'TST_DEV_FS_OPTS', 'TST_FS_TYPE'.
 |                          | Implies 'TST_NEEDS_DEVICE=1' (no need to set it).
 | 'TST_FS_TYPE'            | Overwrite the default filesystem to be used.
+| 'TST_MNTPOINT'           | See
+|                          | https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#mounting-and-unmounting-filesystems[Mounting and unmounting filesystems]
+| 'TST_MNT_PARAMS'         | See
+|                          | https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#mounting-and-unmounting-filesystems[Mounting and unmounting filesystems]
 | 'TST_NEEDS_ROOT'         | Exit the test with 'TCONF' unless executed under root.
 |                          | Alternatively the 'tst_require_root' command can be used.
 | 'TST_NEEDS_TMPDIR'       | Create test temporary directory and cd into it.
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
