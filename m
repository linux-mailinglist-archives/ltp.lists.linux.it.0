Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D839DE6F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:14:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 105B73C7C25
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:14:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 913DC3C0B9A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:14:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 06ABC1000AE4
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:14:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7AD121FDA1;
 Mon,  7 Jun 2021 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623075275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VJYpmZN3aguK2uXEzxsuPbUMgNwqx0bBigjc7/3UvvE=;
 b=UikPR9JLIN4hfUypaC0XED8CQuz4EsaQQF5JFk+u+P8cCt9UzIY/oFaVGMap/JOHAVLRxh
 zmci2Kzbo8M9u8dfQIS2sfhbefpJa8gpy9kBrxKaowFyf20RtBH81uIpazdDvtkyVG6LtG
 k9HT/YduYuHxMlzpV+BiGL1dgrPPLe8=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 4FF1FA3B84;
 Mon,  7 Jun 2021 14:14:35 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon,  7 Jun 2021 15:14:20 +0100
Message-Id: <20210607141421.15072-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add Coccinelle helper scripts for reference
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

Check-in a couple of scripts used for removing the TEST macro from the
library. Also a shell script to show how to run them. These are only
intended to help someone develop their own refactoring scripts. Not
for running automatically.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V2:
* Simplify the Cocci scripts
* Simplify the patchset and combine it with the separate CGroups patch
* Testing & sign-off

Feel free to drop the Coccinelle scripts. However I do think they
should be included for people's information. I simplified them to
remove the Python code and make them easier to understand.

 .../coccinelle/libltp-test-macro-vars.cocci   |  19 ++++
 scripts/coccinelle/libltp-test-macro.cocci    | 104 ++++++++++++++++++
 scripts/coccinelle/run-spatch.sh              |  39 +++++++
 3 files changed, 162 insertions(+)
 create mode 100644 scripts/coccinelle/libltp-test-macro-vars.cocci
 create mode 100644 scripts/coccinelle/libltp-test-macro.cocci
 create mode 100755 scripts/coccinelle/run-spatch.sh

diff --git a/scripts/coccinelle/libltp-test-macro-vars.cocci b/scripts/coccinelle/libltp-test-macro-vars.cocci
new file mode 100644
index 000000000..c12bf3891
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
+identifier tst_var =~ "TST_(ERR|RET)";
+position p;
+expression E;
+@@
+
+(
+* tst_var@p
+|
+* TTERRNO@p | E
+)
diff --git a/scripts/coccinelle/libltp-test-macro.cocci b/scripts/coccinelle/libltp-test-macro.cocci
new file mode 100644
index 000000000..8855aaeb7
--- /dev/null
+++ b/scripts/coccinelle/libltp-test-macro.cocci
@@ -0,0 +1,104 @@
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
+@ find_use exists @
+position p;
+@@
+
+* TEST@p(...);
+
+// Below are rules which will create a patch to replace TEST usage
+// It assumes we can use the ret var without conflicts
+
+// Fix all references to the variables TEST modifies when they occur in a
+// function where TEST was used.
+@ depends on fix && find_use @
+@@
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
+// Replace any remaining occurances of TEST
+@ depends on fix @
+expression tested_expr;
+@@
+
+- 	TEST(tested_expr);
++	ret = tested_expr;
+
diff --git a/scripts/coccinelle/run-spatch.sh b/scripts/coccinelle/run-spatch.sh
new file mode 100755
index 000000000..7bb781bc1
--- /dev/null
+++ b/scripts/coccinelle/run-spatch.sh
@@ -0,0 +1,39 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+# Helper for running spatch Coccinelle scripts on the LTP source tree
+
+if [[ ! -d lib || ! -d scripts/coccinelle ]]; then
+    echo "$0: Can't find lib or scripts directories. Run me from top src dir"
+    exit 1
+fi
+
+# Run a script on the lib dir
+libltp_spatch_report() {
+    spatch --dir lib \
+	   --ignore lib/parse_opts.c \
+	   --ignore lib/newlib_tests \
+	   --ignore lib/tests \
+	   --use-gitgrep \
+	   -D report \
+	   --include-headers \
+	   $*
+}
+
+libltp_spatch_fix() {
+    spatch --dir lib \
+	   --ignore lib/parse_opts.c \
+	   --ignore lib/newlib_tests \
+	   --ignore lib/tests \
+	   --use-gitgrep \
+	   --in-place \
+	   -D fix \
+	   --include-headers \
+	   $*
+}
+
+echo You should uncomment one of the scripts below!
+#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro.cocci
+#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
+#		     --ignore lib/tst_test.c
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
