Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7857A45C7
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 11:22:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68D723CBF0C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 11:22:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8E143C9274
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 11:22:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AEE481400DA6
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 11:22:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F333219BF;
 Mon, 18 Sep 2023 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695028941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RliYklrBlfq0q9/FK0K5nflL7fhkVyJB38ZFGpbmc5k=;
 b=Rt0yFUGQnfmd56xW5TogPNepPxUH0w32AMWp2XX5940RLgzOBPlToBDv0uN6ziP6KKJDnh
 hCz2lqdkoJZkcyzmDNQl8hTKOdrZqCuoZpb00q/PYaPkzKenIToE16w/QOdGPneKba0fdY
 0iM3kHo1XVZ1T/ZXn61s138j+z6xFTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695028941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RliYklrBlfq0q9/FK0K5nflL7fhkVyJB38ZFGpbmc5k=;
 b=68Wb8JTN9H2pM/dfJypQbBdhdYDHBTMyrv/rGfEUDrP60WggytSURJDOYQsYWXkGfg7LPD
 vxytO9H7A5dZQuCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4555913480;
 Mon, 18 Sep 2023 09:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IB+lDM0WCGXoFAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 18 Sep 2023 09:22:21 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 18 Sep 2023 11:22:18 +0200
Message-Id: <20230918092219.24151-2-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230918092219.24151-1-andrea.cervesato@suse.de>
References: <20230918092219.24151-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] Replace runltp-ng with kirk framework
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Kirk application is the runltp-ng successor and it aims to merge
multiple Linux testing frameworks in one tool, providing support
for remote testing via Qemu, SSH, LTX, parallel execution and much
more.

This patch deprecates runltp-ng, which is not replaced by kirk. All
runltp-ng features are present in kirk and even more.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .gitmodules     | 6 +++---
 tools/kirk      | 1 +
 tools/runltp-ng | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)
 create mode 160000 tools/kirk
 delete mode 160000 tools/runltp-ng

diff --git a/.gitmodules b/.gitmodules
index d1d558b9e..088023039 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -4,6 +4,6 @@
 [submodule "tools/sparse/sparse-src"]
 	path = tools/sparse/sparse-src
 	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
-[submodule "tools/runltp-ng"]
-	path = tools/runltp-ng
-	url = https://github.com/linux-test-project/runltp-ng.git
+[submodule "tools/kirk"]
+	path = tools/kirk
+	url = https://github.com/linux-test-project/kirk.git
diff --git a/tools/kirk b/tools/kirk
new file mode 160000
index 000000000..666a2bd8d
--- /dev/null
+++ b/tools/kirk
@@ -0,0 +1 @@
+Subproject commit 666a2bd8dbf583732ed415abf1bae39bd8791061
diff --git a/tools/runltp-ng b/tools/runltp-ng
deleted file mode 160000
index e842511ed..000000000
--- a/tools/runltp-ng
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit e842511ed2c680e3b2ea6dec790913a41d5ed937
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
