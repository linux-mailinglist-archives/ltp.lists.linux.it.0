Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25306BD1D8
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AE8B3C20B9
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2C9293C111E
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:29:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1F7D46013C5
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:28:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E9D5AF1D;
 Tue, 24 Sep 2019 18:28:58 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Sep 2019 20:28:41 +0200
Message-Id: <20190924182841.4528-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] make: Add make check target + run.sh
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

run.sh is simple runner which adds

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

this is somehow related to Christian's work on shell tests [1].

run.sh is really simple, I'd like to add more evaluation, but that's
hard as some tests expect to fail (e.g. test01.c).
The approach to add comments which should be parsed cannot be used,
as some tests do output PID (so we'd have to support regexp instead of
simple diff, but that might be a way).

So for both shell and C tests I'd like to check both expected exit value
and the output (or expect output to be none).

Any comments?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1151766/

 Makefile                  |  5 ++++-
 lib/Makefile              |  5 +++++
 lib/newlib_tests/Makefile |  6 +++++-
 lib/newlib_tests/run.sh   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100755 lib/newlib_tests/run.sh

diff --git a/Makefile b/Makefile
index 768ca4606..e06a7c871 100644
--- a/Makefile
+++ b/Makefile
@@ -83,7 +83,10 @@ all: $(addsuffix -all,$(COMMON_TARGETS)) Version
 
 $(MAKE_TARGETS): lib-all libs-all
 
-.PHONY: include-all include-install
+.PHONY: check include-all include-install
+check:
+	$(MAKE) -C lib/newlib_tests $@
+
 include-install: $(top_builddir)/include/config.h include/mk/config.mk include-all
 
 INSTALL_DIR		:= $(DESTDIR)/$(prefix)
diff --git a/lib/Makefile b/lib/Makefile
index e7fc753da..b8210eb8e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -20,6 +20,8 @@
 # Ngie Cooper, July 2009
 #
 
+.PHONY: check
+
 top_srcdir		?= ..
 
 include $(top_srcdir)/include/mk/env_pre.mk
@@ -44,3 +46,6 @@ $(pc_file):
 
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
+
+check:
+	$(MAKE) -C lib/newlib_tests $@
diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index 2fc50160a..c2ede767c 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -1,5 +1,7 @@
 top_srcdir		?= ../..
 
+.PHONY: check
+
 include $(top_srcdir)/include/mk/env_pre.mk
 
 CFLAGS			+= -W -Wall
@@ -16,5 +18,7 @@ ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= test08
 endif
 
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+check: | $(MAKE_TARGETS)
+	./run.sh
diff --git a/lib/newlib_tests/run.sh b/lib/newlib_tests/run.sh
new file mode 100755
index 000000000..566454106
--- /dev/null
+++ b/lib/newlib_tests/run.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+# blacklist directory content which is not a test
+FILTER_OUT_FILES="$(basename $0) *.c config[0-9]* Makefile test_kconfig"
+
+grep_pattern=
+for i in $(echo $FILTER_OUT_FILES); do
+	grep_pattern="-e $i $grep_pattern"
+done
+
+for i in *; do
+	if ! echo $i | grep -q $grep_pattern; then
+		echo "===== $i ====="
+		./$i
+		echo
+	fi
+done
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
