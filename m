Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C14324440FD
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 13:02:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65E1F3C7219
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 13:02:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE2B43C3012
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 13:01:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B86DC200999
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 13:01:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53B4B1FD4C;
 Wed,  3 Nov 2021 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635940899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrsV6OQzxKQVGKVdGS+/XB3z3Lw4ae+y38sEp3Vv8Dg=;
 b=HX2Tnl7qD9jghSu2BnO3SU6nnk76L4wk8obrRb7NoKerXQjiC9u/jOL71QTyDS8ukgWwq/
 eOVpSW3lLYgbTEPukvJeEFatSu4jW5/G7pDAGfOJQbebCKWokaNFAfLLU+JDDjlfhGQRAg
 9XeOHMI1aXBy+qm28Gr9UXr0w5YYM1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635940899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrsV6OQzxKQVGKVdGS+/XB3z3Lw4ae+y38sEp3Vv8Dg=;
 b=jFDeW2isJZzrC5KxDIgApt18ZMlathBgoDS8y8ueRFa3QEyQTH3XhFjYh/jgeFH1bRQnSa
 GM31CN2zvSnDX3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 418DC13CE7;
 Wed,  3 Nov 2021 12:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3wvSDiN6gmFXRwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 03 Nov 2021 12:01:39 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  3 Nov 2021 13:02:29 +0100
Message-Id: <20211103120233.20728-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103120233.20728-1-chrubis@suse.cz>
References: <20211103120233.20728-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/7] docparse: data_storage: Add integer type node
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 docparse/data_storage.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index 339450c8b..117c1d127 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -15,6 +15,7 @@ enum data_type {
 	DATA_ARRAY,
 	DATA_HASH,
 	DATA_STRING,
+	DATA_INT,
 };
 
 struct data_node_array {
@@ -41,12 +42,18 @@ struct data_node_string {
 	char val[];
 };
 
+struct data_node_int {
+	enum data_type type;
+	long val;
+};
+
 struct data_node {
 	union {
 		enum data_type type;
 		struct data_node_hash hash;
 		struct data_node_array array;
 		struct data_node_string string;
+		struct data_node_int i;
 	};
 };
 
@@ -64,6 +71,19 @@ static inline struct data_node *data_node_string(const char *string)
 	return node;
 }
 
+static inline struct data_node *data_node_int(long i)
+{
+	struct data_node *node = malloc(sizeof(struct data_node_int));
+
+	if (!node)
+		return NULL;
+
+	node->type = DATA_INT;
+	node->i.val = i;
+
+	return node;
+}
+
 #define MAX_ELEMS 100
 
 static inline struct data_node *data_node_hash(void)
@@ -122,6 +142,7 @@ static inline void data_node_free(struct data_node *self)
 
 	switch (self->type) {
 	case DATA_STRING:
+	case DATA_INT:
 	break;
 	case DATA_HASH:
 		for (i = 0; i < self->hash.elems_used; i++) {
@@ -209,6 +230,10 @@ static inline void data_node_print_(struct data_node *self, unsigned int padd)
 	unsigned int i;
 
 	switch (self->type) {
+	case DATA_INT:
+		data_print_padd(padd);
+		printf("%li\n", self->i.val);
+	break;
 	case DATA_STRING:
 		data_print_padd(padd);
 		printf("'%s'\n", self->string.val);
@@ -295,6 +320,10 @@ static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int p
 	unsigned int i;
 
 	switch (self->type) {
+	case DATA_INT:
+		padd = do_padd ? padd : 0;
+		data_fprintf(f, padd, "%li", self->i.val);
+	break;
 	case DATA_STRING:
 		padd = do_padd ? padd : 0;
 		data_fprintf_esc(f, padd, self->string.val);
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
