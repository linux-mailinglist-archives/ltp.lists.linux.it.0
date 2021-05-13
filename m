Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFF37F2F2
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BD5E3C6427
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:24:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BC1F3C4BFC
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:23:57 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5EF2C600E5D
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:23:56 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FghNY6Xg2zpdr9
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:20:29 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 14:23:42 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 13 May 2021 14:23:41 +0800
Message-ID: <20210513062341.83852-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513062341.83852-1-xieziyao@huawei.com>
References: <20210513062341.83852-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2 v2] open_posix_testsuite/Makefile: Use tabs
 instead of spaces
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
Reply-To: 20210512084904.35159-1-xieziyao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Replace spaces with tabs for open_posix_testsuite/Makefile.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/open_posix_testsuite/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/open_posix_testsuite/Makefile b/testcases/open_posix_testsuite/Makefile
index d655ebbd4..205ecdc00 100644
--- a/testcases/open_posix_testsuite/Makefile
+++ b/testcases/open_posix_testsuite/Makefile
@@ -38,7 +38,7 @@ endif
 clean: $(CRITICAL_MAKEFILE)
 	@rm -f $(LOGFILE)*
 	@for dir in $(SUBDIRS) tools; do \
-	    $(MAKE) -C $$dir clean >/dev/null; \
+		$(MAKE) -C $$dir clean >/dev/null; \
 	done

 distclean: distclean-makefiles
@@ -51,7 +51,7 @@ distclean-makefiles:

 generate-makefiles: distclean-makefiles
 	@env top_srcdir=$(top_srcdir) \
-	    $(top_srcdir)/scripts/generate-makefiles.sh
+		$(top_srcdir)/scripts/generate-makefiles.sh

 install: bin-install conformance-install functional-install stress-install

@@ -99,8 +99,8 @@ tools-all:
 	@$(MAKE) -C tools all

 $(CRITICAL_MAKEFILE): \
-    $(top_srcdir)/scripts/generate-makefiles.sh	\
-    $(top_srcdir)/CFLAGS			\
-    $(top_srcdir)/LDFLAGS			\
-    $(top_srcdir)/LDLIBS
+	$(top_srcdir)/scripts/generate-makefiles.sh	\
+	$(top_srcdir)/CFLAGS			\
+	$(top_srcdir)/LDFLAGS			\
+	$(top_srcdir)/LDLIBS
 	@$(MAKE) generate-makefiles
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
