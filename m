Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF1651C03
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 08:57:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7BD83CBA8E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 08:57:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 258FE3CBA53
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 08:57:20 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7BEC0A0D128
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 08:57:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5369F3F8ED
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671523038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsJhYI/uWWZ+A4vJ9xWJMwlCCUoMn9gDcs6bsqMu9D0=;
 b=mTDgFo802S5UsmrCc5Wy2tGnjwJhJuSPz++WAgQFR/s2svxWUQVMCd4zsOOx7JUZ9PRGw4
 qiJRCTPWqBauTFP3YlGeRBObwfKshpbipGml3VLkJmpzVXKYUEoN5hmSM4W+Rz/jTVxZLt
 f7sPXsQQ6FXfiSe4rHaJtqTWpBNdQmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671523038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsJhYI/uWWZ+A4vJ9xWJMwlCCUoMn9gDcs6bsqMu9D0=;
 b=R/Idt1bTMM2jrlwdeUdIFwoAvW49J0mGhnYmVxpE3t8C4BEu6bi0VB9PrNHI6wN1URUPC+
 Ccz4nKG4/VQh36BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C62D913254
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 07:57:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2CZLId1qoWODdQAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 07:57:17 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Tue, 20 Dec 2022 13:27:14 +0530
Message-Id: <20221220075714.28762-1-akumar@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y5xF6PU5Yvh+oku5@pevik>
References: <Y5xF6PU5Yvh+oku5@pevik>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5] statvfs01: Convert to new LTP API
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

Removed the TINFO statements,
Added a validation of statvfs.f_namemax field by trying to create
files of valid and invalid length names.

Changes in v5:
Enabled file creation for vfat and exfat filesystems also.

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/statvfs/statvfs01.c | 109 +++++++-----------
 1 file changed, 40 insertions(+), 69 deletions(-)

diff --git a/testcases/kernel/syscalls/statvfs/statvfs01.c b/testcases/kernel/syscalls/statvfs/statvfs01.c
index e3b356c93..034835da7 100644
--- a/testcases/kernel/syscalls/statvfs/statvfs01.c
+++ b/testcases/kernel/syscalls/statvfs/statvfs01.c
@@ -1,92 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) Wipro Technologies Ltd, 2005.  All Rights Reserved.
  *    AUTHOR: Prashant P Yendigeri <prashant.yendigeri@wipro.com>
- *
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
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
-/*
- *    DESCRIPTION
- *      This is a Phase I test for the statvfs(2) system call.
- *      It is intended to provide a limited exposure of the system call.
- *	This call behaves similar to statfs.
+
+/*\
+ * [Description]
+ *
+ * Verify that statvfs() executes successfully for all
+ * available filesystems. Verify statvfs.f_namemax field
+ * by trying to create files of valid and invalid length names.
  */
 
-#include <stdio.h>
-#include <unistd.h>
-#include <errno.h>
 #include <sys/statvfs.h>
-#include <stdint.h>
-
-#include "test.h"
+#include "tst_test.h"
 
-#define TEST_PATH "/"
+#define MNT_POINT "mntpoint"
+#define TEST_PATH MNT_POINT"/testfile"
+#define NLS_MAX_CHARSET_SIZE 6
 
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "statvfs01";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void run(void)
 {
 	struct statvfs buf;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	char *valid_fname, *toolong_fname;
+	long fs_type;
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	fs_type = tst_fs_type(TEST_PATH);
 
-		tst_count = 0;
+	TST_EXP_PASS(statvfs(TEST_PATH, &buf));
 
-		TEST(statvfs(TEST_PATH, &buf));
+	toolong_fname = SAFE_MALLOC(buf.f_namemax + 1);
+	if (fs_type == TST_VFAT_MAGIC || fs_type == TST_EXFAT_MAGIC)
+		valid_fname = SAFE_MALLOC(buf.f_namemax / NLS_MAX_CHARSET_SIZE - 1);
+	else
+		valid_fname = SAFE_MALLOC(buf.f_namemax - 1);
 
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "statvfs(%s, ...) failed",
-				 TEST_PATH);
-		} else {
-			tst_resm(TPASS, "statvfs(%s, ...) passed", TEST_PATH);
-		}
+	memset(toolong_fname, 'b', buf.f_namemax + 1);
+	if (fs_type == TST_VFAT_MAGIC || fs_type == TST_EXFAT_MAGIC)
+		memset(valid_fname, 'a', buf.f_namemax / NLS_MAX_CHARSET_SIZE - 1);
+	else
+		memset(valid_fname, 'a', buf.f_namemax - 1);
 
-	}
+	TST_EXP_FD(creat(valid_fname, 0444));
+	SAFE_CLOSE(TST_RET);
 
-	tst_resm(TINFO, "This call is similar to statfs");
-	tst_resm(TINFO, "Extracting info about the '%s' file system",
-		 TEST_PATH);
-	tst_resm(TINFO, "file system block size = %lu bytes", buf.f_bsize);
-	tst_resm(TINFO, "file system fragment size = %lu bytes", buf.f_frsize);
-	tst_resm(TINFO, "file system free blocks = %ju",
-		 (uintmax_t) buf.f_bfree);
-	tst_resm(TINFO, "file system total inodes = %ju",
-		 (uintmax_t) buf.f_files);
-	tst_resm(TINFO, "file system free inodes = %ju",
-		 (uintmax_t) buf.f_ffree);
-	tst_resm(TINFO, "file system id = %lu", buf.f_fsid);
-	tst_resm(TINFO, "file system max filename length = %lu", buf.f_namemax);
-
-	cleanup();
-	tst_exit();
+	TST_EXP_FAIL(creat(toolong_fname, 0444), ENAMETOOLONG);
 }
 
 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	SAFE_TOUCH(TEST_PATH, 0666, NULL);
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNT_POINT,
+	.all_filesystems = 1
+};
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
