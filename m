Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D839B7BE
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:15:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9D2E3C7FE2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:15:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A2053C7FCE
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:14:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 45412201082
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:14:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 95F2621A1E;
 Fri,  4 Jun 2021 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622805282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGgSQmPoPVbn7ihnkKEUJWcUiuI8boIBPzvc/ZSuCuk=;
 b=iCZ/V+/FC7VZixS/1llEy3MAUCHXIyG4lNogrrWqLRYaYtk1LFeknUKXsw69fV25iMK5p0
 Q1xR/H+ZMBwhrCN6oxwCwuNWApZE976wqA5WoTDcC+AyFK5s+H/vREQRErw+WyT3Eyf8AG
 tnbeqB/5jdA7FF2E4alMZVNorr7Gg+I=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 65779A3B89;
 Fri,  4 Jun 2021 11:14:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  4 Jun 2021 12:14:33 +0100
Message-Id: <20210604111434.21422-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604111434.21422-1-rpalethorpe@suse.com>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 1/2] Add 'make check' and clang-check to build
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
 configure.ac                       |  2 ++
 include/mk/clang-check.mk          |  9 +++++++++
 include/mk/config.mk.in            |  5 +++++
 include/mk/env_post.mk             |  8 ++++++++
 include/mk/generic_leaf_target.inc |  5 ++++-
 include/mk/lib.mk                  |  3 +++
 include/mk/rules.mk                |  9 +++++++++
 include/mk/testcases.mk            |  1 +
 tools/clang-check/.gitignore       |  1 +
 tools/clang-check/Makefile         | 14 ++++++++++++++
 10 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 include/mk/clang-check.mk
 create mode 100644 tools/clang-check/.gitignore
 create mode 100644 tools/clang-check/Makefile

diff --git a/configure.ac b/configure.ac
index 136d82d09..b37c13c3c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -14,6 +14,7 @@ AC_CONFIG_FILES([ \
 ])
 
 AC_ARG_VAR(HOSTCC, [The C compiler on the host])
+AC_ARG_VAR(CLANG, [The LLVM Clang C compiler on the host])
 
 AM_MAINTAINER_MODE([enable])
 
@@ -42,6 +43,7 @@ AC_CHECK_DECLS([SEM_STAT_ANY],,,[#include <sys/sem.h>])
 
 AC_CHECK_HEADERS_ONCE([ \
     asm/ldt.h \
+    clang-c/Index.h \
     ifaddrs.h \
     keyutils.h \
     linux/can.h \
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
index 218447ef3..361b6a746 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -44,6 +44,11 @@ HOSTCC := cc
 endif
 endif
 
+CLANG := @CLANG@
+ifeq ($(strip $(CLANG)),)
+CLANG := clang
+endif
+
 AIO_LIBS		:= @AIO_LIBS@
 CAP_LIBS		:= @CAP_LIBS@
 ACL_LIBS		:= @ACL_LIBS@
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 1d22f9c53..8903a934d 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -89,6 +89,14 @@ $(error You must define $$(prefix) before executing install)
 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 endif
 
+CHECK_TARGETS			?= $(addprefix check-,$(MAKE_TARGETS))
+CHECK				?= $(abs_top_srcdir)/tools/clang-check/main
+CHECK_FLAGS			?= -resource-dir $(shell $(CLANG) -print-resource-dir)
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
 
diff --git a/tools/clang-check/.gitignore b/tools/clang-check/.gitignore
new file mode 100644
index 000000000..ba2906d06
--- /dev/null
+++ b/tools/clang-check/.gitignore
@@ -0,0 +1 @@
+main
diff --git a/tools/clang-check/Makefile b/tools/clang-check/Makefile
new file mode 100644
index 000000000..4650d6057
--- /dev/null
+++ b/tools/clang-check/Makefile
@@ -0,0 +1,14 @@
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
+HOST_LDFLAGS 		+= -lclang
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
