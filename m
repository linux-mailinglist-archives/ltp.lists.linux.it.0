Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24D7A1A28
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 11:15:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F24C63CE69F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Sep 2023 11:15:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 286133C974E
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 11:15:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 587E31A02366
 for <ltp@lists.linux.it>; Fri, 15 Sep 2023 11:15:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C206C1F890;
 Fri, 15 Sep 2023 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694769348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87eLD7lpRABHaoN0Uor+yp2OHxGdOt6l9eH16IaVRP4=;
 b=lM76Z7f/FQJZ4YhJtM7QthNwuQAHNFkWNef2Qn5dY1JWgH9sbm+famFt4t7nOYmcLJY3pB
 CNHtotQRKK9YtvIIQpL1+Uebr8Qe8782t6b4/OnxD9wubPueg6RaR9jCKkSOY2U2HNlOAg
 GFXnG0IXC4cAC9HWxBZX2fxoO6KXieI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694769348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87eLD7lpRABHaoN0Uor+yp2OHxGdOt6l9eH16IaVRP4=;
 b=pDRSTv4CyHMRPRT1Jcr2Y4jkSmcP/OintOXaTWR77El/IhIbfei6QBAvJHHxS0xLvn4i8C
 k/WizsKp1Y2cIMBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A01891358A;
 Fri, 15 Sep 2023 09:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id doXpJMQgBGXrWgAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 15 Sep 2023 09:15:48 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 15 Sep 2023 11:15:47 +0200
Message-Id: <20230915091547.26270-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Replace runltp-ng with kirk framework
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

Kirk application is a fork of runltp-ng and it aims to merge multiple
Linux testing frameworks in one tool, providing support for remote
testing via Qemu, SSH, LTX, parallel execution and much more.

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
index 000000000..805c56c2a
--- /dev/null
+++ b/tools/kirk
@@ -0,0 +1 @@
+Subproject commit 805c56c2a69b2e9f24ba13f64eab1bdad5885678
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
