Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DC99449D
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 11:45:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8EF13C1B62
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 11:45:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B17C3C182E
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 11:42:39 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C144220828B
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 11:42:38 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E8AD1FDC5
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728380557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQmRU5xnbY8RBm9MuuZC2bJL3ccFGySdvdt42Z+DDCg=;
 b=Hd+ololvEvrAeQwpPEEfrfHMxqlLSXTQYplkl5QXiP93tzqe9NNS47o7hbjXiBtllBsaUq
 cuA7Bcv+ART+AxpbGpg75JgaQjTsS9UDi9iNTx4bhDZMEbK2w5daRnHlla4H9YgIDKayQ6
 J4bL8ffmY/V7uAs/ePU7kK7tRWhdy3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728380557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQmRU5xnbY8RBm9MuuZC2bJL3ccFGySdvdt42Z+DDCg=;
 b=msrF4hUcongx+K10G5ASGc3UtRqeQGE2BJCLi/Z/BE6eDveTJVXHHx7J95/37E6X96BGNI
 OY5GITi446JD35Bg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hd+ololv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=msrF4hUc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728380557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQmRU5xnbY8RBm9MuuZC2bJL3ccFGySdvdt42Z+DDCg=;
 b=Hd+ololvEvrAeQwpPEEfrfHMxqlLSXTQYplkl5QXiP93tzqe9NNS47o7hbjXiBtllBsaUq
 cuA7Bcv+ART+AxpbGpg75JgaQjTsS9UDi9iNTx4bhDZMEbK2w5daRnHlla4H9YgIDKayQ6
 J4bL8ffmY/V7uAs/ePU7kK7tRWhdy3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728380557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQmRU5xnbY8RBm9MuuZC2bJL3ccFGySdvdt42Z+DDCg=;
 b=msrF4hUcongx+K10G5ASGc3UtRqeQGE2BJCLi/Z/BE6eDveTJVXHHx7J95/37E6X96BGNI
 OY5GITi446JD35Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2A7B1340C
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 09:42:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CJH2M4z+BGcZPAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>)
 for <ltp@lists.linux.it>; Tue, 08 Oct 2024 09:42:36 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 08 Oct 2024 11:42:04 +0200
MIME-Version: 1.0
Message-Id: <20241008-listmount_statmount-v5-11-66f4e1a9e7db@suse.com>
References: <20241008-listmount_statmount-v5-0-66f4e1a9e7db@suse.com>
In-Reply-To: <20241008-listmount_statmount-v5-0-66f4e1a9e7db@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728380526; l=4344;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=7Nq/UQ5crV1H6JQyZAbPSTUgpMEN1JwtEviS5vDP84k=;
 b=Qd378GVAF4cjw/ex7cj2II+pVyKM5CoR5vcbfdTrw7TJmZVPRNQDW4LGudC46wMmyumY8oDUn
 f9Lxtq2HqLXDaVzBEqZSSgq2VKllXZ4+Hq53JIRJOry17F4yHwKMQ3I
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 7E8AD1FDC5
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_ONE(0.00)[1];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:mid];
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
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 11/16] Add statmount05 test
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
 runtest/syscalls                                  |   1 +
 testcases/kernel/syscalls/statmount/.gitignore    |   1 +
 testcases/kernel/syscalls/statmount/statmount05.c | 123 ++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index 452ac1ac9..97c7049a2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1578,6 +1578,7 @@ statmount01 statmount01
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
index 000000000..95e674c06
--- /dev/null
+++ b/testcases/kernel/syscalls/statmount/statmount05.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test verifies STATMOUNT_MNT_ROOT and STATMOUNT_MNT_POINT functionalities
+ * of statmount(). In particular, STATMOUNT_MNT_ROOT will give the mount root
+ * (i.e. mount --bind /mnt /bla -> /mnt) and STATMOUNT_MNT_POINT will
+ * give the mount point (i.e. mount --bind /mnt /bla -> /bla).
+ *
+ * [Algorithm]
+ *
+ * - create a mount point
+ * - mount a folder inside the mount point
+ * - run statmount() on the mounted folder using STATMOUNT_MNT_ROOT
+ * - read results and check if contain the mount root path
+ * - run statmount() on the mounted folder using STATMOUNT_MNT_POINT
+ * - read results and check if contain the mount point path
+ */
+
+#define _GNU_SOURCE
+
+#include "statmount.h"
+#include "lapi/stat.h"
+#include "lapi/sched.h"
+#include "tst_tmpdir.h"
+
+#define MNTPOINT "mntpoint"
+#define DIRA MNTPOINT "/LTP_DIR_A"
+#define DIRB MNTPOINT "/LTP_DIR_B"
+#define SM_SIZE (1 << 10)
+
+static uint64_t root_id;
+static struct statmount *st_mount;
+static char *mnt_root;
+static char *mnt_point;
+
+static void test_mount_root(void)
+{
+	tst_res(TINFO, "Testing STATMOUNT_MNT_ROOT");
+
+	char *last_root;
+
+	memset(st_mount, 0, SM_SIZE);
+
+	TST_EXP_PASS(statmount(root_id, STATMOUNT_MNT_ROOT, st_mount,
+		SM_SIZE, 0));
+
+	if (!TST_PASS)
+		return;
+
+	last_root = strrchr(mnt_root, '/');
+
+	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_ROOT);
+	TST_EXP_EQ_STR(st_mount->str + st_mount->mnt_root, last_root);
+}
+
+static void test_mount_point(void)
+{
+	tst_res(TINFO, "Testing STATMOUNT_MNT_POINT");
+
+	memset(st_mount, 0, SM_SIZE);
+
+	TST_EXP_POSITIVE(statmount(root_id, STATMOUNT_MNT_POINT, st_mount,
+		SM_SIZE, 0));
+
+	if (!TST_PASS)
+		return;
+
+	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_POINT);
+	TST_EXP_EQ_STR(st_mount->str + st_mount->mnt_point, mnt_point);
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
+	struct ltp_statx sx;
+
+	mnt_root = tst_tmpdir_genpath(DIRA);
+	mnt_point = tst_tmpdir_genpath(DIRB);
+
+	SAFE_MKDIR(mnt_root, 0700);
+	SAFE_MKDIR(mnt_point, 0700);
+	SAFE_MOUNT(mnt_root, mnt_point, "none", MS_BIND, NULL);
+
+	SAFE_STATX(AT_FDCWD, mnt_point, 0, STATX_MNT_ID_UNIQUE, &sx);
+	root_id = sx.data.stx_mnt_id;
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
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
