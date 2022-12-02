Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E66404B0
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 11:31:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB2853CC3DD
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 11:31:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 574443CC3BE
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 11:31:51 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A9752141545F
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 11:31:49 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A7E221C99;
 Fri,  2 Dec 2022 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1669977108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nAlqPoppglqdFui8YcnSxI04C4T2Z/2fHSYlBQyXdZ8=;
 b=cdTAQ76ZATPsl4gMm89Bq6IK1xuXha+sP7lWYDoHby5NnjnJmZ50lS7bA1N5VMpj73J0H2
 mDK7/yr0R5WlDhDkfCrdt/lqKA7hVNBK37yZ4v7AgQ+JCU5nY3WaKW3H3T161WsweCx6Vk
 I7Nhh3TKtlnikLwEatZAKyw5dSeaUm8=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 939F413644;
 Fri,  2 Dec 2022 10:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wltcHhPUiWOZbQAAGKfGzw
 (envelope-from <andrea.cervesato@suse.com>); Fri, 02 Dec 2022 10:31:47 +0000
To: ltp@lists.linux.it
Date: Fri,  2 Dec 2022 11:30:11 +0100
Message-Id: <20221202103011.12206-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add runltp-ng to upstream
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
index a3c34af4b..e85fc6279 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -4,3 +4,6 @@
 [submodule "tools/sparse/sparse-src"]
 	path = tools/sparse/sparse-src
 	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
+[submodule "tools/runltp-ng"]
+	path = tools/runltp-ng
+	url = https://github.com/acerv/runltp-ng
diff --git a/tools/runltp-ng b/tools/runltp-ng
new file mode 160000
index 000000000..b08471158
--- /dev/null
+++ b/tools/runltp-ng
@@ -0,0 +1 @@
+Subproject commit b0847115891bd3dddbe920a716342917e7088379
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
