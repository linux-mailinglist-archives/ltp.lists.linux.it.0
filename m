Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A32B9290
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:31:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA4083C5A02
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:31:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E19B63C280C
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:31:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A6DB140052C
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:31:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2168ABD6
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:31:01 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Nov 2020 13:31:50 +0100
Message-Id: <20201119123150.13275-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lib/tst_kconfig: Fix off-by-one in string
 check
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

Fixed the condition for "Garbage after string" that was previously
triggered on a correct strings.

Fixes: eeed458492cc ("lib/tst_kconfig: Validate variables")
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_kconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 35f20e7a4..734039e37 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -291,7 +291,7 @@ static int validate_var(const struct tst_expr_tok *var)
 			i++;
 		} while (i < var->tok_len && var->tok[i] != '"');
 
-		if (i < var->tok_len) {
+		if (i < var->tok_len - 1) {
 			print_err(stderr, var, i, "Garbage after a string");
 			return 1;
 		}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
