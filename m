Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D6B0C807
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jul 2025 17:50:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19E8E3CCBB8
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jul 2025 17:50:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0304A3C7168
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 17:49:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4960D1000762
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 17:49:48 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B14721A2F
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753112988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eB9rSISPT/s1yNoiTCe+7uD69bQBZdX4apRORfh2kYc=;
 b=cntyuugCW/G2bac48+sfBGlP/BpHkpGP7O9WqN6n9cLlaA2Sn4G4x6sfqvOccgyWi4Rgg2
 EfrQ8JAQXYRPKeY6kMQz9fKPwZvhO9ccgul/8SipBZOWWiEIaqzIN0Qq77+LG8HG37Sj1K
 ZMW3idQ7KRYNhcQSJOUvhf/e+HftLvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753112988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eB9rSISPT/s1yNoiTCe+7uD69bQBZdX4apRORfh2kYc=;
 b=fn6DDL9oGn3QI5u8Rc7KGpA1XJQUBFyw0iX7AR0PtgdvTDNPUHqqNDWsRXyOqOiqvz8Szz
 2Kaz2lmvYTigPXAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=cntyuugC;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=fn6DDL9o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753112988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eB9rSISPT/s1yNoiTCe+7uD69bQBZdX4apRORfh2kYc=;
 b=cntyuugCW/G2bac48+sfBGlP/BpHkpGP7O9WqN6n9cLlaA2Sn4G4x6sfqvOccgyWi4Rgg2
 EfrQ8JAQXYRPKeY6kMQz9fKPwZvhO9ccgul/8SipBZOWWiEIaqzIN0Qq77+LG8HG37Sj1K
 ZMW3idQ7KRYNhcQSJOUvhf/e+HftLvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753112988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eB9rSISPT/s1yNoiTCe+7uD69bQBZdX4apRORfh2kYc=;
 b=fn6DDL9oGn3QI5u8Rc7KGpA1XJQUBFyw0iX7AR0PtgdvTDNPUHqqNDWsRXyOqOiqvz8Szz
 2Kaz2lmvYTigPXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6047113A88
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 15:49:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id B8hPF5xhfmi6fwAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 15:49:48 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 21 Jul 2025 17:49:44 +0200
Message-ID: <20250721154946.34223-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_ONE(0.00)[1]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,suse.cz:email,oracle.com:email,gnu.org:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_NONE(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MIME_TRACE(0.00)[0:+]; DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 7B14721A2F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] open14: Rewrite to new API
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
- Added subtest info to test description
- Added .needs_root = 1

 testcases/kernel/syscalls/open/open14.c | 280 ++++++++++++------------
 1 file changed, 135 insertions(+), 145 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open14.c b/testcases/kernel/syscalls/open/open14.c
index 3ecb7e4fb..8a4ddb44b 100644
--- a/testcases/kernel/syscalls/open/open14.c
+++ b/testcases/kernel/syscalls/open/open14.c
@@ -1,63 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015-2016 Oracle and/or its affiliates. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
- *
  * Author: Alexey Kodanev <alexey.kodanev@oracle.com>
- *
+ * Copyright (c) 2025 SUSE LLC <mdoucha@suse.cz>
  */
 
-#define _GNU_SOURCE
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <errno.h>
+/*\
+ * Check the functionality of O_TMPFILE flag for open() syscall:
+ * 1) Creation and linking (naming) of a single temp file
+ * 2) Creation of multiple unlinked temp files in a hierarchy of directories
+ * 3) Access permissions of linked temp files match creation mode argument
+ */
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 #include "lapi/fcntl.h"
 
-char *TCID = "open14";
-int TST_TOTAL = 3;
-static ssize_t size;
+#define FILE_COUNT 100
+#define MNTPOINT "mntpoint"
+
 static char buf[1024];
+static int fds[FILE_COUNT];
+static const ssize_t size = sizeof(buf);
 static const ssize_t blocks_num = 4;
-static struct stat st;
-
-static void cleanup(void)
-{
-	tst_rmdir();
-}
 
 static void setup(void)
 {
-	tst_tmpdir();
+	int i;
 
-	size = sizeof(buf);
+	for (i = 0; i < FILE_COUNT; i++)
+		fds[i] = -1;
 
 	memset(buf, 1, size);
+	SAFE_CHDIR(MNTPOINT);
+	fds[0] = open(".", O_TMPFILE | O_RDWR, 0600);
 
-	int fd = open(".", O_TMPFILE | O_RDWR, 0600);
-
-	if (fd == -1) {
+	if (fds[0] == -1) {
 		if (errno == EISDIR || errno == ENOTSUP)
-			tst_brkm(TCONF, cleanup, "O_TMPFILE not supported");
+			tst_brk(TCONF, "O_TMPFILE not supported");
 
-		tst_brkm(TBROK | TERRNO, cleanup, "open() failed");
+		tst_brk(TBROK | TERRNO, "open() failed");
 	}
 
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_CLOSE(fds[0]);
 }
 
 static void write_file(int fd)
@@ -65,183 +50,188 @@ static void write_file(int fd)
 	int i;
 
 	for (i = 0; i < blocks_num; ++i)
-		SAFE_WRITE(cleanup, SAFE_WRITE_ALL, fd, buf, size);
+		SAFE_WRITE(1, fd, buf, size);
 }
 
 void test01(void)
 {
-	int fd;
-	char path[PATH_MAX], tmp[PATH_MAX];
-
-	tst_resm(TINFO, "creating a file with O_TMPFILE flag");
-	fd = SAFE_OPEN(cleanup, ".", O_TMPFILE | O_RDWR, 0600);
-
-	tst_resm(TINFO, "writing data to the file");
-	write_file(fd);
+	struct stat st;
+	char path[PATH_MAX];
 
-	SAFE_FSTAT(cleanup, fd, &st);
-	tst_resm(TINFO, "file size is '%li'", (long)st.st_size);
+	tst_res(TINFO, "Testing creation and linking of single temp file");
+	fds[0] = SAFE_OPEN(".", O_TMPFILE | O_RDWR, 0600);
+	write_file(fds[0]);
+	SAFE_FSTAT(fds[0], &st);
 
 	if (st.st_size != blocks_num * size) {
-		tst_resm(TFAIL, "not expected size: '%li' != '%zu'",
+		tst_res(TFAIL, "Unexpected test file size: %li != %zu",
 			 (long)st.st_size, blocks_num * size);
-		SAFE_CLOSE(cleanup, fd);
-		return;
+	} else {
+		tst_res(TPASS, "Test file size is %li", (long)st.st_size);
 	}
 
-	tst_resm(TINFO, "looking for the file in '.'");
-	if (!tst_dir_is_empty(cleanup, ".", 1))
-		tst_brkm(TFAIL, cleanup, "found a file, this is not expected");
-	tst_resm(TINFO, "file not found, OK");
+	if (!tst_dir_is_empty(".", 1))
+		tst_res(TFAIL, "Test directory is not empty");
+	else
+		tst_res(TPASS, "Test directory is empty");
 
-	snprintf(path, PATH_MAX,  "/proc/self/fd/%d", fd);
-	SAFE_READLINK(cleanup, path, tmp, PATH_MAX);
+	snprintf(path, PATH_MAX, "/proc/self/fd/%d", fds[0]);
+	tst_res(TINFO, "Linking unnamed test file to 'tmpfile'");
+	SAFE_LINKAT(AT_FDCWD, path, AT_FDCWD, "tmpfile", AT_SYMLINK_FOLLOW);
 
-	tst_resm(TINFO, "renaming '%s' -> 'tmpfile'", tmp);
-	SAFE_LINKAT(cleanup, AT_FDCWD, path, AT_FDCWD, "tmpfile",
-		    AT_SYMLINK_FOLLOW);
-
-	if (tst_dir_is_empty(cleanup, ".", 1))
-		tst_brkm(TFAIL, cleanup, "file not found");
+	if (tst_dir_is_empty(".", 1)) {
+		tst_res(TFAIL, "Test directory is still empty");
+		SAFE_CLOSE(fds[0]);
+		return;
+	}
 
-	SAFE_UNLINK(cleanup, "tmpfile");
-	SAFE_CLOSE(cleanup, fd);
+	if (access("tmpfile", F_OK)) {
+		tst_res(TFAIL | TERRNO, "Linked test file not found");
+		SAFE_CLOSE(fds[0]);
+		return;
+	}
 
-	tst_resm(TPASS, "single file tests passed");
+	tst_res(TPASS, "Test file was linked correctly");
+	SAFE_UNLINK("tmpfile");
+	SAFE_CLOSE(fds[0]);
 }
 
-static void read_file(int fd)
+static int read_file(int fd)
 {
 	int i;
 	char tmp[size];
 
-	SAFE_LSEEK(cleanup, fd, 0, SEEK_SET);
+	SAFE_LSEEK(fd, 0, SEEK_SET);
 
 	for (i = 0; i < blocks_num; ++i) {
-		SAFE_READ(cleanup, 0, fd, tmp, size);
-		if (memcmp(buf, tmp, size))
-			tst_brkm(TFAIL, cleanup, "got unexepected data");
+		SAFE_READ(0, fd, tmp, size);
+
+		if (memcmp(buf, tmp, size)) {
+			tst_res(TFAIL, "got unexepected data");
+			return 1;
+		}
 	}
+
+	return 0;
 }
 
 static void test02(void)
 {
-	const int files_num = 100;
-	int i, fd[files_num];
+	int i, fails = 0;
 	char path[PATH_MAX];
 
-	tst_resm(TINFO, "create files in multiple directories");
-	for (i = 0; i < files_num; ++i) {
+	tst_res(TINFO, "Testing temp files in multiple directories");
+	for (i = 0; i < FILE_COUNT; ++i) {
 		snprintf(path, PATH_MAX, "tst02_%d", i);
-		SAFE_MKDIR(cleanup, path, 0700);
-		SAFE_CHDIR(cleanup, path);
-
-		fd[i] = SAFE_OPEN(cleanup, ".", O_TMPFILE | O_RDWR, 0600);
+		SAFE_MKDIR(path, 0700);
+		SAFE_CHDIR(path);
+		fds[i] = SAFE_OPEN(".", O_TMPFILE | O_RDWR, 0600);
 	}
 
-	tst_resm(TINFO, "removing test directories");
-	for (i = files_num - 1; i >= 0; --i) {
-		SAFE_CHDIR(cleanup, "..");
+	tst_res(TINFO, "Removing test directories");
+	for (i = FILE_COUNT - 1; i >= 0; --i) {
+		SAFE_CHDIR("..");
 		snprintf(path, PATH_MAX, "tst02_%d", i);
-		SAFE_RMDIR(cleanup, path);
+		SAFE_RMDIR(path);
 	}
 
-	tst_resm(TINFO, "writing/reading temporary files");
-	for (i = 0; i < files_num; ++i) {
-		write_file(fd[i]);
-		read_file(fd[i]);
+	tst_res(TINFO, "Writing and reading temporary files");
+	for (i = 0; i < FILE_COUNT; ++i) {
+		write_file(fds[i]);
+		fails += read_file(fds[i]);
 	}
 
-	tst_resm(TINFO, "closing temporary files");
-	for (i = 0; i < files_num; ++i)
-		SAFE_CLOSE(cleanup, fd[i]);
+	tst_res(TINFO, "Closing temporary files");
+	for (i = 0; i < FILE_COUNT; ++i)
+		SAFE_CLOSE(fds[i]);
 
-	tst_resm(TPASS, "multiple files tests passed");
+	if (!fails)
+		tst_res(TPASS, "Multiple files test passed");
 }
 
 static void link_tmp_file(int fd)
 {
 	char path1[PATH_MAX], path2[PATH_MAX];
 
-	snprintf(path1, PATH_MAX,  "/proc/self/fd/%d", fd);
-	snprintf(path2, PATH_MAX,  "tmpfile_%d", fd);
-
-	SAFE_LINKAT(cleanup, AT_FDCWD, path1, AT_FDCWD, path2,
-		    AT_SYMLINK_FOLLOW);
+	snprintf(path1, PATH_MAX, "/proc/self/fd/%d", fd);
+	snprintf(path2, PATH_MAX, "tmpfile_%d", fd);
+	SAFE_LINKAT(AT_FDCWD, path1, AT_FDCWD, path2, AT_SYMLINK_FOLLOW);
 }
 
 static void test03(void)
 {
-	const int files_num = 100;
 	const mode_t test_perms[] = { 0, 07777, 001, 0755, 0644, 0440 };
 
-	int i, fd[files_num];
+	int i, fails = 0;
 	char path[PATH_MAX];
 	struct stat st;
 	mode_t mask = umask(0), perm;
 
 	umask(mask);
+	tst_res(TINFO, "Testing linked temp files access mode");
 
-	tst_resm(TINFO, "create multiple directories, link files into them");
-	tst_resm(TINFO, "and check file permissions");
-	for (i = 0; i < files_num; ++i) {
-
+	for (i = 0; i < FILE_COUNT; ++i) {
 		snprintf(path, PATH_MAX, "tst03_%d", i);
-		SAFE_MKDIR(cleanup, path, 0700);
-		SAFE_CHDIR(cleanup, path);
+		SAFE_MKDIR(path, 0700);
+		SAFE_CHDIR(path);
 
 		perm = test_perms[i % ARRAY_SIZE(test_perms)];
-
-		fd[i] = SAFE_OPEN(cleanup, ".", O_TMPFILE | O_RDWR, perm);
-
-		write_file(fd[i]);
-		read_file(fd[i]);
-
-		link_tmp_file(fd[i]);
-
-		snprintf(path, PATH_MAX, "tmpfile_%d", fd[i]);
-
-		SAFE_LSTAT(cleanup, path, &st);
-
-		mode_t exp_mode = perm & ~mask;
-
-		if ((st.st_mode & ~S_IFMT) != exp_mode) {
-			tst_brkm(TFAIL, cleanup,
-				"file mode read %o, but expected %o",
-				st.st_mode & ~S_IFMT, exp_mode);
+		fds[i] = SAFE_OPEN(".", O_TMPFILE | O_RDWR, perm);
+		write_file(fds[i]);
+		read_file(fds[i]);
+		link_tmp_file(fds[i]);
+
+		snprintf(path, PATH_MAX, "tmpfile_%d", fds[i]);
+		SAFE_LSTAT(path, &st);
+		perm &= ~mask;
+
+		if ((st.st_mode & ~S_IFMT) != perm) {
+			tst_res(TFAIL, "Unexpected access mode: %04o != %04o",
+				st.st_mode & ~S_IFMT, perm);
+			fails++;
 		}
 	}
 
-	tst_resm(TINFO, "remove files, directories");
-	for (i = files_num - 1; i >= 0; --i) {
-		snprintf(path, PATH_MAX, "tmpfile_%d", fd[i]);
-		SAFE_UNLINK(cleanup, path);
-		SAFE_CLOSE(cleanup, fd[i]);
+	if (!fails)
+		tst_res(TPASS, "File access modes are correct");
+
+	tst_res(TINFO, "Removing files and directories");
 
-		SAFE_CHDIR(cleanup, "..");
+	for (i = FILE_COUNT - 1; i >= 0; --i) {
+		snprintf(path, PATH_MAX, "tmpfile_%d", fds[i]);
+		SAFE_UNLINK(path);
+		SAFE_CLOSE(fds[i]);
 
+		SAFE_CHDIR("..");
 		snprintf(path, PATH_MAX, "tst03_%d", i);
-		SAFE_RMDIR(cleanup, path);
+		SAFE_RMDIR(path);
 	}
-
-	tst_resm(TPASS, "file permission tests passed");
 }
 
-int main(int ac, char *av[])
+static void run(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
+	test01();
+	test02();
+	test03();
+}
 
-	setup();
+static void cleanup(void)
+{
+	int i;
 
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		test01();
-		test02();
-		test03();
+	for (i = 0; i < FILE_COUNT; i++) {
+		if (fds[i] >= 0)
+			SAFE_CLOSE(fds[i]);
 	}
 
-	cleanup();
-	tst_exit();
+	SAFE_CHDIR("..");
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1
+};
-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
