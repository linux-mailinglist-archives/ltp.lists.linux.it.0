Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADC38E984
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9C703C2E71
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08FDF3C2B88
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 78D6A600A3E
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621867696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P1pCMXKX1dsljlUmrqQTcA8P24g3liWZDXeozvQtIU=;
 b=K6vQ5KSOHMkEk52teJVY5t7jkl6uC2F6UV3w+E6U2sWDksKx5FDzCZKDNfKArAUlTJU8je
 84TsEjp18kL/xinZhKprjMp6A6os+WHFUy+DDzTT14x2YGLz06/DFrmV0n1YYgSn91XaZG
 JDnt7Ey86zuAcmxhtyT5tacWumuPo1w=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09043AC11;
 Mon, 24 May 2021 14:48:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 May 2021 15:47:42 +0100
Message-Id: <20210524144745.10887-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524144745.10887-1-rpalethorpe@suse.com>
References: <20210524144745.10887-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/4] Add scripts to remove TEST in library
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

---
 .../coccinelle/libltp-test-macro-vars.cocci   |  54 +++++++
 scripts/coccinelle/libltp-test-macro.cocci    | 137 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 scripts/coccinelle/libltp-test-macro-vars.cocci
 create mode 100644 scripts/coccinelle/libltp-test-macro.cocci

diff --git a/scripts/coccinelle/libltp-test-macro-vars.cocci b/scripts/coccinelle/libltp-test-macro-vars.cocci
new file mode 100644
index 000000000..679ce80fe
--- /dev/null
+++ b/scripts/coccinelle/libltp-test-macro-vars.cocci
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+// The TEST macro should not be used in the library because it sets
+// TST_RET and TST_ERR which are global variables. The test author
+// only expects these to be changed if *they* call TEST directly.
+
+// Set with -D fix
+virtual fix
+// Set with -D report
+virtual report
+
+// Find all positions where TEST's variables are used
+@ find_use exists @
+identifier tst_var =~ "TST_(ERR|RET)";
+position p;
+expression E;
+@@
+
+(
+ tst_var@p
+|
+ TTERRNO@p | E
+)
+
+@initialize:python depends on report@
+@@
+
+import json
+
+errors = []
+
+@script:python depends on report@
+p << find_use.p;
+@@
+
+msg = {
+    'msg': "TEST macro variable use in library",
+    'file': p[0].file,
+    'line': p[0].line,
+    'col': p[0].column,
+}
+
+errors.append(msg)
+
+@finalize:python depends on report@
+@@
+
+msgs = {
+     'check_script': 'coccinelle/libltp-test-macro-vars.cocci',
+     'errors': errors,
+}
+
+print(json.dumps(msgs, indent=2))
diff --git a/scripts/coccinelle/libltp-test-macro.cocci b/scripts/coccinelle/libltp-test-macro.cocci
new file mode 100644
index 000000000..960b5d325
--- /dev/null
+++ b/scripts/coccinelle/libltp-test-macro.cocci
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+// The TEST macro should not be used in the library because it sets
+// TST_RET and TST_ERR which are global variables. The test author
+// only expects these to be changed if *they* call TEST directly.
+
+// Set with -D fix
+virtual fix
+// Set with -D report
+virtual report
+
+// Find all positions where TEST is _used_.
+@ find_use exists @
+position p;
+@@
+
+ TEST@p(...);
+
+// Print the position of the TEST usage
+@initialize:python depends on report@
+@@
+
+import json
+
+errors = []
+
+@script:python depends on report@
+p << find_use.p;
+@@
+
+msg = {
+    'msg': "TEST macro use in library",
+    'file': p[0].file,
+    'line': p[0].line,
+    'col': p[0].column,
+}
+
+errors.append(msg)
+
+@finalize:python depends on report@
+@@
+
+msgs = {
+     'check_script': 'coccinelle/libltp-test-macro.cocci',
+     'errors': errors,
+}
+
+print(json.dumps(msgs, indent=2))
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
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
