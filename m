Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D943C7F26
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B44D3C756D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 780A03C8657
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D6B971000DE0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:11 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 93DD2229A0;
 Wed, 14 Jul 2021 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626246731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2IMONExmt9GBtsa8nd8BlnPbILiyYNvuZLWLMciai8=;
 b=fH+fpPXTnfDASjCGElA3d/ZS7yWygd1C6qfvV1kDQ2krGhs2CWABOQis9wt7GF95ABTpjd
 ye6pt+x9PxEkyLsT0jVY8CVS7KjEX9hHcantSIpeJWq/XsdN0sKo4hhRKyO7n87lmLB73F
 eRvLTRqOPbhmy1ZvqGe0c3ctGozDdSk=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 40623A3B96;
 Wed, 14 Jul 2021 07:12:11 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 08:11:52 +0100
Message-Id: <20210714071158.15868-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714071158.15868-1-rpalethorpe@suse.com>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/8] Add 'make check' to the build system
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

Allows one to run 'make check' or 'make check-$TARGET'. Which will
execute the CHECK tool with that target's CC arguments and
CHECK_FLAGS. By default the check tool is tools/sparse/main.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 Makefile                                | 8 ++++++++
 include/mk/env_post.mk                  | 8 ++++++++
 include/mk/generic_leaf_target.inc      | 5 ++++-
 include/mk/generic_trunk_target.inc     | 7 ++++++-
 include/mk/lib.mk                       | 3 +++
 include/mk/module.mk                    | 2 ++
 include/mk/rules.mk                     | 9 +++++++++
 include/mk/sparse.mk                    | 9 +++++++++
 include/mk/testcases.mk                 | 1 +
 testcases/open_posix_testsuite/Makefile | 4 ++++
 10 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 include/mk/sparse.mk

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
 
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 1d22f9c53..7f4948037 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -89,6 +89,14 @@ $(error You must define $$(prefix) before executing install)
 endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
 endif
 
+CHECK_TARGETS			?= $(addprefix check-,$(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))))
+CHECK_TARGETS			:= $(filter-out $(addprefix check-, $(FILTER_OUT_MAKE_TARGETS)), $(CHECK_TARGETS))
+CHECK				?= $(abs_top_srcdir)/tools/sparse/main
+
+ifeq ($(CHECK),$(abs_top_srcdir)/tools/sparse/main)
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
index f9b6c0aff..3bf63bf9e 100644
--- a/include/mk/lib.mk
+++ b/include/mk/lib.mk
@@ -26,6 +26,7 @@
 # Makefile to include for libraries.
 
 include $(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/sparse.mk
 
 INSTALL_DIR	:= $(libdir)
 
@@ -57,6 +58,8 @@ LIBSRCS		:= $(filter-out $(FILTER_OUT_LIBSRCS),$(LIBSRCS))
 
 LIBOBJS		:= $(LIBSRCS:.c=.o)
 
+CHECK_TARGETS	:= $(addprefix check-,$(notdir $(LIBSRCS:.c=)))
+
 $(LIB): $(notdir $(LIBOBJS))
 	@if [ -z "$(strip $^)" ] ; then \
 		echo "Cowardly refusing to create empty archive"; \
diff --git a/include/mk/module.mk b/include/mk/module.mk
index 6c8814b96..3bb7350f1 100644
--- a/include/mk/module.mk
+++ b/include/mk/module.mk
@@ -47,6 +47,8 @@ endif
 
 CLEAN_TARGETS += .dep_modules *.mod built-in.a
 
+CHECK_TARGETS := $(filter-out %.ko, $(CHECK_TARGETS))
+
 MODULE_SOURCES := $(patsubst %.ko,%.c,$(filter %.ko, $(MAKE_TARGETS)))
 
 # Ignoring the exit status of commands is done to be forward compatible with
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
diff --git a/include/mk/sparse.mk b/include/mk/sparse.mk
new file mode 100644
index 000000000..66711d107
--- /dev/null
+++ b/include/mk/sparse.mk
@@ -0,0 +1,9 @@
+# Rules to make sparse tool(s) for inclusion in lib and testcases Makefiles
+
+SPARSE_DIR:= $(abs_top_builddir)/tools/sparse
+
+$(SPARSE_DIR)/main: $(SPARSE_DIR)
+	$(MAKE) -C "$^" all
+
+$(SPARSE_DIR): %:
+	mkdir -p "$@"
diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
index 1c81773d0..444020f16 100644
--- a/include/mk/testcases.mk
+++ b/include/mk/testcases.mk
@@ -22,6 +22,7 @@
 
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/functions.mk
+include $(top_srcdir)/include/mk/sparse.mk
 
 APICMDS_DIR	:= $(abs_top_builddir)/tools/apicmds
 
diff --git a/testcases/open_posix_testsuite/Makefile b/testcases/open_posix_testsuite/Makefile
index 205ecdc00..fea6db14b 100644
--- a/testcases/open_posix_testsuite/Makefile
+++ b/testcases/open_posix_testsuite/Makefile
@@ -104,3 +104,7 @@ $(CRITICAL_MAKEFILE): \
 	$(top_srcdir)/LDFLAGS			\
 	$(top_srcdir)/LDLIBS
 	@$(MAKE) generate-makefiles
+
+.PHONY: check
+check:
+	@echo "Checker not yet supported by Open POSIX testsuite"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
