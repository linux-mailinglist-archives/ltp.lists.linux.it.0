Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB284996985
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2024 14:06:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B1FB3C2BC7
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2024 14:06:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B9603C2B8B
 for <ltp@lists.linux.it>; Wed,  9 Oct 2024 14:04:46 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57E2A14098D9
 for <ltp@lists.linux.it>; Wed,  9 Oct 2024 14:04:45 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2CB921F53;
 Wed,  9 Oct 2024 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728475485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM/a7AGcWazbR/Bmu2a1GoikKnwsqmCQJU55vjh3xbU=;
 b=tV7vgnIjHC0Ga23mm/EJPaodUn4tKvJTIVpDT7D3jirCF1pffKJ70xb94YJXdFHbL+l36Q
 LGwfqaXK3WWVkRFcXH2w4CKAgkD0OsUHNmuCHQgl1eHCN6xc7WGMsjRSWaEOTmh/FF6Py7
 UX0xjmxrXFYzwV3SoniQUcEts/oCjXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728475485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM/a7AGcWazbR/Bmu2a1GoikKnwsqmCQJU55vjh3xbU=;
 b=snzc9sb3dKsVcFa44CrpcEQLKZsbWvCyD09pGUl9Xf3MoTjAHwrS+RlmMWReTGndIgXOwX
 1UfrRZwVK++EqADA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728475484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM/a7AGcWazbR/Bmu2a1GoikKnwsqmCQJU55vjh3xbU=;
 b=KGiJsKLzg1XtjBIkgDwLvRGKv6qFYyU5TbD6lbK/hv/sdSI5w3BBX52Uw9OHiSidCDGuOy
 +V4vpPBPrOdGx24KbG0NmviPZ6DfBMjgU+i/DrGh5d6YH/H9DcYLH9kMchWfh7sAy/RKJ4
 CQVIwKkrsjwwUT0xCXubjfr4JGY/pro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728475484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM/a7AGcWazbR/Bmu2a1GoikKnwsqmCQJU55vjh3xbU=;
 b=MxtQddvF/nDr38pYKNGdbvMxwhgQXgUWOvKg8VkHLz8Dx6/qCYUHvvWvjAOLhL/DTIDm5S
 CUA0S9sze9WucnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87BB713A58;
 Wed,  9 Oct 2024 12:04:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OJz3GlxxBmfLEwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 09 Oct 2024 12:04:44 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 09 Oct 2024 14:04:40 +0200
MIME-Version: 1.0
Message-Id: <20241009-listmount_statmount-v8-5-182cd6557223@suse.com>
References: <20241009-listmount_statmount-v8-0-182cd6557223@suse.com>
In-Reply-To: <20241009-listmount_statmount-v8-0-182cd6557223@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728475481; l=4241;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=Z7NozK0DfRaFU2aq2fiF722DyKYl+Cy+Zu+m3CKZXvo=;
 b=eIpjSJn/1x0EPyffm3o8Y8RTzPFY2MRfApYPtNc+oGtqRTcFYh9+NBBFrq2G+cOWK6hCvdhN/
 uQnBtPY8Sa1CFcA6qERs4YCoHD+uEDDDrIEc0UCHDw2j/+Uuhp5Qkl+
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:email,
 suse.com:mid, suse.cz:email]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v8 05/16] Add listmount01 test
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

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                  |  2 +
 testcases/kernel/syscalls/listmount/.gitignore    |  1 +
 testcases/kernel/syscalls/listmount/Makefile      |  7 +++
 testcases/kernel/syscalls/listmount/listmount.h   | 27 ++++++++++
 testcases/kernel/syscalls/listmount/listmount01.c | 63 +++++++++++++++++++++++
 5 files changed, 100 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index 02e721df9..09e3025a6 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -731,6 +731,8 @@ linkat02 linkat02
 
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
index 000000000..aad927f71
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/listmount.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef LISTMOUNT_H
+#define LISTMOUNT_H
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
index 000000000..604e5ce92
--- /dev/null
+++ b/testcases/kernel/syscalls/listmount/listmount01.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test verifies that listmount() is properly recognizing a mounted
+ * root directory using LSMT_ROOT flag.
+ *
+ * [Algorithm]
+ *
+ * - move into a new unshared namespace
+ * - mount() a root inside temporary folder and get its mount ID
+ * - get list of mounted IDs using listmount(LSMT_ROOT, ..)
+ * - verify that the root mount ID is the only mount ID present inside the list
+ */
+
+#define _GNU_SOURCE
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
+	if (!TST_PASS)
+		return;
+
+	TST_EXP_EQ_LI(TST_RET, 1);
+	TST_EXP_EQ_LI(list[0], root_id);
+}
+
+static void setup(void)
+{
+	struct ltp_statx sx;
+
+	SAFE_UNSHARE(CLONE_NEWNS);
+
+	SAFE_CHROOT(MNTPOINT);
+	SAFE_MOUNT("", "/", NULL, MS_REC | MS_PRIVATE, NULL);
+	SAFE_STATX(AT_FDCWD, "/", 0, STATX_MNT_ID_UNIQUE, &sx);
+
+	root_id = sx.data.stx_mnt_id;
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.forks_child = 1,
+	.min_kver = "6.8",
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
