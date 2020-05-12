Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39B1CF8C9
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 034713C24B2
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 98DE13C209D
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 118511A00EC1
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 358FCAB64
 for <ltp@lists.linux.it>; Tue, 12 May 2020 15:17:05 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 17:17:28 +0200
Message-Id: <20200512151730.10201-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] [COMMITTED] lib/tst_mkfs.c: Fix fall through
 warning
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

tst_mkfs.c: In function 'tst_mkfs_':
../include/old/test.h:139:5: warning: this statement may fall through [-Wimplicit-fallthrough=]
  139 |  if (tst_test) \
      |     ^
tst_mkfs.c:98:3: note: in expansion of macro 'tst_brkm'
   98 |   tst_brkm(TCONF, cleanup_fn,
      |   ^~~~~~~~
tst_mkfs.c:100:2: note: here
  100 |  default:
      |  ^~~~~~~

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_mkfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
index 3860545eb..38b2e7151 100644
--- a/lib/tst_mkfs.c
+++ b/lib/tst_mkfs.c
@@ -97,6 +97,7 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	case 255:
 		tst_brkm(TCONF, cleanup_fn,
 			 "%s:%d: %s not found in $PATH", file, lineno, mkfs);
+	break;
 	default:
 		tst_brkm(TBROK, cleanup_fn,
 			 "%s:%d: %s failed with %i", file, lineno, mkfs, ret);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
