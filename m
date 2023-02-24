Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7816A16A7
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Feb 2023 07:37:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27C1D3CBB51
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Feb 2023 07:37:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7378F3CBB14
 for <ltp@lists.linux.it>; Fri, 24 Feb 2023 07:37:24 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 97D961A00E7F
 for <ltp@lists.linux.it>; Fri, 24 Feb 2023 07:37:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5B5E5D884
 for <ltp@lists.linux.it>; Fri, 24 Feb 2023 06:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677220640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1lCsRZ/iYFLEFZgOQHc+0bOBauOSgNbX6sr0yFfr5R8=;
 b=D6CPzuGmms8fmZA+lMrzXn/Gbe65U686X9A9W9CZPM7cn+KHE7mR1tAGvfjqxTu5aBRxQf
 EQeuUxtWLcZFY7aOTjbwOWv0rQCNRiUvq3vUOVZTgdJDWp+bNuDwfRDSnBPrAkYT/Ru6pC
 N9A4e6eLanx/SzgHMuo4z17WH0E5TUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677220640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1lCsRZ/iYFLEFZgOQHc+0bOBauOSgNbX6sr0yFfr5R8=;
 b=iKSo1akSY/GSPDh6AAK52XsyQCCpnG0S9D/X0Lhm6chBn3lIiZg14rYB6LCjwV3iLcj3zN
 qsZau6zGWWGvADBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EEB713A3A
 for <ltp@lists.linux.it>; Fri, 24 Feb 2023 06:37:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OII1BCBb+GO/YgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Fri, 24 Feb 2023 06:37:20 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 24 Feb 2023 12:07:17 +0530
Message-Id: <20230224063717.32388-1-akumar@suse.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] mknod02.c: Convert to new LTP API
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
 testcases/kernel/syscalls/mknod/mknod02.c | 312 +++-------------------
 1 file changed, 44 insertions(+), 268 deletions(-)

diff --git a/testcases/kernel/syscalls/mknod/mknod02.c b/testcases/kernel/syscalls/mknod/mknod02.c
index 594473e24..af63ad377 100644
--- a/testcases/kernel/syscalls/mknod/mknod02.c
+++ b/testcases/kernel/syscalls/mknod/mknod02.c
@@ -1,301 +1,77 @@
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
+ *     07/2001 Ported by Wayne Boyer
+ *   Copyright (c) 2023 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test Name: mknod02
+/*\
+ * [Description]
  *
- * Test Description:
  *  Verify that mknod(2) succeeds when used to create a filesystem
  *  node with set group-ID bit set on a directory without set group-ID bit set.
  *  The node created should have set group-ID bit set and its gid should be
  *  equal to that of its parent directory.
- *
- * Expected Result:
- *  mknod() should return value 0 on success and node created should have
- *  set group-ID bit set, its gid should be equal to that of its parent
- *  directory.
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
- *  mknod02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  This test should be run by 'super-user' (root) only.
- *
  */
 
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
 #include <pwd.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define LTPUSER		"nobody"
-#define MODE_RWX	S_IFIFO | S_IRWXU | S_IRWXG | S_IRWXO
-#define MODE_SGID       S_IFIFO | S_ISGID | S_IRWXU | S_IRWXG | S_IRWXO
-#define DIR_TEMP	"testdir_2"
-#define TNODE		"tnode_%d"
+#include "tst_test.h"
 
-struct stat buf;		/* struct. to hold stat(2) o/p contents */
-struct passwd *user1;		/* struct. to hold getpwnam(3) o/p contents */
+#define MODE1	0010777		/* FIFO */
+#define MODE2	0012777		/* FIFO with Set group ID */
+#define DIR_TEMP	"testdir"
+#define TEMP_NODE	"node1"
 
-char *TCID = "mknod02";
-int TST_TOTAL = 1;
-char node_name[PATH_MAX];	/* buffer to hold node name created */
+static struct stat buf;
+static struct passwd *user_nobody;
 
-gid_t group1_gid, group2_gid, mygid;	/* user and process group id's */
-uid_t save_myuid, user1_uid;	/* user and process user id's */
-pid_t mypid;			/* process id */
+static gid_t gid_nobody, egid_process, rgid_process;
+static uid_t ruid_process, uid_nobody;
 
-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-	int fflag;
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
-		 *  Attempt to create a filesystem node with group-id bit set
-		 *  on a directory without group id bit set such that,
-		 *  the node created by mknod(2) should have group-id (sgid)
-		 *  bit set and node's gid should be equal to that of its
-		 *  parent directory.
-		 */
-		TEST(mknod(node_name, MODE_SGID, 0));
-
-		/* Check return code from mknod(2) */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL,
-				 "mknod(%s, %#o, 0)  failed, errno=%d : %s",
-				 node_name, MODE_SGID, TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
-		}
-		/* Set the functionality flag */
-		fflag = 1;
-
-		/* Check for node's creation */
-		if (stat(node_name, &buf) < 0) {
-			tst_resm(TFAIL, "stat() of %s failed, errno:%d",
-				 node_name, TEST_ERRNO);
-
-			/* unset functionality flag */
-			fflag = 0;
-		}
+	SAFE_CHMOD(".", 0711);
 
-		/* Verify mode permissions of node */
-		if (!(buf.st_mode & S_ISGID)) {
-			tst_resm(TFAIL, "%s: Incorrect modes, setgid "
-				 "bit not set", node_name);
-			/* unset flag as functionality fails */
-			fflag = 0;
-		}
+	ruid_process = getuid();
+	user_nobody = SAFE_GETPWNAM("nobody");
+	uid_nobody = user_nobody->pw_uid;
+	gid_nobody = user_nobody->pw_gid;
 
-		/* Verify group ID of node */
-		if (buf.st_gid != mygid) {
-			tst_resm(TFAIL, "%s: Incorrect group",
-				 node_name);
-			/* unset flag as functionality fails */
-			fflag = 0;
-		}
-		if (fflag) {
-			tst_resm(TPASS, "Functionality of mknod(%s, "
-				 "%#o, 0) successful",
-				 node_name, MODE_SGID);
-		}
+	egid_process = getegid();
 
-		/* Remove the node for the next go `round */
-		if (unlink(node_name) == -1) {
-			tst_resm(TWARN, "unlink(%s) failed, errno:%d %s",
-				 node_name, errno, strerror(errno));
-		}
-	}
+	SAFE_MKDIR(DIR_TEMP, MODE1);
+	SAFE_CHOWN(DIR_TEMP, uid_nobody, egid_process);
 
-	/* Change the directory back to temporary directory */
-	SAFE_CHDIR(cleanup, "..");
+	SAFE_SETGID(gid_nobody);
+	SAFE_SETREUID(-1, uid_nobody);
 
-	/*
-	 * Invoke cleanup() to delete the test directories created
-	 * in the setup() and exit main().
-	 */
-	cleanup();
-
-	tst_exit();
+	rgid_process = getgid();
 }
 
-/*
- * setup(void) - performs all ONE TIME setup for this test.
- *	Exit the test program on receipt of unexpected signals.
- *	Create a temporary directory used to hold test directories created
- *	and change the directory to it.
- *	Verify that pid of process executing the test is root.
- *	Create a test directory on temporary directory and set the ownership
- *	of test directory to ltp user and process.
- *	Set the effective uid/gid of the process to that of ltp user.
- */
-void setup(void)
+static void run(void)
 {
-	tst_require_root();
-
-	/* Capture unexpected signals */
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* Make a temp dir and cd to it */
-	tst_tmpdir();
-
-	/* fix permissions on the tmpdir */
-	if (chmod(".", 0711) != 0) {
-		tst_brkm(TBROK, cleanup, "chmod() failed");
-	}
-
-	/* Save the real user id of the current test process */
-	save_myuid = getuid();
-
-	/* Save the process id of the current test process */
-	mypid = getpid();
-
-	/* Get the node name to be created in the test */
-	sprintf(node_name, TNODE, mypid);
-
-	/* Get the uid/gid of ltpuser */
-	if ((user1 = getpwnam(LTPUSER)) == NULL) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "Couldn't determine if %s was in /etc/passwd",
-			 LTPUSER);
-	}
-	user1_uid = user1->pw_uid;
-	group1_gid = user1->pw_gid;
+	SAFE_CHDIR(DIR_TEMP);
+	TST_EXP_PASS(mknod(TEMP_NODE, MODE2, 0), "mknod(%s, %o, 0)", TEMP_NODE, MODE2);
 
-	/* Get the effective group id of the test process */
-	group2_gid = getegid();
+	TST_EXP_PASS_SILENT(stat(TEMP_NODE, &buf));
 
-	/*
-	 * Create a test directory under temporary directory with the
-	 * specified mode permissions, with uid/gid set to that of guest
-	 * user and the test process.
-	 */
-	SAFE_MKDIR(cleanup, DIR_TEMP, MODE_RWX);
-	SAFE_CHOWN(cleanup, DIR_TEMP, user1_uid, group2_gid);
+	TST_EXP_EQ_LI(buf.st_mode & S_ISGID, S_ISGID);
+	TST_EXP_EQ_LI(buf.st_gid, rgid_process);
 
-	/*
-	 * Verify that test directory created with expected permission modes
-	 * and ownerships.
-	 */
-	SAFE_STAT(cleanup, DIR_TEMP, &buf);
-
-	/* Verify modes of test directory */
-	if (buf.st_mode & S_ISGID) {
-		tst_brkm(TBROK, cleanup,
-			 "%s: Incorrect modes, setgid bit set", DIR_TEMP);
-	}
-
-	/* Verify group ID of test directory */
-	if (buf.st_gid != group2_gid) {
-		tst_brkm(TBROK, cleanup, "%s: Incorrect group", DIR_TEMP);
-	}
-
-	/*
-	 * Set the effective group id and user id of the test process
-	 * to that of guest user.
-	 */
-	SAFE_SETGID(cleanup, group1_gid);
-	if (setreuid(-1, user1_uid) < 0) {
-		tst_brkm(TBROK, cleanup,
-			 "Unable to set process uid to that of ltp user");
-	}
-
-	/* Save the real group ID of the current process */
-	mygid = getgid();
-
-	/* Change directory to DIR_TEMP */
-	SAFE_CHDIR(cleanup, DIR_TEMP);
+	SAFE_UNLINK(TEMP_NODE);
+	SAFE_CHDIR("..");
 }
 
-/*
- * cleanup() - Performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- *	Print test timing stats and errno log if test executed with options.
- *	Restore the real/effective user id of the process changed during
- *	setup().
- *	Remove temporary directory and sub-directories/files under it
- *	created during setup().
- *	Exit the test program with normal exit code.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-
-	/*
-	 * Restore the effective uid of the process changed in the
-	 * setup().
-	 */
-	if (setreuid(-1, save_myuid) < 0) {
-		tst_brkm(TBROK, NULL,
-			 "resetting process real/effective uid failed");
-	}
-
-	tst_rmdir();
-
+	SAFE_SETREUID(-1, ruid_process);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_tmpdir = 1,
+	.needs_root = 1
+};
-- 
2.39.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
