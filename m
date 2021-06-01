Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4E3971ED
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:56:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC44F3C801B
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:56:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92C3B3C59F3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 49DB8601179
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BEA021FD30;
 Tue,  1 Jun 2021 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622544946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEuabypM/jI6lWtPQlMMDUndgZgELkmqHOeKI9yztME=;
 b=Wol7yzrSFMkfxwue+WU0X1aRdworlHQWCVi8h+zz8Q83zHunBfqmTToTYMp3CPNydiwnps
 ofDl88FXvGN/GvTL73JADzJLXLoCfjwIrO+dJ+xaOlvYFWrF9MU2zmTCClGoZvMUyMuljI
 Bc7huNs4wTLebBSK9a7cgUGAkWm2v+8=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 87162A3B85;
 Tue,  1 Jun 2021 10:55:46 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:55:17 +0100
Message-Id: <20210601105521.27459-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601105521.27459-1-rpalethorpe@suse.com>
References: <20210601105521.27459-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/6] API/cgroups: Remove obsolete function in API
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_cgroup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 793a712e1..8fd5ab288 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -225,12 +225,6 @@ static void add_ctrl(uint32_t *const ctrl_field,
 	*ctrl_field |= 1 << ctrl->ctrl_indx;
 }
 
-__attribute__ ((warn_unused_result))
-struct cgroup_root *tst_cgroup_root_get(void)
-{
-	return roots[0].ver ? roots : roots + 1;
-}
-
 static int cgroup_v2_mounted(void)
 {
 	return !!roots[0].ver;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
