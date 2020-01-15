Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E013BE51
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 12:25:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF94B3C1CBB
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 12:25:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E70703C1C70
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 12:25:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 429FE601C56
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 12:25:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87265AC18
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 11:25:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Jan 2020 12:25:09 +0100
Message-Id: <20200115112509.29110-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] tst_mkfs.c: Fix arg order in error
 message
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

This fixes remaining typos from b0a30feb0.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_mkfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
index a33d36a6b..5d208eceb 100644
--- a/lib/tst_mkfs.c
+++ b/lib/tst_mkfs.c
@@ -98,7 +98,7 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 			 "%s:%d: %s not found in $PATH", file, lineno, mkfs);
 	default:
 		tst_brkm(TBROK, cleanup_fn,
-			 "%s:%d: %s failed with %i", mkfs, ret, file, lineno);
+			 "%s:%d: %s failed with %i", file, lineno, mkfs, ret);
 	}
 }
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
