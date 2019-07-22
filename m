Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5C6FD0F
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:53:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79D7F3C1CF9
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:53:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 714963C03AD
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:53:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 64F02600687
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:53:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,294,1559491200"; d="scan'208";a="71946644"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jul 2019 17:53:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 451E84CDDD3F;
 Mon, 22 Jul 2019 17:53:00 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 22 Jul 2019 17:53:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ice_yangxiao@163.com>, <chrubis@suse.cz>
Date: Mon, 22 Jul 2019 17:52:47 +0800
Message-ID: <1563789167-2328-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563789167-2328-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1b8b7f73-fd31-58d2-5162-3648fa9729a5@163.com>
 <1563789167-2328-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 451E84CDDD3F.AFAEF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] ltp-cap.m4: uncouple licap and cap_compare
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Currently, HAVE_LIBCAP is not defined unless libcap supports
cap_compare(). The check for libcap and cap_compare() has to be
uncoupled because libcap-1 doesn't have cap_compare.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 m4/ltp-cap.m4                                 | 21 ++++++++++---------
 .../security/filecaps/check_simple_capset.c   |  4 ++--
 .../security/filecaps/verify_caps_exec.c      |  6 +++---
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/m4/ltp-cap.m4 b/m4/ltp-cap.m4
index 02d3cac8c..502f57006 100644
--- a/m4/ltp-cap.m4
+++ b/m4/ltp-cap.m4
@@ -1,17 +1,18 @@
 dnl SPDX-License-Identifier: GPL-2.0-or-later
 dnl Copyright (c) Cisco Systems Inc., 2009
 dnl Copyright (c) Linux Test Project, 2010
+dnl Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
 dnl Author: Ngie Cooper <yaneurabeya@gmail.com>
 
 AC_DEFUN([LTP_CHECK_CAPABILITY_SUPPORT],[
-AH_TEMPLATE(HAVE_LIBCAP,
-[Define to 1 if you have libcap-2 installed.])
-AC_CHECK_HEADERS([sys/capability.h],[capability_header_prefix="sys"])
-if test "x$capability_header_prefix" != x; then
-	AC_CHECK_LIB(cap,cap_compare,[cap_libs="-lcap"])
-fi
-if test "x$cap_libs" != x; then
-	AC_DEFINE(HAVE_LIBCAP)
-fi
-AC_SUBST(CAP_LIBS,$cap_libs)
+	AC_CHECK_LIB(cap,cap_init,[have_libcap=yes])
+	AC_CHECK_LIB(cap,cap_compare,[have_libcap_2=yes])
+	AC_CHECK_HEADERS(sys/capability.h,[have_sys_cap=yes])
+	if test "x$have_libcap" = "xyes" -a "x$have_sys_cap" = "xyes"; then
+		AC_DEFINE(HAVE_LIBCAP, 1, [Define to 1 if you have libcap and it's headers installed])
+		AC_SUBST(CAP_LIBS, "-lcap")
+	fi
+	if test "x$have_libcap_2" = "xyes" -a "x$have_sys_cap" = "xyes"; then
+		AC_DEFINE(HAVE_LIBCAP_V2, 1, [Define to 1 if you have libcap-2 and it's headers installed])
+	fi
 ])
diff --git a/testcases/kernel/security/filecaps/check_simple_capset.c b/testcases/kernel/security/filecaps/check_simple_capset.c
index 81a75babd..e9c414119 100644
--- a/testcases/kernel/security/filecaps/check_simple_capset.c
+++ b/testcases/kernel/security/filecaps/check_simple_capset.c
@@ -27,7 +27,7 @@
 
 int main(void)
 {
-#ifdef HAVE_LIBCAP
+#ifdef HAVE_LIBCAP_V2
 	cap_t caps, caps2;
 	int ret;
 
@@ -41,7 +41,7 @@ int main(void)
 	cap_free(caps2);
 	return ret;
 #else
-	printf("System doesn't support full POSIX capabilities.\n");
+	printf("System doesn't support V2 POSIX capabilities.\n");
 	return 1;
 #endif
 }
diff --git a/testcases/kernel/security/filecaps/verify_caps_exec.c b/testcases/kernel/security/filecaps/verify_caps_exec.c
index 3e6794102..a4c127fb6 100644
--- a/testcases/kernel/security/filecaps/verify_caps_exec.c
+++ b/testcases/kernel/security/filecaps/verify_caps_exec.c
@@ -62,7 +62,7 @@ static void usage(const char *me)
 #define DROP_PERMS 0
 #define KEEP_PERMS 1
 
-#ifdef HAVE_LIBCAP
+#ifdef HAVE_LIBCAP_V2
 static void print_my_caps(void)
 {
 	cap_t cap = cap_get_proc();
@@ -398,7 +398,7 @@ static int caps_actually_set_test(void)
 
 int main(int argc, char *argv[])
 {
-#ifdef HAVE_LIBCAP
+#ifdef HAVE_LIBCAP_V2
 	if (argc < 2)
 		usage(argv[0]);
 
@@ -419,7 +419,7 @@ int main(int argc, char *argv[])
 		usage(argv[0]);
 	}
 #else
-	tst_resm(TCONF, "System doesn't have POSIX capabilities support.");
+	tst_resm(TCONF, "System doesn't have POSIX  V2 capabilities support.");
 #endif
 
 	tst_exit();
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
