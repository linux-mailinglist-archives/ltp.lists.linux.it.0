Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388B765698
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jul 2023 17:00:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99FA43CD6DF
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jul 2023 17:00:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11A143CD6C1
 for <ltp@lists.linux.it>; Thu, 27 Jul 2023 17:00:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 65FF9100126A
 for <ltp@lists.linux.it>; Thu, 27 Jul 2023 17:00:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61B1F1F383
 for <ltp@lists.linux.it>; Thu, 27 Jul 2023 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1690470014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T7FshX0D9vv2MGDvhYGatzNzHwgeqoqebPYrVaJaflM=;
 b=pdbZ9VeeB9QGwQwjfH4Nft7thxYyHFF/m1JSF/7Dtk//x0KyXOsqXVrOP+1ZjE77YlUMiW
 u//AwQa6v8/UaXwiX5VQqHhxKs0N0h79S25NPdBLXo6VX2aqpQnNuTavM7M5e6/DN/IUeR
 KLLUL37gO08nE0rrtVOlkBa3wo9VnC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1690470014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T7FshX0D9vv2MGDvhYGatzNzHwgeqoqebPYrVaJaflM=;
 b=YPwuTTwezlk28ACSG/X+OgOKzjuoSPs7w7wID2vW4jotNO6nWLymguPawzBsoXSFUYOvMc
 8Z4F74IHf9c24QDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FA7F13902
 for <ltp@lists.linux.it>; Thu, 27 Jul 2023 15:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bP9/En6GwmQMHwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 27 Jul 2023 15:00:14 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 27 Jul 2023 17:00:10 +0200
Message-ID: <20230727150013.31835-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_netdevice: Add missing rtnetlink context
 allocation checks
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
 lib/tst_netdevice.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index 4a0442932..a57f506e9 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -332,6 +332,9 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
 
 	ctx = create_request(file, lineno, RTM_NEWLINK, 0, &info, sizeof(info));
 
+	if (!ctx)
+		return 0;
+
 	if (!tst_rtnl_add_attr_string(file, lineno, ctx, IFLA_IFNAME, ifname)) {
 		tst_rtnl_destroy_context(file, lineno, ctx);
 		return 0;
@@ -411,6 +414,9 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
 
 	ctx = create_request(file, lineno, action, flags, &info, sizeof(info));
 
+	if (!ctx)
+		return 0;
+
 	if (srcaddr && !tst_rtnl_add_attr(file, lineno, ctx, RTA_SRC, srcaddr,
 		srclen)) {
 		tst_rtnl_destroy_context(file, lineno, ctx);
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
