Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E43AD296
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 21:13:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 004683C2DEC
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 21:13:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 941AF3C2435
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 21:13:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EB6C51A008B0
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 21:13:01 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E93A1FD40;
 Fri, 18 Jun 2021 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624043581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wWqOL6P/f+S94zwD3nV9o3OH4T8EWfaufq+haUEzlbA=;
 b=NkUELQYHjjqZ+yQl3d3f0QZhU0QsL2RF0IPnRL3zwWUXxGr6/V7A6MYt3gwBKQujTI+upG
 vPX2Cact3Y5OVp2mTVsXmrt4ISBov5YV+G3UaMX020ymGgyTcrwCX6457aWHGaXdF8o1iC
 OOZN5jrV+YLzbfkFK0c7sR30/MuKe2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624043581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wWqOL6P/f+S94zwD3nV9o3OH4T8EWfaufq+haUEzlbA=;
 b=NSdqToZt0j1BF1L4aZx8Na1HpKvyNkJ1u7N+7SwK6+mJXL3XPIF3daXeZxxOuuW7ub6JmH
 x+XjsNkjie3El0AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E585118DD;
 Fri, 18 Jun 2021 19:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624043581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wWqOL6P/f+S94zwD3nV9o3OH4T8EWfaufq+haUEzlbA=;
 b=NkUELQYHjjqZ+yQl3d3f0QZhU0QsL2RF0IPnRL3zwWUXxGr6/V7A6MYt3gwBKQujTI+upG
 vPX2Cact3Y5OVp2mTVsXmrt4ISBov5YV+G3UaMX020ymGgyTcrwCX6457aWHGaXdF8o1iC
 OOZN5jrV+YLzbfkFK0c7sR30/MuKe2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624043581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wWqOL6P/f+S94zwD3nV9o3OH4T8EWfaufq+haUEzlbA=;
 b=NSdqToZt0j1BF1L4aZx8Na1HpKvyNkJ1u7N+7SwK6+mJXL3XPIF3daXeZxxOuuW7ub6JmH
 x+XjsNkjie3El0AA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id NFu1GzzwzGBURQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 18 Jun 2021 19:13:00 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 18 Jun 2021 21:12:52 +0200
Message-Id: <20210618191252.12403-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 1/1] make: Add make test{, -c, -c-run,
 -shell-run} targets
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For testing C and shell API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

another attempt for make test target.

In a long term, I'd like to wrap the execution with some script, as I
suppose there will be some metadata in test, allowing to run tests which
don't TPASS or TBROK (we have quite a lot of them). Then the summary
would be even more useful.

FIXME: broken in lib/, it runs all test twice.

changes v1->v2:
Not sure if it's a good approach to process each test separately,
there is no loop as Cyril suggested in [1], thus there is no summary
what happen.

I previously had in similar loop in include/mk/generic_leaf_target.inc:

test-c-run: $(TEST_TARGETS)
	@set -e; echo; echo "===== Test C API ====="; \
	for i in $(TEST_TARGETS); do \
	    echo; echo "* $$i"; \
	    echo "PATH $(top_srcdir)/testcases/lib:$$PATH"; \
	    PATH="$(top_srcdir)/testcases/lib:$$PATH" ./$$i || [ $$? -eq 32 ]; \
	done; echo; \
	echo "All C API tests passed or TCONF"

test-shell-run:
	@set -e; echo; echo "===== Test shell API ====="; \
	for i in $(TEST_SHELL_TARGETS); do \
	    echo; echo "* $$i"; \
	    PATH="$(abs_top_srcdir)/testcases/lib:$(abs_top_builddir)/testcases/lib:$$PATH" $(abs_srcdir)/$$i || [ $$? -eq 32 ]; \
	done; echo; \
	echo "All shell API tests passed or TCONF"

but that was problematic in lib (which uses generic_leaf_target.inc).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210603183827.24339-2-pvorel@suse.cz/#2695533

 Makefile                            | 23 ++++++++++++++++++++++-
 include/mk/generic_leaf_target.inc  | 25 ++++++++++++++++++++++---
 include/mk/generic_trunk_target.inc |  2 +-
 lib/newlib_tests/Makefile           | 13 +++++++++++++
 4 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 56812d77b..40cd4b1cb 100644
--- a/Makefile
+++ b/Makefile
@@ -75,10 +75,14 @@ endif
 INSTALL_TARGETS		+= $(COMMON_TARGETS)
 CLEAN_TARGETS		+= $(COMMON_TARGETS) lib libs
 BOOTSTRAP_TARGETS	:= $(sort $(COMMON_TARGETS) $(CLEAN_TARGETS) $(INSTALL_TARGETS))
+TEST_TARGETS		:= lib
+TEST_SHELL_TARGETS	:= lib
 
 CLEAN_TARGETS		:= $(addsuffix -clean,$(CLEAN_TARGETS))
 INSTALL_TARGETS		:= $(addsuffix -install,$(INSTALL_TARGETS))
 MAKE_TARGETS		:= $(addsuffix -all,$(filter-out lib,$(COMMON_TARGETS)))
+TEST_TARGETS		:= $(addsuffix -test-c-run,$(TEST_TARGETS))
+TEST_SHELL_TARGETS	:= $(addsuffix -test-shell-run,$(TEST_SHELL_TARGETS))
 
 # There's no reason why we should run `all' twice. Otherwise we're just wasting
 # 3+ mins of useful CPU cycles on a modern machine, and even more time on an
@@ -189,8 +193,25 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
 
 $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
 
+## Test library API
+.PHONY: test test-c test-c-run test-shell-run
+
+$(TEST_TARGETS): lib-all
+	$(MAKE) -C "$(subst -test-c-run,,$@)" \
+		-f "$(abs_top_srcdir)/$(subst -test-c-run,,$@)/Makefile" test-c-run
+
+$(TEST_SHELL_TARGETS): lib-all
+	$(MAKE) -C "$(subst -test-shell-run,,$@)" \
+		-f "$(abs_top_srcdir)/$(subst -test-shell-run,,$@)/Makefile" test-shell-run
+
+test-c-run: $(TEST_TARGETS)
+
+test-shell-run: $(TEST_SHELL_TARGETS)
+
+test: test-c test-c-run test-shell-run
+
 ## Install
-install: $(INSTALL_TARGETS)
+install: lib-all $(INSTALL_TARGETS)
 
 ## Help
 .PHONY: help
diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index 64953f89a..19e238f92 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -63,8 +63,12 @@
 #				  real files or directories). This will automatically append
 #				  adds the .o suffix to all files referenced by
 #				  $(MAKE_TARGETS)) to CLEAN_TARGETS, if MAKE_TARGETS wasn't
-#				  defined (see
-#				  $(MAKE_TARGETS)).
+#				  defined (see $(MAKE_TARGETS)).
+#
+# $(TEST_TARGETS)		: LTP C API tests to be runned with test-c-run.
+#
+# $(TEST_SHELL_TARGETS)		: LTP shell API tests to be runned with test-shell-run.
+#
 # $(INSTALL_MODE)		: What mode should we using when calling
 # 				  install(1)?
 #
@@ -92,7 +96,7 @@
 # INSTALL_DIR			:= $(libdir)
 #
 
-.PHONY: all clean install
+.PHONY: all clean install test test-c test-c-run test-shell-run
 
 ifneq ($(strip $(MAKE_TARGETS)),)
 $(MAKE_TARGETS) += $(HOST_MAKE_TARGETS)
@@ -102,11 +106,26 @@ $(MAKE_TARGETS): | $(MAKE_DEPS)
 
 all: $(MAKE_TARGETS)
 
+TEST_TARGETS_RUN := $(addsuffix -run,$(TEST_TARGETS))
+TEST_SHELL_TARGETS_RUN := $(addsuffix -run,$(TEST_SHELL_TARGETS))
+
+$(TEST_TARGETS_RUN): | $(TEST_TARGETS)
+test-c-run: $(TEST_TARGETS_RUN)
+test-shell-run: $(TEST_SHELL_TARGETS_RUN)
+
+.PHONY: $(TEST_TARGETS_RUN) $(TEST_SHELL_TARGETS_RUN)
+$(TEST_TARGETS_RUN) $(TEST_SHELL_TARGETS_RUN):
+	@set -e; echo; echo "* $(subst -run,,$@)"; \
+	PATH="$(top_srcdir)/testcases/lib:$$PATH" ./$(subst -run,,$@) || [ $$? -eq 32 ]; \
+
+test: test-c-run test-shell-run
+
 clean:: $(CLEAN_DEPS)
 	-$(RM) -f -r $(CLEAN_TARGETS)
 
 $(INSTALL_FILES): | $(INSTALL_DEPS)
 
 install: $(INSTALL_FILES)
+test-c: $(TEST_TARGETS)
 
 # vim: syntax=make
diff --git a/include/mk/generic_trunk_target.inc b/include/mk/generic_trunk_target.inc
index fc59f944f..4427a0f86 100644
--- a/include/mk/generic_trunk_target.inc
+++ b/include/mk/generic_trunk_target.inc
@@ -48,7 +48,7 @@
 
 include $(top_srcdir)/include/mk/functions.mk
 
-RECURSIVE_TARGETS		?= all install
+RECURSIVE_TARGETS		?= all install test test-c test-c-run test-shell-run
 
 $(eval $(get_make_dirs))
 
diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index 30ca6810c..7ac28660d 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -19,5 +19,18 @@ ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= test08
 endif
 
+# C API tests
+# NOTE: only those which exit 0 (TPASS) or 32 (TCONF)
+# TODO: commented out for quicker demonstration
+# TEST_TARGETS += test05 test07 test09 test12 test15 test16 test18
+# TEST_TARGETS += test_exec test_timer tst_bool_expr tst_res_hexd
+# TEST_TARGETS += tst_strstatus tst_fuzzy_sync01 tst_fuzzy_sync02
+TEST_TARGETS += tst_strstatus test05
+
+# shell API tests
+# NOTE: only those which exit 0 (TPASS) or 32 (TCONF)
+TEST_SHELL_TARGETS += shell/tst_check_driver.sh
+# TODO: commented out for quicker demonstration
+# TEST_SHELL_TARGETS += shell/net/*.sh
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
