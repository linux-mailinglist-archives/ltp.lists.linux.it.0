Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5C4E2526
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Mar 2022 12:22:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1792C3C65B9
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Mar 2022 12:22:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 785F93C0611
 for <ltp@lists.linux.it>; Mon, 21 Mar 2022 12:21:56 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D10B360081C
 for <ltp@lists.linux.it>; Mon, 21 Mar 2022 12:21:55 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1AA091F37F;
 Mon, 21 Mar 2022 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1647861715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Br6sLaT5hGw1ctl289im1QR6EBomudm69hXVIWl9VR0=;
 b=FQuOTwQqrXbKNnMlbJ+0biOJPgxmC/LaiSDLTUU+mR4ZXMtFN/7jIXkOQhEToDiYNLArCu
 9GjdkN9u20eygbG53wzBh5U/2YFUBijIo0LFmcMI8dsR1SbQb13xoG6nG4tHqzqkj40xbx
 T0RDt21RAJnYJYIYcRjKDisTzit50YI=
Received: from g78.suse.de (unknown [10.163.24.182])
 by relay2.suse.de (Postfix) with ESMTP id C8BFCA3B93;
 Mon, 21 Mar 2022 11:21:54 +0000 (UTC)
To: linux-sparse@vger.kernel.org
Date: Mon, 21 Mar 2022 11:21:19 +0000
Message-Id: <20220321112119.23308-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] sparse: Use offsetof macro to silence null ptr
 subtraction warning
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Subtracting (char *)0 is undefined behavior. Newer compilers warn
about this unless it is done in system headers.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 token.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/token.h b/token.h
index bccac0e4..9000e0cb 100644
--- a/token.h
+++ b/token.h
@@ -201,7 +201,7 @@ struct token {
 
 static inline struct token *containing_token(struct token **p)
 {
-	void *addr = (char *)p - ((char *)&((struct token *)0)->next - (char *)0);
+	void *addr = (char *)p - offsetof(struct token, next);
 	return addr;
 }
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
