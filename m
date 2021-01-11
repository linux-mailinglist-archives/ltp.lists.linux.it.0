Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AC2F125F
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 13:36:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20DFA3C5FD4
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 13:36:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A81613C25C8
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 13:36:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0D1471400B89
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 13:36:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 249A5AD4E;
 Mon, 11 Jan 2021 12:36:33 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 11 Jan 2021 13:36:26 +0100
Message-Id: <20210111123626.28932-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils detection
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

Using pkg-config is less error prone during cross compilation.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

if you agree with this, I'll replace (probably after release) ACL_LIBS,
CAP_LIBS, CRYPTO_LIBS, SELINUX_LIBS (to follow libmnl and libtirpc).

libaio and libnuma does not support pkg-config.

Tested: https://travis-ci.org/github/pevik/ltp/builds/753925166

Kind regards,
Petr

 configure.ac                                   |  2 +-
 include/mk/config.mk.in                        |  6 +++---
 m4/ltp-keyutils.m4                             | 10 ----------
 m4/ltp-libkeyutils.m4                          |  8 ++++++++
 testcases/cve/Makefile                         |  2 +-
 testcases/kernel/syscalls/add_key/Makefile     |  2 +-
 testcases/kernel/syscalls/keyctl/Makefile      |  2 +-
 testcases/kernel/syscalls/request_key/Makefile |  2 +-
 8 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 m4/ltp-keyutils.m4
 create mode 100644 m4/ltp-libkeyutils.m4

diff --git a/configure.ac b/configure.ac
index 06be1c094..8d667eb1e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -328,7 +328,7 @@ LTP_CHECK_CLONE_SUPPORTS_7_ARGS
 LTP_CHECK_CRYPTO
 LTP_CHECK_FORTIFY_SOURCE
 LTP_CHECK_KERNEL_DEVEL
-LTP_CHECK_KEYUTILS_SUPPORT
+LTP_CHECK_LIBKEYUTILS
 LTP_CHECK_LIBMNL
 LTP_CHECK_LINUX_PTRACE
 LTP_CHECK_LINUXRANDOM
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 218447ef3..382b7fda2 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -52,12 +52,12 @@ LEXLIB			:= @LEXLIB@
 NUMA_LIBS		:= @NUMA_LIBS@
 SELINUX_LIBS		:= @SELINUX_LIBS@
 HAVE_RPC		:= @HAVE_RPC@
-LIBTIRPC_CFLAGS		:= @LIBTIRPC_CFLAGS@
-LIBTIRPC_LIBS		:= @LIBTIRPC_LIBS@
-KEYUTILS_LIBS		:= @KEYUTILS_LIBS@
 HAVE_FTS_H		:= @HAVE_FTS_H@
+LIBKEYUTILS_LIBS	:= @LIBKEYUTILS_LIBS@
 LIBMNL_LIBS		:= @LIBMNL_LIBS@
 LIBMNL_CFLAGS		:= @LIBMNL_CFLAGS@
+LIBTIRPC_CFLAGS		:= @LIBTIRPC_CFLAGS@
+LIBTIRPC_LIBS		:= @LIBTIRPC_LIBS@
 
 prefix			:= @prefix@
 
diff --git a/m4/ltp-keyutils.m4 b/m4/ltp-keyutils.m4
deleted file mode 100644
index 451c549f3..000000000
--- a/m4/ltp-keyutils.m4
+++ /dev/null
@@ -1,10 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Copyright (c) 2016 Fujitsu Ltd.
-dnl Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
-dnl Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
-
-AC_DEFUN([LTP_CHECK_KEYUTILS_SUPPORT], [
-	AC_CHECK_LIB([keyutils], [add_key],
-	[AC_DEFINE(HAVE_LIBKEYUTILS, 1, [Define to 1 if you have libkeyutils installed.])
-	      AC_SUBST(KEYUTILS_LIBS, "-lkeyutils")])
-])
diff --git a/m4/ltp-libkeyutils.m4 b/m4/ltp-libkeyutils.m4
new file mode 100644
index 000000000..f5d128969
--- /dev/null
+++ b/m4/ltp-libkeyutils.m4
@@ -0,0 +1,8 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+
+AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
+    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [
+        AC_DEFINE([HAVE_LIBKEYUTILS], [1], [Define to 1 if you have libkeyutils library and headers])
+	], [have_libkeyutils=no])
+])
diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index da44fff60..90921dd85 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -21,7 +21,7 @@ CFLAGS			+= -D_GNU_SOURCE
 
 stack_clash:	CFLAGS += -fno-optimize-sibling-calls
 
-cve-2016-7042:	LDLIBS += $(KEYUTILS_LIBS)
+cve-2016-7042:	LDLIBS += $(LIBKEYUTILS_LIBS)
 
 cve-2016-7117:	CFLAGS += -pthread
 cve-2016-7117:	LDLIBS += -lrt
diff --git a/testcases/kernel/syscalls/add_key/Makefile b/testcases/kernel/syscalls/add_key/Makefile
index 0f51e0bc2..6c2102247 100644
--- a/testcases/kernel/syscalls/add_key/Makefile
+++ b/testcases/kernel/syscalls/add_key/Makefile
@@ -5,6 +5,6 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += $(KEYUTILS_LIBS)
+LDLIBS  += $(LIBKEYUTILS_LIBS)
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/keyctl/Makefile b/testcases/kernel/syscalls/keyctl/Makefile
index 180ece25a..343c5e359 100644
--- a/testcases/kernel/syscalls/keyctl/Makefile
+++ b/testcases/kernel/syscalls/keyctl/Makefile
@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS	+= $(KEYUTILS_LIBS)
+LDLIBS	+= $(LIBKEYUTILS_LIBS)
 keyctl02: LDLIBS	+= -lpthread
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/request_key/Makefile b/testcases/kernel/syscalls/request_key/Makefile
index 58a99875e..e69774b96 100644
--- a/testcases/kernel/syscalls/request_key/Makefile
+++ b/testcases/kernel/syscalls/request_key/Makefile
@@ -6,6 +6,6 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS		+= $(KEYUTILS_LIBS)
+LDLIBS		+= $(LIBKEYUTILS_LIBS)
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
