Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47092D7E1
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 19:58:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2DCE3D38BA
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2024 19:58:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A71673D3818
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 19:57:02 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BBC641A00FCD
 for <ltp@lists.linux.it>; Wed, 10 Jul 2024 19:57:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3B451FCD9;
 Wed, 10 Jul 2024 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720634220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uus/tkiwpYRYw+MQKPc4v2pWTru1cuQ9ronz7ToJEQ=;
 b=ZgiREe96tXvsRbIB59fivclInkVeq8nCImv/baaWkFe5iYkPVXKNEUtyl7fkV6dNqOw09G
 AIpqADLr9+8Qnvjk25UCf6Yljv61vfojZZEIvAjLDE3YhdKfbVpwu/80Uwo5yFCbhDc3Fm
 P0hPSE1NwGnR5tOimfDClw41tHuql+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720634220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uus/tkiwpYRYw+MQKPc4v2pWTru1cuQ9ronz7ToJEQ=;
 b=/0+iwvflx4J404BJop8ngCxwYAun/m7BRilPgPEldk1pi+eV/UcbfaJUdI0XPZkveG+QCR
 wnoUjepTKOjtaxCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZgiREe96;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/0+iwvfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720634220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uus/tkiwpYRYw+MQKPc4v2pWTru1cuQ9ronz7ToJEQ=;
 b=ZgiREe96tXvsRbIB59fivclInkVeq8nCImv/baaWkFe5iYkPVXKNEUtyl7fkV6dNqOw09G
 AIpqADLr9+8Qnvjk25UCf6Yljv61vfojZZEIvAjLDE3YhdKfbVpwu/80Uwo5yFCbhDc3Fm
 P0hPSE1NwGnR5tOimfDClw41tHuql+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720634220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uus/tkiwpYRYw+MQKPc4v2pWTru1cuQ9ronz7ToJEQ=;
 b=/0+iwvflx4J404BJop8ngCxwYAun/m7BRilPgPEldk1pi+eV/UcbfaJUdI0XPZkveG+QCR
 wnoUjepTKOjtaxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9543137D2;
 Wed, 10 Jul 2024 17:56:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EKrBM2vLjmaZegAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 10 Jul 2024 17:56:59 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 10 Jul 2024 19:56:45 +0200
MIME-Version: 1.0
Message-Id: <20240710-landlock-v2-7-478d8c2f6bab@suse.com>
References: <20240710-landlock-v2-0-478d8c2f6bab@suse.com>
In-Reply-To: <20240710-landlock-v2-0-478d8c2f6bab@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4212;
 i=andrea.cervesato@suse.com; h=from:subject:message-id;
 bh=/DPbW9WJA9B7SM9pvBVukc8X4nU69D6R+pJqeZjdNOA=;
 b=owEB7QES/pANAwAIAcvMGrIgs+ZGAcsmYgBmjstefglLY65iPnEfa7CAPOSw4NGftv/AHsol/
 xO89rpwFYiJAbMEAAEIAB0WIQT1ysFzUKRW0sIb39jLzBqyILPmRgUCZo7LXgAKCRDLzBqyILPm
 RqYVC/9LVlx2LrgcB8pK9Odo2HaiPV0P2SGjCTrneLLo3DqlbHIxvCUGRBM0khuaM+eax8rkre6
 5svWasBSQDN4INa1TvFYQoZnA7z7xc2iUqWHm4xHLFduanBlWVdkDhtL9x5YboTLkkHbqNONwe0
 ffEq+kFazo7BWGK/nLOvFuVr0ZUH6y5uZKKirnF+pz2jdspJjZ8SYKYzvWFcxOhKDdEYjTaVXK5
 wJuU9qsCistwu8XFYlJOfcELnDSmoLkzXdXeX+228j91Ay0uaMB6Cu0aMeF+HbEnu5IAKAenta6
 1vORZlEkPWzkeX96GcRcKnYjRF9pFRqnHr4pUUFlePKM9ItkP0f7Slv6xxlenlRCcVbn/as2qz/
 Ci9r0A1DdLgghSEHiLB2es7Uu2kTNmAQd2y9yvWzT+XBmYi6cpJqRJxp+mXwWCl0DCbhs+Bz2G3
 y4d+dMaDJAb87pqBLJ5l5DdbKVw7UuREGXfqo/o92DkU+WKw1uYz705bZh3NW4OHFM404=
X-Developer-Key: i=andrea.cervesato@suse.com; a=openpgp;
 fpr=F5CAC17350A456D2C21BDFD8CBCC1AB220B3E646
X-Rspamd-Queue-Id: F3B451FCD9
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.com:email];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 7/7] Add landlock06 test
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

This test verifies LANDLOCK_ACCESS_FS_IOCTL_DEV access in the
landlock sandbox by creating a pipe and testing that ioctl() can
be executed on it. The test is also verifying that some of the I/O
operations can be always executed no matter the sandbox rules.
This feature is available since kernel 6.10.

Reviewed-by: Li Wang <liwang@redhat.com>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                |   1 +
 testcases/kernel/syscalls/landlock/.gitignore   |   1 +
 testcases/kernel/syscalls/landlock/landlock06.c | 110 ++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index bb54538ed..e2d32895e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -689,6 +689,7 @@ landlock02 landlock02
 landlock03 landlock03
 landlock04 landlock04
 landlock05 landlock05
+landlock06 landlock06
 
 lchown01 lchown01
 lchown01_16 lchown01_16
diff --git a/testcases/kernel/syscalls/landlock/.gitignore b/testcases/kernel/syscalls/landlock/.gitignore
index a7ea6be2e..315ac1dca 100644
--- a/testcases/kernel/syscalls/landlock/.gitignore
+++ b/testcases/kernel/syscalls/landlock/.gitignore
@@ -4,3 +4,4 @@ landlock02
 landlock03
 landlock04
 landlock05
+landlock06
diff --git a/testcases/kernel/syscalls/landlock/landlock06.c b/testcases/kernel/syscalls/landlock/landlock06.c
new file mode 100644
index 000000000..3281c2d2d
--- /dev/null
+++ b/testcases/kernel/syscalls/landlock/landlock06.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test verifies LANDLOCK_ACCESS_FS_IOCTL_DEV access in the
+ * landlock sandbox by creating a pipe and testing that ioctl() can be executed
+ * on it. The test is also verifying that some of the I/O operations can be
+ * always executed no matter the sandbox rules.
+ */
+
+#include "landlock_common.h"
+#include <sys/ioctl.h>
+
+#define MNTPOINT "sandbox"
+#define FILENAME MNTPOINT"/fifo"
+
+static struct landlock_ruleset_attr *ruleset_attr;
+static struct landlock_path_beneath_attr *path_beneath_attr;
+static int file_fd;
+static int dev_fd;
+
+static void run(void)
+{
+	if (!SAFE_FORK()) {
+		int flag;
+		size_t sz = 0;
+
+		TST_EXP_PASS(ioctl(file_fd, FIONREAD, &sz));
+
+		/* check unrestrictable commands */
+		TST_EXP_PASS(ioctl(dev_fd, FIOCLEX));
+		TST_EXP_PASS(ioctl(dev_fd, FIONCLEX));
+		TST_EXP_PASS(ioctl(dev_fd, FIONBIO, &flag));
+		TST_EXP_PASS(ioctl(dev_fd, FIOASYNC, &flag));
+
+		_exit(0);
+	}
+}
+
+static void setup(void)
+{
+	int ruleset_fd;
+
+	verify_landlock_is_enabled();
+
+	SAFE_MKFIFO(FILENAME, 0640);
+
+	file_fd = SAFE_OPEN(FILENAME, O_RDONLY | O_NONBLOCK, 0640);
+	dev_fd = SAFE_OPEN("/dev/zero", O_RDONLY | O_NONBLOCK, 0640);
+
+	tst_res(TINFO, "Applying LANDLOCK_ACCESS_FS_IOCTL_DEV");
+
+	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_IOCTL_DEV;
+
+	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
+		ruleset_attr, sizeof(struct landlock_ruleset_attr), 0);
+
+	apply_landlock_layer(
+		ruleset_attr,
+		path_beneath_attr,
+		MNTPOINT,
+		LANDLOCK_ACCESS_FS_IOCTL_DEV
+	);
+
+	SAFE_CLOSE(ruleset_fd);
+}
+
+static void cleanup(void)
+{
+	if (dev_fd != -1)
+		SAFE_CLOSE(dev_fd);
+
+	if (file_fd != -1)
+		SAFE_CLOSE(file_fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.min_kver = "6.10",
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_SECURITY_LANDLOCK=y",
+		NULL
+	},
+	.bufs = (struct tst_buffers []) {
+		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{&path_beneath_attr, .size = sizeof(struct landlock_path_beneath_attr)},
+		{},
+	},
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
+		{}
+	},
+	.format_device = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.skip_filesystems = (const char *[]) {
+		"vfat",
+		NULL
+	},
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
