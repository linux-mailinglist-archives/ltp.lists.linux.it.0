Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71656A0C7
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jul 2022 13:03:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FE423C97BE
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jul 2022 13:03:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF2C43C9AC7
 for <ltp@lists.linux.it>; Thu,  7 Jul 2022 13:03:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 353441A00719
 for <ltp@lists.linux.it>; Thu,  7 Jul 2022 13:03:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0B55221CF
 for <ltp@lists.linux.it>; Thu,  7 Jul 2022 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657191812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIm5TufeXHCLSc4TP7RCTaSxvT/xrpKhLYfnrPA3ibI=;
 b=aVaaJMNt6791oLcTfOnYAETJZ6M3W3PHIW3dgbmeROTIUAeQoHmxGLAjOGF3tOulJpadrp
 700BJJpyc+QcsSDvDhU7pXQ/O1qyjEKCjKWGf4OVQKOejbm7uWAa/gFdZxHxpGpZZ0bMWX
 3D01S6wjWwKgD/LSxiE1wAnBzyEzYUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657191812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIm5TufeXHCLSc4TP7RCTaSxvT/xrpKhLYfnrPA3ibI=;
 b=acgMqxAT8OOAZXDViSm41kmKArCQN+Jggs6HQYlx/vt0hgh5pWQtKdltNPRk9ucQaKaSoH
 /GQyxaRznaBqmaBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2022D13A33
 for <ltp@lists.linux.it>; Thu,  7 Jul 2022 11:03:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wuw5NIO9xmJbRwAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Thu, 07 Jul 2022 11:03:31 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu,  7 Jul 2022 16:33:13 +0530
Message-Id: <20220707110319.24665-4-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707110319.24665-1-akumar@suse.de>
References: <20220707110319.24665-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/9] Rewrite rename03.c using new LTP API
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/rename/rename03.c | 274 ++++----------------
 1 file changed, 56 insertions(+), 218 deletions(-)

diff --git a/testcases/kernel/syscalls/rename/rename03.c b/testcases/kernel/syscalls/rename/rename03.c
index 396e95c4d..fa2a0b266 100644
--- a/testcases/kernel/syscalls/rename/rename03.c
+++ b/testcases/kernel/syscalls/rename/rename03.c
@@ -1,230 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) International Business Machines  Corp., 2001
+ *  07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * NAME
- *	rename03
- *
- * DESCRIPTION
- *	This test will verify that rename(2) functions correctly
- *	when the "new" file or directory exists
- *
- * ALGORITHM
- *	Setup:
- *		Setup signal handling.
- *		Create temporary directory.
- *		Pause for SIGUSR1 if option specified.
+/*\
+ * [Description]
  *
- *	Test:
- *		Loop if the proper options are given.
- *              1.  both old and new file exist
- *                  create the "old" file and the "new" file
- *                  rename the "old" to the "new" file
- *                  verify the "new" file points to the "old" file
- *                  verify the "old" file does not exists
- *              2.  both old file and new directory exist
- *                  create the "old" and the "new" directory
- *                  rename the "old" to the "new" directory
- *                  verify the "new" points to the "old" directory
- *                  verify the "old" does not exists
- *	Cleanup:
- *		Print errno log and/or timing stats if options given
- *		Delete the temporary directory created.
- *
- * USAGE
- *	rename03 [-c n] [-f] [-i n] [-I x] [-p x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-f   : Turn off functionality Testing.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	None.
- */
-#include <sys/types.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <errno.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();
-void setup2();
-void cleanup();
-
-char *TCID = "rename03";
-int TST_TOTAL = 2;
-
-char fname[255], mname[255];
-char fdir[255], mdir[255];
-struct stat buf1, buf2;
-dev_t f_olddev, d_olddev;
-ino_t f_oldino, d_oldino;
-
-struct test_case_t {
-	char *name1;
-	char *name2;
-	char *desc;
-	dev_t *olddev;
-	ino_t *oldino;
-} TC[] = {
-	{
-	fname, mname, "file", &f_olddev, &f_oldino}, {
-	fdir, mdir, "directory", &d_olddev, &d_oldino}
-};
-
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-	/*
-	 * perform global setup for test
-	 */
-	setup();
-
-	/*
-	 * check looping state if -i option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* set up the files and directories for the tests */
-		setup2();
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(rename(TC[i].name1, TC[i].name2));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "call failed unexpectedly");
-				continue;
-			}
-
-			SAFE_STAT(cleanup, TC[i].name2, &buf2);
-
-			/*
-			 * verify the new file or directory is the
-			 * same as the old one
-			 */
-			if (buf2.st_dev != *TC[i].olddev ||
-			    buf2.st_ino != *TC[i].oldino) {
-				tst_resm(TFAIL, "rename() failed: the "
-					 "new %s points to a different "
-					 "inode/location", TC[i].desc);
-				continue;
-			}
-			/*
-			 * verify that the old file or directory
-			 * does not exist
-			 */
-			if (stat(fname, &buf2) != -1) {
-				tst_resm(TFAIL, "the old %s still "
-					 "exists", TC[i].desc);
-				continue;
-			}
-
-			tst_resm(TPASS, "functionality is correct "
-				 "for renaming a %s", TC[i].desc);
-		}
-
-		/* reset things in case we are looping */
-
-		/* unlink the new file */
-		SAFE_UNLINK(cleanup, mname);
-
-		/* remove the new directory */
-		SAFE_RMDIR(cleanup, mdir);
-	}
-
-	cleanup();
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
+ * Verify rename(2) functions correctly when the newpath
+ * file or directory (empty) exists.
  */
-void setup(void)
-{
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+#include <sys/stat.h>
+#include <stdio.h>
+#include "tst_test.h"
 
-	/* Create a temporary directory and make it current. */
-	tst_tmpdir();
+#define OLD_FILE_NAME "oldfile"
+#define NEW_FILE_NAME "newfile"
+#define OLD_DIR_NAME "olddir"
+#define NEW_DIR_NAME "newdir"
 
-	sprintf(fname, "./tfile_%d", getpid());
-	sprintf(mname, "./rnfile_%d", getpid());
-	sprintf(fdir, "./tdir_%d", getpid());
-	sprintf(mdir, "./rndir_%d", getpid());
-}
+static struct stat old_file_st, old_dir_st, new_file_st, new_dir_st;
 
-/*
- * setup2() - set up the files and directories for the tests
- */
-void setup2(void)
+static void run(void)
 {
-	SAFE_TOUCH(cleanup, fname, 0700, NULL);
-
-	SAFE_STAT(cleanup, fname, &buf1);
-
-	/* save original file's dev and ino */
-	f_olddev = buf1.st_dev;
-	f_oldino = buf1.st_ino;
-
-	SAFE_TOUCH(cleanup, mname, 0700, NULL);
-
-	/* create "old" directory */
-	SAFE_MKDIR(cleanup, fdir, 00770);
-	SAFE_STAT(cleanup, fdir, &buf1);
-
-	d_olddev = buf1.st_dev;
-	d_oldino = buf1.st_ino;
-
-	/* create another directory */
-	SAFE_MKDIR(cleanup, mdir, 00770);
+	SAFE_TOUCH(OLD_FILE_NAME, 0700, NULL);
+	SAFE_MKDIR(OLD_DIR_NAME, 00770);
+	SAFE_TOUCH(NEW_FILE_NAME, 0700, NULL);
+	SAFE_MKDIR(NEW_DIR_NAME, 00770);
+
+	SAFE_STAT(OLD_FILE_NAME, &old_file_st);
+	SAFE_STAT(OLD_DIR_NAME, &old_dir_st);
+
+	TST_EXP_PASS(rename(OLD_FILE_NAME, NEW_FILE_NAME),
+						"rename(%s, %s)",
+						OLD_FILE_NAME, NEW_FILE_NAME);
+	TST_EXP_PASS(rename(OLD_DIR_NAME, NEW_DIR_NAME),
+						"rename(%s, %s)",
+						OLD_DIR_NAME, NEW_DIR_NAME);
+
+	SAFE_STAT(NEW_FILE_NAME, &new_file_st);
+	SAFE_STAT(NEW_DIR_NAME, &new_dir_st);
+
+	TST_EXP_EQ_LI(old_file_st.st_dev, new_file_st.st_dev);
+	TST_EXP_EQ_LI(old_file_st.st_ino, new_file_st.st_ino);
+
+	TST_EXP_EQ_LI(old_dir_st.st_dev, new_dir_st.st_dev);
+	TST_EXP_EQ_LI(old_dir_st.st_ino, new_dir_st.st_ino);
+
+	TST_EXP_FAIL(stat(OLD_FILE_NAME, &old_file_st),
+				ENOENT,
+				"stat(%s, &old_file_st)",
+				OLD_FILE_NAME);
+	TST_EXP_FAIL(stat(OLD_DIR_NAME, &old_dir_st),
+				ENOENT,
+				"stat(%s, &old_dir_st)",
+				OLD_DIR_NAME);
+
+	SAFE_UNLINK(NEW_FILE_NAME);
+	SAFE_RMDIR(NEW_DIR_NAME);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- */
-void cleanup(void)
-{
-
-	/*
-	 * Remove the temporary directory.
-	 */
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1
+};
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
