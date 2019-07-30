Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 179597A081
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9BC93C1D6E
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DB5793C1D59
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A7D57200E0A
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,325,1559491200"; d="scan'208";a="72503930"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 13:46:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id D9E244CDE889;
 Tue, 30 Jul 2019 13:46:05 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 30 Jul 2019 13:46:01 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <pvorel@suse.cz>
Date: Tue, 30 Jul 2019 13:45:31 +0800
Message-ID: <1564465533-2475-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20190729144227.GA8824@dell5510>
 <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: D9E244CDE889.A087F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/5] m4:remove useless ltp-fs_ioc_flags.m4
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

FS_IOC_GETFLAGS and FS_IOC_SETFLAGS have been defined in lapi/fs.h.
setxattr03.c checked this ioctl return value, so removing it is safe.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac                                    |  1 -
 m4/ltp-fs_ioc_flags.m4                          | 11 -----------
 testcases/kernel/syscalls/setxattr/setxattr03.c |  9 ++++-----
 3 files changed, 4 insertions(+), 17 deletions(-)
 delete mode 100644 m4/ltp-fs_ioc_flags.m4

diff --git a/configure.ac b/configure.ac
index b0eddcbf8..70c6fef5b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -214,7 +214,6 @@ LTP_CHECK_CLONE_SUPPORTS_7_ARGS
 LTP_CHECK_CRYPTO
 LTP_CHECK_FIDEDUPE
 LTP_CHECK_FORTIFY_SOURCE
-LTP_CHECK_FS_IOC_FLAGS
 LTP_CHECK_FTS_H
 LTP_CHECK_IF_LINK
 LTP_CHECK_IOVEC
diff --git a/m4/ltp-fs_ioc_flags.m4 b/m4/ltp-fs_ioc_flags.m4
deleted file mode 100644
index 79fffd27b..000000000
--- a/m4/ltp-fs_ioc_flags.m4
+++ /dev/null
@@ -1,11 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Copyright (c) Linux Test Project, 2012
-dnl Author: Cyril Hrubis <chrubis@suse.cz>
-
-AC_DEFUN([LTP_CHECK_FS_IOC_FLAGS],[
-AH_TEMPLATE(HAVE_FS_IOC_FLAGS,
-[Define to 1 if you have FS_IOC_GETFLAGS and FS_IOC_SETFLAGS in <linux/fs.h>.])
-AC_MSG_CHECKING([for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS in <linux/fs.h>])
-AC_TRY_COMPILE([#include <linux/fs.h>], [int flags = FS_IOC_GETFLAGS;],
-               AC_DEFINE(HAVE_FS_IOC_FLAGS) AC_MSG_RESULT(yes), AC_MSG_RESULT(no))
-])
diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
index a2f6cbf36..4215a21f4 100644
--- a/testcases/kernel/syscalls/setxattr/setxattr03.c
+++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
@@ -47,14 +47,14 @@
 #ifdef HAVE_SYS_XATTR_H
 # include <sys/xattr.h>
 #endif
-#include <linux/fs.h>
+#include "lapi/fs.h"
 
 #include "test.h"
 #include "safe_macros.h"
 
 char *TCID = "setxattr03";
 
-#if defined HAVE_SYS_XATTR_H && defined HAVE_FS_IOC_FLAGS
+#if defined HAVE_SYS_XATTR_H
 #define XATTR_TEST_KEY "user.testkey"
 #define XATTR_TEST_VALUE "this is a test value"
 #define XATTR_TEST_VALUE_SIZE (sizeof(XATTR_TEST_VALUE) - 1)
@@ -206,7 +206,6 @@ static void cleanup(void)
 #else
 int main(void)
 {
-	tst_brkm(TCONF, NULL, "<sys/xattr.h> not present or FS_IOC_FLAGS "
-		 "missing in <linux/fs.h>");
+	tst_brkm(TCONF, NULL, "<sys/xattr.h> not present");
 }
-#endif /* defined HAVE_SYS_XATTR_H && defined HAVE_FS_IOC_FLAGS */
+#endif /* defined HAVE_SYS_XATTR_H */
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
