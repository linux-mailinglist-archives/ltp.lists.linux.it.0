Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHH/D/YjcmnhdgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:19:50 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC111672E9
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:19:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8163C3CB5E0
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:19:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 892463CB5A3
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 14:19:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AC74C1400E0E
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 14:19:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 100125BCCC
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769087983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKjcd+CPTWC4L5UtNl+d/69tvxSI578cCiHWQaIpDTU=;
 b=M34WLd09EdM7VQdJ9Zgl756mBHqzTTF0ZaIeVg4bdWtgksezZz0Z/OODd459FhzblkeXD8
 oye+0ebESF1Kwoh+CnjcDfOu36sx8AuurL5C9FdhqFpoolgFqvaUdzT9t4CmyOIgHaIvWA
 AIzGmEsaHsICJ7n3XC0/yDa4nbdcdkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769087983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKjcd+CPTWC4L5UtNl+d/69tvxSI578cCiHWQaIpDTU=;
 b=B9J4B8iT6rh57lbjP0EgYXYUkEiBMqF18S60w/8O+Gq7GicdkVy/D1MoZTmDToi1SICEEl
 xCZIECxVpipi7WBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769087983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKjcd+CPTWC4L5UtNl+d/69tvxSI578cCiHWQaIpDTU=;
 b=M34WLd09EdM7VQdJ9Zgl756mBHqzTTF0ZaIeVg4bdWtgksezZz0Z/OODd459FhzblkeXD8
 oye+0ebESF1Kwoh+CnjcDfOu36sx8AuurL5C9FdhqFpoolgFqvaUdzT9t4CmyOIgHaIvWA
 AIzGmEsaHsICJ7n3XC0/yDa4nbdcdkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769087983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKjcd+CPTWC4L5UtNl+d/69tvxSI578cCiHWQaIpDTU=;
 b=B9J4B8iT6rh57lbjP0EgYXYUkEiBMqF18S60w/8O+Gq7GicdkVy/D1MoZTmDToi1SICEEl
 xCZIECxVpipi7WBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E662113987
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W3JYN+4jcmkNOgAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:19:42 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 22 Jan 2026 14:20:58 +0100
Message-ID: <20260122132059.24503-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122132059.24503-1-chrubis@suse.cz>
References: <20260122132059.24503-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/3] metadata: metaparse: Add bool mappings to typemap
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	DMARC_NA(0.00)[suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: DC111672E9
X-Rspamd-Action: no action

- add all boolean flags in tst_test to the typemap

- make typemap recursive (adds child pointer to the typemap struct)

- add typemap mappings for the need_cmds optional key

- change the implied tags to bool

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 metadata/metaparse.c | 85 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 7 deletions(-)

diff --git a/metadata/metaparse.c b/metadata/metaparse.c
index 36736ac06..3bca70879 100644
--- a/metadata/metaparse.c
+++ b/metadata/metaparse.c
@@ -968,11 +968,40 @@ static struct data_node *parse_file(const char *fname)
 	return res;
 }
 
-static struct typemap {
+struct typemap {
 	const char *id;
 	enum data_type type;
-} tst_test_typemap[] = {
+	struct typemap *child;
+};
+
+static struct typemap needs_cmds_typemap[] = {
+	{.id = "optional", .type = DATA_BOOL},
+	{}
+};
+
+static struct typemap tst_test_typemap[] = {
 	{.id = "test_variants", .type = DATA_INT},
+	/* All bitflags in tst_test struct */
+	{.id = "needs_tmpdir", .type = DATA_BOOL},
+	{.id = "needs_root", .type = DATA_BOOL},
+	{.id = "forks_child", .type = DATA_BOOL},
+	{.id = "needs_device", .type = DATA_BOOL},
+	{.id = "needs_checkpoints", .type = DATA_BOOL},
+	{.id = "needs_overlay", .type = DATA_BOOL},
+	{.id = "format_device", .type = DATA_BOOL},
+	{.id = "mount_device", .type = DATA_BOOL},
+	{.id = "needs_rofs", .type = DATA_BOOL},
+	{.id = "child_needs_reinit", .type = DATA_BOOL},
+	{.id = "runs_script", .type = DATA_BOOL},
+	{.id = "needs_devfs", .type = DATA_BOOL},
+	{.id = "restore_wallclock", .type = DATA_BOOL},
+	{.id = "all_filesystems", .type = DATA_BOOL},
+	{.id = "skip_in_lockdown", .type = DATA_BOOL},
+	{.id = "skip_in_secureboot", .type = DATA_BOOL},
+	{.id = "skip_in_compat", .type = DATA_BOOL},
+	{.id = "needs_hugetlbfs", .type = DATA_BOOL},
+	{.id = "needs_cgroup_nsdelegate", .type = DATA_BOOL},
+	{.id = "needs_cmds", .child = needs_cmds_typemap},
 	{}
 };
 
@@ -996,18 +1025,55 @@ static void convert_str2int(struct data_node *res, const char *id, const char *s
 	data_node_hash_add(res, id, data_node_int(val));
 }
 
-static void check_normalize_types(struct data_node *res)
+static void convert_str2bool(struct data_node *res, const char *id, const char *str_val)
+{
+	long val;
+	char *endptr;
+
+	errno = 0;
+	val = strtol(str_val, &endptr, 10);
+
+	if (errno || *endptr) {
+		fprintf(stderr,	"Cannot convert %s value %s to bool!\n", id, str_val);
+		exit(1);
+	}
+
+	if (verbose)
+		fprintf(stderr, "NORMALIZING %s TO BOOL %li\n", id, val);
+
+	data_node_hash_del(res, id);
+	data_node_hash_add(res, id, data_node_bool(val));
+}
+
+static void check_normalize_types(struct data_node *res, const char *id, struct typemap *typemaps)
 {
 	unsigned int i;
 
-	for (i = 0; tst_test_typemap[i].id; i++) {
+	if (res->type == DATA_ARRAY) {
+		for (i = 0; i < res->array.array_used; i++)
+			check_normalize_types(res->array.array[i], id, typemaps);
+
+		return;
+	}
+
+	if (res->type != DATA_HASH) {
+		fprintf(stderr, "Typemap '%s' type %s has no children!\n", id, data_type_name(res->type));
+		exit(1);
+	}
+
+	for (i = 0; typemaps[i].id; i++) {
 		struct data_node *n;
-		struct typemap *typemap = &tst_test_typemap[i];
+		struct typemap *typemap = &typemaps[i];
 
 		n = data_node_hash_get(res, typemap->id);
 		if (!n)
 			continue;
 
+		if (typemap->child) {
+			check_normalize_types(n, typemap->id, typemap->child);
+			continue;
+		}
+
 		if (n->type == typemap->type)
 			continue;
 
@@ -1016,6 +1082,11 @@ static void check_normalize_types(struct data_node *res)
 			continue;
 		}
 
+		if (n->type == DATA_STRING && typemap->type == DATA_BOOL) {
+			convert_str2bool(res, typemap->id, n->string.val);
+			continue;
+		}
+
 		fprintf(stderr, "Cannot convert %s from %s to %s!\n",
 			typemap->id, data_type_name(n->type),
 			data_type_name(typemap->type));
@@ -1125,14 +1196,14 @@ int main(int argc, char *argv[])
 	}
 
 	/* Normalize types */
-	check_normalize_types(res);
+	check_normalize_types(res, "",  tst_test_typemap);
 
 	for (i = 0; implies[i].flag; i++) {
 		if (data_node_hash_get(res, implies[i].flag)) {
 			for (j = 0; implies[i].implies[j]; j++) {
 				if (!data_node_hash_get(res, implies[i].implies[j]))
 					data_node_hash_add(res, implies[i].implies[j],
-							   data_node_string("1"));
+							   data_node_bool(true));
 			}
 		}
 	}
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
