Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2FF2938E4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 12:08:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 694443C56CB
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 12:08:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 438123C26A5
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 12:08:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8B255600555
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 12:08:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29A5BB8F4;
 Tue, 20 Oct 2020 10:08:44 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 20 Oct 2020 12:09:08 +0200
Message-Id: <20201020100910.10828-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020100910.10828-1-chrubis@suse.cz>
References: <20201020100910.10828-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib/tst_kconfig: Rewrite the parser internals
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

This patch changes the parser internals so that the parser results are
not tied to the kconfigs array from the tst_test structure anymore.

This is a first step to a parser that can parse more complex
expressions.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_kconfig.h |  34 ++++----
 lib/tst_kconfig.c     | 184 +++++++++++++++++++-----------------------
 2 files changed, 103 insertions(+), 115 deletions(-)

diff --git a/include/tst_kconfig.h b/include/tst_kconfig.h
index 2d2cfd782..1bb21fea8 100644
--- a/include/tst_kconfig.h
+++ b/include/tst_kconfig.h
@@ -6,27 +6,27 @@
 #ifndef TST_KCONFIG_H__
 #define TST_KCONFIG_H__
 
-struct tst_kconfig_res {
-	char match;
-	char *value;
+struct tst_kconfig_var {
+	char id[64];
+	unsigned int id_len;
+	char choice;
+	char *val;
 };
 
 /**
- * Reads a kernel config and parses it for values defined in kconfigs array.
+ *
+ * Reads a kernel config, parses it and writes results into an array of
+ * tst_kconfig_var structures.
  *
  * The path to the kernel config should be autodetected in most of the cases as
  * the code looks for know locations. It can be explicitely set/overrided with
  * the KCONFIG_PATH environment variable as well.
  *
- * The kcofings array is expected to contain strings in a format "CONFIG_FOO"
- * or "CONFIG_FOO=bar". The result array has to be suitably sized to fit the
- * results.
- *
- * @param kconfigs array of config strings to look for
- * @param results array to store results to
- * @param cnt size of the arrays
+ * The caller has to initialize the tst_kconfig_var structure. The id has to be
+ * filled with config variable name such as 'CONFIG_FOO', the id_len should
+ * hold the id string length and the choice and val has to be zeroed.
  *
- * The match in the tst_kconfig_res structure is set as follows:
+ * After a call to this function each choice be set as follows:
  *
  *  'm' - config option set to m
  *  'y' - config option set to y
@@ -34,11 +34,13 @@ struct tst_kconfig_res {
  *  'n' - config option is not set
  *   0  - config option not found
  *
- * In the case that match is set to 'v' the value points to a newly allocated
- * string that holds the value.
+ * In the case that match is set to 'v' the val pointer points to a newly
+ * allocated string that holds the value.
+ *
+ * @param vars An array of caller initalized tst_kconfig_var structures.
+ * @param vars_len Length of the vars array.
  */
-void tst_kconfig_read(const char *const kconfigs[],
-		      struct tst_kconfig_res results[], size_t cnt);
+void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len);
 
 /**
  * Checks if required kernel configuration options are set in the kernel
diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index d49187b6f..f80925cc9 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -84,15 +84,6 @@ static void close_kconfig(FILE *fp)
 		fclose(fp);
 }
 
-struct match {
-	/* match len, string length up to \0 or = */
-	size_t len;
-	/* if set part of conf string after = */
-	const char *val;
-	/* if set the config option was matched already */
-	int match;
-};
-
 static int is_set(const char *str, const char *val)
 {
 	size_t vlen = strlen(val);
@@ -114,96 +105,70 @@ static int is_set(const char *str, const char *val)
 	}
 }
 
-static inline int match(struct match *match, const char *conf,
-                        struct tst_kconfig_res *result, const char *line)
+static inline int kconfig_parse_line(const char *line,
+                                     struct tst_kconfig_var *vars,
+                                     unsigned int vars_len)
 {
-	if (match->match)
-		return 0;
+	unsigned int i;
 
-	const char *cfg = strstr(line, "CONFIG_");
+	for (i = 0; i < vars_len; i++) {
+		if (!strncmp(vars[i].id, line, vars[i].id_len)) {
+			const char *val = &line[vars[i].id_len];
+
+			switch (val[0]) {
+			case '=':
+				break;
+			case ' ':
+				if (is_set(val, "is not set")) {
+					vars[i].choice = 'n';
+					return 1;
+				}
+				return 1;
+			/* vars[i].id may be prefix to longer config var */
+			default:
+				return 0;
+			}
 
-	if (!cfg)
-		return 0;
+			if (is_set(val, "=y")) {
+				vars[i].choice = 'y';
+				return 1;
+			}
 
-	if (strncmp(cfg, conf, match->len))
-		return 0;
+			if (is_set(val, "=m")) {
+				vars[i].choice = 'm';
+				return 1;
+			}
 
-	const char *val = &cfg[match->len];
+			vars[i].choice = 'v';
+			vars[i].val = strndup(val+1, strlen(val)-2);
 
-	switch (cfg[match->len]) {
-	case '=':
-		break;
-	case ' ':
-		if (is_set(val, "is not set")) {
-			result->match = 'n';
-			goto match;
+			return 1;
 		}
-	/* fall through */
-	default:
-		return 0;
-	}
-
-	if (is_set(val, "=y")) {
-		result->match = 'y';
-		goto match;
 	}
 
-	if (is_set(val, "=m")) {
-		result->match = 'm';
-		goto match;
-	}
-
-	result->match = 'v';
-	result->value = strndup(val+1, strlen(val)-2);
-
-match:
-	match->match = 1;
-	return 1;
+	return 0;
 }
 
-void tst_kconfig_read(const char *const *kconfigs,
-                      struct tst_kconfig_res results[], size_t cnt)
+void tst_kconfig_read(struct tst_kconfig_var vars[], size_t vars_len)
 {
-	struct match matches[cnt];
-	FILE *fp;
-	unsigned int i, j;
-	char buf[1024];
-
-	for (i = 0; i < cnt; i++) {
-		const char *val = strchr(kconfigs[i], '=');
-
-		if (strncmp("CONFIG_", kconfigs[i], 7))
-			tst_brk(TBROK, "Invalid config string '%s'", kconfigs[i]);
+	char line[128];
+	unsigned int vars_found = 0;
 
-		matches[i].match = 0;
-		matches[i].len = strlen(kconfigs[i]);
-
-		if (val) {
-			matches[i].val = val + 1;
-			matches[i].len -= strlen(val);
-		}
-
-		results[i].match = 0;
-		results[i].value = NULL;
-	}
-
-	fp = open_kconfig();
+	FILE *fp = open_kconfig();
 	if (!fp)
 		tst_brk(TBROK, "Cannot parse kernel .config");
 
-	while (fgets(buf, sizeof(buf), fp)) {
-		for (i = 0; i < cnt; i++) {
-			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
-				for (j = 0; j < cnt; j++) {
-					if (matches[j].match)
-						break;
-				}
+	while (fgets(line, sizeof(line), fp)) {
+		char *cfg = strstr(line, "CONFIG_");
 
-				if (j == cnt)
-					goto exit;
-			}
-		}
+		if (!cfg)
+			continue;
+
+		if (kconfig_parse_line(line, vars, vars_len))
+			vars_found++;
 
+		if (vars_found == vars_len)
+			goto exit;
 	}
 
 exit:
@@ -219,42 +184,63 @@ static size_t array_len(const char *const kconfigs[])
 	return i;
 }
 
-static int compare_res(struct tst_kconfig_res *res, const char *kconfig,
-                       char match, const char *val)
+static int compare_res(struct tst_kconfig_var *var, const char *kconfig,
+                       char choice, const char *val)
 {
-	if (res->match != match) {
-		tst_res(TINFO, "Needs kernel %s, have %c", kconfig, res->match);
+	if (var->choice != choice) {
+		tst_res(TINFO, "Needs kernel %s, have %c", kconfig, var->choice);
 		return 1;
 	}
 
-	if (match != 'v')
+	if (choice != 'v')
 		return 0;
 
-	if (strcmp(res->value, val)) {
-		tst_res(TINFO, "Needs kernel %s, have %s", kconfig, res->value);
+	if (strcmp(var->val, val)) {
+		tst_res(TINFO, "Needs kernel %s, have %s", kconfig, var->val);
 		return 1;
 	}
 
 	return 0;
 }
 
+static inline unsigned int get_len(const char* kconfig)
+{
+	char *sep = index(kconfig, '=');
+
+	if (!sep)
+		return strlen(kconfig);
+
+	return sep - kconfig;
+}
+
 void tst_kconfig_check(const char *const kconfigs[])
 {
-	size_t cnt = array_len(kconfigs);
-	struct tst_kconfig_res results[cnt];
+	size_t vars_cnt = array_len(kconfigs);
+	struct tst_kconfig_var vars[vars_cnt];
 	unsigned int i;
 	int abort_test = 0;
 
-	tst_kconfig_read(kconfigs, results, cnt);
+	memset(vars, 0, sizeof(*vars) * vars_cnt);
+
+	for (i = 0; i < vars_cnt; i++) {
+		vars[i].id_len = get_len(kconfigs[i]);
+
+		if (vars[i].id_len >= sizeof(vars[i].id))
+			tst_brk(TBROK, "kconfig var id too long!");
+
+		strncpy(vars[i].id, kconfigs[i], vars[i].id_len);
+	}
+
+	tst_kconfig_read(vars, vars_cnt);
 
-	for (i = 0; i < cnt; i++) {
-		if (results[i].match == 0) {
+	for (i = 0; i < vars_cnt; i++) {
+		if (vars[i].choice == 0) {
 			tst_res(TINFO, "Missing kernel %s", kconfigs[i]);
 			abort_test = 1;
 			continue;
 		}
 
-		if (results[i].match == 'n') {
+		if (vars[i].choice == 'n') {
 			tst_res(TINFO, "Kernel %s is not set", kconfigs[i]);
 			abort_test = 1;
 			continue;
@@ -263,21 +249,21 @@ void tst_kconfig_check(const char *const kconfigs[])
 		const char *val = strchr(kconfigs[i], '=');
 
 		if (val) {
-			char match = 'v';
+			char choice = 'v';
 			val++;
 
 			if (!strcmp(val, "y"))
-				match = 'y';
+				choice = 'y';
 
 			if (!strcmp(val, "m"))
-				match = 'm';
+				choice = 'm';
 
-			if (compare_res(&results[i], kconfigs[i], match, val))
+			if (compare_res(&vars[i], kconfigs[i], choice, val))
 				abort_test = 1;
 
 		}
 
-		free(results[i].value);
+		free(vars[i].val);
 	}
 
 	if (abort_test)
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
