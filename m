Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363C2B0912
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:57:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC3B63C5FF7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 16:57:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 49BB33C4FEF
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:57:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AE80A14013A4
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 16:57:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFF7FAF82;
 Thu, 12 Nov 2020 15:57:01 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Nov 2020 16:47:48 +0100
Message-Id: <20201112154748.17857-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112154748.17857-1-chrubis@suse.cz>
References: <20201112154748.17857-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] lib/tst_kconfig: Validate variables
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

Add variable validation so that we catch typos even before we attempt to
evaluate the expressions.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/.gitignore       |   1 +
 lib/newlib_tests/test_kconfig02.c |  29 +++++++++
 lib/tst_kconfig.c                 | 102 ++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 lib/newlib_tests/test_kconfig02.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 89de61cf7..ac1d19be0 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -32,6 +32,7 @@ test_exec
 test_exec_child
 test_kconfig
 test_kconfig01
+test_kconfig02
 variant
 test_guarded_buf
 tst_bool_expr
diff --git a/lib/newlib_tests/test_kconfig02.c b/lib/newlib_tests/test_kconfig02.c
new file mode 100644
index 000000000..176929222
--- /dev/null
+++ b/lib/newlib_tests/test_kconfig02.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ *
+ * Invalid boolean expression test.
+ */
+
+#include "tst_test.h"
+
+static void do_test(void)
+{
+	tst_res(TPASS, "Test passed!");
+}
+
+static const char *kconfigs[] = {
+	"\"CONFIG_FOO=val\"",
+	"CONFIG_a=1",
+	"CONFIG_FOO=",
+	"CONFIG_DEFAULT_HOSTNAME=\"(none",
+	"CONFIG_DEFAULT_HOSTNAME=\"(none)\"a",
+	"CONFIG_BROKEN=a\" | CONFIG_FOO",
+	"CONFIG_BROKEN=a=",
+	NULL
+};
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.needs_kconfigs = kconfigs,
+};
diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 468f03a86..72830703c 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -224,6 +224,105 @@ static inline unsigned int get_len(const char* kconfig, unsigned int len)
 	return sep - kconfig;
 }
 
+static void print_err(FILE *f, const struct tst_expr_tok *var,
+                      size_t spaces, const char *err)
+{
+	size_t i;
+
+	for (i = 0; i < var->tok_len; i++)
+		fputc(var->tok[i], f);
+
+	fputc('\n', f);
+
+	while (spaces--)
+		fputc(' ', f);
+
+	fprintf(f, "^\n%s\n\n", err);
+}
+
+static int validate_var(const struct tst_expr_tok *var)
+{
+	size_t i = 7;
+
+	if (var->tok_len < 7 || strncmp(var->tok, "CONFIG_", 7)) {
+		print_err(stderr, var, 0, "Expected CONFIG_ prefix");
+		return 1;
+	}
+
+	while (var->tok[i]) {
+		char c;
+
+		if (i >= var->tok_len)
+			return 0;
+
+		c = var->tok[i];
+
+		if ((c >= 'A' && c <= 'Z') || c == '_') {
+			i++;
+			continue;
+		}
+
+		if (c == '=') {
+			i++;
+			break;
+		}
+
+		print_err(stderr, var, i, "Unexpected character in variable name");
+		return 1;
+	}
+
+	if (i >= var->tok_len) {
+		print_err(stderr, var, i, "Missing value");
+		return 1;
+	}
+
+	if (var->tok[i] == '"') {
+		do {
+			i++;
+		} while (i < var->tok_len && var->tok[i] != '"');
+
+		if (i < var->tok_len) {
+			print_err(stderr, var, i, "Garbage after a string");
+			return 1;
+		}
+
+		if (var->tok[i] != '"') {
+			print_err(stderr, var, i, "Untermianted string");
+			return 1;
+		}
+
+		return 0;
+	}
+
+	do {
+		i++;
+	} while (i < var->tok_len && isalnum(var->tok[i]));
+
+	if (i < var->tok_len) {
+		print_err(stderr, var, i, "Invalid character in variable value");
+		return 1;
+	}
+
+	return 0;
+}
+
+static int validate_vars(struct tst_expr *const exprs[], unsigned int expr_cnt)
+{
+	unsigned int i;
+	const struct tst_expr_tok *j;
+	unsigned int ret = 0;
+
+	for (i = 0; i < expr_cnt; i++) {
+		for (j = exprs[i]->rpn; j; j = j->next) {
+			if (j->op == TST_OP_VAR)
+				ret |= validate_var(j);
+		}
+	}
+
+	return ret;
+}
+
+
 static inline unsigned int get_var_cnt(struct tst_expr *const exprs[],
                                        unsigned int expr_cnt)
 {
@@ -372,6 +471,9 @@ void tst_kconfig_check(const char *const kconfigs[])
 			tst_brk(TBROK, "Invalid kconfig expression!");
 	}
 
+	if (validate_vars(exprs, expr_cnt))
+		tst_brk(TBROK, "Invalid kconfig variables!");
+
 	var_cnt = get_var_cnt(exprs, expr_cnt);
 	struct tst_kconfig_var vars[var_cnt];
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
