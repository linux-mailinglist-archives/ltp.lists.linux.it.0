Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FCE3DDEA5
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:37:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD2DC3C8B10
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:37:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CED213C8B0A
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5CE1E1A00985
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 180501FFDE;
 Mon,  2 Aug 2021 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G+a0l/XUhSm7SamAK1xfvRC8nQ9J3oN/zz6fo3jUsk=;
 b=Cdj9EuBxlKmUZdDPkDjKimHtKxa9J7eSKtWxgjxrJiBdBx74vDig5F87Sk6+50L9FgzUXP
 FwXvKp8oQro1aRw51Zr2MtbRmoWaMKSTpKiVH8F8k2AKAit/nwbXDjhwGrvi7AvRQb0Qyn
 TzchDuLLHC9K5pSKQEB8MRltbRc/huA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G+a0l/XUhSm7SamAK1xfvRC8nQ9J3oN/zz6fo3jUsk=;
 b=JdJcZZ+DKY7QQhRxLGUlZQetv9ycH/G8gqqt/HfwcZT0PMj/dj99Emb6ZicEa7APKvcgCX
 7e+IKvxlmFxh/9Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E07EA13B47;
 Mon,  2 Aug 2021 17:35:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2JleNPssCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:36 +0200
Message-Id: <20210802173536.19525-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802173536.19525-1-pvorel@suse.cz>
References: <20210802173536.19525-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v7 7/7] ci: Install iproute2
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

shell API test runtime dependency. To fix:

runtest TINFO: * shell/net/tst_rhost_run.sh
tst_rhost_run 1 TCONF: 'ip' not found

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v7.

 ci/debian.sh     | 1 +
 ci/fedora.sh     | 1 +
 ci/tumbleweed.sh | 1 +
 3 files changed, 3 insertions(+)

diff --git a/ci/debian.sh b/ci/debian.sh
index a609da887..e929452ff 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -22,6 +22,7 @@ $apt \
 	clang \
 	gcc \
 	git \
+	iproute2 \
 	libacl1 \
 	libacl1-dev \
 	libaio-dev \
diff --git a/ci/fedora.sh b/ci/fedora.sh
index 959f3af20..dc1293aa5 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -13,6 +13,7 @@ $yum \
 	gcc \
 	git \
 	findutils \
+	iproute \
 	numactl-devel \
 	libtirpc \
 	libtirpc-devel \
diff --git a/ci/tumbleweed.sh b/ci/tumbleweed.sh
index ab622e05c..f1e7252f2 100755
--- a/ci/tumbleweed.sh
+++ b/ci/tumbleweed.sh
@@ -13,6 +13,7 @@ $zyp \
 	gcc \
 	git \
 	gzip \
+	iproute2 \
 	make \
 	kernel-default-devel \
 	keyutils-devel \
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
