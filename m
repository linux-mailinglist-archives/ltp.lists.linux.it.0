Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF11E5E09
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:15:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE6903C3204
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:15:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2FD4F3C31C0
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:15:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7499232A3B
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:15:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A73C7AD60
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:15:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 13:15:04 +0200
Message-Id: <20200528111504.12638-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_taint.h Add taint for randstruct
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

Added in kernel 4.17.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_taint.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tst_taint.h b/include/tst_taint.h
index 0acc1140c..cfa84dded 100644
--- a/include/tst_taint.h
+++ b/include/tst_taint.h
@@ -60,7 +60,8 @@
 #define TST_TAINT_E     (1 << 13) /* unsigned module was loaded */
 #define TST_TAINT_L     (1 << 14) /* A soft lock-up has previously occurred */
 #define TST_TAINT_K     (1 << 15) /* kernel has been live-patched */
-#define TST_TAINT_X	(1 << 16) /* auxiliary taint, for distro's use */
+#define TST_TAINT_X     (1 << 16) /* auxiliary taint, for distro's use */
+#define TST_TAINT_T     (1 << 17) /* kernel was built with the struct randomization plugin */
 
 /*
  * Initialize and prepare support for checking tainted kernel.
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
