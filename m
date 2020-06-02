Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 511351EB6A3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 09:38:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 349A83C3056
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 09:38:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 522A73C3027
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 09:38:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4E77D1000C55
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 09:38:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,462,1583164800"; d="scan'208";a="93643961"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jun 2020 15:38:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2BE104BCC8B2
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 15:38:02 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Jun 2020 15:38:00 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 2 Jun 2020 15:37:58 +0800
Message-ID: <1591083478-5342-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2BE104BCC8B2.AF3E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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

Use INTERNAL_LIB for ltp lib because installing these ltp static
library in any situation is meaningless.

all static library as below:
./libs/libltpuinput/libltpuinput.a
./libs/libltpnewipc/libltpnewipc.a
./libs/libltpnuma/libltpnuma.a
./libs/libltpipc/libltpipc.a
./libs/libltpipc/libltpmsgctl.a
./utils/sctp/lib/libsctp.a
./utils/sctp/testlib/libsctputil.a
./lib/libltp.a
./testcases/network/rpc/basic_tests/rpc01/lib/librpc01.a
./testcases/network/rpc/rpc-tirpc/tests_pack/lib/librpc-tirpc.a
./testcases/kernel/containers/libclone/libclone.a
./testcases/kernel/mem/hugetlb/lib/libhugetlb.a
./testcases/kernel/mem/lib/libmem.a
./testcases/kernel/controllers/libcontrollers/libcontrollers.a
./testcases/kernel/controllers/cpuset/cpuset_lib/libcpu_set.a
./testcases/kernel/lib/libkerntest.a

Also include Android_libpthread and android_librt and remove useless
libdir variable.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2:
1.remove ./testcases/commands/nm/datafiles/lib.a from commit message
2.add two anroid Makefiles
3.remove useless libdir

 include/mk/config.mk.in                                 | 3 +--
 include/mk/generic_leaf_target.inc                      | 6 ------
 include/mk/lib.mk                                       | 2 --
 lib/Makefile                                            | 2 +-
 lib/android_libpthread/Makefile                         | 2 +-
 lib/android_librt/Makefile                              | 2 +-
 libs/libltpipc/Makefile                                 | 2 +-
 libs/libltpnuma/Makefile                                | 2 +-
 libs/libltpuinput/Makefile                              | 2 +-
 testcases/kernel/containers/libclone/Makefile           | 2 +-
 testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
 testcases/kernel/controllers/libcontrollers/Makefile    | 2 +-
 testcases/kernel/mem/hugetlb/lib/Makefile               | 2 +-
 testcases/network/rpc/rpc-tirpc/tests_pack/lib/Makefile | 2 +-
 utils/sctp/lib/Makefile                                 | 2 +-
 utils/sctp/testlib/Makefile                             | 2 +-
 16 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 427608a17..f7b26cbd5 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -52,7 +52,6 @@ datarootdir		:= @datarootdir@
 includedir		:= @includedir@
 exec_prefix		:= @exec_prefix@
 bindir			:= @bindir@
-libdir			:= @libdir@
 mandir			:= @mandir@
 
 CPPFLAGS		:= @CPPFLAGS@
@@ -82,4 +81,4 @@ ifeq ($(strip $(prefix)),)
 $(error you are using $$(prefix) incorrectly -- set it to $(abs_top_srcdir) if you want to build in the source tree)
 endif
 
-export datarootdir includedir libdir mandir prefix
+export datarootdir includedir mandir prefix
diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index dd54d05e9..ca61ceff4 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -83,12 +83,6 @@
 #
 # INSTALL_DIR			:= /path/to/installdir/from/$(DESTDIR)
 #
-# e.g. if I wanted to install my binaries in $(libdir) (which may not exist
-# outside of $(prefix) right now, but could in the future), I could do the
-# following:
-#
-# INSTALL_DIR			:= $(libdir)
-#
 
 .PHONY: all clean install
 
diff --git a/include/mk/lib.mk b/include/mk/lib.mk
index 36e1ba17b..9d018718b 100644
--- a/include/mk/lib.mk
+++ b/include/mk/lib.mk
@@ -26,8 +26,6 @@
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_DIR	:= $(libdir)
-
 # An extension of generic_leaf_target, strictly for libraries.
 .PHONY: install_headers
 
diff --git a/lib/Makefile b/lib/Makefile
index e7fc753da..f019432e8 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -32,7 +32,7 @@ else
 FILTER_OUT_LIBSRCS	+= tlibio.c tst_safe_sysv_ipc.c
 endif
 
-LIB			:= libltp.a
+INTERNAL_LIB		:= libltp.a
 
 pc_file			:= $(DESTDIR)/$(datarootdir)/pkgconfig/ltp.pc
 
diff --git a/lib/android_libpthread/Makefile b/lib/android_libpthread/Makefile
index 2946d093f..441cadcb9 100644
--- a/lib/android_libpthread/Makefile
+++ b/lib/android_libpthread/Makefile
@@ -2,6 +2,6 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= libpthread.a
+INTERNAL_LIB		:= libpthread.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/lib/android_librt/Makefile b/lib/android_librt/Makefile
index ecb1fbe6c..70d520c0a 100644
--- a/lib/android_librt/Makefile
+++ b/lib/android_librt/Makefile
@@ -2,6 +2,6 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= librt.a
+INTERNAL_LIB 		:= librt.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/libs/libltpipc/Makefile b/libs/libltpipc/Makefile
index 11f38ea0a..fadd04833 100644
--- a/libs/libltpipc/Makefile
+++ b/libs/libltpipc/Makefile
@@ -5,7 +5,7 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= libltpipc.a libltpmsgctl.a
+INTERNAL_LIB		:= libltpipc.a libltpmsgctl.a
 
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpnuma/Makefile b/libs/libltpnuma/Makefile
index 56d6b7762..a6856758d 100644
--- a/libs/libltpnuma/Makefile
+++ b/libs/libltpnuma/Makefile
@@ -6,7 +6,7 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= libltpnuma.a
+INTERNAL_LIB		:= libltpnuma.a
 
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpuinput/Makefile b/libs/libltpuinput/Makefile
index dd2a6c096..c72dd2e1e 100644
--- a/libs/libltpuinput/Makefile
+++ b/libs/libltpuinput/Makefile
@@ -6,7 +6,7 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= libltpuinput.a
+INTERNAL_LIB		:= libltpuinput.a
 
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/containers/libclone/Makefile b/testcases/kernel/containers/libclone/Makefile
index d78570db7..13af52b67 100644
--- a/testcases/kernel/containers/libclone/Makefile
+++ b/testcases/kernel/containers/libclone/Makefile
@@ -22,6 +22,6 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LIB			:= libclone.a
+INTERNAL_LIB		:= libclone.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
index 069ebc38c..1b6a40bea 100644
--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS			:= -lm -lcontrollers -lltp $(LDLIBS)
 
-LIB			:= libcpu_set.a
+INTERNAL_LIB		:= libcpu_set.a
 
 include	$(top_srcdir)/include/mk/lib.mk
diff --git a/testcases/kernel/controllers/libcontrollers/Makefile b/testcases/kernel/controllers/libcontrollers/Makefile
index 88918cf2d..9f8955e28 100644
--- a/testcases/kernel/controllers/libcontrollers/Makefile
+++ b/testcases/kernel/controllers/libcontrollers/Makefile
@@ -24,6 +24,6 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LIB			:= libcontrollers.a
+INTERNAL_LIB		:= libcontrollers.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/testcases/kernel/mem/hugetlb/lib/Makefile b/testcases/kernel/mem/hugetlb/lib/Makefile
index c5c55648f..2e893429d 100644
--- a/testcases/kernel/mem/hugetlb/lib/Makefile
+++ b/testcases/kernel/mem/hugetlb/lib/Makefile
@@ -21,6 +21,6 @@ top_srcdir		?= ../../../../..
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/testcases/kernel/mem/include/libmem.mk
 
-LIB			:= libhugetlb.a
+INTERNAL_LIB		:= libhugetlb.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/lib/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/lib/Makefile
index 3563d2dc5..5a6f5d41c 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/lib/Makefile
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/lib/Makefile
@@ -20,6 +20,6 @@ top_srcdir             ?= ../../../../../..
 
 include        $(top_srcdir)/include/mk/env_pre.mk
 
-LIB	:= librpc-tirpc.a
+INTERNAL_LIB	:= librpc-tirpc.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/utils/sctp/lib/Makefile b/utils/sctp/lib/Makefile
index c0cb35b4e..54438b61c 100644
--- a/utils/sctp/lib/Makefile
+++ b/utils/sctp/lib/Makefile
@@ -26,6 +26,6 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 CPPFLAGS		+= -I$(abs_srcdir)/../include
 
-LIB			:= libsctp.a
+INTERNAL_LIB		:= libsctp.a
 
 include $(top_srcdir)/include/mk/lib.mk
diff --git a/utils/sctp/testlib/Makefile b/utils/sctp/testlib/Makefile
index 2977f45b3..84ed02040 100644
--- a/utils/sctp/testlib/Makefile
+++ b/utils/sctp/testlib/Makefile
@@ -28,7 +28,7 @@ CPPFLAGS		+= -DLTP -I$(abs_srcdir)/../include
 
 LDLIBS			+= -lltp -lsctp
 
-LIB			:= libsctputil.a
+INTERNAL_LIB		:= libsctputil.a
 
 #
 #DEPLIBDIR		:= ../lib
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
