Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2AF54FC19
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 19:20:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE0603C8C94
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 19:20:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD5C23C0675
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 19:20:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFECA1401143
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 19:20:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B54F1F8B4;
 Fri, 17 Jun 2022 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655486434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1AOPlQsL88H7KgjrCNanxyFvm/1x5a9tyYl+Q26nM8=;
 b=ncFPkBTTKKcKEUVajGGDAe0qgiV4bci4zpwr4VeU9CmHDnj8GowWKTJ5tr/v7tsi+FLGNA
 7C0vGdkVYJNTlk0DFKLNlBILsCH7927IupZSj7Bbre2IgIlaf86zO5dl2xJEfls2bxyBcT
 bPmyknGlbL2b3DO5Qua4orTpXlVskY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655486434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1AOPlQsL88H7KgjrCNanxyFvm/1x5a9tyYl+Q26nM8=;
 b=8XTuf6SJue65zH2pgdTl1zwX2wPn1NjIeh609ZOqMoQ8HgMmUglggHkZv7WORK5OlsHf35
 h26zFkFi/rtJ/3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 582DC1348E;
 Fri, 17 Jun 2022 17:20:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IaaoAeG3rGKIcwAAMHmgww
 (envelope-from <akumar@suse.de>); Fri, 17 Jun 2022 17:20:33 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 17 Jun 2022 22:50:20 +0530
Message-Id: <20220617172025.23975-2-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617172025.23975-1-akumar@suse.de>
References: <20220617172025.23975-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/6] Rewrite utime01.c using new LTP API
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
 testcases/kernel/syscalls/utime/utime01.c | 250 ++++------------------
 1 file changed, 45 insertions(+), 205 deletions(-)

diff --git a/testcases/kernel/syscalls/utime/utime01.c b/testcases/kernel/syscalls/utime/utime01.c
index 1e6862515..acdb07076 100644
--- a/testcases/kernel/syscalls/utime/utime01.c
+++ b/testcases/kernel/syscalls/utime/utime01.c
@@ -1,223 +1,63 @@
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
- * Test Name: utime01
- *
- * Test Description:
- *  Verify that the system call utime() successfully sets the modification
- *  and access times of a file to the current time, if the times argument
- *  is null, and the user ID of the process is "root".
- *
- * Expected Result:
- *  utime succeeds returning zero and sets the access and modification
- *  times of the file to the current time.
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
- *  utime01 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
- *		where,  -c n : Run n copies concurrently.
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
- *  This test should be run by 'super-user' (root) only.
- *
+/*\
+ * [Description]
+ *  Verify that the system call utime() successfully changes the last
+ *  access and modification times of a file to the current time if the
+ *  times argument is NULL and the user ID of the process is "root".
  */
 
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <fcntl.h>
 #include <utime.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <signal.h>
-#include <time.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define TEMP_FILE	"tmp_file"
-#define FILE_MODE	S_IRUSR | S_IRGRP | S_IROTH
 
-char *TCID = "utime01";
-int TST_TOTAL = 1;
-time_t curr_time;		/* current time in seconds */
+#include "tst_test.h"
+#include "tst_clocks.h"
 
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
+#define MNT_POINT	"mntpoint"
+#define TEMP_FILE	MNT_POINT"/tmp_file"
+#define FILE_MODE	0444
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	struct stat stat_buf;	/* struct buffer to hold file info. */
-	int lc;
-	long type;
-	time_t modf_time, access_time;
-	time_t pres_time;	/* file modification/access/present time */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	switch ((type = tst_fs_type(cleanup, "."))) {
-	case TST_NFS_MAGIC:
-		if (tst_kvercmp(2, 6, 18) < 0)
-			tst_brkm(TCONF, cleanup, "Cannot do utime on a file"
-				" on %s filesystem before 2.6.18",
-				 tst_fs_type_name(type));
-		break;
-	case TST_V9FS_MAGIC:
-		tst_brkm(TCONF, cleanup,
-			 "Cannot do utime on a file on %s filesystem",
-			 tst_fs_type_name(type));
-		break;
-	}
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Invoke utime(2) to set TEMP_FILE access and
-		 * modification times to the current time.
-		 */
-		TEST(utime(TEMP_FILE, NULL));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL|TTERRNO, "utime(%s) failed", TEMP_FILE);
-		} else {
-			/*
-			 * Sleep for a second so that mod time and
-			 * access times will be different from the
-			 * current time
-			 */
-			sleep(2);
-
-			/*
-			 * Get the current time now, after calling
-			 * utime(2)
-			 */
-			pres_time = time(NULL);
-
-			/*
-			 * Get the modification and access times of
-			 * temporary file using stat(2).
-			 */
-			SAFE_STAT(cleanup, TEMP_FILE, &stat_buf);
-			modf_time = stat_buf.st_mtime;
-			access_time = stat_buf.st_atime;
-
-			/* Now do the actual verification */
-			if (modf_time <= curr_time ||
-			    modf_time >= pres_time ||
-			    access_time <= curr_time ||
-			    access_time >= pres_time) {
-				tst_resm(TFAIL, "%s access and "
-					 "modification times not set",
-					 TEMP_FILE);
-			} else {
-				tst_resm(TPASS, "Functionality of "
-					 "utime(%s, NULL) successful",
-					 TEMP_FILE);
-			}
-		}
-		tst_count++;
-	}
-
-	cleanup();
-	tst_exit();
+	SAFE_TOUCH(TEMP_FILE, FILE_MODE, NULL);
 }
 
-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and change directory to it.
- *  Create a test file under temporary directory and close it
- */
-void setup(void)
+static void run(void)
 {
-	int fildes;		/* file handle for temp file */
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
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
-	/* Get the current time */
-	curr_time = time(NULL);
+	struct stat stat_buf;
+	time_t pre_time, post_time;
+
+	pre_time = tst_get_fs_timestamp();
+	TST_EXP_PASS(utime(TEMP_FILE, NULL), "utime(%s, NULL)", TEMP_FILE);
+	if (!TST_PASS) {
+		tst_res(TFAIL | TTERRNO, "utime(%s) failed", TEMP_FILE);
+		return;
+	}
+	post_time = tst_get_fs_timestamp();
+	SAFE_STAT(TEMP_FILE, &stat_buf);
 
-	/*
-	 * Sleep for a second so that mod time and access times will be
-	 * different from the current time
-	 */
-	sleep(2);		/* sleep(1) on IA64 sometimes sleeps < 1 sec!! */
+	if (stat_buf.st_mtime < pre_time || stat_buf.st_mtime > post_time)
+		tst_res(TFAIL, "utime() did not set expected mtime");
 
+	if (stat_buf.st_atime < pre_time || stat_buf.st_atime > post_time)
+		tst_res(TFAIL, "utime() did not set expected atime");
 }
 
-/*
- * void
- * cleanup() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- *  Remove the test directory and testfile created in the setup.
- */
-void cleanup(void)
-{
-
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.mntpoint = MNT_POINT,
+	.mount_device = 1,
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
