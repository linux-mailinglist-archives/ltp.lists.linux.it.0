Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D2157566
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:40:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C76653C24DD
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:40:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B00BB3C207E
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:40:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87AC9600B2D
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:40:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DEDEB00A;
 Mon, 10 Feb 2020 12:40:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 10 Feb 2020 13:40:43 +0100
Message-Id: <20200210124043.14425-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200210124043.14425-1-pvorel@suse.cz>
References: <20200210124043.14425-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] safe_macros: Use tst_umount() in safe_umount()
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

To get retry workaround for gvfsd-trash background daemon.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/safe_macros.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index 41fa4ca83..deb19d2df 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -772,7 +772,7 @@ int safe_umount(const char *file, const int lineno, void (*cleanup_fn)(void),
 {
 	int rval;
 
-	rval = umount(target);
+	rval = tst_umount(target);
 
 	if (rval == -1) {
 		tst_brkm(TBROK | TERRNO, cleanup_fn,
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
