Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CC3E2DEA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 17:46:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 848653CA3EA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 17:46:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 39E443C6873
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 17:46:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 029C51400181
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 17:45:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E6DA21C8E
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628264758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxgiuVk71VP6WJOKuRanfAkavvPRW2P0A0LFDrDl6eY=;
 b=HVWCaiVc3lK/6bEpdWAIXqHQICCrAjtafLJQ+0mv9aGt9QiPnx/TnKC7LUbLin3PE27XAk
 Dvh/KpC1qadR9qu76AMQVd8AqALS89z75beFMBg0xWD0uh2wbUDFt5ULdyPjp43QYy1pgx
 /4jm88gyeLszFWXeRTYjtNb+YmE7/Zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628264758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxgiuVk71VP6WJOKuRanfAkavvPRW2P0A0LFDrDl6eY=;
 b=HSiKrhdBxlGfpxmY9R55UumGy0oz013V9WXpBy8UAQlLF50RyOXfjlqjcScrS/4v67/vcj
 yfTlxNhLnn7LRsDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECCAF13A8E
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 15:45:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9O/OODVZDWG6WwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 15:45:57 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 17:45:55 +0200
Message-Id: <20210806154557.19551-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/creat08: Convert to new API
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

creat08 and open10 are nearly identical tests except for validating creat() and
open() respectively. I've decided to keep them separate and add a new CVE test
which was supposed to replace one removed check in both tests.

 testcases/kernel/syscalls/creat/creat08.c | 536 +++++-----------------
 1 file changed, 111 insertions(+), 425 deletions(-)

diff --git a/testcases/kernel/syscalls/creat/creat08.c b/testcases/kernel/syscalls/creat/creat08.c
index d22558ac3..1ae531f23 100644
--- a/testcases/kernel/syscalls/creat/creat08.c
+++ b/testcases/kernel/syscalls/creat/creat08.c
@@ -1,456 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
+ *     Ported from SPIE by Airong Zhang <zhanga@us.ibm.com>
+ * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
  *
- *   Copyright (c) International Business Machines  Corp., 2002
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
- */
-
-/*
- * NAME
- *	creat08.c - Verifies that the group ID and setgid bit are
- *		   set correctly when a new file is created.
- *		   (ported from SPIE, section2/iosuite/creat5.c,
- *		    by Airong Zhang <zhanga@us.ibm.com>)
- * CALLS
- *	creat
- *
- * ALGORITHM
- *	Create two directories, one with the group ID of this process
- *	and the setgid bit not set, and the other with a group ID
- *	other than that of this process and with the setgid bit set.
- *	In each directory, create a file with and without the setgid
- *	bit set in the creation modes. Verify that the modes and group
- *	ID are correct on each of the 4 files.
- *	As root, create a file with the setgid bit on in the
- *	directory with the setgid bit.
- *	This tests the SVID3 create group semantics.
- *
- * USAGE
- *	creat08
- *
- * RESTRICTIONS
- *
+ * Verify that the group ID and setgid bit are set correctly when a new file
+ * is created.
  */
 
-#include <stdio.h>		/* needed by testhead.h         */
+#include <stdlib.h>
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <grp.h>
 #include <pwd.h>
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "creat08";
-int TST_TOTAL = 1;
-int local_flag;
+#include "tst_test.h"
 
-#define PASSED 1
-#define FAILED 0
+#define MODE_RWX        0777
+#define MODE_SGID       (S_ISGID|0777)
 
-#define MODE_RWX        (S_IRWXU|S_IRWXG|S_IRWXO)
-#define MODE_SGID       (S_ISGID|S_IRWXU|S_IRWXG|S_IRWXO)
-#define DIR_A_TEMP	"testdir.A.%d"
-#define DIR_B_TEMP	"testdir.B.%d"
-#define SETGID		"setgid"
-#define NOSETGID	"nosetgid"
-#define ROOT_SETGID	"root_setgid"
-#define	MSGSIZE		150
+#define DIR_A		"dir_a"
+#define DIR_B		"dir_b"
+#define SETGID_A	DIR_A "/setgid"
+#define NOSETGID_A	DIR_A "/nosetgid"
+#define SETGID_B	DIR_B "/setgid"
+#define NOSETGID_B	DIR_B "/nosetgid"
+#define ROOT_SETGID	DIR_B "/root_setgid"
 
-static void tst_cleanup(void);
-static void cleanup(void);
-static void setup(void);
+static char *tmpdir;
+static uid_t orig_uid, nobody_uid;
+static gid_t nobody_gid, bin_gid;
+static int fd = -1;
 
-static char DIR_A[MSGSIZE], DIR_B[MSGSIZE];
-static char setgid_A[MSGSIZE], nosetgid_A[MSGSIZE];
-static char setgid_B[MSGSIZE], nosetgid_B[MSGSIZE], root_setgid_B[MSGSIZE];
+static void setup(void)
+{
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+	struct group *ltpgroup = SAFE_GETGRNAM_FALLBACK("nobody", "nogroup");
+
+	orig_uid = getuid();
+	nobody_uid = ltpuser->pw_uid;
+	nobody_gid = ltpgroup->gr_gid;
+	ltpgroup = SAFE_GETGRNAM("bin");
+	bin_gid = ltpgroup->gr_gid;
+	tmpdir = tst_get_tmpdir();
+}
 
-int main(int ac, char **av)
+static void file_test(const char *name, mode_t mode, int sgid, gid_t gid)
 {
 	struct stat buf;
-	struct group *group;
-	struct passwd *user1;
-	gid_t group1_gid, group2_gid, mygid;
-	uid_t save_myuid, user1_uid;
-	pid_t mypid;
-
-	int fd;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		local_flag = PASSED;
-
-		save_myuid = getuid();
-		mypid = getpid();
-		sprintf(DIR_A, DIR_A_TEMP, mypid);
-		sprintf(DIR_B, DIR_B_TEMP, mypid);
-		sprintf(setgid_A, "%s/%s", DIR_A, SETGID);
-		sprintf(nosetgid_A, "%s/%s", DIR_A, NOSETGID);
-		sprintf(setgid_B, "%s/%s", DIR_B, SETGID);
-		sprintf(nosetgid_B, "%s/%s", DIR_B, NOSETGID);
-		sprintf(root_setgid_B, "%s/%s", DIR_B, ROOT_SETGID);
-
-		/* Get the uid of user1 */
-		if ((user1 = getpwnam("nobody")) == NULL) {
-			tst_brkm(TBROK | TERRNO, NULL,
-				 "getpwnam(\"nobody\") failed");
-		}
-
-		user1_uid = user1->pw_uid;
-
-		/*
-		 * Get the group IDs of group1 and group2.
-		 */
-		if ((group = getgrnam("nobody")) == NULL) {
-			if ((group = getgrnam("nogroup")) == NULL) {
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "getgrnam(\"nobody\") and "
-					 "getgrnam(\"nogroup\") failed");
-			}
-		}
-		group1_gid = group->gr_gid;
-		if ((group = getgrnam("bin")) == NULL) {
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "getgrnam(\"bin\") failed");
-		}
-		group2_gid = group->gr_gid;
-
-/*--------------------------------------------------------------*/
-/* Block0: Set up the parent directories			*/
-/*--------------------------------------------------------------*/
-		/*
-		 * Create a directory with group id the same as this process
-		 * and with no setgid bit.
-		 */
-		if (mkdir(DIR_A, MODE_RWX) == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", DIR_A);
-			local_flag = FAILED;
-		}
-
-		if (chown(DIR_A, user1_uid, group2_gid) == -1) {
-			tst_resm(TFAIL, "Chown of %s failed", DIR_A);
-			local_flag = FAILED;
-		}
-
-		if (stat(DIR_A, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", DIR_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (buf.st_mode & S_ISGID) {
-			tst_resm(TFAIL, "%s: Incorrect modes, setgid bit set",
-				 DIR_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group", DIR_A);
-			tst_resm(TINFO, "got %u and %u", buf.st_gid,
-				 group2_gid);
-			local_flag = FAILED;
-		}
-
-		/*
-		 * Create a directory with group id different from that of
-		 * this process and with the setgid bit set.
-		 */
-		if (mkdir(DIR_B, MODE_RWX) == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (chown(DIR_B, user1_uid, group2_gid) == -1) {
-			tst_resm(TFAIL, "Chown of %s failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (chmod(DIR_B, MODE_SGID) == -1) {
-			tst_resm(TFAIL, "Chmod of %s failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (stat(DIR_B, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (!(buf.st_mode & S_ISGID)) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit not set",
-				 DIR_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group", DIR_B);
-			tst_resm(TINFO, "got %u and %u", buf.st_gid,
-				 group2_gid);
-			local_flag = FAILED;
-		}
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block0.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block0.");
-		}
 
-		local_flag = PASSED;
+	fd = SAFE_CREAT(name, mode);
+	SAFE_STAT(name, &buf);
+	SAFE_CLOSE(fd);
 
-/*--------------------------------------------------------------*/
-/* Block1: Create two files in testdir.A, one with the setgid   */
-/*         bit set in the creation modes and the other without. */
-/*	   Both should inherit the group ID of the process and  */
-/*	   maintain the setgid bit as specified in the creation */
-/*	   modes.                                               */
-/*--------------------------------------------------------------*/
-		/*
-		 * Now become user1, group1
-		 */
-		if (setgid(group1_gid) == -1) {
-			tst_resm(TINFO,
-				 "Unable to set process group ID to group1");
-		}
-
-		if (setreuid(-1, user1_uid) == -1) {
-			tst_resm(TINFO, "Unable to set process uid to user1");
-		}
-		mygid = getgid();
-
-		/*
-		 * Create the file with setgid not set
-		 */
-		fd = open(nosetgid_A, O_CREAT | O_EXCL | O_RDWR, MODE_RWX);
-		if (fd == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", nosetgid_A);
-			local_flag = FAILED;
-		}
-
-		if (stat(nosetgid_A, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", nosetgid_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (buf.st_mode & S_ISGID) {
-			tst_resm(TFAIL, "%s: Incorrect modes, setgid bit set",
-				 nosetgid_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != mygid) {
-			tst_resm(TFAIL, "%s: Incorrect group", nosetgid_A);
-			local_flag = FAILED;
-		}
-		close(fd);
-
-		/*
-		 * Create the file with setgid set
-		 */
-		fd = open(setgid_A, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
-		if (fd == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", setgid_A);
-			local_flag = FAILED;
-		}
-
-		if (stat(setgid_A, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", setgid_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (!(buf.st_mode & S_ISGID)) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit not set",
-				 setgid_A);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != mygid) {
-			tst_resm(TFAIL, "%s: Incorrect group", setgid_A);
-			tst_resm(TINFO, "got %u and %u", buf.st_gid, mygid);
-			local_flag = FAILED;
-		}
-		close(fd);
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block1.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block1.");
-		}
-
-		local_flag = PASSED;
-
-/*--------------------------------------------------------------*/
-/* Block2: Create two files in testdir.B, one with the setgid   */
-/*         bit set in the creation modes and the other without. */
-/*	   Both should inherit the group ID of the parent       */
-/*	   directory, group2.                                   */
-/*--------------------------------------------------------------*/
-		/*
-		 * Create the file with setgid not set
-		 */
-		fd = creat(nosetgid_B, MODE_RWX);
-		if (fd == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", nosetgid_B);
-			local_flag = FAILED;
-		}
-
-		if (stat(nosetgid_B, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", nosetgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (buf.st_mode & S_ISGID) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit should not be set",
-				 nosetgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group", nosetgid_B);
-			local_flag = FAILED;
-		}
-		close(fd);
-
-		/*
-		 * Create the file with setgid set
-		 */
-		fd = creat(setgid_B, MODE_SGID);
-		if (fd == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", setgid_B);
-			local_flag = FAILED;
-		}
-
-		if (stat(setgid_B, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", setgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group", setgid_B);
-			tst_resm(TFAIL, "got %u and %u", buf.st_gid,
-				 group2_gid);
-			local_flag = FAILED;
-		}
+	if (buf.st_gid != gid) {
+		tst_res(TFAIL, "%s: Incorrect group, %u != %u", name,
+			buf.st_gid, gid);
+	} else {
+		tst_res(TPASS, "%s: Owned by correct group", name);
+	}
 
-		/*
-		 * Skip S_ISGID check
-		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
-		 * clears S_ISGID for files created by non-group members
-		 */
+	if (sgid < 0) {
+		tst_res(TINFO, "%s: Skipping setgid bit check", name);
+		return;
+	}
 
-		close(fd);
+	if (buf.st_mode & S_ISGID)
+		tst_res(sgid ? TPASS : TFAIL, "%s: Setgid bit is set", name);
+	else
+		tst_res(sgid ? TFAIL : TPASS, "%s: Setgid bit not set", name);
+}
 
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block2.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block2.");
-		}
+static void run(void)
+{
+	struct stat buf;
 
-		local_flag = PASSED;
-/*--------------------------------------------------------------*/
-/* Block3: Create a file in testdir.B, with the setgid bit set  */
-/*	   in the creation modes and do so as root. The file    */
-/*	   should inherit the group ID of the parent directory, */
-/*	   group2 and should have the setgid bit set.		*/
-/*--------------------------------------------------------------*/
-		/* Become root again */
-		if (setreuid(-1, save_myuid) == -1) {
-			tst_resm(TFAIL | TERRNO,
-				 "Changing back to root failed");
-			local_flag = FAILED;
-		}
+	/* Create directories and set permissions */
+	SAFE_MKDIR(DIR_A, MODE_RWX);
+	SAFE_CHOWN(DIR_A, nobody_uid, bin_gid);
+	SAFE_STAT(DIR_A, &buf);
 
-		/* Create the file with setgid set */
-		fd = creat(root_setgid_B, MODE_SGID);
-		if (fd == -1) {
-			tst_resm(TFAIL, "Creation of %s failed", root_setgid_B);
-			local_flag = FAILED;
-		}
+	if (buf.st_mode & S_ISGID)
+		tst_brk(TBROK, "%s: Setgid bit is set", DIR_A);
 
-		if (stat(root_setgid_B, &buf) == -1) {
-			tst_resm(TFAIL, "Stat of %s failed", root_setgid_B);
-			local_flag = FAILED;
-		}
+	if (buf.st_gid != bin_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", DIR_A,
+			buf.st_gid, bin_gid);
+	}
 
-		/* Verify modes */
-		if (!(buf.st_mode & S_ISGID)) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit not set",
-				 root_setgid_B);
-			local_flag = FAILED;
-		}
+	SAFE_MKDIR(DIR_B, MODE_RWX);
+	SAFE_CHOWN(DIR_B, nobody_uid, bin_gid);
+	SAFE_CHMOD(DIR_B, MODE_SGID);
+	SAFE_STAT(DIR_B, &buf);
 
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group", root_setgid_B);
-			tst_resm(TINFO, "got %u and %u", buf.st_gid,
-				 group2_gid);
-			local_flag = FAILED;
-		}
-		close(fd);
+	if (!(buf.st_mode & S_ISGID))
+		tst_brk(TBROK, "%s: Setgid bit not set", DIR_B);
 
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block3");
-		} else {
-			tst_resm(TFAIL, "Test failed in block3");
-		}
-		tst_cleanup();
+	if (buf.st_gid != bin_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", DIR_B,
+			buf.st_gid, bin_gid);
 	}
-	cleanup();
-	tst_exit();
-}
 
-static void setup(void)
-{
-	tst_require_root();
-	tst_tmpdir();
-}
-
-static void tst_cleanup(void)
-{
-	if (unlink(setgid_A) == -1) {
-		tst_resm(TBROK, "%s failed", setgid_A);
-	}
-	if (unlink(nosetgid_A) == -1) {
-		tst_resm(TBROK, "unlink %s failed", nosetgid_A);
-	}
-	SAFE_RMDIR(NULL, DIR_A);
-	SAFE_UNLINK(NULL, setgid_B);
-	SAFE_UNLINK(NULL, root_setgid_B);
-	SAFE_UNLINK(NULL, nosetgid_B);
-	SAFE_RMDIR(NULL, DIR_B);
+	/* Switch to user nobody and create two files in DIR_A */
+	/* Both files should inherit GID from the process */
+	SAFE_SETGID(nobody_gid);
+	SAFE_SETREUID(-1, nobody_uid);
+	file_test(NOSETGID_A, MODE_RWX, 0, nobody_gid);
+	file_test(SETGID_A, MODE_SGID, 1, nobody_gid);
+
+	/* Create two files in DIR_B and validate owner and permissions */
+	/* Both files should inherit GID from the parent directory */
+	file_test(NOSETGID_B, MODE_RWX, 0, bin_gid);
+	/*
+	 * CVE 2018-13405 (privilege escalation using setgid bit) has its
+	 * own test, skip setgid check here
+	 */
+	file_test(SETGID_B, MODE_SGID, -1, bin_gid);
+
+	/* Switch back to root UID and create a file in DIR_B */
+	/* The file should inherid GID from parent directory */
+	SAFE_SETREUID(-1, orig_uid);
+	file_test(ROOT_SETGID, MODE_SGID, 1, bin_gid);
+
+	/* Cleanup between loops */
+	tst_purge_dir(tmpdir);
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
+	SAFE_SETREUID(-1, orig_uid);
+
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+
+	free(tmpdir);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
