Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000B3F864E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D36513C93B3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 85FE73C2E39
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66B291A00E03
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7543222D4
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629976933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwJ5U5XKRCvPOMj6OMJ7EiP85Bm3+Hhs7C41l7te9R0=;
 b=zFFxVeeVaJsV93cHMYol6MEfFp3mZ1ky18t17trIYgdDJZAjroXt5KgOsulFqvP13ViT0P
 MF2nepT45+M3m1/DLUQhQrSuoFL7/mE26ETFplzf22GDSr1BjeSJe2ZEMHsjyhAhLr49T+
 0HTjLkcXYfGysCiI8eoIn5f2A3pTCQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629976933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwJ5U5XKRCvPOMj6OMJ7EiP85Bm3+Hhs7C41l7te9R0=;
 b=cku5fpbaDOaxtZrKFxsxDGw0F7Ai3kOl+L/QauqcisKm33tjCdBoZD8oRsCG7IjQj1Mwr6
 L0zV/r8ylFrf3PCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCCA713BA0
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YKENLWV5J2FEPgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Aug 2021 13:22:11 +0200
Message-Id: <20210826112212.26394-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826112212.26394-1-mdoucha@suse.cz>
References: <20210826112212.26394-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] syscalls/open10: Convert to new API
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

Changes since v1:
- Use nobody's primary group for setgid member subtests
- Use any unassigned gid for setgid non-member subtests
- Don't switch users in cleanup()

 testcases/kernel/syscalls/open/open10.c | 537 +++++-------------------
 1 file changed, 107 insertions(+), 430 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open10.c b/testcases/kernel/syscalls/open/open10.c
index 14feec9e1..c7c23fbdb 100644
--- a/testcases/kernel/syscalls/open/open10.c
+++ b/testcases/kernel/syscalls/open/open10.c
@@ -1,461 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
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
+ * Verify that the group ID and setgid bit are set correctly when a new file
+ * is created.
  */
 
-/*
- * Description:
- *	Verifies that the group ID and setgid bit are
- *	set correctly when a new file is created using open.
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
- */
-
-#include <stdio.h>
+#include <stdlib.h>
 #include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <grp.h>
 #include <pwd.h>
-#include "test.h"
+#include "tst_test.h"
+#include "tst_uid.h"
 
-char *TCID = "open10";
-int TST_TOTAL = 1;
-static int local_flag;
+#define MODE_RWX        0777
+#define MODE_SGID       (S_ISGID|0777)
 
-#define PASSED 1
-#define FAILED 0
+#define DIR_A		"dir_a"
+#define DIR_B		"dir_b"
+#define SETGID_A	DIR_A "/setgid"
+#define NOSETGID_A	DIR_A "/nosetgid"
+#define SETGID_B	DIR_B "/setgid"
+#define NOSETGID_B	DIR_B "/nosetgid"
+#define ROOT_SETGID	DIR_B "/root_setgid"
 
-#define MODE_RWX        (S_IRWXU | S_IRWXG | S_IRWXO)
-#define MODE_SGID       (S_ISGID | S_IRWXU | S_IRWXG | S_IRWXO)
-#define DIR_A_TEMP	"open10.testdir.A.%d"
-#define DIR_B_TEMP	"open10.testdir.B.%d"
-#define SETGID		"setgid"
-#define NOSETGID	"nosetgid"
-#define ROOT_SETGID	"root_setgid"
-#define	MSGSIZE		150
+static char *tmpdir;
+static uid_t orig_uid, nobody_uid;
+static gid_t nobody_gid, free_gid;
+static int fd = -1;
 
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char *av[])
+static void setup(void)
 {
-	int ret;
-	struct stat buf;
-	struct group *group;
-	struct passwd *user1;
-	char DIR_A[MSGSIZE], DIR_B[MSGSIZE];
-	char setgid_A[MSGSIZE], nosetgid_A[MSGSIZE];
-	char setgid_B[MSGSIZE], nosetgid_B[MSGSIZE], root_setgid_B[MSGSIZE];
-	gid_t group1_gid, group2_gid, mygid;
-	uid_t save_myuid, user1_uid;
-	pid_t mypid;
-
-	int lc;
-	int fail_count = 0;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
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
-		user1 = getpwnam("nobody");
-		if (user1 == NULL)
-			tst_brkm(TBROK, cleanup, "nobody not in /etc/passwd");
-
-		user1_uid = user1->pw_uid;
-
-		/*
-		 * Get the group IDs of group1 and group2.
-		 */
-		group = getgrnam("nobody");
-		if (group == NULL) {
-			group = getgrnam("nogroup");
-			if (group == NULL) {
-				tst_brkm(TBROK, cleanup,
-					 "nobody/nogroup not in /etc/group");
-			}
-		}
-		group1_gid = group->gr_gid;
-		group = getgrnam("bin");
-		if (group == NULL)
-			tst_brkm(TBROK, cleanup, "bin not in /etc/group");
-
-		group2_gid = group->gr_gid;
-
-		/*
-		 * Create a directory with group id the same as this process
-		 * and with no setgid bit.
-		 */
-		if (mkdir(DIR_A, MODE_RWX) < 0) {
-			tst_resm(TFAIL | TERRNO, "mkdir(%s) failed", DIR_A);
-			local_flag = FAILED;
-		}
-
-		if (chown(DIR_A, user1_uid, group2_gid) < 0) {
-			tst_resm(TFAIL | TERRNO, "chown(%s) failed", DIR_A);
-			local_flag = FAILED;
-		}
-
-		if (stat(DIR_A, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", DIR_A);
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
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 DIR_A, buf.st_gid, group2_gid);
-			local_flag = FAILED;
-		}
-
-		/*
-		 * Create a directory with group id different from that of
-		 * this process and with the setgid bit set.
-		 */
-		if (mkdir(DIR_B, MODE_RWX) < 0) {
-			tst_resm(TFAIL | TERRNO, "mkdir(%s) failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (chown(DIR_B, user1_uid, group2_gid) < 0) {
-			tst_resm(TFAIL | TERRNO, "chown(%s) failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (chmod(DIR_B, MODE_SGID) < 0) {
-			tst_resm(TFAIL | TERRNO, "chmod(%s) failed", DIR_B);
-			local_flag = FAILED;
-		}
-
-		if (stat(DIR_B, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", DIR_B);
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
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 DIR_B, buf.st_gid, group2_gid);
-			local_flag = FAILED;
-		}
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block0.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block0.");
-			fail_count++;
-		}
-
-		local_flag = PASSED;
-
-		/*
-		 * Create two files in testdir.A, one with the setgid
-		 * bit set in the creation modes and the other without.
-		 * Both should inherit the group ID of the process and
-		 * maintain the setgid bit as specified in the creation
-		 * modes.
-		 */
-		if (setgid(group1_gid) < 0) {
-			tst_resm(TINFO,
-				 "Unable to set process group ID to group1");
-		}
-
-		if (setreuid(-1, user1_uid) < 0)
-			tst_resm(TINFO, "Unable to set process uid to user1");
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
 
-		mygid = getgid();
-
-		/*
-		 * Create the file with setgid not set
-		 */
-		ret = open(nosetgid_A, O_CREAT | O_EXCL | O_RDWR, MODE_RWX);
-		if (ret < 0) {
-			tst_resm(TFAIL | TERRNO, "open(%s) failed", nosetgid_A);
-			local_flag = FAILED;
-		}
-		close(ret);
-
-		if (stat(nosetgid_A, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", nosetgid_A);
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
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 nosetgid_A, buf.st_gid, mygid);
-			local_flag = FAILED;
-		}
-
-		/*
-		 * Create the file with setgid set
-		 */
-		ret = open(setgid_A, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
-		if (ret < 0) {
-			tst_resm(TFAIL | TERRNO, "open(%s) failed", setgid_A);
-			local_flag = FAILED;
-		}
-		close(ret);
-
-		if (stat(setgid_A, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", setgid_A);
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
-			tst_resm(TFAIL, "%s: Incorrect group (%d and %d)",
-				 setgid_A, buf.st_gid, mygid);
-			local_flag = FAILED;
-		}
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block1.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block1.");
-			fail_count++;
-		}
-
-		local_flag = PASSED;
-
-		/*
-		 * Create two files in testdir.B, one with the setgid
-		 * bit set in the creation modes and the other without.
-		 * Both should inherit the group ID of the parent
-		 * directory, group2. Either file should have the segid
-		 * bit set in the modes.
-		 */
-		/*
-		 * Create the file with setgid not set
-		 */
-		ret = open(nosetgid_B, O_CREAT | O_EXCL | O_RDWR, MODE_RWX);
-		if (ret < 0) {
-			tst_resm(TFAIL | TERRNO, "open(%s) failed", nosetgid_B);
-			local_flag = FAILED;
-		}
-		close(ret);
-
-		if (stat(nosetgid_B, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", nosetgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify modes */
-		if (buf.st_mode & S_ISGID) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit should be set",
-				 nosetgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 nosetgid_B, buf.st_gid, group2_gid);
-			local_flag = FAILED;
-		}
-
-		/*
-		 * Create the file with setgid set
-		 */
-		ret = open(setgid_B, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
-		if (ret < 0) {
-			tst_resm(TFAIL | TERRNO, "open(%s) failed", setgid_B);
-			local_flag = FAILED;
-		}
-		close(ret);
-
-		if (stat(setgid_B, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed", setgid_B);
-			local_flag = FAILED;
-		}
-
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 setgid_B, buf.st_gid, group2_gid);
-			local_flag = FAILED;
-		}
-
-		/*
-		 * Skip S_ISGID check
-		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
-		 * clears S_ISGID for files created by non-group members
-		 */
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block2.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block2.");
-			fail_count++;
-		}
+	orig_uid = getuid();
+	nobody_uid = ltpuser->pw_uid;
+	nobody_gid = ltpuser->pw_gid;
+	free_gid = tst_get_free_gid(nobody_gid);
+	tmpdir = tst_get_tmpdir();
+}
 
-		local_flag = PASSED;
+static void file_test(const char *name, mode_t mode, int sgid, gid_t gid)
+{
+	struct stat buf;
 
-		/*
-		 * Create a file in testdir.B, with the setgid bit set
-		 * in the creation modes and do so as root. The file
-		 * should inherit the group ID of the parent directory,
-		 * group2 and should have the setgid bit set.
-		 */
+	fd = SAFE_OPEN(name, O_CREAT | O_EXCL | O_RDWR, mode);
+	SAFE_CLOSE(fd);
+	SAFE_STAT(name, &buf);
 
-		/* Become root again */
-		if (setreuid(-1, save_myuid) < 0) {
-			tst_resm(TFAIL | TERRNO,
-				 "Changing back to root failed");
-			local_flag = FAILED;
-		}
+	if (buf.st_gid != gid) {
+		tst_res(TFAIL, "%s: Incorrect group, %u != %u", name,
+			buf.st_gid, gid);
+	} else {
+		tst_res(TPASS, "%s: Owned by correct group", name);
+	}
 
-		/* Create the file with setgid set */
-		ret = open(root_setgid_B, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
-		if (ret < 0) {
-			tst_resm(TFAIL | TERRNO, "open(%s) failed",
-				 root_setgid_B);
-			local_flag = FAILED;
-		}
-		close(ret);
+	if (sgid < 0) {
+		tst_res(TINFO, "%s: Skipping setgid bit check", name);
+		return;
+	}
 
-		if (stat(root_setgid_B, &buf) < 0) {
-			tst_resm(TFAIL | TERRNO, "stat(%s) failed",
-				 root_setgid_B);
-			local_flag = FAILED;
-		}
+	if (buf.st_mode & S_ISGID)
+		tst_res(sgid ? TPASS : TFAIL, "%s: Setgid bit is set", name);
+	else
+		tst_res(sgid ? TFAIL : TPASS, "%s: Setgid bit not set", name);
+}
 
-		/* Verify modes */
-		if (!(buf.st_mode & S_ISGID)) {
-			tst_resm(TFAIL,
-				 "%s: Incorrect modes, setgid bit not set",
-				 root_setgid_B);
-			local_flag = FAILED;
-		}
+static void run(void)
+{
+	struct stat buf;
 
-		/* Verify group ID */
-		if (buf.st_gid != group2_gid) {
-			tst_resm(TFAIL, "%s: Incorrect group (got %d and %d)",
-				 root_setgid_B, buf.st_gid, group2_gid);
-			local_flag = FAILED;
-		}
+	/* Create directories and set permissions */
+	SAFE_MKDIR(DIR_A, MODE_RWX);
+	SAFE_CHOWN(DIR_A, nobody_uid, free_gid);
+	SAFE_STAT(DIR_A, &buf);
 
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block3.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block3.");
-			fail_count++;
-		}
+	if (buf.st_mode & S_ISGID)
+		tst_brk(TBROK, "%s: Setgid bit is set", DIR_A);
 
-		/*
-		 * Clean up any files created by test before call to anyfail.
-		 * Remove the directories.
-		 */
-		if (unlink(setgid_A) < 0)
-			tst_resm(TWARN | TERRNO, "unlink(%s) failed", setgid_A);
-		if (unlink(nosetgid_A) < 0)
-			tst_resm(TWARN | TERRNO, "unlink(%s) failed",
-				 nosetgid_A);
-		if (rmdir(DIR_A) < 0)
-			tst_resm(TWARN | TERRNO, "rmdir(%s) failed", DIR_A);
+	if (buf.st_gid != free_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", DIR_A,
+			buf.st_gid, free_gid);
+	}
 
-		if (unlink(setgid_B) < 0)
-			tst_resm(TWARN | TERRNO, "unlink(%s) failed", setgid_B);
-		if (unlink(root_setgid_B) < 0)
-			tst_resm(TWARN | TERRNO, "unlink(%s) failed",
-				 root_setgid_B);
-		if (unlink(nosetgid_B) < 0)
-			tst_resm(TWARN | TERRNO, "unlink(%s) failed",
-				 nosetgid_B);
-		if (rmdir(DIR_B) < 0)
-			tst_resm(TWARN | TERRNO, "rmdir(%s) failed", DIR_B);
+	SAFE_MKDIR(DIR_B, MODE_RWX);
+	SAFE_CHOWN(DIR_B, nobody_uid, free_gid);
+	SAFE_CHMOD(DIR_B, MODE_SGID);
+	SAFE_STAT(DIR_B, &buf);
 
-		if (fail_count == 0) {
-			tst_resm(TPASS, "Test passed.");
-		} else {
-			tst_resm(TFAIL,
-				 "Test failed because of above failures.");
-		}
+	if (!(buf.st_mode & S_ISGID))
+		tst_brk(TBROK, "%s: Setgid bit not set", DIR_B);
 
+	if (buf.st_gid != free_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", DIR_B,
+			buf.st_gid, free_gid);
 	}
 
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_require_root();
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
-	tst_tmpdir();
+	/* Switch to user nobody and create two files in DIR_A */
+	/* Both files should inherit GID from the process */
+	SAFE_SETGID(nobody_gid);
+	SAFE_SETREUID(-1, nobody_uid);
+	file_test(NOSETGID_A, MODE_RWX, 0, nobody_gid);
+	file_test(SETGID_A, MODE_SGID, 1, nobody_gid);
+
+	/* Create two files in DIR_B and validate owner and permissions */
+	/* Both files should inherit GID from the parent directory */
+	file_test(NOSETGID_B, MODE_RWX, 0, free_gid);
+	/*
+	 * CVE 2018-13405 (privilege escalation using setgid bit) has its
+	 * own test, skip setgid check here
+	 */
+	file_test(SETGID_B, MODE_SGID, -1, free_gid);
+
+	/* Switch back to root UID and create a file in DIR_B */
+	/* The file should inherid GID from parent directory */
+	SAFE_SETREUID(-1, orig_uid);
+	file_test(ROOT_SETGID, MODE_SGID, 1, free_gid);
+
+	/* Cleanup between loops */
+	tst_purge_dir(tmpdir);
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
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
