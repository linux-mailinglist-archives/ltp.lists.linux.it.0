Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0B7F73DC
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Nov 2023 13:31:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BA3C3CDE6A
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Nov 2023 13:31:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 094743CCB8A
 for <ltp@lists.linux.it>; Fri, 24 Nov 2023 13:31:22 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4BF7F256FE2
 for <ltp@lists.linux.it>; Fri, 24 Nov 2023 13:31:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0FE021FD90;
 Fri, 24 Nov 2023 12:31:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE3231340B;
 Fri, 24 Nov 2023 12:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /h2IL5eXYGV3IgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 24 Nov 2023 12:31:19 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 24 Nov 2023 13:31:17 +0100
Message-Id: <20231124123118.20441-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam-Score: 7.78
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: 0FE021FD90
Authentication-Results: smtp-out2.suse.de; dkim=none;
 dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de
 (policy=none); 
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither
 permitted nor denied by domain of andrea.cervesato@suse.de)
 smtp.mailfrom=andrea.cervesato@suse.de
X-Spamd-Result: default: False [7.78 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(4.60)[~all:c]; NEURAL_HAM_LONG(-0.89)[-0.889];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWO(0.00)[2]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 NEURAL_HAM_SHORT(-0.12)[-0.608];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Refactor mount01 test using new LTP API
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/mount/mount01.c | 115 ++++++----------------
 1 file changed, 32 insertions(+), 83 deletions(-)

diff --git a/testcases/kernel/syscalls/mount/mount01.c b/testcases/kernel/syscalls/mount/mount01.c
index 1d902ba89..b757d826a 100644
--- a/testcases/kernel/syscalls/mount/mount01.c
+++ b/testcases/kernel/syscalls/mount/mount01.c
@@ -1,99 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
+ *               Nirmala Devi Dhanasekar <nirmala.devi@wipro.com>
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- *    AUTHOR		: Nirmala Devi Dhanasekar <nirmala.devi@wipro.com>
- *
- *    DESCRIPTION
- *	This is a Phase I test for the mount(2) system call.
- *	It is intended to provide a limited exposure of the system call.
+ * Basic test that checks `mount` syscall works on multiple filesystems.
  */
 
-#include <errno.h>
+#include "tst_test.h"
 #include <sys/mount.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include "test.h"
-#include "safe_macros.h"
-
-static void setup(void);
-static void cleanup(void);
 
-char *TCID = "mount01";
-int TST_TOTAL = 1;
-
-#define DIR_MODE (S_IRWXU | S_IRUSR | S_IXUSR | S_IRGRP | S_IXGRP)
 #define MNTPOINT "mntpoint"
 
-static const char *device;
-static const char *fs_type;
-
-int main(int ac, char **av)
+static void cleanup(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(mount(device, MNTPOINT, fs_type, 0, NULL));
-
-		if (TEST_RETURN != 0) {
-			tst_resm(TFAIL | TTERRNO, "mount(2) failed");
-		} else {
-			tst_resm(TPASS, "mount(2) passed ");
-			TEST(tst_umount(MNTPOINT));
-			if (TEST_RETURN != 0) {
-				tst_brkm(TBROK | TTERRNO, cleanup,
-					 "umount(2) failed");
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	if (tst_is_mounted(MNTPOINT))
+		SAFE_UMOUNT(MNTPOINT);
 }
 
-static void setup(void)
+static void run(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	tst_tmpdir();
-
-	fs_type = tst_dev_fs_type();
-	device = tst_acquire_device(cleanup);
-
-	if (!device)
-		tst_brkm(TCONF, cleanup, "Failed to obtain block device");
+	TST_EXP_PASS(mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL));
 
-	tst_mkfs(cleanup, device, fs_type, NULL, NULL);
-
-	SAFE_MKDIR(cleanup, MNTPOINT, DIR_MODE);
-
-	TEST_PAUSE;
+	if (tst_is_mounted(MNTPOINT))
+		SAFE_UMOUNT(MNTPOINT);
 }
 
-static void cleanup(void)
-{
-	if (device)
-		tst_release_device(device);
-
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_root = 1,
+	.needs_device = 1,
+	.needs_tmpdir = 1,
+	.format_device = 1,
+	.all_filesystems = 1,
+	.mntpoint = MNTPOINT,
+	.skip_filesystems = (const char *const []){
+		"exfat",
+		"vfat",
+		"ntfs",
+		NULL
+	},
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
