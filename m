Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867D6520E7
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 13:45:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D10883CBA77
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 13:45:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 586273CBA51
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 13:45:34 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 784C76005C3
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 13:45:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A77595D045;
 Tue, 20 Dec 2022 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1671540332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iR758uE/grPplHTgUcwmJvQ1xPWm4F6de7xCHJM/BuY=;
 b=TgtrKFs5N8kxoKmBi+MXysU7tJpumiZQ9TUZnG6meRGul+cP45kP5KixBskkjqoD1rvnqg
 zHt2m5uOMpBaIOPA1mzjRs5IS7gwgV3uKt9R8iDiFkhDWco7/pc8667rea6BkT5TIABsFP
 BNgNFbWFU+Q3tEYs6HltjgPSQY9YST0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79C7B13254;
 Tue, 20 Dec 2022 12:45:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /OF4GmyuoWOmegAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 20 Dec 2022 12:45:32 +0000
To: ltp@lists.linux.it
Date: Tue, 20 Dec 2022 13:43:51 +0100
Message-Id: <20221220124351.5001-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add runltp-ng to upstream
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

runltp-ng is the next generation runner for Linux Testing Project and it
will replace the current obsolete runltp script in the next future.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .gitmodules     | 3 +++
 tools/runltp-ng | 1 +
 2 files changed, 4 insertions(+)
 create mode 160000 tools/runltp-ng

diff --git a/.gitmodules b/.gitmodules
index a3c34af4b..810eac395 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -4,3 +4,6 @@
 [submodule "tools/sparse/sparse-src"]
 	path = tools/sparse/sparse-src
 	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
+[submodule "tools/runltp-ng"]
+	path = tools/runltp-ng
+	url = git@github.com:linux-test-project/runltp-ng.git
diff --git a/tools/runltp-ng b/tools/runltp-ng
new file mode 160000
index 000000000..af20a864e
--- /dev/null
+++ b/tools/runltp-ng
@@ -0,0 +1 @@
+Subproject commit af20a864ec01674ce4f5a21d3308dc3a76da9303
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
