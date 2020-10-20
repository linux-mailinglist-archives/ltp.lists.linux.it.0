Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B32938E8
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 12:09:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D481E3C28EC
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 12:09:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C66E43C31A9
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 12:08:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CFBD41A0092F
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 12:08:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CB07B8FE;
 Tue, 20 Oct 2020 10:08:45 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Oct 2020 12:09:10 +0200
Message-Id: <20201020100910.10828-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020100910.10828-1-chrubis@suse.cz>
References: <20201020100910.10828-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] lib/tst_kconfig: Make use of boolean expression
 eval
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

Now each string in the kconfig[] array in tst_test structure is an
boolean expression which is evaluated. All expressions has to be true in
order for the test to continue.

+ Update the docs.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Pengfei Xu <pengfei.xu@intel.com>
---
 doc/test-writing-guidelines.txt |  21 ++--
 lib/newlib_tests/test_kconfig.c |   1 +
 lib/tst_kconfig.c               | 186 ++++++++++++++++++++++++--------
 3 files changed, 154 insertions(+), 54 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 1a51ef7c7..3c2ab7166 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1643,21 +1643,26 @@ on the system, disabled syscalls can be detected by checking for 'ENOSYS'
 errno etc.
 
 However in rare cases core kernel features couldn't be detected based on the
-kernel userspace API and we have to resort to kernel .config parsing.
+kernel userspace API and we have to resort to parse the kernel .config.
 
-For this cases the test should set the 'NULL' terminated '.needs_kconfigs' array
-of kernel config options required for the test. The config option can be
-specified either as plain "CONFIG_FOO" in which case it's sufficient for the
-test continue if it's set to any value (typically =y or =m). Or with a value
-as "CONFIG_FOO=bar" in which case the value has to match as well. The test is
-aborted with 'TCONF' if any of the required options were not set.
+For this cases the test should set the 'NULL' terminated '.needs_kconfigs'
+array of boolean expressions with constraints on the kconfig variables. The
+boolean expression consits of variables, two binary operations '&' and '|',
+negation '!' and correct sequence of parentesis '()'. Variables are expected
+to be in a form of "CONFIG_FOO[=bar]".
+
+The test will continue to run if all expressions are evaluated to 'True'.
+Missing variable is mapped to 'False' as well as variable with different than
+specified value, e.g. 'CONFIG_FOO=bar' will evaluate to 'False' if the value
+is anything else but 'bar'. If config variable is specified as plain
+'CONFIG_FOO' it's evaluated to true it's set to any value (typically =y or =m).
 
 [source,c]
 -------------------------------------------------------------------------------
 #include "tst_test.h"
 
 static const char *kconfigs[] = {
-	"CONFIG_X86_INTEL_UMIP",
+	"CONFIG_X86_INTEL_UMIP | CONFIG_X86_UMIP",
 	NULL
 };
 
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfig.c
index d9c662fc5..183d55611 100644
--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -14,6 +14,7 @@ static const char *kconfigs[] = {
 	"CONFIG_MMU",
 	"CONFIG_EXT4_FS=m",
 	"CONFIG_PGTABLE_LEVELS=4",
+	"CONFIG_MMU & CONFIG_EXT4_FS=m",
 	NULL
 };
 
diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index f80925cc9..cd99a3034 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -12,6 +12,7 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_kconfig.h"
+#include "tst_bool_expr.h"
 
 static const char *kconfig_path(char *path_buf, size_t path_buf_len)
 {
@@ -184,86 +185,179 @@ static size_t array_len(const char *const kconfigs[])
 	return i;
 }
 
-static int compare_res(struct tst_kconfig_var *var, const char *kconfig,
-                       char choice, const char *val)
+static inline unsigned int get_len(const char* kconfig)
 {
-	if (var->choice != choice) {
-		tst_res(TINFO, "Needs kernel %s, have %c", kconfig, var->choice);
-		return 1;
-	}
+	char *sep = index(kconfig, '=');
 
-	if (choice != 'v')
-		return 0;
+	if (!sep)
+		return strlen(kconfig);
 
-	if (strcmp(var->val, val)) {
-		tst_res(TINFO, "Needs kernel %s, have %s", kconfig, var->val);
-		return 1;
+	return sep - kconfig;
+}
+
+static inline unsigned int get_var_cnt(struct tst_expr *exprs[],
+                                       unsigned int expr_cnt)
+{
+	unsigned int i;
+	struct tst_expr *j;
+	unsigned int cnt = 0;
+
+	for (i = 0; i < expr_cnt; i++) {
+		for (j = exprs[i]; j; j = j->next) {
+			if (j->op == TST_OP_VAR)
+				cnt++;
+		}
 	}
 
-	return 0;
+	return cnt;
 }
 
-static inline unsigned int get_len(const char* kconfig)
+static struct tst_kconfig_var *find_var(struct tst_kconfig_var vars[],
+                                        unsigned int var_cnt,
+                                        const char *var)
 {
-	char *sep = index(kconfig, '=');
+	unsigned int i;
 
-	if (!sep)
-		return strlen(kconfig);
+	for (i = 0; i < var_cnt; i++) {
+		if (!strcmp(vars[i].id, var))
+			return &vars[i];
+	}
 
-	return sep - kconfig;
+	return NULL;
 }
 
-void tst_kconfig_check(const char *const kconfigs[])
+/*
+ * Fill in the kconfig variables array from the expressions. Also makes sure
+ * that each variable is copied to the array exaclty once.
+ */
+static inline unsigned int get_vars(struct tst_expr *exprs[],
+                                    unsigned int expr_cnt,
+                                    struct tst_kconfig_var vars[])
 {
-	size_t vars_cnt = array_len(kconfigs);
-	struct tst_kconfig_var vars[vars_cnt];
 	unsigned int i;
-	int abort_test = 0;
+	struct tst_expr *j;
+	unsigned int cnt = 0;
+
+	for (i = 0; i < expr_cnt; i++) {
+		for (j = exprs[i]; j; j = j->next) {
+			struct tst_kconfig_var *var;
 
-	memset(vars, 0, sizeof(*vars) * vars_cnt);
+			if (j->op != TST_OP_VAR)
+				continue;
 
-	for (i = 0; i < vars_cnt; i++) {
-		vars[i].id_len = get_len(kconfigs[i]);
+			vars[cnt].id_len = get_len(j->val);
 
-		if (vars[i].id_len >= sizeof(vars[i].id))
-			tst_brk(TBROK, "kconfig var id too long!");
+			if (vars[cnt].id_len >= sizeof(vars[cnt].id))
+				tst_brk(TBROK, "kconfig var id too long!");
 
-		strncpy(vars[i].id, kconfigs[i], vars[i].id_len);
+			strncpy(vars[cnt].id, j->val, vars[cnt].id_len);
+
+			var = find_var(vars, cnt, vars[cnt].id);
+
+			if (var)
+				j->priv = var;
+			else
+				j->priv = &vars[cnt++];
+		}
 	}
 
-	tst_kconfig_read(vars, vars_cnt);
+	return cnt;
+}
+
+static int map(struct tst_expr *expr)
+{
+	struct tst_kconfig_var *var = expr->priv;
 
-	for (i = 0; i < vars_cnt; i++) {
-		if (vars[i].choice == 0) {
-			tst_res(TINFO, "Missing kernel %s", kconfigs[i]);
-			abort_test = 1;
+	if (var->choice == 0)
+		return 0;
+
+	const char *val = strchr(expr->val, '=');
+
+	/* CONFIG_FOO evaluates to true if y or m */
+	if (!val)
+		return var->choice == 'y' || var->choice == 'm';
+
+	char choice = 'v';
+	val++;
+
+	if (!strcmp(val, "n"))
+		choice = 'n';
+
+	if (!strcmp(val, "y"))
+		choice = 'y';
+
+	if (!strcmp(val, "m"))
+		choice = 'm';
+
+	if (choice != 'v')
+		return var->choice == choice;
+
+	return !strcmp(val, var->val);
+}
+
+static void dump_vars(struct tst_expr *expr)
+{
+	struct tst_expr *i;
+	struct tst_kconfig_var *var;
+
+	tst_res(TINFO, "Variables:");
+
+	for (i = expr; i; i = i->next) {
+		if (i->op != TST_OP_VAR)
+			continue;
+
+		var = i->priv;
+
+		if (!var->choice) {
+			tst_res(TINFO, "%s Undefined", var->id);
 			continue;
 		}
 
-		if (vars[i].choice == 'n') {
-			tst_res(TINFO, "Kernel %s is not set", kconfigs[i]);
-			abort_test = 1;
+		if (var->choice == 'v') {
+			tst_res(TINFO, "%s = %s", var->id, var->val);
 			continue;
 		}
 
-		const char *val = strchr(kconfigs[i], '=');
+		tst_res(TINFO, "%s = %c", var->id, var->choice);
+	}
+}
 
-		if (val) {
-			char choice = 'v';
-			val++;
+void tst_kconfig_check(const char *const kconfigs[])
+{
+	size_t expr_cnt = array_len(kconfigs);
+	struct tst_expr *exprs[expr_cnt];
+	unsigned int i, var_cnt;
+	int abort_test = 0;
+
+	for (i = 0; i < expr_cnt; i++) {
+		exprs[i] = tst_bool_expr_parse(kconfigs[i]);
+
+		if (!exprs[i])
+			tst_brk(TBROK, "Invalid kconfig expression!");
+	}
 
-			if (!strcmp(val, "y"))
-				choice = 'y';
+	var_cnt = get_var_cnt(exprs, expr_cnt);
+	struct tst_kconfig_var vars[var_cnt];
 
-			if (!strcmp(val, "m"))
-				choice = 'm';
+	var_cnt = get_vars(exprs, expr_cnt, vars);
 
-			if (compare_res(&vars[i], kconfigs[i], choice, val))
-				abort_test = 1;
+	tst_kconfig_read(vars, var_cnt);
 
+	for (i = 0; i < expr_cnt; i++) {
+		int val = tst_bool_expr_eval(exprs[i], map);
+
+		if (val != 1) {
+			abort_test = 1;
+			tst_res(TINFO, "Expression '%s' not satisfied!", kconfigs[i]);
+			dump_vars(exprs[i]);
 		}
 
-		free(vars[i].val);
+		tst_bool_expr_free(exprs[i]);
+	}
+
+	for (i = 0; i < var_cnt; i++) {
+		if (vars[i].choice == 'v')
+			free(vars[i].val);
 	}
 
 	if (abort_test)
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
