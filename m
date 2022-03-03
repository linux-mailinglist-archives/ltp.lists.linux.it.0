Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E21354CC054
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:49:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981C23CA334
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:49:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48DF33CA366
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:16 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3C3FB10005ED
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE3C4210FA
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646318895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNn6CcIjeWnX7BNwqT8E77YG8VnzqpEfPDqkvgq47l0=;
 b=qe1XNpChe9ucLwmBFacJLpzRpanMoO95MtqML0zWTBtFsDyLOyxNY4HIUIEY6aVTG/ZEfp
 xOhTr4Y0e/gRSNbTKvHQXa2mBAWWGvX1ruK+3bSsf22ngK/jEa95ckUD+7xljRY8XEtpgm
 6tnHb8ku2BTyKIifA/7emUKDOmIFu2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646318895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNn6CcIjeWnX7BNwqT8E77YG8VnzqpEfPDqkvgq47l0=;
 b=TCc0Rz4W84zmD6yvmksDCrjjNa9VMLGzZJmQ/4siEEBJsa4aZNQi1gHMKorVFKFATw9vQB
 QArbVxwj4IxIrPAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9FD013AD9
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dE53KC/VIGICAwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 03 Mar 2022 14:48:15 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Mar 2022 15:50:31 +0100
Message-Id: <20220303145032.21493-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303145032.21493-1-chrubis@suse.cz>
References: <20220303145032.21493-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 6/7] libs: libltpnuma: Fix free memory estimate
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

On long running systems most of the memory would be consumed by a
file page cache which is reclaimable. Because of that the numa test will
be skipped even if the system has plenty of memory. To fix this this
patch adds 90% of the memory used by the page cache to the free memory
estimate.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 libs/libltpnuma/tst_numa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c
index 417d98ced..7b8c4bc79 100644
--- a/libs/libltpnuma/tst_numa.c
+++ b/libs/libltpnuma/tst_numa.c
@@ -129,6 +129,7 @@ static int node_has_enough_memory(int node, size_t min_kb)
 	char buf[1024];
 	long mem_total = 0;
 	long mem_used = 0;
+	long file_pages = 0;
 
 	/* Make sure there is some space for kernel upkeeping as well */
 	min_kb += 4096;
@@ -152,6 +153,9 @@ static int node_has_enough_memory(int node, size_t min_kb)
 
 		if (sscanf(buf, "%*s %*i MemUsed: %li", &val) == 1)
 			mem_used = val;
+
+		if (sscanf(buf, "%*s %*i FilePages: %li", &val) == 1)
+			file_pages = val;
 	}
 
 	fclose(fp);
@@ -161,7 +165,7 @@ static int node_has_enough_memory(int node, size_t min_kb)
 		return 0;
 	}
 
-	if (mem_total - mem_used < (long)min_kb) {
+	if (mem_total - mem_used + (9 * file_pages)/10 < (long)min_kb) {
 		tst_res(TINFO,
 		        "Not enough free RAM on node %i, have %likB needs %zukB",
 		        node, mem_total - mem_used, min_kb);
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
