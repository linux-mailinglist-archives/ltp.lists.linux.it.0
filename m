Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B083A2B51
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 14:18:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 210633C7083
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 14:18:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 836903C1D75
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 14:18:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CDB881A017AD
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 14:18:28 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 00E8221966;
 Thu, 10 Jun 2021 12:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623327508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9eIskCX4vqyGckUFepKhFLI8xEfTHovcCyKzxTBql6Y=;
 b=nZslwBMYFsfqZt0XQs+NZ9bcIt1U0zuRvKYh3tNZBSgh6WRcjWycnzT4NXvOAGwu+qDhy0
 402LW9Ec1OMhzd9inE83aL7wJY9ihwFpkq4FxlXTLnrjKFEBEHc02g+vNKRtTWZOV6G7tf
 tGuWdRNr9Thtn2rYRkPQb0HAj8YCXeY=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id C5227A3B8B;
 Thu, 10 Jun 2021 12:18:27 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 10 Jun 2021 13:18:18 +0100
Message-Id: <20210610121819.24626-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] Add Coccinelle helper scripts for reference
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

Check-in a couple of semantic patches used for removing the TEST macro
from the library. Also include a shell script to run them with a
working set of arguments.

These are only intended to help someone develop their own refactoring
or check scripts. Not for running automatically.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V3:
* Make proper shell script to run spatch
* Fix some issues people would likely encounter with semantic patches

V2:
* Simplify the Cocci scripts
* Simplify the patchset and combine it with the separate CGroups patch
* Testing & sign-off

 .../coccinelle/libltp-test-macro-vars.cocci   |  19 ++++
 scripts/coccinelle/libltp-test-macro.cocci    | 107 ++++++++++++++++++
 scripts/coccinelle/run-spatch.sh              | 106 +++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 scripts/coccinelle/libltp-test-macro-vars.cocci
 create mode 100644 scripts/coccinelle/libltp-test-macro.cocci
 create mode 100755 scripts/coccinelle/run-spatch.sh

diff --git a/scripts/coccinelle/libltp-test-macro-vars.cocci b/scripts/coccinelle/libltp-test-macro-vars.cocci
new file mode 100644
index 000000000..ed5459a48
--- /dev/null
+++ b/scripts/coccinelle/libltp-test-macro-vars.cocci
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+// The TEST macro should not be used in the library because it sets
+// TST_RET and TST_ERR which are global variables. The test author
+// only expects these to be changed if *they* call TEST directly.
+
+// Find all positions where TEST's variables are used
+@ find_use exists @
+expression E;
+@@
+
+(
+* TST_ERR
+|
+* TST_RET
+|
+* TTERRNO | E
+)
diff --git a/scripts/coccinelle/libltp-test-macro.cocci b/scripts/coccinelle/libltp-test-macro.cocci
new file mode 100644
index 000000000..7563d23aa
--- /dev/null
+++ b/scripts/coccinelle/libltp-test-macro.cocci
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+// The TEST macro should not be used in the library because it sets
+// TST_RET and TST_ERR which are global variables. The test author
+// only expects these to be changed if *they* call TEST directly.
+
+// Set with -D fix
+virtual fix
+
+// Find all positions where TEST is _used_.
+@ depends on !fix exists @
+@@
+
+* TEST(...);
+
+// Below are rules which will create a patch to replace TEST usage
+// It assumes we can use the ret var without conflicts
+
+// Fix all references to the variables TEST modifies when they occur in a
+// function where TEST was used.
+@ depends on fix exists @
+@@
+
+ TEST(...)
+
+ ...
+
+(
+- TST_RET
++ ret
+|
+- TST_ERR
++ errno
+|
+- TTERRNO
++ TERRNO
+)
+
+// Replace TEST in all functions where it occurs only at the start. It
+// is slightly complicated by adding a newline if a statement appears
+// on the line after TEST(). It is not clear to me what the rules are
+// for matching whitespace as it has no semantic meaning, but this
+// appears to work.
+@ depends on fix @
+identifier fn;
+expression tested_expr;
+statement st;
+@@
+
+  fn (...)
+  {
+- 	TEST(tested_expr);
++	const long ret = tested_expr;
+(
++
+	st
+|
+
+)
+	... when != TEST(...)
+  }
+
+// Replace TEST in all functions where it occurs at the start
+// Functions where it *only* occurs at the start were handled above
+@ depends on fix @
+identifier fn;
+expression tested_expr;
+statement st;
+@@
+
+  fn (...)
+  {
+- 	TEST(tested_expr);
++	long ret = tested_expr;
+(
++
+	st
+|
+
+)
+	...
+  }
+
+// Add ret var at the start of a function where TEST occurs and there
+// is not already a ret declaration
+@ depends on fix exists @
+identifier fn;
+@@
+
+  fn (...)
+  {
++	long ret;
+	... when != long ret;
+
+	TEST(...)
+	...
+  }
+
+// Replace any remaining occurrences of TEST
+@ depends on fix @
+expression tested_expr;
+@@
+
+- 	TEST(tested_expr);
++	ret = tested_expr;
+
diff --git a/scripts/coccinelle/run-spatch.sh b/scripts/coccinelle/run-spatch.sh
new file mode 100755
index 000000000..e8e6f47d8
--- /dev/null
+++ b/scripts/coccinelle/run-spatch.sh
@@ -0,0 +1,106 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+# Helper for running spatch Coccinelle scripts on the LTP source tree
+
+if [ ! -d lib ] || [ ! -d scripts/coccinelle ]; then
+    echo "$0: Can't find lib or scripts directories. Run me from top src dir"
+    exit 1
+fi
+
+do_fix=no
+
+# Run a script on the lib dir
+libltp_spatch() {
+    echo libltp_spatch $*
+
+    if [ $do_fix = yes ]; then
+	spatch --dir lib \
+	       --ignore lib/parse_opts.c \
+	       --ignore lib/newlib_tests \
+	       --ignore lib/tests \
+	       --use-gitgrep \
+	       --in-place \
+	       -D fix \
+	       --include-headers \
+	       $*
+    else
+	spatch --dir lib \
+	       --ignore lib/parse_opts.c \
+	       --ignore lib/newlib_tests \
+	       --ignore lib/tests \
+	       --use-gitgrep \
+	       --include-headers \
+	       $*
+    fi
+}
+
+tests_spatch() {
+        echo tests_spatch $*
+
+        if [ $do_fix = yes ]; then
+	    spatch --dir testcases \
+		   --use-gitgrep \
+		   --in-place \
+		   -D fix \
+		   --include-headers \
+		   $*
+	else
+	    spatch --dir testcases \
+		   --use-gitgrep \
+		   --include-headers \
+		   $*
+	fi
+}
+
+usage()
+{
+    cat <<EOF
+Usage:
+$0 [ -f ] <patch basename> [ <patch basename> [...] ]
+$0 -h
+
+Options:
+-f	Apply the semantic patch in-place to fix the code
+-h	You are reading it
+
+If run without -f then the semantic patch will only print locations
+where it matches or show a diff.
+
+EOF
+}
+
+while getopts "fh" opt; do
+    case $opt in
+	f) do_fix=yes;;
+	h|?) usage; exit $([ $opt = h ]);;
+    esac
+done
+
+shift $(($OPTIND - 1))
+
+if [ $# -eq 0 ]; then
+    echo -e "Missing semantic patch name \n"
+    usage; exit 1
+fi
+
+if [ $do_fix = yes ] && [ -n "$(git ls-files -m -d)" ]; then
+    echo "At least stage your current changes!"
+    exit 1
+fi
+
+for spatch_file in $*; do
+    case $spatch_file in
+	libltp-test-macro)
+	    libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro.cocci;;
+	libltp-test-macro-vars)
+	    libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
+			  --ignore lib/tst_test.c;;
+	*)
+	    tests_spatch --sp-file scripts/coccinelle/$spatch_file.cocci;;
+    esac
+done
+
+
+
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
