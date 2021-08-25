Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755B3F702F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:14:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 905CA3C3012
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:14:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90C1C3C2F5C
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:14:27 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1198200CED
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:14:26 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1681D21FE4;
 Wed, 25 Aug 2021 07:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629875666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XDLhSRR3AeGUYEynZzp/FNcKHxLZhE2AHtVHBoyImlM=;
 b=iQ+I3YsSUBhOcrQhIyZg++oQ3FKTBkyWq3gKLCameYrrKVW5lWf4ME3GPIZqMeZKOW6ulF
 7NOv3DHp6i2VaAbxayRK2OwXldkji2DZU6YNtJyJB1uZPnUahSd3CuRPXXGqRbRpTOaLX1
 W+ACxqKhX+t4oY94jSJkTClSCetwdls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629875666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XDLhSRR3AeGUYEynZzp/FNcKHxLZhE2AHtVHBoyImlM=;
 b=C94H6VjUI3C2xvFj9it4AIf0gAlNgcNac/eh+0kFFwqJ7BEEre6V97rRnGrvnld0YryJXI
 Z0O25O2l3xWKc6CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D3F2D13929;
 Wed, 25 Aug 2021 07:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Y9GDMdHtJWE+ZQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 07:14:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 09:14:20 +0200
Message-Id: <20210825071420.5751-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] doc: TST_MNTPOINT should be full path
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

Document changed behavior in 205a43dfb ("Make argument to tst_umount an
absolute path").

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/shell-test-api.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index ecdbe9e6a..afc01dd01 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -515,8 +515,8 @@ The 'tst_mount' mounts '$TST_DEVICE' of '$TST_FS_TYPE' (optional) to
 '$TST_MNT_PARAMS'. The '$TST_MNTPOINT' directory is created if it didn't
 exist prior to the function call.
 
-If the path passed (optional, defaults to '$TST_MNTPOINT') to the 'tst_umount' is
-not mounted (present in '/proc/mounts') it's noop.
+If the path passed (optional, should be full path, defaults to '$TST_MNTPOINT')
+to the 'tst_umount' is not mounted (present in '/proc/mounts') it's noop.
 Otherwise it retries to umount the filesystem a few times on failure.
 This is a workaround since there are daemons dumb enough to probe all newly
 mounted filesystems, and prevents them from being umounted shortly after they
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
