Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0C441CDD
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 15:52:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDF3B3C70D1
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 15:52:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 956163C7046
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 15:52:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DB6C3635497
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 15:52:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B53821968
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635778368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w29bkNUD5EYvH778wGo87Cpn+aRzXbQlnsoQ9KaOduk=;
 b=iIE4lTMOBgHSEwxTgSJpWvW1oQN9iKWY2eezq8E5s5xPQLt9Fs1fJrqQfu3eoZHPbchUmu
 /xi/wS3kVaz+FjrsHNWQRwVf40MX9t6hg0lrByrzDdhkPiUhh9CLoNBdIe1JnJESF5CqZx
 ZqUnt0Rwsftq0GPQhZjHAVckdxHhDm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635778368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w29bkNUD5EYvH778wGo87Cpn+aRzXbQlnsoQ9KaOduk=;
 b=1WimFMtyhz8+n01BqHWtPmKvPouTaeYFbyeKkZfZ1m7xrb86UisSpcxECfINwSSi8w6Amc
 yatnr7aKcxrInHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56C6913522
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 14:52:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJXME0D/f2GzLQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 01 Nov 2021 14:52:48 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Nov 2021 15:53:36 +0100
Message-Id: <20211101145342.7166-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211101145342.7166-1-chrubis@suse.cz>
References: <20211101145342.7166-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/7] docparse: Implement #define and #include
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

We ignore most of the include statements and we attempt to parse only
header files that reside in the same directory as the test source code,
that is since we are not interested in any system or library headers as
we are only looking for constants used in the tst_test structure that
are always either directly in the test source or in header in the same
directory.

The macro support is very simple as well, it's a single pass as we are
not interested in intricate macros. We just need values for constants
that are used in the tst_test structure intializations.

+ Also add -v verbose mode that prints included files and defined macros

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 docparse/docparse.c | 234 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 224 insertions(+), 10 deletions(-)

diff --git a/docparse/docparse.c b/docparse/docparse.c
index 8cd0d0eef..64f9d08d9 100644
--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2019-2021 Cyril Hrubis <chrubis@suse.cz>
  * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
  */
 
+#define _GNU_SOURCE
+
+#include <search.h>
 #include <stdio.h>
 #include <string.h>
 #include <libgen.h>
@@ -12,6 +15,9 @@
 
 #include "data_storage.h"
 
+static int verbose;
+static char *includepath;
+
 #define WARN(str) fprintf(stderr, "WARNING: " str "\n")
 
 static void oneline_comment(FILE *f)
@@ -126,7 +132,7 @@ static void maybe_comment(FILE *f, struct data_node *doc)
 	}
 }
 
-const char *next_token(FILE *f, struct data_node *doc)
+static char *next_token(FILE *f, struct data_node *doc)
 {
 	size_t i = 0;
 	static char buf[4096];
@@ -159,6 +165,7 @@ const char *next_token(FILE *f, struct data_node *doc)
 		case ',':
 		case '[':
 		case ']':
+		case '#':
 			if (i) {
 				ungetc(c, f);
 				goto exit;
@@ -197,6 +204,46 @@ exit:
 	return buf;
 }
 
+static FILE *open_include(const char *includepath, FILE *f)
+{
+	char buf[256];
+	char *path;
+	FILE *inc;
+
+	if (!fscanf(f, "%s\n", buf))
+		return NULL;
+
+	if (buf[0] != '"')
+		return NULL;
+
+	char *filename = buf + 1;
+
+	if (!buf[0])
+		return NULL;
+
+	filename[strlen(filename)-1] = 0;
+
+	if (asprintf(&path, "%s/%s", includepath, filename) < 0)
+		return NULL;
+
+	inc = fopen(path, "r");
+
+	if (inc && verbose)
+		fprintf(stderr, "INCLUDE %s\n", path);
+
+	free(path);
+
+	return inc;
+}
+
+static void close_include(FILE *inc)
+{
+	if (verbose)
+		fprintf(stderr, "INCLUDE END\n");
+
+	fclose(inc);
+}
+
 static int parse_array(FILE *f, struct data_node *node)
 {
 	const char *token;
@@ -234,9 +281,28 @@ static int parse_array(FILE *f, struct data_node *node)
 	return 0;
 }
 
+static void try_apply_macro(char **res)
+{
+	ENTRY macro = {
+		.key = *res,
+	};
+
+	ENTRY *ret;
+
+	ret = hsearch(macro, FIND);
+
+	if (!ret)
+		return;
+
+	if (verbose)
+		fprintf(stderr, "APPLYING MACRO %s=%s\n", ret->key, (char*)ret->data);
+
+	*res = ret->data;
+}
+
 static int parse_test_struct(FILE *f, struct data_node *doc, struct data_node *node)
 {
-	const char *token;
+	char *token;
 	char *id = NULL;
 	int state = 0;
 	struct data_node *ret;
@@ -280,6 +346,7 @@ static int parse_test_struct(FILE *f, struct data_node *doc, struct data_node *n
 			ret = data_node_array();
 			parse_array(f, ret);
 		} else {
+			try_apply_macro(&token);
 			ret = data_node_string(token);
 		}
 
@@ -302,6 +369,114 @@ static const char *tokens[] = {
 	"{",
 };
 
+static void macro_get_string(FILE *f, char *buf, char *buf_end)
+{
+	int c;
+
+	for (;;) {
+		c = fgetc(f);
+
+		switch (c) {
+		case '"':
+		case EOF:
+			*buf = 0;
+			return;
+		default:
+			if (buf < buf_end)
+				*(buf++) = c;
+		}
+	}
+}
+
+static void macro_get_val(FILE *f, char *buf, size_t buf_len)
+{
+	int c, prev = 0;
+	char *buf_end = buf + buf_len - 1;
+
+	c = fgetc(f);
+	if (c == '"') {
+		macro_get_string(f, buf, buf_end);
+		return;
+	}
+
+	for (;;) {
+		switch (c) {
+		case '\n':
+			if (prev == '\\') {
+				buf--;
+			} else {
+				*buf = 0;
+				return;
+			}
+		break;
+		case EOF:
+			*buf = 0;
+			return;
+		case ' ':
+		case '\t':
+		break;
+		default:
+			if (buf < buf_end)
+				*(buf++) = c;
+		}
+
+		prev = c;
+		c = fgetc(f);
+	}
+}
+
+static void parse_macro(FILE *f)
+{
+	char name[128];
+	char val[256];
+
+	if (!fscanf(f, "%s[^\n]", name))
+		return;
+
+	if (fgetc(f) == '\n')
+		return;
+
+	macro_get_val(f, val, sizeof(val));
+
+	ENTRY e = {
+		.key = strdup(name),
+		.data = strdup(val),
+	};
+
+	if (verbose)
+		fprintf(stderr, " MACRO %s=%s\n", e.key, (char*)e.data);
+
+	hsearch(e, ENTER);
+}
+
+static void parse_include_macros(FILE *f)
+{
+	FILE *inc;
+	const char *token;
+	int hash = 0;
+
+	inc = open_include(includepath, f);
+	if (!inc)
+		return;
+
+	while ((token = next_token(inc, NULL))) {
+		if (token[0] == '#') {
+			hash = 1;
+			continue;
+		}
+
+		if (!hash)
+			continue;
+
+		if (!strcmp(token, "define"))
+			parse_macro(inc);
+
+		hash = 0;
+	}
+
+	close_include(inc);
+}
+
 static struct data_node *parse_file(const char *fname)
 {
 	int state = 0, found = 0;
@@ -314,14 +489,28 @@ static struct data_node *parse_file(const char *fname)
 
 	FILE *f = fopen(fname, "r");
 
+	includepath = dirname(strdup(fname));
+
 	struct data_node *res = data_node_hash();
 	struct data_node *doc = data_node_array();
 
 	while ((token = next_token(f, doc))) {
-		if (state < 6 && !strcmp(tokens[state], token))
+		if (state < 6 && !strcmp(tokens[state], token)) {
 			state++;
-		else
+		} else {
+			if (token[0] == '#') {
+				token = next_token(f, doc);
+				if (token) {
+					if (!strcmp(token, "define"))
+						parse_macro(f);
+
+					if (!strcmp(token, "include"))
+						parse_include_macros(f);
+				}
+			}
+
 			state = 0;
+		}
 
 		if (state < 6)
 			continue;
@@ -386,17 +575,42 @@ const char *strip_name(char *path)
 	return name;
 }
 
+static void print_help(const char *prgname)
+{
+	printf("usage: %s [-vh] input.c\n\n", prgname);
+	printf("-v sets verbose mode\n");
+	printf("-h prints this help\n\n");
+	exit(0);
+}
+
 int main(int argc, char *argv[])
 {
 	unsigned int i, j;
 	struct data_node *res;
+	int opt;
+
+	while ((opt = getopt(argc, argv, "hv")) != -1) {
+		switch (opt) {
+		case 'h':
+			print_help(argv[0]);
+		break;
+		case 'v':
+			verbose = 1;
+		break;
+		}
+	}
+
+	if (optind >= argc) {
+		fprintf(stderr, "No input filename.c\n");
+		return 1;
+	}
 
-	if (argc != 2) {
-		fprintf(stderr, "Usage: docparse filename.c\n");
+	if (!hcreate(128)) {
+		fprintf(stderr, "Failed to initialize hash table\n");
 		return 1;
 	}
 
-	res = parse_file(argv[1]);
+	res = parse_file(argv[optind]);
 	if (!res)
 		return 0;
 
@@ -425,8 +639,8 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	data_node_hash_add(res, "fname", data_node_string(argv[1]));
-	printf("  \"%s\": ", strip_name(argv[1]));
+	data_node_hash_add(res, "fname", data_node_string(argv[optind]));
+	printf("  \"%s\": ", strip_name(argv[optind]));
 	data_to_json(res, stdout, 2);
 	data_node_free(res);
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
