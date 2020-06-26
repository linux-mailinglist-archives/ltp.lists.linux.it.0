Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AC20B004
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 12:47:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 096533C2B59
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 12:47:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 98BB43C0ECB
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 12:47:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A028260094C
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 12:46:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CE93ABF4
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 10:47:12 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 12:47:32 +0200
Message-Id: <20200626104732.24678-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] libltpvdso: Guard the sysv/auxv.h too
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

Obviously this header is only present when the getauxval() function is
present. This should be the last fix.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 libs/libltpvdso/vdso_helpers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libs/libltpvdso/vdso_helpers.c b/libs/libltpvdso/vdso_helpers.c
index 635270097..208c12f65 100644
--- a/libs/libltpvdso/vdso_helpers.c
+++ b/libs/libltpvdso/vdso_helpers.c
@@ -8,9 +8,12 @@
 #include "tst_test.h"
 
 #include "parse_vdso.h"
-#include <sys/auxv.h>
 #include "config.h"
 
+#ifdef HAVE_GETAUXVAL
+# include <sys/auxv.h>
+#endif /* HAVE_GETAUXVAL */
+
 static unsigned long sysinfo_ehdr;
 
 static void vdso_init(void)
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
