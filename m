Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AA58C8A7
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 14:53:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EB4F3C9473
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 14:53:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C9053C712D
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 14:53:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 25E83140055E
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 14:53:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48C191FF77;
 Mon,  8 Aug 2022 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1659963229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YFo+JoeNSlcrchnNtfCY2tmI0C9VsbjNx6EHlouCJxc=;
 b=g8+rA1oyOFQnyCsasaSDr4W8AibiIAueN7pbjzL4DfiKrqRrXKiUJv2xsDUdkJsUqaGh13
 +SvaBgX4YMLAYmJJtl1d4Bkben2VtiX7Thxegini65vmLuxSpYBokUCFIsNBoCEPcSCDhV
 zdExlpNFYw6wb/P+x/xL7/xs+1NLSAg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C69213A7C;
 Mon,  8 Aug 2022 12:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7x6zAF0H8WKYUgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Mon, 08 Aug 2022 12:53:49 +0000
To: ltp@lists.linux.it
Date: Mon,  8 Aug 2022 14:53:09 +0200
Message-Id: <20220808125309.16041-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Fix description for pidns01 and pidns02 tests
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/containers/pidns/pidns01.c | 2 +-
 testcases/kernel/containers/pidns/pidns02.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns01.c b/testcases/kernel/containers/pidns/pidns01.c
index 5077b11d9..eba4b806b 100644
--- a/testcases/kernel/containers/pidns/pidns01.c
+++ b/testcases/kernel/containers/pidns/pidns01.c
@@ -8,7 +8,7 @@
 /*\
  * [Description]
  *
- * Clone a process with CLONE_NEWPID flag and check:
+ * Clone a process with CLONE_NEWNS flag and check:
  *
  * - child process ID must be 1
  * - parent process ID must be 0
diff --git a/testcases/kernel/containers/pidns/pidns02.c b/testcases/kernel/containers/pidns/pidns02.c
index 9683abd9c..9f3a46526 100644
--- a/testcases/kernel/containers/pidns/pidns02.c
+++ b/testcases/kernel/containers/pidns/pidns02.c
@@ -7,7 +7,7 @@
 /*\
  * [Description]
  *
- * Clone a process with CLONE_NEWPID flag and check:
+ * Clone a process with CLONE_NEWNS flag and check:
  *
  * - child session ID must be 1
  * - parent process group ID must be 1
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
