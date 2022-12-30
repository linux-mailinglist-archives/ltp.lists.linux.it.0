Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4F65516D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Dec 2022 15:37:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27113CB98D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Dec 2022 15:37:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5692C3CB971
 for <ltp@lists.linux.it>; Fri, 23 Dec 2022 15:36:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6CFCA100117C
 for <ltp@lists.linux.it>; Fri, 23 Dec 2022 15:36:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7710720958
 for <ltp@lists.linux.it>; Fri, 23 Dec 2022 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671806215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NhkgijfcBBx5b+lmWutgEQ3Dtf58iHF15Lm2rQMRHF8=;
 b=RDTzkOg5vYPU7aty3GNROHO/PC/HHAUQb4pKvgAzKbsKNJblJ1q3qqYYhJcYlfsV4Xp8Tt
 5NgfZmSRB9xukX2CJxGzxgaldUzQQDgzN8ilYdFRo0ry10LIeKmCtqdPHbfFPs5QwPMZam
 Bc3onZdClM8UqqRrFGvSJFcww42jojM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671806215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NhkgijfcBBx5b+lmWutgEQ3Dtf58iHF15Lm2rQMRHF8=;
 b=zQlAq6l3aE7DHHMhmF0uFTD9XrgOID94RGSIcUkfR88qcy2v+dsnYkmiRhYCRFUVuv0aPp
 9hV/Oa+vy+gkZVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA91E138E4
 for <ltp@lists.linux.it>; Fri, 23 Dec 2022 14:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KC+SKga9pWN7bgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Fri, 23 Dec 2022 14:36:54 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 23 Dec 2022 20:06:52 +0530
Message-Id: <20221223143652.32232-1-akumar@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6] statvfs01: Convert to new LTP API
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

changes in v6:
add variable for file name length.
use static buffers of PATH_MAX length to avoid memory leak.

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/statvfs/statvfs01.c | 105 ++++++------------
 1 file changed, 36 insertions(+), 69 deletions(-)

diff --git a/testcases/kernel/syscalls/statvfs/statvfs01.c b/testcases/kernel/syscalls/statvfs/statvfs01.c
index e3b356c93..dd14d6a0e 100644
--- a/testcases/kernel/syscalls/statvfs/statvfs01.c
+++ b/testcases/kernel/syscalls/statvfs/statvfs01.c
@@ -1,92 +1,59 @@
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
+	char valid_fname[PATH_MAX], toolong_fname[PATH_MAX];
+	long fs_type;
+	long valid_len;
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	fs_type = tst_fs_type(TEST_PATH);
 
-		tst_count = 0;
+	TST_EXP_PASS(statvfs(TEST_PATH, &buf));
 
-		TEST(statvfs(TEST_PATH, &buf));
+	valid_len = buf.f_namemax;
+	if (fs_type == TST_VFAT_MAGIC || fs_type == TST_EXFAT_MAGIC)
+		valid_len = buf.f_namemax / NLS_MAX_CHARSET_SIZE;
 
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "statvfs(%s, ...) failed",
-				 TEST_PATH);
-		} else {
-			tst_resm(TPASS, "statvfs(%s, ...) passed", TEST_PATH);
-		}
+	memset(valid_fname, 'a', valid_len);
+	memset(toolong_fname, 'b', valid_len + 1);
 
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
