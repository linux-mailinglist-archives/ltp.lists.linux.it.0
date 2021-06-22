Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AAC3B0A21
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:17:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 829103C96DE
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:17:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18AEB3C7017
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:17:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AAA356000F0
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:17:54 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1121F218F8
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624378674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7PkX8NlROdJmYdu0A+ZVWoMLSFTnFCiR4Xi4BFSlAcE=;
 b=sf9BqssNOQpqPOw2frX8n9azE4XkLLOLS9Kikc0xylDVI/4a/nIl77Q6gFNLxV85Y4vRNC
 02kOwSXUpH1XNNlrAoriIf31I1dFCB6ifOTJm/nNG6U6/309SwLBtX8vKxLfWCwWGJfhW7
 bR7UTwAyfUjGQtKddI+mrHuq+O+iwp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624378674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7PkX8NlROdJmYdu0A+ZVWoMLSFTnFCiR4Xi4BFSlAcE=;
 b=3eVDZl/6u1sJSXCnq6DCW0nrDGEDJVzYB8lZTJu/d2En54RpU+6w7ws2XlolAr/EjuuS6A
 KlA5LXo99G8SDVAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E5B0211A97
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624378674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7PkX8NlROdJmYdu0A+ZVWoMLSFTnFCiR4Xi4BFSlAcE=;
 b=sf9BqssNOQpqPOw2frX8n9azE4XkLLOLS9Kikc0xylDVI/4a/nIl77Q6gFNLxV85Y4vRNC
 02kOwSXUpH1XNNlrAoriIf31I1dFCB6ifOTJm/nNG6U6/309SwLBtX8vKxLfWCwWGJfhW7
 bR7UTwAyfUjGQtKddI+mrHuq+O+iwp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624378674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7PkX8NlROdJmYdu0A+ZVWoMLSFTnFCiR4Xi4BFSlAcE=;
 b=3eVDZl/6u1sJSXCnq6DCW0nrDGEDJVzYB8lZTJu/d2En54RpU+6w7ws2XlolAr/EjuuS6A
 KlA5LXo99G8SDVAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id VphONzEN0mDUIgAALh3uQQ (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:17:53 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 18:17:53 +0200
Message-Id: <20210622161753.32550-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_rtnetlink: pass error codes using rtnl_errno
 variable
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Renamed rtnl_errno to tst_rtnl_errno

 include/tst_rtnetlink.h |  2 ++
 lib/tst_netdevice.c     | 26 +++++++++++++++-----------
 lib/tst_rtnetlink.c     |  6 ++++--
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/include/tst_rtnetlink.h b/include/tst_rtnetlink.h
index 12ec258f2..6a0c53df4 100644
--- a/include/tst_rtnetlink.h
+++ b/include/tst_rtnetlink.h
@@ -21,6 +21,8 @@ struct tst_rtnl_message {
 	size_t payload_size;
 };
 
+extern int tst_rtnl_errno;
+
 /* Open a netlink socket */
 struct tst_rtnl_context *tst_rtnl_create_context(const char *file,
 	const int lineno);
diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index d098173d5..a4bc22635 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -149,9 +149,9 @@ int tst_create_veth_pair(const char *file, const int lineno,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
-			"Failed to create veth interfaces %s+%s", ifname1,
-			ifname2);
+		tst_brk_(file, lineno, TBROK,
+			"Failed to create veth interfaces %s+%s: %s", ifname1,
+			ifname2, tst_strerrno(tst_rtnl_errno));
 	}
 
 	return ret;
@@ -183,8 +183,9 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
-			"Failed to remove netdevice %s", ifname);
+		tst_brk_(file, lineno, TBROK,
+			"Failed to remove netdevice %s: %s", ifname,
+			tst_strerrno(tst_rtnl_errno));
 	}
 
 	return ret;
@@ -232,8 +233,9 @@ static int modify_address(const char *file, const int lineno,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
-			"Failed to modify %s network address", ifname);
+		tst_brk_(file, lineno, TBROK,
+			"Failed to modify %s network address: %s", ifname,
+			tst_strerrno(tst_rtnl_errno));
 	}
 
 	return ret;
@@ -301,8 +303,9 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
-			"Failed to move %s to another namespace", ifname);
+		tst_brk_(file, lineno, TBROK,
+			"Failed to move %s to another namespace: %s", ifname,
+			tst_strerrno(tst_rtnl_errno));
 	}
 
 	return ret;
@@ -392,8 +395,9 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
 	tst_rtnl_destroy_context(file, lineno, ctx);
 
 	if (!ret) {
-		tst_brk_(file, lineno, TBROK | TTERRNO,
-			"Failed to modify network route");
+		tst_brk_(file, lineno, TBROK,
+			"Failed to modify network route: %s",
+			tst_strerrno(tst_rtnl_errno));
 	}
 
 	return ret;
diff --git a/lib/tst_rtnetlink.c b/lib/tst_rtnetlink.c
index 1ecda3a9f..a2411dfde 100644
--- a/lib/tst_rtnetlink.c
+++ b/lib/tst_rtnetlink.c
@@ -24,6 +24,8 @@ struct tst_rtnl_context {
 	struct nlmsghdr *curmsg;
 };
 
+int tst_rtnl_errno;
+
 static int tst_rtnl_grow_buffer(const char *file, const int lineno,
 	struct tst_rtnl_context *ctx, size_t size)
 {
@@ -380,7 +382,7 @@ int tst_rtnl_check_acks(const char *file, const int lineno,
 		}
 
 		if (res->err->error) {
-			TST_ERR = -res->err->error;
+			tst_rtnl_errno = -res->err->error;
 			return 0;
 		}
 	}
@@ -394,7 +396,7 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
 	struct tst_rtnl_message *response;
 	int ret;
 
-	TST_ERR = 0;
+	tst_rtnl_errno = 0;
 
 	if (tst_rtnl_send(file, lineno, ctx) <= 0)
 		return 0;
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
