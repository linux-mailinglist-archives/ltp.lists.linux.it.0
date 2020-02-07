Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860F1559D1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:41:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B36963C23B4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:41:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 81EF73C237E
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:41:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6BCA76181AD
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:41:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20701AD19;
 Fri,  7 Feb 2020 14:41:11 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Feb 2020 15:41:04 +0100
Message-Id: <20200207144105.19947-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v6 1/2] safe_macros: Use tst_umount() in safe_umount()
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
Hi,

this should be ok, but better to double check.
Used in fsmount01.

Kind regards,
Petr

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
