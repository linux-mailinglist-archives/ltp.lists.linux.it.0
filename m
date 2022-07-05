Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 981DF566353
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 08:44:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C4013CA073
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 08:44:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 556483C649E
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 08:44:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C7D0B6008B0
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 08:44:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BDDB1FF79
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 06:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657003441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xq/uJKQC+Y+6VwZFo/0P33FTMcY2bmqYPTc6a2kx62U=;
 b=SK56AuZV33thqPPoL9KFyr4donO9iHLyheyXQljo5QKvIdpln77PyPITvazxfiVSE+6sEj
 NRAqg0bhyMGLqvLDgQhwoWGNsogsttjQbobpw4Q/JMBLKIJYCs+75EI0A61tm9LLJqvOra
 /DjR8PChKcmo3OsCzRVyShRsBiQFHZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657003441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xq/uJKQC+Y+6VwZFo/0P33FTMcY2bmqYPTc6a2kx62U=;
 b=H6jldavwh0kwdug8sE2oRPUTttYevi1qTkJrXpM3VnqvS0ZszMDRbCJbFq+jx/WtS54Lqa
 tqtZDrgAJgiJZABw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D6EF13A79
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 06:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JPFOF7Ddw2LGIwAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Tue, 05 Jul 2022 06:44:00 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Tue,  5 Jul 2022 12:13:58 +0530
Message-Id: <20220705064358.4683-1-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Rewrite utime05.c using new LTP API
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

Converted to new LTP API and enabled the test to run on all filesystems
skipping vfat and exfat.

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/utime/utime05.c | 229 +++++-----------------
 1 file changed, 54 insertions(+), 175 deletions(-)

diff --git a/testcases/kernel/syscalls/utime/utime05.c b/testcases/kernel/syscalls/utime/utime05.c
index b2d2450bf..7ee6861c5 100644
--- a/testcases/kernel/syscalls/utime/utime05.c
+++ b/testcases/kernel/syscalls/utime/utime05.c
@@ -1,200 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
  *   Copyright (c) International Business Machines  Corp., 2001
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
+ *		07/2001 ported by John George
+ *   Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test Name: utime05
- *
- * Test Description:
- *  Verify that the system call utime() successfully sets the modification
- *  and access times of a file to the value specified by the times argument
- *  under the following constraints,
- *		- The times argument is not null,
- *		- The user ID of the process is not "root".
- *		- The file is owned by the user ID of the process.
- *
- * Expected Result:
- *  utime succeeds returning zero and sets the access and modification
- *  times of the file to that specified by the times argument.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *	Verify the Functionality of system call
- *      if successful,
- *		Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *   Delete the temporary directory created.
- *
- * Usage:  <for command-line>
- *  utime05 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
- *		where,	-c n : Run n copies concurrently.
- *			-e   : Turn on errno logging.
- *			-f   : Turn off functionality Testing.
- *			-i n : Execute test n times.
- *			-I x : Execute test for x seconds.
- *			-P x : Pause for x seconds between iterations.
- *			-t   : Turn on syscall timing.
- *
- * History
- *	07/2001 John George
- *		-Ported
- *
- * Restrictions:
+/*\
+ * [Description]
  *
+ * Verify that the system call utime() successfully changes the last
+ * access and modification times of a file to the values specified by
+ * times argument, under the following constraints:
+ * - The times argument is not NULL.
+ * - The user ID of the process is not "root".
+ * - The file is owned by the user ID of the process.
  */
 
-#include <stdio.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
 #include <utime.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <signal.h>
 #include <pwd.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
-#define TEMP_FILE	"tmp_file"
-#define FILE_MODE	S_IRUSR | S_IRGRP | S_IROTH
-#define NEW_TIME	10000
+#define MNT_POINT	"mntpoint"
+#define TEMP_FILE	MNT_POINT"/tmp_file"
 
-char *TCID = "utime05";
-int TST_TOTAL = 1;
+#define FILE_MODE	0444
+#define MODE_RWX	0777
+#define NEW_MODF_TIME	10000
+#define NEW_ACCESS_TIME	20000
 
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+#define TEST_USERNAME "nobody"
 
-struct utimbuf times;		/* struct. buffer for utime() */
+static struct utimbuf times = {
+	.modtime = NEW_MODF_TIME,
+	.actime = NEW_ACCESS_TIME
+};
 
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	struct stat stat_buf;	/* struct buffer to hold file info. */
-	int lc;
-	time_t modf_time, access_time;
-	/* file modification/access time */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Invoke utime(2) to set TEMP_FILE access and
-		 * modification times to that specified by
-		 * times argument.
-		 */
-		TEST(utime(TEMP_FILE, &times));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL|TTERRNO, "utime(%s) failed", TEMP_FILE);
-		} else {
-			/*
-			 * Get the modification and access times of
-			 * temporary file using stat(2).
-			 */
-			SAFE_STAT(cleanup, TEMP_FILE, &stat_buf);
-			modf_time = stat_buf.st_mtime;
-			access_time = stat_buf.st_atime;
-
-			/* Now do the actual verification */
-			if ((modf_time != NEW_TIME) ||
-			    (access_time != NEW_TIME)) {
-				tst_resm(TFAIL, "%s access and "
-					 "modification times not set",
-					 TEMP_FILE);
-			} else {
-				tst_resm(TPASS, "Functionality of "
-					 "utime(%s, &times) successful",
-					 TEMP_FILE);
-			}
-		}
-		tst_count++;	/* incr TEST_LOOP counter */
-	}
+	struct passwd *pw;
 
-	cleanup();
-	tst_exit();
-}
+	SAFE_CHMOD(MNT_POINT, MODE_RWX);
 
-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and change directory to it.
- *  Create a test file under temporary directory and close it
- */
-void setup(void)
-{
-	int fildes;		/* file handle for temp file */
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	/* Switch to nobody user for correct error code collection */
-	ltpuser = SAFE_GETPWNAM(NULL, nobody_uid);
-	SAFE_SETUID(NULL, ltpuser->pw_uid);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* Creat a temporary file under above directory */
-	fildes = SAFE_CREAT(cleanup, TEMP_FILE, FILE_MODE);
-
-	/* Close the temporary file created */
-	SAFE_CLOSE(cleanup, fildes);
-
-	/* Initialize the modification and access time in the times arg */
-	times.actime = NEW_TIME;
-	times.modtime = NEW_TIME;
+	pw = SAFE_GETPWNAM(TEST_USERNAME);
+	tst_res(TINFO, "Switching effective user ID to user: %s", pw->pw_name);
+	SAFE_SETEUID(pw->pw_uid);
 
+	SAFE_TOUCH(TEMP_FILE, FILE_MODE, NULL);
 }
 
-/*
- * void
- * cleanup() -	performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- *		Remove the test directory and testfile created in the setup.
- */
-void cleanup(void)
+static void run(void)
 {
+	struct stat stat_buf;
 
-	tst_rmdir();
+	TST_EXP_PASS(utime(TEMP_FILE, &times), "utime(%s, &times)", TEMP_FILE);
+	if (!TST_PASS)
+		return;
 
+	SAFE_STAT(TEMP_FILE, &stat_buf);
+
+	TST_EXP_EQ_LI(stat_buf.st_mtime, NEW_MODF_TIME);
+	TST_EXP_EQ_LI(stat_buf.st_atime, NEW_ACCESS_TIME);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.mount_device = 1,
+	.mntpoint = MNT_POINT,
+	.all_filesystems = 1,
+	.skip_filesystems = (const char *const[]) {
+		"vfat",
+		"exfat",
+		NULL
+	}
+};
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
