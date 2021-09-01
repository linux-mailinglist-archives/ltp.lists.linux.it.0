Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA313FD2C7
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 07:17:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2513C99B5
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 07:17:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCBD63C29AD
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 07:17:12 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A1ED2600C77
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 07:17:11 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3EF3A9F66D;
 Wed,  1 Sep 2021 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630473430; bh=wPCk920HTgfMfKREMMEuTlbV9JaU+ns9vBFArzYARfE=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=phczbto9omzKQnUVZtL7uoz9wFy16hSwVPQ+cTqdnLWtpC7N3covEfPviu1yEc4GN
 VKqJ2rLSjtVWhE3r6qYmTwBhZM2kHDIFzVshKSGPA3vqdKdbBgvDf2EeXiVhYvM6s+
 DAJRDoFga37JAf0iTIKpxOT3MPmtSUn4sDZbR8wo=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	egorenar@linux.ibm.com,
	chrubis@suse.cz
Date: Wed,  1 Sep 2021 07:17:04 +0200
Message-Id: <20210901051704.1672590-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] tst_wallclock: Prevent fail on read-only
 /etc/localtime
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If /etc/localtime is readonly, the time should not
have changed anyway.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 lib/tst_wallclock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 1244ea26b..ee53e2b7f 100644
--- a/lib/tst_wallclock.c
+++ b/lib/tst_wallclock.c
@@ -72,7 +72,7 @@ void tst_wallclock_restore(void)
 	 * might not be enough because the current access time might be far
 	 * in the future.
 	 */
-	ret = access(localtime, F_OK);
+	ret = access(localtime, F_OK | W_OK);
 	if (!ret)
 		SAFE_TOUCH(localtime, 0, NULL);
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
