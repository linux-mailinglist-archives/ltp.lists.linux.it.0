Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7F20AF62
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 12:05:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D77F83C2B59
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 12:05:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 222633C074B
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 12:05:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0D6E1000CDD
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 12:05:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7412AF17
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 10:05:15 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 12:05:37 +0200
Message-Id: <20200626100537.23511-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] libltpvdso: Add check for getauxval()
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

The getauxval() function have been added into glibc 2.19 and hence is
not present in Centos 6.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 configure.ac                   | 1 +
 libs/libltpvdso/vdso_helpers.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/configure.ac b/configure.ac
index 05032d1cf..81804fd5b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -87,6 +87,7 @@ AC_CHECK_FUNCS([ \
     fsopen \
     fspick \
     fstatat \
+    getauxval \
     getdents \
     getdents64 \
     io_pgetevents \
diff --git a/libs/libltpvdso/vdso_helpers.c b/libs/libltpvdso/vdso_helpers.c
index e95840345..635270097 100644
--- a/libs/libltpvdso/vdso_helpers.c
+++ b/libs/libltpvdso/vdso_helpers.c
@@ -9,11 +9,13 @@
 
 #include "parse_vdso.h"
 #include <sys/auxv.h>
+#include "config.h"
 
 static unsigned long sysinfo_ehdr;
 
 static void vdso_init(void)
 {
+#ifdef HAVE_GETAUXVAL
 	if (sysinfo_ehdr)
 		return;
 
@@ -24,6 +26,9 @@ static void vdso_init(void)
 	}
 
 	vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
+#else
+	tst_res(TINFO, "getauxval() not supported");
+#endif /* HAVE_GETAUXVAL */
 }
 
 void find_clock_gettime_vdso(gettime_t *ptr_vdso_gettime,
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
