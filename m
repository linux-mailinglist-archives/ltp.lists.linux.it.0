Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9438E987
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 299423C7A3C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A356A3C1886
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4D729600A1D
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621867696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5c3pIDoIwbYFpVqu8NQzaRuTrIQJPw+cwbi23+yrjQ=;
 b=J5QRBKITt+cd95dOtAA9snPvZF1U+GjP2fKEdoQnbxksMkMnxKzNAgOWbDCfaI9eM0E2lo
 A9UF73YJ2u1OhU89yigKlE2MNvPN53h8ikQPopYShw7BZvlOasGYX6fyp61ME1LlDTgWLt
 iTBkMAnc4jBw293ZQVDWzscq1amH/t0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D038CADE5;
 Mon, 24 May 2021 14:48:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 May 2021 15:47:45 +0100
Message-Id: <20210524144745.10887-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524144745.10887-1-rpalethorpe@suse.com>
References: <20210524144745.10887-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 4/4] API: Removal of TST_ERR usage
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

Use errno instead to stop Coccinelle test from failing.
---
 lib/tst_netdevice.c | 10 +++++-----
 lib/tst_rtnetlink.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index d098173d5..cc2766be8 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -149,7 +149,7 @@ int tst_create_veth_pair(const char *file, const int lineno,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to create veth interfaces %s+%s", ifname1,
 			ifname2);
 	}
@@ -183,7 +183,7 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to remove netdevice %s", ifname);
 	}
 
@@ -232,7 +232,7 @@ static int modify_address(const char *file, const int lineno,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to modify %s network address", ifname);
 	}
 
@@ -301,7 +301,7 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to move %s to another namespace", ifname);
 	}
 
@@ -392,7 +392,7 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
+		tst_brk_(file, lineno, TBROK | TERRNO,
 			"Failed to modify network route");
 	}
 
diff --git a/lib/tst_rtnetlink.c b/lib/tst_rtnetlink.c
index 1ecda3a9f..d93f7e18d 100644
--- a/lib/tst_rtnetlink.c
+++ b/lib/tst_rtnetlink.c
@@ -380,7 +380,7 @@ int tst_rtnl_check_acks(const char *file, const int lineno,
 		}
 
 		if (res->err->error) {
-			TST_ERR = -res->err->error;
+			errno = -res->err->error;
 			return 0;
 		}
 	}
@@ -394,7 +394,7 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
 	struct tst_rtnl_message *response;
 	int ret;
 
-	TST_ERR = 0;
+	errno = 0;
 
 	if (tst_rtnl_send(file, lineno, ctx) <= 0)
 		return 0;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
