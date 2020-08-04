Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4D23BC12
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 16:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50F683C32CE
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 16:27:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A56EF3C254F
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:27:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 99D0F2011BA
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:27:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF717B184
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:27:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 16:27:05 +0200
Message-Id: <20200804142705.12377-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] make: Drop 3.80 support
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

make 3.81 was released 14 years ago, we can safely require it now.

Removed also make check as not necessary any more because the latest LTP
release does not compile on systems with make 3.81 due old libc and
kernel headers.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I need to adjust some rule for other WIP patchset, thus decided to do
cleanup first.

NOTE: I guess Cyril should first merge his "Build system fixes" patchset
[1] and I'll rebase.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=193503&state=*

 Makefile                |  8 ++------
 include/mk/env_post.mk  | 21 ++-------------------
 include/mk/env_pre.mk   | 36 ++++--------------------------------
 include/mk/functions.mk | 33 ++-------------------------------
 include/mk/lib.mk       | 10 ++--------
 5 files changed, 12 insertions(+), 96 deletions(-)

diff --git a/Makefile b/Makefile
index 768ca4606..bf5077231 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 #
 #    Top-level Makefile for LTP. See INSTALL for more info.
 #
-#    Copyright (C) 2009-2010, Cisco Systems Inc.
-#    Copyright (C) 2010-2011, Linux Test Project.
+#    Copyright (c) Linux Test Project, 2009-2020
+#    Copyright (c) Cisco Systems Inc., 2009-2010
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -89,11 +89,7 @@ include-install: $(top_builddir)/include/config.h include/mk/config.mk include-a
 INSTALL_DIR		:= $(DESTDIR)/$(prefix)
 
 # DO NOT REMOVE THIS CALL (see clean_install_dir call below...)!!!!
-ifdef MAKE_3_80_COMPAT
-INSTALL_DIR		:= $(call MAKE_3_80_abspath,$(INSTALL_DIR))
-else
 INSTALL_DIR		:= $(abspath $(INSTALL_DIR))
-endif
 
 # build tree bootstrap targets and $(INSTALL_DIR) target.
 $(sort $(addprefix $(abs_top_builddir)/,$(BOOTSTRAP_TARGETS)) $(INSTALL_DIR) $(DESTDIR)/$(bindir)):
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index f4169ad66..56bc7d454 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -1,7 +1,8 @@
 #
 #    Environment post-setup Makefile.
 #
-#    Copyright (C) 2009, Cisco Systems Inc.
+#    Copyright (c) Linux Test Project, 2009-2020
+#    Copyright (c) Cisco Systems Inc., 2009
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -79,28 +80,10 @@ INSTALL_TARGETS			:= $(patsubst $(abs_srcdir)/%,%,$(INSTALL_TARGETS))
 # scripts, so let's chmod them like that.
 INSTALL_MODE			?= 00775
 
-ifdef MAKE_3_80_COMPAT
-
-INSTALL_PATH			:= $(call MAKE_3_80_abspath,$(DESTDIR)/$(INSTALL_DIR))
-
-INSTALL_TARGETS_ABS		:= $(call MAKE_3_80_abspath,$(addprefix $(INSTALL_PATH)/,$(INSTALL_TARGETS)))
-MAKE_TARGETS_ABS		:= $(call MAKE_3_80_abspath,$(addprefix $(INSTALL_PATH)/,$(MAKE_TARGETS)))
-
-INSTALL_FILES			:= $(INSTALL_TARGETS_ABS) $(MAKE_TARGETS_ABS)
-
-$(INSTALL_TARGETS_ABS):
-	test -d "$(@D)" || mkdir -p "$(@D)"
-	install -m $(INSTALL_MODE) "$(abs_srcdir)/$(subst $(INSTALL_PATH)/,,$@)" "$@"
-
-$(MAKE_TARGETS_ABS):
-	test -d "$(@D)" || mkdir -p "$(@D)"
-	install -m $(INSTALL_MODE) "$(abs_builddir)/$(subst $(INSTALL_PATH)/,,$@)" "$@"
-else
 $(abspath $(addprefix $(DESTDIR)/$(INSTALL_DIR)/,$(sort $(dir $(INSTALL_TARGETS) $(MAKE_TARGETS))))):
 	mkdir -p "$@"
 $(foreach install_target,$(INSTALL_TARGETS),$(eval $(call generate_install_rule,$(install_target),$(abs_srcdir),$(INSTALL_DIR))))
 $(foreach make_target,$(MAKE_TARGETS),$(eval $(call generate_install_rule,$(make_target),$(abs_builddir),$(INSTALL_DIR))))
-endif
 
 else  # else ! $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 $(error You must define $$(prefix) before executing install)
diff --git a/include/mk/env_pre.mk b/include/mk/env_pre.mk
index c4a1f4708..f87c15c37 100644
--- a/include/mk/env_pre.mk
+++ b/include/mk/env_pre.mk
@@ -1,7 +1,8 @@
 #
 #    Make pre-include environment Makefile.
 #
-#    Copyright (C) 2009, Cisco Systems Inc.
+#    Copyright (c) Linux Test Project, 2009-2020
+#    Copyright (c) Cisco Systems Inc., 2009
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -36,28 +37,13 @@ BUILD_TREE_NONSRCDIR_INSTALL	:= 3
 # configure not run.
 BUILD_TREE_UNCONFIGURED		:= 4
 
-ifndef MAKE_VERSION_CHECK
-export MAKE_VERSION_CHECK = 1
-ifneq ($(firstword $(sort 3.80 $(MAKE_VERSION))),3.80)
-$(error Your version of make $(MAKE_VERSION) is too old. Upgrade to at least 3.80; 3.81+ is preferred)
-else
-ifneq ($(filter 3.80%,$(MAKE_VERSION)),)
-export MAKE_3_80_COMPAT	:= 1
-endif # make 3.80?
-endif # At least make 3.80?
-endif # MAKE_VERSION_CHECK
-
 # Get the absolute path for the source directory.
 top_srcdir			?= $(error You must define top_srcdir before including this file)
 
 include $(top_srcdir)/include/mk/functions.mk
 
 # Where's the root source directory?
-ifdef MAKE_3_80_COMPAT
-abs_top_srcdir			:= $(call MAKE_3_80_abspath,$(top_srcdir))
-else
 abs_top_srcdir			:= $(abspath $(top_srcdir))
-endif
 
 #
 # Where's the root object directory?
@@ -67,12 +53,8 @@ endif
 #
 top_builddir			?= $(top_srcdir)
 
-# We need the absolute path...
-ifdef MAKE_3_80_COMPAT
-abs_top_builddir		:= $(call MAKE_3_80_abspath,$(top_builddir))
-else
+# We need the absolute path
 abs_top_builddir		:= $(abspath $(top_builddir))
-endif
 
 # Where's the root object directory?
 builddir			:= .
@@ -81,12 +63,8 @@ abs_builddir			:= $(CURDIR)
 
 cwd_rel_from_top		:= $(subst $(abs_top_builddir),,$(abs_builddir))
 
-# Where's the source located at? Squish all of the / away by using abspath...
-ifdef MAKE_3_80_COMPAT
-abs_srcdir			:= $(call MAKE_3_80_abspath,$(abs_top_srcdir)/$(cwd_rel_from_top))
-else
+# Where's the source located at? Squish all of the / away by using abspath
 abs_srcdir			:= $(abspath $(abs_top_srcdir)/$(cwd_rel_from_top))
-endif
 
 srcdir				:= $(strip $(subst $(abs_top_srcdir)/,,$(abs_srcdir)))
 
@@ -136,13 +114,7 @@ BUILD_TREE_STATE		:= $(BUILD_TREE_NONSRCDIR_INSTALL)
 endif
 endif
 
-ifeq ($(MAKE_3_80_COMPAT),1)
-# Trick make 3.80 into thinking that the default goal is all.
-.PHONY: default
-default: all
-else
 .DEFAULT_GOAL			:= all
-endif
 
 endif	# END autotools, *clean...
 
diff --git a/include/mk/functions.mk b/include/mk/functions.mk
index 6f67b5af8..79c6193ca 100644
--- a/include/mk/functions.mk
+++ b/include/mk/functions.mk
@@ -1,7 +1,8 @@
 #
 #  A Makefile with a collection of reusable functions.
 #
-#    Copyright (C) 2009, Cisco Systems Inc.
+#    Copyright (c) Linux Test Project, 2009-2020
+#    Copyright (c) Cisco Systems Inc., 2009
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -20,25 +21,6 @@
 # Ngie Cooper, July 2009
 #
 
-SQUOTE			:= '
-
-# ' # to keep colorized editors from going nuts
-
-MAKE_3_80_realpath	= $(shell $(top_srcdir)/scripts/realpath.sh '$(subst $(SQUOTE),\\$(SQUOTE),$(1))')
-
-MAKE_3_80_abspath	= $(shell $(top_srcdir)/scripts/abspath.sh '$(subst $(SQUOTE),\\$(SQUOTE),$(1))')
-
-#
-# NOTE (garrcoop):
-#
-# The following functions are (sometimes) split into 3.80 and 3.81+
-# counterparts, and not conditionalized inside of the define(s) to work around
-# an issue with how make 3.80 evaluates defines.
-#
-# SO DO NOT INTERNALIZE CONDITIONALS IN DEFINES OR YOU WILL BREAK MAKE 3.80!
-#
-
-#
 # Generate an install rule which also creates the install directory if needed
 # to avoid unnecessary bourne shell based for-loops and install errors, as well
 # as adhoc install rules.
@@ -46,17 +28,7 @@ MAKE_3_80_abspath	= $(shell $(top_srcdir)/scripts/abspath.sh '$(subst $(SQUOTE),
 # 1 -> Target basename.
 # 2 -> Source directory.
 # 3 -> Destination directory.
-#
-ifdef MAKE_3_80_COMPAT
-define generate_install_rule
 
-INSTALL_FILES		+= $$(call MAKE_3_80_abspath,$$(DESTDIR)/$(3)/$(1))
-
-$$(call MAKE_3_80_abspath,$$(DESTDIR)/$(3)/$(1)): \
-    $$(call MAKE_3_80_abspath,$$(dir $$(DESTDIR)/$(3)/$(1)))
-	install -m $$(INSTALL_MODE) "$(2)/$(1)" "$$@"
-endef
-else # not MAKE_3_80_COMPAT
 define generate_install_rule
 
 INSTALL_FILES		+= $$(abspath $$(DESTDIR)/$(3)/$(1))
@@ -65,7 +37,6 @@ $$(abspath $$(DESTDIR)/$(3)/$(1)): \
     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
 	install -m $$(INSTALL_MODE) "$(2)/$(1)" "$$@"
 endef
-endif # END MAKE_3_80_COMPAT
 
 #
 # Set SUBDIRS to the subdirectories where Makefiles were found.
diff --git a/include/mk/lib.mk b/include/mk/lib.mk
index 36e1ba17b..f0e56cb00 100644
--- a/include/mk/lib.mk
+++ b/include/mk/lib.mk
@@ -1,7 +1,8 @@
 #
 #    library include Makefile.
 #
-#    Copyright (C) 2009, Cisco Systems Inc.
+#    Copyright (c) Linux Test Project, 2009-2020
+#    Copyright (c) Cisco Systems Inc., 2009
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -49,15 +50,8 @@ endif
 MAKE_TARGETS	+= $(LIB)
 
 LIBSRCS		?= $(wildcard $(abs_srcdir)/*.c)
-
-ifdef MAKE_3_80_COMPAT
-LIBSRCS		:= $(call MAKE_3_80_abspath,$(LIBSRCS))
-else
 LIBSRCS		:= $(abspath $(LIBSRCS))
-endif
-
 LIBSRCS		:= $(subst $(abs_srcdir)/,,$(wildcard $(LIBSRCS)))
-
 LIBSRCS		:= $(filter-out $(FILTER_OUT_LIBSRCS),$(LIBSRCS))
 
 LIBOBJS		:= $(LIBSRCS:.c=.o)
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
