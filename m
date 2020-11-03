Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76A2A4FC6
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5D3E3C5465
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AE90D3C5464
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 532492000DE
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84645AEC4;
 Tue,  3 Nov 2020 19:13:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:17 +0100
Message-Id: <20201103191327.11081-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 01/11] make: Support compiling native build tools
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add HOST_MAKE_TARGETS make target and HOSTCC,
HOST_{CFLAGS,LDFLAGS} make variables.

Needed for cross-compilation.

NOTE: detect cross compilation with comparing $(build) and $(host)
instead of using $cross_compiling configure variable, which would
require move the detection into m4 macro.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 configure.ac                       |  2 ++
 include/mk/config.mk.in            | 21 +++++++++++++++++++++
 include/mk/env_post.mk             |  3 +--
 include/mk/generic_leaf_target.inc |  6 ++++++
 include/mk/rules.mk                |  8 ++++++++
 5 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 03e4e09c9..05672f8f6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -13,6 +13,8 @@ AC_CONFIG_FILES([ \
     execltp \
 ])
 
+AC_ARG_VAR(HOSTCC, [The C compiler on the host])
+
 AM_MAINTAINER_MODE([enable])
 
 AC_CANONICAL_HOST
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 427608a17..8f73a6a34 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -31,6 +31,19 @@ RANLIB			:= @RANLIB@
 STRIP			:= @STRIP@
 YACC			:= @YACC@
 
+HOSTCC  = @HOSTCC@
+build := @build@
+host := @host@
+ifeq ($(strip $(HOSTCC)),)
+# native build, respect CC
+ifeq ($(build),$(host))
+HOSTCC := $(CC)
+else
+# cross compilation
+HOSTCC := cc
+endif
+endif
+
 AIO_LIBS		:= @AIO_LIBS@
 CAP_LIBS		:= @CAP_LIBS@
 ACL_LIBS		:= @ACL_LIBS@
@@ -70,6 +83,14 @@ WCFLAGS			?= -Wall -W @GCC_WARN_OLDSTYLE@
 LDFLAGS			+= $(WLDFLAGS)
 CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
 
+ifeq ($(strip $(HOST_CFLAGS)),)
+HOST_CFLAGS := $(CFLAGS)
+endif
+
+ifeq ($(strip $(HOST_LDFLAGS)),)
+HOST_LDFLAGS := $(LDFLAGS)
+endif
+
 LINUX_VERSION		:= @LINUX_VERSION@
 LINUX_DIR		:= @LINUX_DIR@
 LINUX_VERSION_MAJOR	:= @LINUX_VERSION_MAJOR@
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 44a333198..d52ad9f0b 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -48,11 +48,10 @@ LDFLAGS				+= -L$(top_builddir)/lib/android_librt
 endif
 
 MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
-
 MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
 
 # with only *.dwo, .[0-9]+.dwo can not be cleaned
-CLEAN_TARGETS			+= $(MAKE_TARGETS) *.o *.pyc .cache.mk *.dwo .*.dwo
+CLEAN_TARGETS			+= $(MAKE_TARGETS) $(HOST_MAKE_TARGETS) *.o *.pyc .cache.mk *.dwo .*.dwo
 
 # Majority of the files end up in testcases/bin...
 INSTALL_DIR			?= testcases/bin
diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index dd54d05e9..e6fa107d1 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -57,6 +57,8 @@
 #				     rope to hang one's self in the event of
 #				     unwanted behavior.
 #
+# $(HOST_MAKE_TARGETS)	: Host tools which use $HOSTCC.
+#
 # $(CLEAN_TARGETS)		: What targets should be cleaned (must be
 #				  real files). This will automatically append
 #				  adds the .o suffix to all files referenced
@@ -92,6 +94,10 @@
 
 .PHONY: all clean install
 
+ifneq ($(strip $(MAKE_TARGETS)),)
+$(MAKE_TARGETS) += $(HOST_MAKE_TARGETS)
+endif
+
 $(MAKE_TARGETS): | $(MAKE_DEPS)
 
 all: $(MAKE_TARGETS)
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
index 6a22e43af..c8f4bbbbe 100644
--- a/include/mk/rules.mk
+++ b/include/mk/rules.mk
@@ -22,6 +22,14 @@ else
 	@echo LD $(target_rel_dir)$@
 endif
 
+$(HOST_MAKE_TARGETS): %: %.c
+ifdef VERBOSE
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) $< $(HOST_LDLIBS) -o $@
+else
+	@$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) $< $(HOST_LDLIBS) -o $@
+	@echo HOSTCC $(target_rel_dir)$@
+endif
+
 %: %.c
 ifdef VERBOSE
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ $(LTPLDLIBS) $(LDLIBS) -o $@
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
