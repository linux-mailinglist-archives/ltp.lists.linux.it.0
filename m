Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C838C63C9
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 11:36:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CDA23CF887
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2024 11:36:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28A193CF731
 for <ltp@lists.linux.it>; Wed, 15 May 2024 11:33:59 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6E0DF1408701
 for <ltp@lists.linux.it>; Wed, 15 May 2024 11:33:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61E762048A;
 Wed, 15 May 2024 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715765637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sn0di5rzGd5SNhnR2+1IKOwEvEyw0VZYX9AkcXoGUO8=;
 b=VObkzQOsLVHNGfurX/zjJFQZCvcMMIet5t8vw+gf3x30Az4V/P29m5WU3pPvlXGkjJlUFg
 LKMBgUOO1WQz0E6tj6fPCtF+Vuia4EQMYYoSZkuq0lGowUlygi/lnQf0WvWRJDLQUDnIQC
 EafpbA2P8Tr17+kuAnBfwfEpHJLeons=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715765637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sn0di5rzGd5SNhnR2+1IKOwEvEyw0VZYX9AkcXoGUO8=;
 b=onFSnV+QEzU50s3gsd93Csr3+egzmRjjSZVs0mfDI9uvTZ/xoQ7JgYtH5zsPE8RAssCWII
 jMVb3yYM13Hb1QBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VObkzQOs;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=onFSnV+Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715765637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sn0di5rzGd5SNhnR2+1IKOwEvEyw0VZYX9AkcXoGUO8=;
 b=VObkzQOsLVHNGfurX/zjJFQZCvcMMIet5t8vw+gf3x30Az4V/P29m5WU3pPvlXGkjJlUFg
 LKMBgUOO1WQz0E6tj6fPCtF+Vuia4EQMYYoSZkuq0lGowUlygi/lnQf0WvWRJDLQUDnIQC
 EafpbA2P8Tr17+kuAnBfwfEpHJLeons=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715765637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sn0di5rzGd5SNhnR2+1IKOwEvEyw0VZYX9AkcXoGUO8=;
 b=onFSnV+QEzU50s3gsd93Csr3+egzmRjjSZVs0mfDI9uvTZ/xoQ7JgYtH5zsPE8RAssCWII
 jMVb3yYM13Hb1QBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39BCE1372E;
 Wed, 15 May 2024 09:33:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mPOuC4WBRGb1TwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 15 May 2024 09:33:57 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed, 15 May 2024 11:33:48 +0200
Message-Id: <20240515093349.7347-10-andrea.cervesato@suse.de>
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
X-Rspamd-Queue-Id: 61E762048A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1 09/10] Add statmount05 test
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

This test verifies STATMOUNT_MNT_ROOT and STATMOUNT_MNT_POINT
functionalities of statmount().

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/statmount/.gitignore      |   1 +
 .../kernel/syscalls/statmount/statmount05.c   | 138 ++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 testcases/kernel/syscalls/statmount/statmount05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 3c262ca3e..2984117e6 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1541,6 +1541,7 @@ statmount01 statmount01
 statmount02 statmount02
 statmount03 statmount03
 statmount04 statmount04
+statmount05 statmount05
 
 statfs01 statfs01
 statfs01_64 statfs01_64
diff --git a/testcases/kernel/syscalls/statmount/.gitignore b/testcases/kernel/syscalls/statmount/.gitignore
index e720050b5..f64763242 100644
--- a/testcases/kernel/syscalls/statmount/.gitignore
+++ b/testcases/kernel/syscalls/statmount/.gitignore
@@ -2,3 +2,4 @@ statmount01
 statmount02
 statmount03
 statmount04
+statmount05
diff --git a/testcases/kernel/syscalls/statmount/statmount05.c b/testcases/kernel/syscalls/statmount/statmount05.c
new file mode 100644
index 000000000..9882719f5
--- /dev/null
+++ b/testcases/kernel/syscalls/statmount/statmount05.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/**
+ * [Description]
+ *
+ * This test verifies STATMOUNT_MNT_ROOT and STATMOUNT_MNT_POINT functionalities
+ * of statmount(). In particular, STATMOUNT_MNT_ROOT will give the mount root
+ * (i.e. mount --bind /mnt /bla -> /mnt) and STATMOUNT_MNT_POINT will
+ * give the mount point (i.e. mount --bind /mnt /bla -> /bla).
+ *
+ * [Algorithm]
+ *
+ * * create a mount point
+ * * mount a folder inside the mount point
+ * * run statmount() on the mounted folder using STATMOUNT_MNT_ROOT
+ * * read results and check if contain the mount root path
+ * * run statmount() on the mounted folder using STATMOUNT_MNT_POINT
+ * * read results and check if contain the mount point path
+ */
+
+#include "statmount.h"
+#include "lapi/stat.h"
+#include "lapi/sched.h"
+
+#define MNTPOINT "mntpoint"
+#define DIRA MNTPOINT "/LTP_DIR_A"
+#define DIRB MNTPOINT "/LTP_DIR_B"
+#define SM_SIZE (1 << 10)
+
+static uint64_t root_id;
+static struct statmount *st_mount;
+static char mnt_root[PATH_MAX];
+static char mnt_point[PATH_MAX];
+
+static void test_mount_root(void)
+{
+	tst_res(TINFO, "Testing STATMOUNT_MNT_ROOT");
+
+	char *last_root;
+
+	memset(st_mount, 0, SM_SIZE);
+
+	TST_EXP_PASS(statmount(
+		root_id,
+		STATMOUNT_MNT_ROOT,
+		st_mount,
+		SM_SIZE,
+		0));
+
+	if (TST_RET == -1)
+		return;
+
+	last_root = strrchr(mnt_root, '/');
+
+	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_ROOT);
+	TST_EXP_EXPR(strcmp(st_mount->str + st_mount->mnt_root, last_root) == 0,
+		"statmount() read '%s', expected '%s'",
+		st_mount->str + st_mount->mnt_root,
+		last_root);
+}
+
+static void test_mount_point(void)
+{
+	tst_res(TINFO, "Testing STATMOUNT_MNT_POINT");
+
+	memset(st_mount, 0, SM_SIZE);
+
+	TST_EXP_POSITIVE(statmount(
+		root_id,
+		STATMOUNT_MNT_POINT,
+		st_mount,
+		SM_SIZE,
+		0));
+
+	if (TST_RET == -1)
+		return;
+
+	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_POINT);
+	TST_EXP_EXPR(strcmp(st_mount->str + st_mount->mnt_point, mnt_point) == 0,
+		"mount point is '%s'",
+		st_mount->str + st_mount->mnt_point);
+}
+
+static void run(void)
+{
+	test_mount_root();
+	test_mount_point();
+}
+
+static void setup(void)
+{
+	char *tmpdir;
+	struct statx sx;
+
+	tmpdir = tst_get_tmpdir();
+	snprintf(mnt_root, PATH_MAX, "%s/%s", tmpdir, DIRA);
+	snprintf(mnt_point, PATH_MAX, "%s/%s", tmpdir, DIRB);
+	free(tmpdir);
+
+	SAFE_MKDIR(mnt_root, 0700);
+	SAFE_MKDIR(mnt_point, 0700);
+	SAFE_MOUNT(mnt_root, mnt_point, "none", MS_BIND, NULL);
+
+	SAFE_STATX(AT_FDCWD, mnt_point, 0, STATX_MNT_ID_UNIQUE, &sx);
+	root_id = sx.stx_mnt_id;
+}
+
+static void cleanup(void)
+{
+	if (tst_is_mounted(DIRB))
+		SAFE_UMOUNT(DIRB);
+
+	if (tst_is_mounted(DIRA))
+		SAFE_UMOUNT(DIRA);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
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
+		{&st_mount, .size = SM_SIZE},
+		{}
+	}
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
