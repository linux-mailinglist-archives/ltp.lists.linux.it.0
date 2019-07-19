Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CA6E483
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:49:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 703C33C1D45
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:49:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 883C23C1C7E
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 12:49:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id AF0F7140165F
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 12:49:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,282,1559491200"; d="scan'208";a="71784664"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Jul 2019 18:49:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id C5CF94B41EE5
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 18:48:56 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 19 Jul 2019 18:49:00 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 19 Jul 2019 18:48:54 +0800
Message-ID: <1563533334-2232-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: C5CF94B41EE5.AED08
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] m4: remove useless ltp-securebits.m4
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

Since commit fe9d9218c, we have detected linux/securebits.h in
confiure.ac. one place used the HAVE_SECUREBITS(ltp-securebits.m4 
defined), it only controls compile. kernel/security/securebits/
check_keepcaps.c has HAVE_LINUX_SECUREBITS_H check in internal, 
so removing it is safe.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac                       |  1 -
 include/mk/features.mk.default     |  3 ---
 include/mk/features.mk.in          |  3 ---
 m4/ltp-securebits.m4               | 10 ----------
 testcases/kernel/security/Makefile |  4 ----
 5 files changed, 21 deletions(-)
 delete mode 100644 m4/ltp-securebits.m4

diff --git a/configure.ac b/configure.ac
index 3dcf282e8..f899d8ebc 100644
--- a/configure.ac
+++ b/configure.ac
@@ -226,7 +226,6 @@ LTP_CHECK_NOMMU_LINUX
 LTP_CHECK_PERF_EVENT
 LTP_CHECK_PRCTL_SUPPORT
 LTP_CHECK_RLIMIT64
-LTP_CHECK_SECUREBITS
 LTP_CHECK_SELINUX
 LTP_CHECK_SIGNAL
 LTP_CHECK_STATX
diff --git a/include/mk/features.mk.default b/include/mk/features.mk.default
index 94b8b0c54..3a6cc5176 100644
--- a/include/mk/features.mk.default
+++ b/include/mk/features.mk.default
@@ -29,9 +29,6 @@ WITH_PYTHON			:= no
 
 # Features knobs
 
-# Is securebits[.h], et all support available?
-HAVE_SECUREBITS			:= no
-
 # Test suite knobs
 
 # Enable testcases/kernel/power_management's compile and install?
diff --git a/include/mk/features.mk.in b/include/mk/features.mk.in
index 7536b6f20..8e561b738 100644
--- a/include/mk/features.mk.in
+++ b/include/mk/features.mk.in
@@ -29,9 +29,6 @@ WITH_PYTHON			:= @WITH_PYTHON@
 
 # Features knobs
 
-# Is securebits[.h], et all support available?
-HAVE_SECUREBITS			:= @HAVE_SECUREBITS@
-
 # Test suite knobs
 
 # Enable testcases/kernel/power_management's compile and install?
diff --git a/m4/ltp-securebits.m4 b/m4/ltp-securebits.m4
deleted file mode 100644
index 7888e6335..000000000
--- a/m4/ltp-securebits.m4
+++ /dev/null
@@ -1,10 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Copyright (c) Serge Hallyn (2010)
-
-AC_DEFUN([LTP_CHECK_SECUREBITS],[
-	AC_CHECK_HEADERS(linux/securebits.h,[have_securebits=yes])
-if test "x$have_securebits" != xyes; then
-	have_securebits=no
-fi
-AC_SUBST(HAVE_SECUREBITS,$have_securebits)
-])
diff --git a/testcases/kernel/security/Makefile b/testcases/kernel/security/Makefile
index 0b4b98b83..eea794aa9 100644
--- a/testcases/kernel/security/Makefile
+++ b/testcases/kernel/security/Makefile
@@ -24,10 +24,6 @@ top_srcdir		?= ../../..
 
 include	$(top_srcdir)/include/mk/env_pre.mk
 
-ifneq ($(HAVE_SECUREBITS),yes)
-FILTER_OUT_DIRS		+= securebits
-endif
-
 OPT_CFLAGS		+= -O
 DEBUG_LDFLAGS		+= -s
 
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
