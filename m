Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDE8C63C7
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 11:36:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454853CF5AD
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 11:36:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ABD6D3CF672
 for <ltp@lists.linux.it>; Wed, 15 May 2024 11:33:58 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0B0702095EE
 for <ltp@lists.linux.it>; Wed, 15 May 2024 11:33:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDF8B339F3;
 Wed, 15 May 2024 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715765637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FBwUiHxgGuJToDPCl/CxD15WUb4m4zjOr/qjrAZEQA=;
 b=TH95tkKNx4x6wzVuBlVhZ4BcbvDwWHFzCxODSQV4t+YmtjwsFYrVmC0NescDYoLpGSEHgs
 d8LGRHv5J/jI7cBe6zd467+7ooLfNkK9Q5h04M6dirGZpZ5tFQ7/pXfenjDJKuSKMFzi4K
 CYDmbtvyjS2gT97+hYDP/Dclj+1w9T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715765637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FBwUiHxgGuJToDPCl/CxD15WUb4m4zjOr/qjrAZEQA=;
 b=pAjrjuIg6CxOaA96CqkbNmz1YUwXP0BnNcMkDTPVdMSCXoDHHwD4VfEGlT7xyO8ijcTQDZ
 okRopRRapORe9mDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u6ehjyWe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8w/6wL8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715765636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FBwUiHxgGuJToDPCl/CxD15WUb4m4zjOr/qjrAZEQA=;
 b=u6ehjyWeWVcpgPW7AL6ZyRX9JjR+SM/+7HejaRBadR7D/vjc/Px7jiiR4qvOMmPH9L5Er2
 ThNKguCzBqpiY1qDPpekocSTCV3RExo58awniDtkNHJDWN3RlUn4OISfDcgbqawElk4Arf
 BPxGd0Ye7F9rfsdzFLbHjYLGhWZqn60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715765636;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FBwUiHxgGuJToDPCl/CxD15WUb4m4zjOr/qjrAZEQA=;
 b=8w/6wL8zUUCMp0dvJhsd9YIDGpkVsPhSwi8F+X6z17SPdgseZAV0Q/9cZCZKFlkMCbz3zc
 493bsEltfODTQjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C86161372E;
 Wed, 15 May 2024 09:33:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wMH5LoSBRGb1TwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 15 May 2024 09:33:56 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 15 May 2024 11:33:46 +0200
Message-Id: <20240515093349.7347-8-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240515093349.7347-1-andrea.cervesato@suse.de>
References: <20240515093349.7347-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EDF8B339F3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1 07/10] Add statmount03 test
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

This test verifies that statmount() is correctly reading mount
information (mount id, parent mount id, mount attributes etc.)
using STATMOUNT_MNT_BASIC.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/statmount/.gitignore      |  1 +
 .../kernel/syscalls/statmount/statmount03.c   | 99 +++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 testcases/kernel/syscalls/statmount/statmount03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 5f1df42ca..116106521 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1539,6 +1539,7 @@ stat04_64 symlink01 -T stat04_64
 
 statmount01 statmount01
 statmount02 statmount02
+statmount03 statmount03
 
 statfs01 statfs01
 statfs01_64 statfs01_64
diff --git a/testcases/kernel/syscalls/statmount/.gitignore b/testcases/kernel/syscalls/statmount/.gitignore
index a30b9565f..2a02bf721 100644
--- a/testcases/kernel/syscalls/statmount/.gitignore
+++ b/testcases/kernel/syscalls/statmount/.gitignore
@@ -1,2 +1,3 @@
 statmount01
 statmount02
+statmount03
diff --git a/testcases/kernel/syscalls/statmount/statmount03.c b/testcases/kernel/syscalls/statmount/statmount03.c
new file mode 100644
index 000000000..6140940bd
--- /dev/null
+++ b/testcases/kernel/syscalls/statmount/statmount03.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/**
+ * [Description]
+ *
+ * This test verifies that statmount() is correctly reading mount information
+ * (mount id, parent mount id, mount attributes etc.) using STATMOUNT_MNT_BASIC.
+ *
+ * [Algorithm]
+ *
+ * * create a mount point
+ * * create a new parent folder inside the mount point and obtain its mount info
+ * * create the new "/" mount folder and obtain its mount info
+ * * run statmount() on the mount point using STATMOUNT_MNT_BASIC
+ * * read results and check if mount info are correct
+ */
+
+#include "statmount.h"
+#include "lapi/stat.h"
+#include "lapi/sched.h"
+
+#define MNTPOINT "mntpoint"
+#define MYPARENT MNTPOINT "/myroot"
+
+static uint64_t root_id;
+static uint64_t root_id_old;
+static uint64_t parent_id;
+static uint64_t parent_id_old;
+static struct statmount *st_mount;
+
+static void run(void)
+{
+	memset(st_mount, 0, sizeof(struct statmount));
+
+	TST_EXP_PASS(statmount(
+		root_id,
+		STATMOUNT_MNT_BASIC,
+		st_mount,
+		sizeof(struct statmount),
+		0));
+
+	if (TST_RET == -1)
+		return;
+
+	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_BASIC);
+	TST_EXP_EQ_LI(st_mount->size, sizeof(struct statmount));
+	TST_EXP_EQ_LI(st_mount->mnt_id, root_id);
+	TST_EXP_EQ_LI(st_mount->mnt_id_old, root_id_old);
+	TST_EXP_EQ_LI(st_mount->mnt_parent_id, parent_id);
+	TST_EXP_EQ_LI(st_mount->mnt_parent_id_old, parent_id_old);
+	TST_EXP_EQ_LI(st_mount->mnt_propagation, MS_PRIVATE);
+}
+
+static void setup(void)
+{
+	struct statx sx;
+
+	SAFE_UNSHARE(CLONE_NEWNS);
+	SAFE_MKDIR(MYPARENT, 0700);
+
+	SAFE_STATX(AT_FDCWD, MYPARENT, 0, STATX_MNT_ID_UNIQUE, &sx);
+	parent_id = sx.stx_mnt_id;
+
+	SAFE_STATX(AT_FDCWD, MYPARENT, 0, STATX_MNT_ID, &sx);
+	parent_id_old = sx.stx_mnt_id;
+
+	SAFE_MOUNT("", "/", NULL, MS_REC | MS_PRIVATE, NULL);
+	SAFE_MOUNT(MYPARENT, MYPARENT, NULL, MS_BIND, NULL);
+	SAFE_CHROOT(MYPARENT);
+	SAFE_CHDIR("/");
+
+	SAFE_STATX(AT_FDCWD, "/", 0, STATX_MNT_ID_UNIQUE, &sx);
+	root_id = sx.stx_mnt_id;
+
+	SAFE_STATX(AT_FDCWD, "/", 0, STATX_MNT_ID, &sx);
+	root_id_old = sx.stx_mnt_id;
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.min_kver = "6.8",
+	.needs_tmpdir = 1,
+	.format_device = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.skip_filesystems = (const char *const []) {
+		"fuse",
+		NULL
+	},
+	.bufs = (struct tst_buffers []) {
+		{&st_mount, .size = sizeof(struct statmount)},
+		{}
+	}
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
