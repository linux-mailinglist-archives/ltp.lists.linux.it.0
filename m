Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88438B01AA6
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jul 2025 13:36:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27A903CA4B5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jul 2025 13:36:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 145F93CB31F
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 13:36:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7EEB760093D
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 13:36:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F30411F80C
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752233758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrawlDUvpoNJbxXFrWRP48PJ9MEQAdKbsoObpetscJg=;
 b=WF1ZBguIH1TKyeL89UAXykdcH36KmfI+3DudO7FjYGa5X0fioV+XJO8pUd2m/nRlHOuyjv
 2/khFfEBMkCCFoDlCsqHyVfhWOhZY017Rk2NfXbmDiLdlM58dkNiV9lFl+NRx1GTDTmh4R
 urI1Lb5rRPKtSaZwwFoHflmJRLrJ3Ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752233758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrawlDUvpoNJbxXFrWRP48PJ9MEQAdKbsoObpetscJg=;
 b=ckKzm7llZNR4QZRLIM42ZeopR+KQwKR42cM7g8eQfh3rgipOs11jGq0Q2YyuKQeiTOJ2/J
 j1OBxhmLV+aumyCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752233757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrawlDUvpoNJbxXFrWRP48PJ9MEQAdKbsoObpetscJg=;
 b=LGfZkpV54dWoCEiEpuTF5oPqDLP99j+Vv+Q+bk6hMb5vq0ZZSQlVCGyOieo/CeQHqPrlAG
 mKunt3fPDphH0q1Qoxg6vXWJSmUxylLS9qsVeS8FJN1r2sCf47kOE5EbvlmLn00CTAbbNe
 SJYAocPB33roSj7Di9WKYbzYLAjSo9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752233757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrawlDUvpoNJbxXFrWRP48PJ9MEQAdKbsoObpetscJg=;
 b=x8iH3b3RmHwGWFm7ZwCiafTGJiVgMKfe12glDMuyfBcOTliFJFxWfzJakr0S9kJDnhqdxB
 e7wqBh2NLl+3ObCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0D801388B
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SX0DNh33cGhqFwAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 11 Jul 2025 11:35:57 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Jul 2025 13:36:32 +0200
Message-ID: <20250711113632.11391-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250711113632.11391-1-chrubis@suse.cz>
References: <20250711113632.11391-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/2] metaparse: Map arrays with designated
 initializers to JSON objects
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

The parser now scans array declarations and if it finds out that
complete initialization is using designated initializers the result is
mapped into a JSON object instead of an arrray.

A diff snippet looks like:

--------------------------
    "filesystems": [
-    [
-     ".type=btrfs"
-    ],
-    [
-     ".type=bcachefs"
-    ],
-    [
-     ".type=xfs",
-     ".min_kver=4.16",
-     ".mkfs_ver=mkfs.xfs >= 1.5.0",
-     [
+    {
+     "type": "btrfs"
+    },
+    {
+     "type": "bcachefs"
+    },
+    {
+     "type": "xfs",
+     "min_kver": "4.16",
+     "mkfs_ver": "mkfs.xfs >= 1.5.0",
+     "mkfs_opts": [
       "-m",
       "reflink=1"
-     ],
-     ".mkfs_opts=(constchar*const[])"
-    ]
+     ]
+    }
    ],
--------------------------

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 metadata/data_storage.h |  20 ++++++
 metadata/metaparse.c    | 142 +++++++++++++++++++++++++++++++++-------
 2 files changed, 139 insertions(+), 23 deletions(-)

diff --git a/metadata/data_storage.h b/metadata/data_storage.h
index f837feec8..6ca5d7d90 100644
--- a/metadata/data_storage.h
+++ b/metadata/data_storage.h
@@ -10,6 +10,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#include <stdbool.h>
 
 enum data_type {
 	DATA_ARRAY,
@@ -228,6 +229,13 @@ static inline struct data_node *data_node_hash_get(struct data_node *self, const
 	return hash->elems[i].node;
 }
 
+static inline unsigned int data_node_hash_len(struct data_node *self)
+{
+	struct data_node_hash *hash = &self->hash;
+
+	return hash->elems_used;
+}
+
 static inline int data_node_array_add(struct data_node *self, struct data_node *payload)
 {
 	if (self->type != DATA_ARRAY)
@@ -285,6 +293,18 @@ static inline void data_print_padd(unsigned int i)
 		putchar(' ');
 }
 
+static inline bool data_node_is_empty(struct data_node *self)
+{
+	switch (self->type) {
+	case DATA_ARRAY:
+		return data_node_array_len(self) == 0;
+	case DATA_HASH:
+		return data_node_hash_len(self) == 0;
+	default:
+		return false;
+	}
+}
+
 static inline void data_node_print_(struct data_node *self, unsigned int padd)
 {
 	unsigned int i;
diff --git a/metadata/metaparse.c b/metadata/metaparse.c
index 9723a92c2..36736ac06 100644
--- a/metadata/metaparse.c
+++ b/metadata/metaparse.c
@@ -337,15 +337,20 @@ static void try_apply_macro(char **res)
 	*res = ret->data;
 }
 
-static void finalize_array_entry(char **entry, struct data_node *node)
+static void finalize_array_entry(char **val, char **id, struct data_node *node)
 {
-	if (!*entry)
+	if (!*val)
 		return;
 
-	data_node_array_add(node, data_node_string(*entry));
+	if (*id)
+		data_node_hash_add(node, *id+1, data_node_string(*val));
+	else
+		data_node_array_add(node, data_node_string(*val));
 
-	free(*entry);
-	*entry = NULL;
+	free(*id);
+	free(*val);
+	*id = NULL;
+	*val = NULL;
 }
 
 static void str_append(char **res, char *append)
@@ -369,24 +374,106 @@ err:
 	exit(1);
 }
 
-static int parse_array(FILE *f, struct data_node *node)
+static int array_is_hash(FILE *f)
 {
+	long pos = ftell(f);
+	int has_ids = 1;
+	int elem_seen = 0;
+	int comma_last = 0;
+	int in_id = 1;
 	char *token;
-	char *entry = NULL;
+
+	while ((token = next_token(f, NULL))) {
+
+		if (!strcmp(token, "}")) {
+			if (in_id && !comma_last)
+				has_ids = 0;
+			goto ret;
+		}
+
+		elem_seen = 1;
+
+		if (!strcmp(token, "{")) {
+			if (in_id) {
+				has_ids = 0;
+				goto ret;
+			}
+
+			int level = 1;
+
+			for (;;) {
+				token = next_token(f, NULL);
+
+				if (!token)
+					goto ret;
+
+				if (!strcmp(token, "{"))
+					level++;
+
+				if (!strcmp(token, "}"))
+					level--;
+
+				if (!level)
+					break;
+			}
+		} else if (!strcmp(token, ",")) {
+			if (in_id) {
+				has_ids = 0;
+				goto ret;
+			}
+
+			in_id = 1;
+
+			comma_last = 1;
+		} else if (!strcmp(token, "=")) {
+			in_id = 0;
+		} else {
+			comma_last = 0;
+		}
+	}
+
+ret:
+	fseek(f, pos, SEEK_SET);
+	return elem_seen && has_ids;
+}
+
+static int parse_array(FILE *f, const char *arr_id, struct data_node **ret)
+{
+	char *token;
+	char *val = NULL, *id = NULL;
 	int parent_cnt = 0;
+	int is_hash = array_is_hash(f);
+
+	if (verbose)
+		fprintf(stderr, "PARSING ARRAY (%s) is_hash = %i\n", arr_id, is_hash);
+
+	if (is_hash)
+		*ret = data_node_hash();
+	else
+		*ret = data_node_array();
 
 	for (;;) {
 		if (!(token = next_token(f, NULL)))
 			return 1;
 
 		if (!strcmp(token, "{")) {
-			struct data_node *ret = data_node_array();
-			parse_array(f, ret);
+			struct data_node *sub_ret;
 
-			if (data_node_array_len(ret))
-				data_node_array_add(node, ret);
-			else
-				data_node_free(ret);
+			parse_array(f, id, &sub_ret);
+
+			if (data_node_is_empty(sub_ret)) {
+				data_node_free(sub_ret);
+			} else {
+				if (is_hash)
+					data_node_hash_add(*ret, id+1, sub_ret);
+				else
+					data_node_array_add(*ret, sub_ret);
+			}
+
+			free(id);
+			id = NULL;
+			free(val);
+			val = NULL;
 
 			continue;
 		}
@@ -394,23 +481,33 @@ static int parse_array(FILE *f, struct data_node *node)
 		if (!strcmp(token, "}")) {
 			struct data_node *arr_last;
 
-			finalize_array_entry(&entry, node);
-
+			finalize_array_entry(&val, &id, *ret);
 			/* Remove NULL terminating entry, if present. */
-			arr_last = data_node_array_last(node);
-			if (arr_last && arr_last->type == DATA_NULL)
-				data_node_array_last_rem(node);
+			if (!is_hash) {
+				arr_last = data_node_array_last(*ret);
+				if (arr_last && arr_last->type == DATA_NULL)
+					data_node_array_last_rem(*ret);
+			}
 
 			return 0;
 		}
 
+		if (is_hash && !strcmp(token, "=") && !id) {
+			id = val;
+			val = NULL;
+			continue;
+		}
+
 		if (!strcmp(token, ",") && parent_cnt <= 0) {
-			finalize_array_entry(&entry, node);
+			finalize_array_entry(&val, &id, *ret);
 			continue;
 		}
 
 		if (!strcmp(token, "NULL")) {
-			data_node_array_add(node, data_node_null());
+			if (is_hash)
+				data_node_hash_add(*ret, id, data_node_null());
+			else
+				data_node_array_add(*ret, data_node_null());
 			continue;
 		}
 
@@ -421,7 +518,7 @@ static int parse_array(FILE *f, struct data_node *node)
 			parent_cnt--;
 
 		try_apply_macro(&token);
-		str_append(&entry, token);
+		str_append(&val, token);
 	}
 
 	return 0;
@@ -605,8 +702,7 @@ static int parse_test_struct(FILE *f, struct data_node *doc, struct data_node *n
 		}
 
 		if (!strcmp(token, "{")) {
-			ret = data_node_array();
-			parse_array(f, ret);
+			parse_array(f, id, &ret);
 		} else if (!strcmp(token, "ARRAY_SIZE")) {
 			if (parse_array_size(f, &ret))
 				return 1;
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
