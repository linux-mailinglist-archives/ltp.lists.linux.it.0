Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0D9BC959
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2024 10:35:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F3FD3D1F56
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2024 10:35:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47B2E3D1F2D
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 10:34:35 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8E7851420363
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 10:34:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88C5C1FE13
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730799268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtpGncQXbjbUlIGomZKZjK5/UpevnvgG8MsYnBoymnM=;
 b=YRkxMdfrY3tj6AJGtFZ1sU0ssWOlVD7BOT/O4X9OKdRSyVonkfyXvamSRg6PUGVnZ5c0We
 YScYVyuM6Q6K2qj9YaXvimh8U34QBQeha3w5Ostf6Pd+0NL/N3mYHgHNVi+fWHNo+pwwz8
 CuQ2DgEWNfRLVBhinatv4pi7O2dgnfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730799268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtpGncQXbjbUlIGomZKZjK5/UpevnvgG8MsYnBoymnM=;
 b=YAmpREv18m6rBZD+D9/konTkThz5wJyFr/YLbspXUSRIc0tukLHwZIltuEbtdL8HGEAuxW
 +cyrqvGMkIj4txDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YRkxMdfr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YAmpREv1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730799268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtpGncQXbjbUlIGomZKZjK5/UpevnvgG8MsYnBoymnM=;
 b=YRkxMdfrY3tj6AJGtFZ1sU0ssWOlVD7BOT/O4X9OKdRSyVonkfyXvamSRg6PUGVnZ5c0We
 YScYVyuM6Q6K2qj9YaXvimh8U34QBQeha3w5Ostf6Pd+0NL/N3mYHgHNVi+fWHNo+pwwz8
 CuQ2DgEWNfRLVBhinatv4pi7O2dgnfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730799268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtpGncQXbjbUlIGomZKZjK5/UpevnvgG8MsYnBoymnM=;
 b=YAmpREv18m6rBZD+D9/konTkThz5wJyFr/YLbspXUSRIc0tukLHwZIltuEbtdL8HGEAuxW
 +cyrqvGMkIj4txDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3661213A39
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 09:34:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sKkrB6TmKWeAPwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>)
 for <ltp@lists.linux.it>; Tue, 05 Nov 2024 09:34:28 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 05 Nov 2024 10:34:25 +0100
MIME-Version: 1.0
Message-Id: <20241105-landlock_network-v2-1-d58791487919@suse.com>
References: <20241105-landlock_network-v2-0-d58791487919@suse.com>
In-Reply-To: <20241105-landlock_network-v2-0-d58791487919@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730799267; l=16487;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=oE4ik91HL3diHXFRWnahOkX1LS6eZ+bfEL5Zyt8YRGY=;
 b=gkphp9xEtW6G6kSWJRCsdLoLM1kXcOPNS65PDBHerGTyNozZV/zZBgUd/D0QGVJtX6e8anWzG
 41xs2S4QEGUB9w77FyQoJyZ4xkn/j7p3eDRF//aSLJEKdGcdmzhbiJD
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 88C5C1FE13
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_ONE(0.00)[1];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:mid,suse.de:dkim];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/4] Fallback landlock network support
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Landlock network support has been added in the ABI v4, adding features
for bind() and connect() syscalls. It also defined one more member in
the landlock_ruleset_attr struct, breaking our LTP fallbacks, used to
build landlock testing suite. For this reason, we introduce
tst_landlock_ruleset_attr_abi[14] struct(s) which fallback ABI v1 and v4
ruleset_attr definitions.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 configure.ac                                       |  3 ++-
 include/lapi/capability.h                          |  4 ++++
 include/lapi/landlock.h                            | 28 ++++++++++++----------
 testcases/kernel/syscalls/landlock/landlock01.c    | 15 ++++--------
 testcases/kernel/syscalls/landlock/landlock02.c    |  8 +++----
 testcases/kernel/syscalls/landlock/landlock03.c    |  6 ++---
 testcases/kernel/syscalls/landlock/landlock04.c    |  6 ++---
 testcases/kernel/syscalls/landlock/landlock05.c    | 10 ++++----
 testcases/kernel/syscalls/landlock/landlock06.c    | 14 ++++-------
 testcases/kernel/syscalls/landlock/landlock07.c    |  6 ++---
 .../kernel/syscalls/landlock/landlock_common.h     | 12 ++++------
 11 files changed, 53 insertions(+), 59 deletions(-)

diff --git a/configure.ac b/configure.ac
index d327974efa71f263d7f7f5aec9d2c5831d53dd0e..e2e4fd18daa54dbf2034fa9bcc4f2383b53392f4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -34,6 +34,8 @@ m4_ifndef([PKG_CHECK_EXISTS],
 AC_PREFIX_DEFAULT(/opt/ltp)
 
 AC_CHECK_DECLS([IFLA_NET_NS_PID],,,[#include <linux/if_link.h>])
+AC_CHECK_DECLS([LANDLOCK_RULE_PATH_BENEATH],,,[#include <linux/landlock.h>])
+AC_CHECK_DECLS([LANDLOCK_RULE_NET_PORT],,,[#include <linux/landlock.h>])
 AC_CHECK_DECLS([MADV_MERGEABLE],,,[#include <sys/mman.h>])
 AC_CHECK_DECLS([NFTA_CHAIN_ID, NFTA_VERDICT_CHAIN_ID],,,[#include <linux/netfilter/nf_tables.h>])
 AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
@@ -172,7 +174,6 @@ AC_CHECK_MEMBERS([struct utsname.domainname],,,[
 ])
 
 AC_CHECK_TYPES([enum kcmp_type],,,[#include <linux/kcmp.h>])
-AC_CHECK_TYPES([enum landlock_rule_type],,,[#include <linux/landlock.h>])
 AC_CHECK_TYPES([struct acct_v3],,,[#include <sys/acct.h>])
 AC_CHECK_TYPES([struct af_alg_iv, struct sockaddr_alg],,,[# include <linux/if_alg.h>])
 AC_CHECK_TYPES([struct fanotify_event_info_fid, struct fanotify_event_info_error,
diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 0f317d6d770e86b399f0fed2de04c1dce6723eae..14d2d3c12c051006875f1f864ec58a88a3870ec0 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -20,6 +20,10 @@
 # endif
 #endif
 
+#ifndef CAP_NET_BIND_SERVICE
+# define CAP_NET_BIND_SERVICE 10
+#endif
+
 #ifndef CAP_NET_RAW
 # define CAP_NET_RAW          13
 #endif
diff --git a/include/lapi/landlock.h b/include/lapi/landlock.h
index 211d171ebecd92d75224369dc7f1d5c5903c9ce7..b3c8c548e661680541cdf6e4a8fb68a3f5029fec 100644
--- a/include/lapi/landlock.h
+++ b/include/lapi/landlock.h
@@ -7,6 +7,7 @@
 #define LAPI_LANDLOCK_H__
 
 #include "config.h"
+#include <stdint.h>
 
 #ifdef HAVE_LINUX_LANDLOCK_H
 # include <linux/landlock.h>
@@ -14,13 +15,16 @@
 
 #include "lapi/syscalls.h"
 
-#ifndef HAVE_STRUCT_LANDLOCK_RULESET_ATTR
-struct landlock_ruleset_attr
+struct tst_landlock_ruleset_attr_abi1
+{
+	uint64_t handled_access_fs;
+};
+
+struct tst_landlock_ruleset_attr_abi4
 {
 	uint64_t handled_access_fs;
 	uint64_t handled_access_net;
 };
-#endif
 
 #ifndef HAVE_STRUCT_LANDLOCK_PATH_BENEATH_ATTR
 struct landlock_path_beneath_attr
@@ -30,12 +34,12 @@ struct landlock_path_beneath_attr
 } __attribute__((packed));
 #endif
 
-#ifndef HAVE_ENUM_LANDLOCK_RULE_TYPE
-enum landlock_rule_type
-{
-	LANDLOCK_RULE_PATH_BENEATH = 1,
-	LANDLOCK_RULE_NET_PORT,
-};
+#if !HAVE_DECL_LANDLOCK_RULE_PATH_BENEATH
+# define LANDLOCK_RULE_PATH_BENEATH 1
+#endif
+
+#if !HAVE_DECL_LANDLOCK_RULE_NET_PORT
+# define LANDLOCK_RULE_NET_PORT 2
 #endif
 
 #ifndef HAVE_STRUCT_LANDLOCK_NET_PORT_ATTR
@@ -123,8 +127,7 @@ struct landlock_net_port_attr
 #endif
 
 static inline int safe_landlock_create_ruleset(const char *file, const int lineno,
-	const struct landlock_ruleset_attr *attr,
-	size_t size , uint32_t flags)
+	const void *attr, size_t size , uint32_t flags)
 {
 	int rval;
 
@@ -143,8 +146,7 @@ static inline int safe_landlock_create_ruleset(const char *file, const int linen
 }
 
 static inline int safe_landlock_add_rule(const char *file, const int lineno,
-	int ruleset_fd, enum landlock_rule_type rule_type,
-	const void *rule_attr, uint32_t flags)
+	int ruleset_fd, int rule_type, const void *rule_attr, uint32_t flags)
 {
 	int rval;
 
diff --git a/testcases/kernel/syscalls/landlock/landlock01.c b/testcases/kernel/syscalls/landlock/landlock01.c
index 083685c64fa6d1c0caab887ee03594ea1426f62f..bd3a37153449b8d75b9671f5c3b3838c701b05ae 100644
--- a/testcases/kernel/syscalls/landlock/landlock01.c
+++ b/testcases/kernel/syscalls/landlock/landlock01.c
@@ -17,14 +17,14 @@
 
 #include "landlock_common.h"
 
-static struct landlock_ruleset_attr *ruleset_attr;
-static struct landlock_ruleset_attr *null_attr;
+static struct tst_landlock_ruleset_attr_abi4 *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi4 *null_attr;
 static size_t rule_size;
 static size_t rule_small_size;
 static size_t rule_big_size;
 
 static struct tcase {
-	struct landlock_ruleset_attr **attr;
+	struct tst_landlock_ruleset_attr_abi4 **attr;
 	uint64_t access_fs;
 	size_t *size;
 	uint32_t flags;
@@ -60,13 +60,8 @@ static void setup(void)
 {
 	verify_landlock_is_enabled();
 
-	rule_size = sizeof(struct landlock_ruleset_attr);
-
-#ifdef HAVE_STRUCT_LANDLOCK_RULESET_ATTR_HANDLED_ACCESS_NET
+	rule_size = sizeof(struct tst_landlock_ruleset_attr_abi4);
 	rule_small_size = rule_size - sizeof(uint64_t) - 1;
-#else
-	rule_small_size = rule_size - 1;
-#endif
 
 	rule_big_size = SAFE_SYSCONF(_SC_PAGESIZE) + 1;
 }
@@ -77,7 +72,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.needs_root = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi4)},
 		{},
 	},
 	.caps = (struct tst_cap []) {
diff --git a/testcases/kernel/syscalls/landlock/landlock02.c b/testcases/kernel/syscalls/landlock/landlock02.c
index 1a3df69c9cc3eda98e28cfbfd1e12c57e26d0128..8566d407f6d17ab367695125f07d0a80cf4130e5 100644
--- a/testcases/kernel/syscalls/landlock/landlock02.c
+++ b/testcases/kernel/syscalls/landlock/landlock02.c
@@ -20,7 +20,7 @@
 
 #include "landlock_common.h"
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static struct landlock_path_beneath_attr *path_beneath_attr;
 static struct landlock_path_beneath_attr *rule_null;
 static int ruleset_fd;
@@ -93,7 +93,7 @@ static void run(unsigned int n)
 	}
 
 	TST_EXP_FAIL(tst_syscall(__NR_landlock_add_rule,
-			*tc->fd, tc->rule_type, *tc->attr, tc->flags),
+		*tc->fd, tc->rule_type, *tc->attr, tc->flags),
 		tc->exp_errno,
 		"%s",
 		tc->msg);
@@ -106,7 +106,7 @@ static void setup(void)
 	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_EXECUTE;
 
 	ruleset_fd = TST_EXP_FD_SILENT(tst_syscall(__NR_landlock_create_ruleset,
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0));
+		ruleset_attr, sizeof(struct tst_landlock_ruleset_attr_abi1), 0));
 }
 
 static void cleanup(void)
@@ -122,7 +122,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.needs_root = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{&path_beneath_attr, .size = sizeof(struct landlock_path_beneath_attr)},
 		{},
 	},
diff --git a/testcases/kernel/syscalls/landlock/landlock03.c b/testcases/kernel/syscalls/landlock/landlock03.c
index 224482255b287cef64f579b5707a92a6b5908f8b..150c8cc4e50ee1b41af3c8c01771c51a8715746f 100644
--- a/testcases/kernel/syscalls/landlock/landlock03.c
+++ b/testcases/kernel/syscalls/landlock/landlock03.c
@@ -21,7 +21,7 @@
 
 #define MAX_STACKED_RULESETS 16
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static int ruleset_fd = -1;
 static int ruleset_invalid = -1;
 static int file_fd = -1;
@@ -89,7 +89,7 @@ static void setup(void)
 	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_EXECUTE;
 
 	ruleset_fd = TST_EXP_FD_SILENT(tst_syscall(__NR_landlock_create_ruleset,
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0));
+		ruleset_attr, sizeof(struct tst_landlock_ruleset_attr_abi1), 0));
 
 	file_fd = SAFE_OPEN("junk.bin", O_CREAT, 0777);
 }
@@ -112,7 +112,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{},
 	},
 	.caps = (struct tst_cap []) {
diff --git a/testcases/kernel/syscalls/landlock/landlock04.c b/testcases/kernel/syscalls/landlock/landlock04.c
index e9dedd45091ecd15cdce2fa7227bbfceb14abb5e..2485591e2196072f81708fc10cebd382e536e2a9 100644
--- a/testcases/kernel/syscalls/landlock/landlock04.c
+++ b/testcases/kernel/syscalls/landlock/landlock04.c
@@ -15,7 +15,7 @@
 #include "landlock_tester.h"
 #include "tst_safe_stdio.h"
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static struct landlock_path_beneath_attr *path_beneath_attr;
 static int ruleset_fd = -1;
 
@@ -153,7 +153,7 @@ static void setup(void)
 	ruleset_attr->handled_access_fs = tester_get_all_fs_rules();
 
 	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0);
+		ruleset_attr, sizeof(struct tst_landlock_ruleset_attr_abi1), 0);
 
 	/* since our binary is dynamically linked, we need to enable dependences
 	 * to be read and executed
@@ -192,7 +192,7 @@ static struct tst_test test = {
 		NULL,
 	},
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{&path_beneath_attr, .size = sizeof(struct landlock_path_beneath_attr)},
 		{},
 	},
diff --git a/testcases/kernel/syscalls/landlock/landlock05.c b/testcases/kernel/syscalls/landlock/landlock05.c
index 703f7d81c336907f360acbe45b42720dc12bac23..3d5048f0ab51b2d7c3eedc82ef80c04935ac5d86 100644
--- a/testcases/kernel/syscalls/landlock/landlock05.c
+++ b/testcases/kernel/syscalls/landlock/landlock05.c
@@ -28,7 +28,7 @@
 #define FILENAME2 DIR2"/file"
 #define FILENAME3 DIR3"/file"
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static struct landlock_path_beneath_attr *path_beneath_attr;
 
 static void run(void)
@@ -68,15 +68,15 @@ static void setup(void)
 		LANDLOCK_ACCESS_FS_REFER;
 
 	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0);
+		ruleset_attr, sizeof(struct tst_landlock_ruleset_attr_abi1), 0);
 
-	apply_landlock_rule(
+	apply_landlock_fs_rule(
 		path_beneath_attr,
 		ruleset_fd,
 		LANDLOCK_ACCESS_FS_REFER,
 		DIR1);
 
-	apply_landlock_rule(
+	apply_landlock_fs_rule(
 		path_beneath_attr,
 		ruleset_fd,
 		LANDLOCK_ACCESS_FS_REFER,
@@ -93,7 +93,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{&path_beneath_attr, .size = sizeof(struct landlock_path_beneath_attr)},
 		{},
 	},
diff --git a/testcases/kernel/syscalls/landlock/landlock06.c b/testcases/kernel/syscalls/landlock/landlock06.c
index 1a6e59241557db23b23beabf9863a9c51353757a..74237d11657054985f06431467fbb161ded0c1b6 100644
--- a/testcases/kernel/syscalls/landlock/landlock06.c
+++ b/testcases/kernel/syscalls/landlock/landlock06.c
@@ -18,7 +18,7 @@
 #define MNTPOINT "sandbox"
 #define FILENAME MNTPOINT"/fifo"
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static struct landlock_path_beneath_attr *path_beneath_attr;
 static int file_fd = -1;
 static int dev_fd = -1;
@@ -42,8 +42,6 @@ static void run(void)
 
 static void setup(void)
 {
-	int ruleset_fd;
-
 	if (verify_landlock_is_enabled() < 5)
 		tst_brk(TCONF, "LANDLOCK_ACCESS_FS_IOCTL_DEV is not supported");
 
@@ -56,17 +54,13 @@ static void setup(void)
 
 	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_IOCTL_DEV;
 
-	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0);
-
-	apply_landlock_layer(
+	apply_landlock_fs_layer(
 		ruleset_attr,
+		sizeof(struct tst_landlock_ruleset_attr_abi1),
 		path_beneath_attr,
 		MNTPOINT,
 		LANDLOCK_ACCESS_FS_IOCTL_DEV
 	);
-
-	SAFE_CLOSE(ruleset_fd);
 }
 
 static void cleanup(void)
@@ -85,7 +79,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{&path_beneath_attr, .size = sizeof(struct landlock_path_beneath_attr)},
 		{},
 	},
diff --git a/testcases/kernel/syscalls/landlock/landlock07.c b/testcases/kernel/syscalls/landlock/landlock07.c
index 6115ad53876209051952873679eb96014b4dd805..8ee614856312d55e573e18f88a6690b50497ee8b 100644
--- a/testcases/kernel/syscalls/landlock/landlock07.c
+++ b/testcases/kernel/syscalls/landlock/landlock07.c
@@ -25,7 +25,7 @@
 #include "lapi/prctl.h"
 #include "landlock_common.h"
 
-static struct landlock_ruleset_attr *ruleset_attr;
+static struct tst_landlock_ruleset_attr_abi1 *ruleset_attr;
 static int ruleset_fd;
 
 static pid_t spawn_houdini(void)
@@ -77,7 +77,7 @@ static void setup(void)
 	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_WRITE_FILE;
 	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
 		ruleset_attr,
-		sizeof(struct landlock_ruleset_attr),
+		sizeof(struct tst_landlock_ruleset_attr_abi1),
 		0);
 }
 
@@ -93,7 +93,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.forks_child = 1,
 	.bufs = (struct tst_buffers []) {
-		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi1)},
 		{},
 	},
 	.caps = (struct tst_cap []) {
diff --git a/testcases/kernel/syscalls/landlock/landlock_common.h b/testcases/kernel/syscalls/landlock/landlock_common.h
index da91daeab7b3def7184f611a90273419e4cfa6f2..f3096f4bf15f155f2a00b39c461d0805a76306e5 100644
--- a/testcases/kernel/syscalls/landlock/landlock_common.h
+++ b/testcases/kernel/syscalls/landlock/landlock_common.h
@@ -33,7 +33,7 @@ static inline int verify_landlock_is_enabled(void)
 	return abi;
 }
 
-static inline void apply_landlock_rule(
+static inline void apply_landlock_fs_rule(
 	struct landlock_path_beneath_attr *path_beneath_attr,
 	const int ruleset_fd,
 	const int access,
@@ -57,21 +57,19 @@ static inline void enforce_ruleset(const int ruleset_fd)
 	SAFE_LANDLOCK_RESTRICT_SELF(ruleset_fd, 0);
 }
 
-static inline void apply_landlock_layer(
-	struct landlock_ruleset_attr *ruleset_attr,
+static inline void apply_landlock_fs_layer(
+	void *ruleset_attr, size_t attr_size,
 	struct landlock_path_beneath_attr *path_beneath_attr,
 	const char *path,
 	const int access)
 {
 	int ruleset_fd;
 
-	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
-		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0);
+	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(ruleset_attr, attr_size, 0);
 
-	apply_landlock_rule(path_beneath_attr, ruleset_fd, access, path);
+	apply_landlock_fs_rule(path_beneath_attr, ruleset_fd, access, path);
 	enforce_ruleset(ruleset_fd);
 
 	SAFE_CLOSE(ruleset_fd);
 }
-
 #endif /* LANDLOCK_COMMON_H__ */

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
