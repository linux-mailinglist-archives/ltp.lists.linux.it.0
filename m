Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6D3C9943
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 08:58:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D1E73C6AA6
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 08:58:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90E563C0131
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 08:58:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B19B760136A
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 08:58:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA75E1FDE4;
 Thu, 15 Jul 2021 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626332291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9fVX53WKAL06H7VnPtinbsia11Y/mhBm4uk0uOtf0k4=;
 b=cptENYL9TEWjrm7CQdrp5qUzybUaWc8SkiDmhwbviWdUlf06W1zvoUmbX3Oh1bJ+9hVFH+
 U9b6VSxBVd8RR4GldkfJBb9keJmz5Z8ytaMfeNxzZ28hwszCKxODGawwgZot/nXu16TqLs
 0g9u/hIVYTVslK+wrP17xP0Ry+MV8cA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626332291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9fVX53WKAL06H7VnPtinbsia11Y/mhBm4uk0uOtf0k4=;
 b=mYo0nq0DDQZgQ4miOLeTEr2O48UmhkD4rNVrj1QceTnzym7fcqtNJa/qncmCzK3qbK2bgY
 yNAkLgciixrqFxAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A16E713C27;
 Thu, 15 Jul 2021 06:58:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CzyuJYPc72A7XAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 06:58:11 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Jul 2021 08:58:05 +0200
Message-Id: <20210715065805.14086-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] doc: Specify linux-stable-git rule
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
 doc/c-test-api.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 45784195b..9d26a483d 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -2205,6 +2205,10 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
+NOTE: We don't track all backports to stable kernel but just those which are
+      stable branch specific (unique), i.e. no commit in mainline. Example of
+      commits: c4a23c852e80, cac68d12c531.
+
 Glibc git commit in a regression test for a glibc bug:
 [source,c]
 -------------------------------------------------------------------------------
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
