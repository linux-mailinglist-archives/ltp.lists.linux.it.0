Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAB6FF06F
	for <lists+linux-ltp@lfdr.de>; Thu, 11 May 2023 13:17:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F1103CB548
	for <lists+linux-ltp@lfdr.de>; Thu, 11 May 2023 13:17:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 12FD33CB4A3
 for <ltp@lists.linux.it>; Thu, 11 May 2023 13:17:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4496F1400DA8
 for <ltp@lists.linux.it>; Thu, 11 May 2023 13:17:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 433F721B3F
 for <ltp@lists.linux.it>; Thu, 11 May 2023 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683803856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5vxnYOCgjLympU/YyczbQaJGwOgW5vy+nJElTrNnT2U=;
 b=QFFWT3Iv5vyc/hRKJCqqvbvQzDb/mlU0BAgT/qXEtteKtQ1c5HlaMjonQTkobqAJ8nynvR
 vtzxpQJcySSUzvfLfCH8UGTqLjc8HGtRCbig00jyywGjR8e4dHfXm+8cfAST6XLMTH2Xgq
 iuK3TTIIRIYS6qwrnXdZyN21+hu0wpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683803856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5vxnYOCgjLympU/YyczbQaJGwOgW5vy+nJElTrNnT2U=;
 b=8Z03o3zL1WclD7DP0ft7wDavaG2rfTB0ztdrjKTpMQPOfb1lcYvMovNMBiOHb/myTc8pBW
 Bx/pMeNpD3wvw+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F7BF138FA
 for <ltp@lists.linux.it>; Thu, 11 May 2023 11:17:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mPwjCtDOXGRZWgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 11 May 2023 11:17:36 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 11 May 2023 13:17:35 +0200
Message-Id: <20230511111735.20615-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] hugemmap32: Check for hugetlbfs availability
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

Trying to open PATH_HUGEPAGE unconditionally will fail if hugepage
support is disabled in kernel or not provided by hardware.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
index 85d57319f..36a426a09 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c
@@ -47,6 +47,9 @@ static void setup(void)
 	struct dirent *ent;
 	unsigned long hpage_size;
 
+	if (access(PATH_HUGEPAGE, F_OK))
+		tst_brk(TCONF, "hugetlbfs is not supported");
+
 	dir = SAFE_OPENDIR(PATH_HUGEPAGE);
 	while ((ent = SAFE_READDIR(dir))) {
 		if ((sscanf(ent->d_name, "hugepages-%lukB", &hpage_size) == 1) &&
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
