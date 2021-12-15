Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B147560B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 11:16:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41DF13C2BBF
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 11:16:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 952553C2BBF
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 11:16:50 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB69514016E3
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 11:16:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E85341F386;
 Wed, 15 Dec 2021 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639563408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IeUm+BWbsqSskHCEWHjGEW5SSumini3kC0S5BhUrpM8=;
 b=Xk3SLKA4kUJshVhw09eoU9MjLhPtvN979ZmAsqDOq178rMq3Pv3DGpHLT333WL95IXXf2n
 gtVxUlc1cAihee28mKULyTnhTqCUquTRCTj2JCYwWRmbJoIowjJuo6DyHDo/kx7q/pWl6D
 T6qoD+Z5L1sNTM6ooZr4Pt9n6VT+Hc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639563408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IeUm+BWbsqSskHCEWHjGEW5SSumini3kC0S5BhUrpM8=;
 b=oQi6Y/0EW8APYZ823Y5LKyX3scY9+c6WVW3UwtUOlXB0VoDYjYt1d6rFqmwGlFhsGV7dlq
 DPfNqZNiwItIWcBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B405D13B09;
 Wed, 15 Dec 2021 10:16:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S+jwKZDAuWGmagAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Dec 2021 10:16:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Dec 2021 11:16:42 +0100
Message-Id: <20211215101642.2464-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] ci: Don't run wiki mirror on LTP forks
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

Forks obviously don't have rights to push to official wiki:
remote: Permission to linux-test-project/ltp.wiki.git denied to github-actions[bot].
fatal: unable to access 'https://github.com/linux-test-project/ltp.wiki/':
The requested URL returned error: 403

Although script could be easily modified to mirror fork's wiki, IMHO we
don't want to have duplicate wiki content all over github (currently
there are 811 LTP forks).

Fixes: 43316ef67a ("github: Add action to update wiki")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I'm sorry for not realizing this before.
Tested on my fork: https://github.com/pevik/ltp/actions/runs/1582082773

Kind regards,
Petr

 .github/workflows/wiki-mirror.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/wiki-mirror.yml b/.github/workflows/wiki-mirror.yml
index 44a3e9ed7e..d138f8f226 100644
--- a/.github/workflows/wiki-mirror.yml
+++ b/.github/workflows/wiki-mirror.yml
@@ -13,6 +13,7 @@ on:
 jobs:
   mirror:
     runs-on: ubuntu-latest
+    if: ${{ github.event.pull_request.head.repo.full_name == 'linux-test-project/ltp' }}
     steps:
       - name: Checkout LTP
         uses: actions/checkout@v2
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
