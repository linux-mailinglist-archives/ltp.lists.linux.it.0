Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFB8C65C6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 13:33:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB8183CF7B1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 13:33:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4AD63CF75A
 for <ltp@lists.linux.it>; Wed, 15 May 2024 13:33:49 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 52EBC1A0C278
 for <ltp@lists.linux.it>; Wed, 15 May 2024 13:33:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFE9133ADE;
 Wed, 15 May 2024 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715772828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFp1ujAIA/zECwSOzdfpYjXhDcjJ+Dn3X0D6RjX8hSs=;
 b=XUudth+ozauxLcJ8FN/HufOmhpq8jLtYkPgcSf7aLqbZ9WOpFRDERhXnPJBPuJsauBzl3q
 zRgNHxuAyNsnnE4wMadf3saK5FRQSJo0KPhdv+WnMvpCeuPdE4NDU5eWqCK5h4MH4ubOPZ
 UOlo1HFQF8qfwO6DnK/KAiCEl4tPNi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715772828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFp1ujAIA/zECwSOzdfpYjXhDcjJ+Dn3X0D6RjX8hSs=;
 b=LUv2dyhAl7dRmk61bgee2sypAZniwWaSnXQcsAqj2G+PTKWL+4ANtRIaorLE/WPYXbDYXU
 oepwRalPgyBG4KAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715772828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFp1ujAIA/zECwSOzdfpYjXhDcjJ+Dn3X0D6RjX8hSs=;
 b=XUudth+ozauxLcJ8FN/HufOmhpq8jLtYkPgcSf7aLqbZ9WOpFRDERhXnPJBPuJsauBzl3q
 zRgNHxuAyNsnnE4wMadf3saK5FRQSJo0KPhdv+WnMvpCeuPdE4NDU5eWqCK5h4MH4ubOPZ
 UOlo1HFQF8qfwO6DnK/KAiCEl4tPNi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715772828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFp1ujAIA/zECwSOzdfpYjXhDcjJ+Dn3X0D6RjX8hSs=;
 b=LUv2dyhAl7dRmk61bgee2sypAZniwWaSnXQcsAqj2G+PTKWL+4ANtRIaorLE/WPYXbDYXU
 oepwRalPgyBG4KAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9F1113A66;
 Wed, 15 May 2024 11:33:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Hh3K5ydRGbwNAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 15 May 2024 11:33:48 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 15 May 2024 13:33:31 +0200
Message-Id: <20240515113338.554-4-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240515113338.554-1-andrea.cervesato@suse.de>
References: <20240515113338.554-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 03/10] Add listmount01 test
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

This test verifies that listmount() is properly recognizing a mounted
root directory using LSMT_ROOT flag.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                              |  2 +
 .../kernel/syscalls/listmount/.gitignore      |  1 +
 testcases/kernel/syscalls/listmount/Makefile  |  7 ++
 .../kernel/syscalls/listmount/listmount.h     | 26 ++++++++
 .../kernel/syscalls/listmount/listmount01.c   | 66 +++++++++++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 testcases/kernel/syscalls/listmount/.gitignore
 create mode 100644 testcases/kernel/syscalls/listmount/Makefile
 create mode 100644 testcases/kernel/syscalls/listmount/listmount.h
 create mode 100644 testcases/kernel/syscalls/listmount/listmount01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index d9cf37510..8fd4a9a0a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -706,6 +706,8 @@ linkat02 linkat02
 
 listen01 listen01
 
+listmount01 listmount01
+
 listxattr01 listxattr01
 listxattr02 listxattr02
 listxattr03 listxattr03
diff --git a/testcases/kernel/syscalls/listmount/.gitignore b/testcases/kernel/syscalls/listmount/.gitignore
new file mode 100644
index 000000000..5257b298c
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/.gitignore
@@ -0,0 +1 @@
+listmount01
diff --git a/testcases/kernel/syscalls/listmount/Makefile b/testcases/kernel/syscalls/listmount/Makefile
new file mode 100644
index 000000000..8cf1b9024
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/listmount/listmount.h b/testcases/kernel/syscalls/listmount/listmount.h
new file mode 100644
index 000000000..93766cd33
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/listmount.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef LISTMOUNT_H
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "lapi/mount.h"
+#include "lapi/syscalls.h"
+
+static inline ssize_t listmount(uint64_t mnt_id, uint64_t last_mnt_id,
+			 uint64_t list[], size_t num, unsigned int flags)
+{
+	struct mnt_id_req req = {
+		.size = MNT_ID_REQ_SIZE_VER0,
+		.mnt_id = mnt_id,
+		.param = last_mnt_id,
+	};
+
+	return tst_syscall(__NR_listmount, &req, list, num, flags);
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/listmount/listmount01.c b/testcases/kernel/syscalls/listmount/listmount01.c
new file mode 100644
index 000000000..20cc90507
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/listmount01.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/**
+ * [Description]
+ *
+ * This test verifies that listmount() is properly recognizing a mounted
+ * root directory using LSMT_ROOT flag.
+ *
+ * [Algorithm]
+ *
+ * * move into a new unshared namespace
+ * * mount() a root inside temporary folder and get its mount ID
+ * * get list of mounted IDs using listmount(LSMT_ROOT, ..)
+ * * verify that the root mount ID is the only mount ID present inside the list
+ */
+
+#include "listmount.h"
+#include "lapi/stat.h"
+#include "lapi/sched.h"
+
+#define MNTPOINT "mntpoint"
+#define LISTSIZE 32
+
+static uint64_t root_id;
+
+static void run(void)
+{
+	uint64_t list[LISTSIZE];
+
+	TST_EXP_POSITIVE(listmount(LSMT_ROOT, 0, list, LISTSIZE, 0));
+	if (TST_RET == -1)
+		return;
+
+	TST_EXP_EQ_LI(TST_RET, 1);
+	TST_EXP_EQ_LI(list[0], root_id);
+}
+
+static void setup(void)
+{
+	struct statx sx;
+
+	SAFE_UNSHARE(CLONE_NEWNS);
+
+	SAFE_CHROOT(MNTPOINT);
+	SAFE_MOUNT("", "/", NULL, MS_REC | MS_PRIVATE, NULL);
+	SAFE_STATX(AT_FDCWD, "/", 0, STATX_MNT_ID_UNIQUE, &sx);
+
+	root_id = sx.stx_mnt_id;
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.forks_child = 1,
+	.min_kver = "6.8",
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.skip_filesystems = (const char *const []) {
+		"fuse",
+		NULL
+	},
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
