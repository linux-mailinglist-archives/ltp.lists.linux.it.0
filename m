Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF749B6BD
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:49:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08E0D3C954A
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:49:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01CBC3C93B0
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:49:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6BEB620015D
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:49:42 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C8E6A1F3AA;
 Tue, 25 Jan 2022 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1643122181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOaYU3271OMIaKbYb1xdRPEkbJ/tvW/MziTCq6b9d7c=;
 b=hA9Pdlt/n/kQv1KQolvo0qlnvnAj5oiOaVrJ3f3Hi9VsQfg+ByA/2KtKlNmblXZKnCbgYp
 0A4Pn0QmyPTQtyTMRTRKujeIC9TL9iTaI/CwYzfzo0vtImM5s8VwsPrOItWR95tr+Y5Xd1
 bOP0WusIg39HRkO810WDc10lsMCS6Fo=
Received: from g78.suse.de (unknown [10.163.24.90])
 by relay2.suse.de (Postfix) with ESMTP id 8DCF1A3B81;
 Tue, 25 Jan 2022 14:49:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 25 Jan 2022 14:49:22 +0000
Message-Id: <20220125144923.5849-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144923.5849-1-rpalethorpe@suse.com>
References: <20220124173651.652-1-rpalethorpe@suse.com>
 <20220125144923.5849-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] memcontrol02: Fix anon memory comparison
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

All memory is being compared with the size malloc'ed instead of just
anon.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/controllers/memcg/memcontrol02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/memcontrol02.c b/testcases/kernel/controllers/memcg/memcontrol02.c
index 411f5aea6..75ae5f56c 100644
--- a/testcases/kernel/controllers/memcg/memcontrol02.c
+++ b/testcases/kernel/controllers/memcg/memcontrol02.c
@@ -67,8 +67,8 @@ static void alloc_anon_50M_check(void)
 	SAFE_CGROUP_LINES_SCANF(cg_child, "memory.stat", anon_key_fmt, &anon);
 
 	TST_EXP_EXPR(anon > 0, "(memory.stat.anon=%zd) > 0", anon);
-	TST_EXP_EXPR(values_close(size, current, 3),
-		     "(size=%zd) ~= (memory.stat.anon=%zd)", size, current);
+	TST_EXP_EXPR(values_close(size, anon, 3),
+		     "(size=%zd) ~= (memory.stat.anon=%zd)", size, anon);
 	TST_EXP_EXPR(values_close(anon, current, 3),
 		     "(memory.current=%zd) ~= (memory.stat.anon=%zd)",
 		     current, anon);
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
