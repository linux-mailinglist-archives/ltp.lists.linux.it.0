Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9C3A6627
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464A93C8B07
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 13:57:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10F6F3C2779
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:57:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 364131400C44
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 13:56:58 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B68041FD33;
 Mon, 14 Jun 2021 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623671817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0V9NRiywyQ5ik28RmUUVWfZqHX3NSB2JgM3LKO6t2o=;
 b=X9agpe+6Jvc/aDxPecTG5oP+UKrkmt2fpLH6VuTNv/8IG+qjnFH1pzd4RgLEwBsar2uYTP
 6LqAhhPnL0VAFw6njW+WvR9CLUH1Kz3DOgT01vaBtY/xo/G8+t5LVTbNVCqHFuu6Nr6RwT
 QWoW9fJRxazpdTAeJzLw/o3efIiL3u8=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 7F141A3B87;
 Mon, 14 Jun 2021 11:56:57 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 14 Jun 2021 12:56:37 +0100
Message-Id: <20210614115638.25467-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614115638.25467-1-rpalethorpe@suse.com>
References: <20210614115638.25467-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v3 1/2] Add 'make check' and clang-check to build
 system
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Allows the user to run 'make check' to check all source files or
'make check-<target>' to check one source file corresponding to a
target.

Adds makefile pieces for tools/clang-check/main which will be a
libclang based tool. By default this is ran by 'make check'.

In theory allows other tools to be specified with
'make CHECK=tool CHECK_FLAGS=<args> check...'. e.g. 'make CHECK=sparse
CHECK_FLAGS= check-tst_cgroup'

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 Makefile                            |  8 +++++++
 configure.ac                        |  2 ++
 include/mk/clang-check.mk           |  9 ++++++++
 include/mk/config.mk.in             |  5 +++++
 include/mk/env_post.mk              | 11 +++++++++
 include/mk/generic_leaf_target.inc  |  5 ++++-
 include/mk/generic_trunk_target.inc |  7 +++++-
 include/mk/lib.mk                   |  3 +++
 include/mk/rules.mk                 |  9 ++++++++
 include/mk/testcases.mk             |  1 +
 m4/ltp-clang.m4                     | 29 ++++++++++++++++++++++++
 tools/clang-check/.gitignore        |  1 +
 tools/clang-check/Makefile          | 35 +++++++++++++++++++++++++++++
 13 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 include/mk/clang-check.mk
 create mode 100644 m4/ltp-clang.m4
 create mode 100644 tools/clang-check/.gitignore
 create mode 100644 tools/clang-check/Makefile

diff --git a/Makefile b/Makefile
index 56812d77b..3b0ba330d 100644
--- a/Makefile
+++ b/Makefile
@@ -79,6 +79,7 @@ BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS
 CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
 INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
 MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
+CHECK_TARGETS		:= $(addsuffix -check,testcases lib)
 
 # There's no reason why we should run `all' twice. Otherwise we're just wasting
 # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
@@ -108,6 +109,10 @@ $(MAKE_TARGETS) include-all lib-all libs-all:
 	$(MAKE) -C "$(subst -all,,$@)" \
 		-f "$(abs_top_srcdir)/$(subst -all,,$@)/Makefile" all
 
+$(CHECK_TARGETS): tools-all
+	$(MAKE) -C "$(subst -check,,$@)" \
+		-f "$(abs_top_srcdir)/$(subst -check,,$@)/Makefile" check
+
 # Let's not conflict with ac-clean, maintainer-clean, etc, so.
 $(filter-out include-clean,$(CLEAN_TARGETS))::
 	-$(MAKE) -C "$(subst -clean,,$@)" \
@@ -189,6 +194,9 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
 
 $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
 
+.PHONY: check
+check: $(CHECK_TARGETS)
+
 ## Install
 install: $(INSTALL_TARGETS)
 
diff --git a/configure.ac b/configure.ac
index 136d82d09..945fdcb3f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -370,4 +370,6 @@ LTP_CHECK_TASKSTATS
 test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
 LTP_DETECT_HOST_CPU
 
+LTP_CHECK_CLANG
+
 AC_OUTPUT
diff --git a/include/mk/clang-check.mk b/include/mk/clang-check.mk
new file mode 100644
index 000000000..2ab7b67a1
--- /dev/null
+++ b/include/mk/clang-check.mk
@@ -0,0 +1,9 @@
+# Rules to make clang-check tool(s) for inclusion in lib and testcases Makefiles
+
+CLANG_CHECK_DIR:= $(abs_top_builddir)/tools/clang-check
+
+$(CLANG_CHECK_DIR)/main: $(CLANG_CHECK_DIR)
+	$(MAKE) -C "$^" -f "$(CLANG_CHECK_DIR)/Makefile" all
+
+$(CLANG_CHECK_DIR): %:
+	mkdir -p "$@"
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 218447ef3..e1561a989 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -44,6 +44,11 @@ HOSTCC := cc
 endif
 endif
 
+LLVM_CONFIG ?= @LLVM_CONFIG@
+CLANG 	    ?= @CLANG@
+CLANG_LIBS  ?= @CLANG_LIBS@
+HAVE_CLANG_C_INDEX_H := @HAVE_CLANG_C_INDEX_H@
+
 AIO_LIBS		:= @AIO_LIBS@
 CAP_LIBS		:= @CAP_LIBS@
 ACL_LIBS		:= @ACL_LIBS@
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 1d22f9c53..74f53e038 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -89,6 +89,17 @@ $(error You must define $$(prefix) before executing install)
 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 endif
 
+CHECK_TARGETS			?= $(addprefix check-,$(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))))
+CHECK				?= $(abs_top_srcdir)/tools/clang-check/main
+ifneq ($(strip $(CLANG)),":")
+CHECK_FLAGS			?= -resource-dir $(shell $(CLANG) -print-resource-dir)
+endif
+
+
+ifeq ($(dir $(CHECK)),$(abs_top_srcdir)/tools/clang-check/)
+CHECK_DEPS			+= $(CHECK)
+endif
+
 include $(top_srcdir)/include/mk/rules.mk
 
 endif
diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index 64953f89a..aa092a5a3 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -92,7 +92,7 @@
 # INSTALL_DIR			:= $(libdir)
 #
 
-.PHONY: all clean install
+.PHONY: all clean install check
 
 ifneq ($(strip $(MAKE_TARGETS)),)
 $(MAKE_TARGETS) += $(HOST_MAKE_TARGETS)
@@ -109,4 +109,7 @@ $(INSTALL_FILES): | $(INSTALL_DEPS)
 
 install: $(INSTALL_FILES)
 
+$(CHECK_TARGETS): | $(CHECK_DEPS)
+check: $(CHECK_TARGETS)
+
 # vim: syntax=make
diff --git a/include/mk/generic_trunk_target.inc b/include/mk/generic_trunk_target.inc
index fc59f944f..32a108fbf 100644
--- a/include/mk/generic_trunk_target.inc
+++ b/include/mk/generic_trunk_target.inc
@@ -48,7 +48,7 @@
 
 include $(top_srcdir)/include/mk/functions.mk
 
-RECURSIVE_TARGETS		?= all install
+RECURSIVE_TARGETS		?= all install check
 
 $(eval $(get_make_dirs))
 
@@ -68,6 +68,9 @@ $(INSTALL_FILES): | $(INSTALL_DEPS)
 
 trunk-install: $(INSTALL_FILES)
 
+$(CHECK_TARGETS): | $(CHECK_DEPS)
+trunk-check: $(CHECK_TARGETS)
+
 # Avoid creating duplicate .PHONY references to all, clean, and install. IIRC,
 # I've seen some indeterministic behavior when one does this in the past with
 # GNU Make...
@@ -108,4 +111,6 @@ else
 endif
 endif
 
+check: trunk-check
+
 # vim: syntax=make
diff --git a/include/mk/lib.mk b/include/mk/lib.mk
index f9b6c0aff..a3961bce5 100644
--- a/include/mk/lib.mk
+++ b/include/mk/lib.mk
@@ -26,6 +26,7 @@
 # Makefile to include for libraries.
 
 include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/clang-check.mk
 
 INSTALL_DIR	:= $(libdir)
 
@@ -57,6 +58,8 @@ LIBSRCS		:= $(filter-out $(FILTER_OUT_LIBSRCS),$(LIBSRCS))
 
 LIBOBJS		:= $(LIBSRCS:.c=.o)
 
+CHECK_TARGETS	:= $(addprefix check-,$(notdir $(LIBSRCS:.c=)))
+
 $(LIB): $(notdir $(LIBOBJS))
 	@if [ -z "$(strip $^)" ] ; then \
 		echo "Cowardly refusing to create empty archive"; \
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
index c8f4bbbbe..2a04b2b67 100644
--- a/include/mk/rules.mk
+++ b/include/mk/rules.mk
@@ -37,3 +37,12 @@ else
 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
 	@echo CC $(target_rel_dir)$@
 endif
+
+.PHONY: $(CHECK_TARGETS)
+$(CHECK_TARGETS): check-%: %.c
+ifdef VERBOSE
+	$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
+else
+	@$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
+	@echo CHECK $(target_rel_dir)$<
+endif
diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
index 1c81773d0..e59899898 100644
--- a/include/mk/testcases.mk
+++ b/include/mk/testcases.mk
@@ -22,6 +22,7 @@
 
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/functions.mk
+include $(top_srcdir)/include/mk/clang-check.mk
 
 APICMDS_DIR	:= $(abs_top_builddir)/tools/apicmds
 
diff --git a/m4/ltp-clang.m4 b/m4/ltp-clang.m4
new file mode 100644
index 000000000..08314036b
--- /dev/null
+++ b/m4/ltp-clang.m4
@@ -0,0 +1,29 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2021 SUSE LLC
+
+dnl Find the libraries and tools necessary to build tools/clang-check
+
+dnl Note that it is possible to use libclang without the clang
+dnl executable or llvm-config. However it then means we have to start
+dnl searching the system for various Clang resources.
+
+AC_DEFUN([LTP_CHECK_CLANG],
+	[AC_CHECK_TOOL(LLVM_CONFIG, llvm-config, :)
+	 AC_CHECK_TOOL(CLANG, clang, :)
+	 ltp_save_CFLAGS=$CFLAGS
+    	 ltp_save_LDFLAGS=$LDFLAGS
+	 if test $LLVM_CONFIG != ":"; then
+    	    CFLAGS=$($LLVM_CONFIG --cflags)
+    	    LDFLAGS=$($LLVM_CONFIG --ldflags)
+	 fi
+	 AC_CHECK_LIB([clang], [clang_createIndex], [have_libclang=yes])
+	 AC_CHECK_HEADERS([clang-c/Index.h], [have_clang_h=1])
+	 if test x$have_libclang != xyes -o x$have_clang_h != x1 -o "x$CLANG" = "x:"; then
+	    AC_MSG_WARN(Libclang and Clang are needed for test development)
+	 else
+	    AC_SUBST(HAVE_CLANG_C_INDEX_H, $have_clang_h)
+	    AC_SUBST(CLANG_LIBS, -lclang)
+	 fi
+	 CFLAGS=$ltp_save_CFLAGS
+	 LDFLAGS=$ltp_save_LDFLAGS
+])
diff --git a/tools/clang-check/.gitignore b/tools/clang-check/.gitignore
new file mode 100644
index 000000000..ba2906d06
--- /dev/null
+++ b/tools/clang-check/.gitignore
@@ -0,0 +1 @@
+main
diff --git a/tools/clang-check/Makefile b/tools/clang-check/Makefile
new file mode 100644
index 000000000..f5c4a9a78
--- /dev/null
+++ b/tools/clang-check/Makefile
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+# Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/functions.mk
+
+HOST_MAKE_TARGETS	:= main
+ifneq ($(strip $(LLVM_CONFIG)),":")
+HOST_CFLAGS		+= $(shell $(LLVM_CONFIG) --cflags)
+HOST_LDFLAGS		+= $(shell $(LLVM_CONFIG) --ldflags)
+endif
+HOST_LDLIBS 		+= $(CLANG_LIBS)
+
+.PHONY: check-clang-deps
+check-clang-deps:
+ifeq ($(strip $(CLANG)),":")
+	$(warning clang-check: clang executable is missing which we use to find the Clang resource directory; install clang package)
+endif
+ifeq ($(strip $(LLVM_CONFIG)),":")
+	$(warning clang-check: llvm-config is missing which we use to find the libclang location; install the clang/LLVM devel packages)
+endif
+ifeq ($(strip $(CLANG_LIBS)),)
+	$(warning clang-check: libclang missing)
+endif
+ifneq ($(strip $(HAVE_CLANG_C_INDEX_H)),1)
+	$(warning clang-check: clang development headers are missing; install the clang devel package)
+endif
+
+MAKE_DEPS += check-clang-deps
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
