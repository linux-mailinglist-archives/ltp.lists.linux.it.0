Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C76BA2C99B1
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 09:40:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BE763C4CFC
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 09:40:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1CA3C3C2BEE
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 09:40:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B979D1A00F77
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 09:40:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 246B7AC2F
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 08:40:51 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Dec 2020 09:41:43 +0100
Message-Id: <20201201084143.22991-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lib: tst_resm() put back redirection to
 newlib
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

We do have new library code calling back to old library tst_brkm() at
least in move_pages/move_pages12.c hence we have to keep the redirection
in the test library for the time being.

Fixes #745

Fixes: 61db712e3557 (lib: Fix SAFE_MACROS() redirection to new library)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_res.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/tst_res.c b/lib/tst_res.c
index c9ba0fa66..8d86b48a4 100644
--- a/lib/tst_res.c
+++ b/lib/tst_res.c
@@ -587,6 +587,8 @@ void tst_brkm__(const char *file, const int lineno, int ttype,
 			tst_brk_(file, lineno, TBROK,
 			         "Non-NULL cleanup in newlib!");
 		}
+
+		tst_brk_(file, lineno, ttype, "%s", tmesg);
 	}
 
 	tst_brk__(file, lineno, ttype, func, "%s", tmesg);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
