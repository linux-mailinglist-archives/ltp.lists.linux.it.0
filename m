Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE7B1B997
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:46:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0E053C6A05
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:46:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28EBA3C6AF6
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:06 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 937AE200A05
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1EFF72126C;
 Tue,  5 Aug 2025 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5c83BHJQPBgeTZ8Ybz8Raa6qjiiO1r8BbHqabkWfg0=;
 b=dte/eEaVZ/lSJ7EHWiKrSvixEVUef2CCdcVKHEcTlAbOKazMdzo4g8ird+y45aOQiPtYhP
 FQLP6XnVGIOb3X+kWsUtqgGyPpVzRn/3/G5AGtOikyYmzCQqWMBVQdZlo2soV8Rz5rvEnd
 tLethzEoMGZqkTVnptGOC/NSs3urJaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5c83BHJQPBgeTZ8Ybz8Raa6qjiiO1r8BbHqabkWfg0=;
 b=hR/NgInK70VC5q9Z+yylaA1rLbjwNWwFdm9uYpU2sUtYmDPxTYRDKgbq91byvXiD9zlrqc
 gJvBj5K2pMMtCEBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5c83BHJQPBgeTZ8Ybz8Raa6qjiiO1r8BbHqabkWfg0=;
 b=dte/eEaVZ/lSJ7EHWiKrSvixEVUef2CCdcVKHEcTlAbOKazMdzo4g8ird+y45aOQiPtYhP
 FQLP6XnVGIOb3X+kWsUtqgGyPpVzRn/3/G5AGtOikyYmzCQqWMBVQdZlo2soV8Rz5rvEnd
 tLethzEoMGZqkTVnptGOC/NSs3urJaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5c83BHJQPBgeTZ8Ybz8Raa6qjiiO1r8BbHqabkWfg0=;
 b=hR/NgInK70VC5q9Z+yylaA1rLbjwNWwFdm9uYpU2sUtYmDPxTYRDKgbq91byvXiD9zlrqc
 gJvBj5K2pMMtCEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB87E13A50;
 Tue,  5 Aug 2025 17:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AIjDNgtDkmhaFQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 05 Aug 2025 17:44:43 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 05 Aug 2025 19:44:43 +0200
MIME-Version: 1.0
Message-Id: <20250805-file_setattr_getattr-v5-4-2bc4d18e0033@suse.com>
References: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
In-Reply-To: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754415882; l=6600;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=0mlkdupzx9AdP91jiyPyEMOBNW0bbIeYXovOO+mEiSU=;
 b=8V4Bx+YxpFRRWaip9ycANqF61sHfFifc3+SVajJjfT1rJzMRuPeCAD/jhIzR9EW/0MFzhofhv
 IRzFA2vrckaDDUrBiGw/1b6fYvjtnY80oMsvBXmjfP/Ge+zAUEEo+er
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email, suse.com:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 4/7] Add file_attr01 test
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

Verify that `file_getattr` and `file_setattr` syscalls are raising the
correct errors according to the invalid input arguments. In particular:

- EBADFD: Invalid file descriptor.
- ENOENT: File doesn't exist
- EFAULT: File name is NULL
- EFAULT: File attributes is NULL
- EINVAL: File attributes size is zero
- E2BIG: File attributes size is too big
- EINVAL: Invalid AT flags

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                  |   2 +
 testcases/kernel/syscalls/file_attr/.gitignore    |   1 +
 testcases/kernel/syscalls/file_attr/Makefile      |   8 +
 testcases/kernel/syscalls/file_attr/file_attr01.c | 178 ++++++++++++++++++++++
 4 files changed, 189 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index 6a17a34f8b5fc1289947d4504b7a146f3d022f1c..fed17a38baf0586ec886876b58c04158fa11e8e0 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -246,6 +246,8 @@ fallocate06 fallocate06
 fsetxattr01 fsetxattr01
 fsetxattr02 fsetxattr02
 
+file_attr01 file_attr01
+
 #posix_fadvise test cases
 posix_fadvise01                      posix_fadvise01
 posix_fadvise01_64                posix_fadvise01_64
diff --git a/testcases/kernel/syscalls/file_attr/.gitignore b/testcases/kernel/syscalls/file_attr/.gitignore
new file mode 100644
index 0000000000000000000000000000000000000000..de06f204d34be482a6401f2a5e7931caa5e3ab12
--- /dev/null
+++ b/testcases/kernel/syscalls/file_attr/.gitignore
@@ -0,0 +1 @@
+file_attr01
diff --git a/testcases/kernel/syscalls/file_attr/Makefile b/testcases/kernel/syscalls/file_attr/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3b19b0ce6be00839038c405eea027b0102761e45
--- /dev/null
+++ b/testcases/kernel/syscalls/file_attr/Makefile
@@ -0,0 +1,8 @@
+# Copyright (c) 2025 - Linaro Limited. All rights reserved.
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/file_attr/file_attr01.c b/testcases/kernel/syscalls/file_attr/file_attr01.c
new file mode 100644
index 0000000000000000000000000000000000000000..b1eae6a465ff9f036f3baf8914899729e7933005
--- /dev/null
+++ b/testcases/kernel/syscalls/file_attr/file_attr01.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * Verify that `file_getattr` and `file_setattr` syscalls are raising the
+ * correct errors according to the invalid input arguments. In particular:
+ *
+ * - EBADFD: Invalid file descriptor.
+ * - ENOENT: File doesn't exist
+ * - EFAULT: File name is NULL
+ * - EFAULT: File attributes is NULL
+ * - EINVAL: File attributes size is zero
+ * - E2BIG: File attributes size is too big
+ * - EINVAL: Invalid AT flags
+ */
+
+#include <string.h>
+#include "tst_test.h"
+#include "lapi/fs.h"
+#include "lapi/fcntl.h"
+
+#define MNTPOINT "mntpoint"
+#define FILENAME "ltp_file"
+#define NO_FILENAME "ltp_file_doesnt_exist"
+
+static int valid_dfd = -1;
+static int invalid_dfd = -1;
+static char *valid_filename;
+static char *invalid_filename;
+static char *null_ptr;
+static size_t zero;
+static size_t small_usize;
+static size_t valid_usize;
+static size_t big_usize;
+static struct file_attr *valid_file_attr;
+
+static struct tcase {
+	int *dfd;
+	char **filename;
+	struct file_attr **ufattr;
+	size_t *usize;
+	int at_flags;
+	int exp_errno;
+	char *msg;
+} tcases[] = {
+	{
+		.dfd = &invalid_dfd,
+		.filename = &valid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &valid_usize,
+		.exp_errno = EBADF,
+		.msg = "Invalid file descriptor",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &invalid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &valid_usize,
+		.exp_errno = ENOENT,
+		.msg = "File doesn't exist",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &null_ptr,
+		.ufattr = &valid_file_attr,
+		.usize = &valid_usize,
+		.exp_errno = EFAULT,
+		.msg = "Filename is NULL",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &valid_filename,
+		.ufattr = (struct file_attr **)(&null_ptr),
+		.usize = &valid_usize,
+		.exp_errno = EFAULT,
+		.msg = "File attributes is NULL",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &valid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &zero,
+		.exp_errno = EINVAL,
+		.msg = "File attributes size is zero",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &valid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &small_usize,
+		.exp_errno = EINVAL,
+		.msg = "File attributes size is too small",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &valid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &big_usize,
+		.exp_errno = E2BIG,
+		.msg = "File attributes size is too big",
+	},
+	{
+		.dfd = &valid_dfd,
+		.filename = &valid_filename,
+		.ufattr = &valid_file_attr,
+		.usize = &valid_usize,
+		.at_flags = -1,
+		.exp_errno = EINVAL,
+		.msg = "Invalid AT flags",
+	},
+};
+
+static void run(unsigned int i)
+{
+	struct tcase *tc = &tcases[i];
+
+	if (tst_variant) {
+		TST_EXP_FAIL(file_getattr(
+			*tc->dfd, *tc->filename,
+			*tc->ufattr, *tc->usize,
+			tc->at_flags),
+			tc->exp_errno,
+			"%s", tc->msg);
+	} else {
+		TST_EXP_FAIL(file_setattr(
+			*tc->dfd, *tc->filename,
+			*tc->ufattr, *tc->usize,
+			tc->at_flags),
+			tc->exp_errno,
+			"%s", tc->msg);
+	}
+}
+
+static void setup(void)
+{
+	valid_dfd = SAFE_OPEN(MNTPOINT, O_RDONLY);
+
+	SAFE_CHDIR(MNTPOINT);
+	SAFE_TOUCH(FILENAME, 0777, NULL);
+	SAFE_CHDIR("..");
+
+	valid_usize = FILE_ATTR_SIZE_LATEST;
+	small_usize = FILE_ATTR_SIZE_LATEST - 1;
+	big_usize = SAFE_SYSCONF(_SC_PAGESIZE) + 100;
+}
+
+static void cleanup(void)
+{
+	if (valid_dfd != -1)
+		SAFE_CLOSE(valid_dfd);
+}
+
+static struct tst_test test = {
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.mntpoint = MNTPOINT,
+	.needs_root = 1,
+	.mount_device = 1,
+	.all_filesystems = 1,
+	.test_variants = 2,
+	.skip_filesystems = (const char *const []) {
+		"fuse",
+		"ntfs",
+		"vfat",
+		"exfat",
+		NULL
+	},
+	.bufs = (struct tst_buffers []) {
+		{&valid_filename, .str = FILENAME},
+		{&invalid_filename, .str = NO_FILENAME},
+		{&valid_file_attr, .size = sizeof(struct file_attr)},
+		{}
+	}
+};

-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
