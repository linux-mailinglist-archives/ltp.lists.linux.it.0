Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4720ACB91B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 17:57:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AD243C9DB9
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 17:57:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 89BB23C9DCF
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 17:57:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A8E81400985
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 17:57:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2FDA7211CB
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748879837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nguko6cy7/7OEGicHIuhFTn5FP0HZ+d/i6JNCFsBrCw=;
 b=PTICNzE0v9QBU4hh3vS3ZXwMmCyB/0Yb3jlaU6FDeql36EQgFdRI2P0HYP1kRE1qz3bAV6
 2CsrLsz4AulPsmrFYxytAkdqbWSr/e5QdUhPwsXk/bwxMzkREXOGpH8/F5ea/DhgKWp6x7
 +JWHSzeWnTsv3eaGTrqrwiZhlwnL0G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748879837;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nguko6cy7/7OEGicHIuhFTn5FP0HZ+d/i6JNCFsBrCw=;
 b=/0kyEa4r491dfx8tWFDUbMS1+6Nvd377zypc4El/Iw+3QoGl8WnkhLY0Yt8+yRvO8ZL8on
 np3/E3yHOnvdreCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=PTICNzE0;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="/0kyEa4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748879837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nguko6cy7/7OEGicHIuhFTn5FP0HZ+d/i6JNCFsBrCw=;
 b=PTICNzE0v9QBU4hh3vS3ZXwMmCyB/0Yb3jlaU6FDeql36EQgFdRI2P0HYP1kRE1qz3bAV6
 2CsrLsz4AulPsmrFYxytAkdqbWSr/e5QdUhPwsXk/bwxMzkREXOGpH8/F5ea/DhgKWp6x7
 +JWHSzeWnTsv3eaGTrqrwiZhlwnL0G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748879837;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nguko6cy7/7OEGicHIuhFTn5FP0HZ+d/i6JNCFsBrCw=;
 b=/0kyEa4r491dfx8tWFDUbMS1+6Nvd377zypc4El/Iw+3QoGl8WnkhLY0Yt8+yRvO8ZL8on
 np3/E3yHOnvdreCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2375313A63
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 15:57:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I6ZkCN3JPWiqBgAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 02 Jun 2025 15:57:17 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Jun 2025 17:57:05 +0200
Message-ID: <20250602155710.63165-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2FDA7211CB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_ONE(0.00)[1]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_NONE(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 ASN(0.00)[asn:9498, ipnet:::/1, country:IN];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] open12: Convert to new API
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

In addition to converting the test, also enable .all_filesystems.
A follow-up patch fixes the useless O_APPEND testcase.

 testcases/kernel/syscalls/open/open12.c | 247 +++++++++---------------
 1 file changed, 90 insertions(+), 157 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open12.c b/testcases/kernel/syscalls/open/open12.c
index 188d17946..c8147bc9f 100644
--- a/testcases/kernel/syscalls/open/open12.c
+++ b/testcases/kernel/syscalls/open/open12.c
@@ -1,134 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
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
- * with this program.
+ * Copyright (c) 2025 SUSE LLC <mdoucha@suse.cz>
  */
-/*
- * DESCRIPTION
- *	This test case will verify basic function of open(2) with the flags
- *	O_APPEND, O_NOATIME, O_CLOEXEC and O_LARGEFILE.
+/*\
+ * This test case will verify basic function of open(2) with the flags
+ * O_APPEND, O_NOATIME, O_CLOEXEC and O_LARGEFILE.
  */
 
 #define _GNU_SOURCE
 
-#include <stdio.h>
-#include <sys/types.h>
 #include <sys/wait.h>
-#include <unistd.h>
-#include <mntent.h>
-#include <errno.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 #include "lapi/fcntl.h"
 #include "lapi/mount.h"
 
 #define MNTPOINT	"mntpoint"
-#define TEST_FILE	MNTPOINT"/test_file"
-#define LARGE_FILE	"large_file"
-
-#define DIR_MODE 0755
-
-char *TCID = "open12";
+#define TEST_FILE	MNTPOINT "/test_file"
+#define LARGE_FILE	MNTPOINT "/large_file"
 
-static const char *device;
-static unsigned int mount_flag, skip_noatime;
+static int fd = -1;
 
-static void setup(void);
-static void cleanup(void);
 static void test_append(void);
 static void test_noatime(void);
 static void test_cloexec(void);
 static void test_largefile(void);
 
-static void (*test_func[])(void) = { test_append, test_noatime, test_cloexec,
-				     test_largefile };
+static void (*test_func[])(void) = {
+	test_append, test_noatime, test_cloexec, test_largefile
+};
 
-int TST_TOTAL = ARRAY_SIZE(test_func);
-
-int main(int argc, char **argv)
+static void run(unsigned int n)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		for (i = 0; i < TST_TOTAL; i++)
-			(*test_func[i])();
-	}
-
-	cleanup();
-	tst_exit();
+	test_func[n]();
 }
 
 static void setup(void)
 {
-	const char *mount_flags[] = {"noatime", "relatime", NULL};
-
-	TEST_PAUSE;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_tmpdir();
-
-	SAFE_MKDIR(cleanup, MNTPOINT, DIR_MODE);
-
-	if (tst_path_has_mnt_flags(cleanup, NULL, mount_flags)) {
-		const char *fs_type;
-
-		fs_type = tst_dev_fs_type();
-		device = tst_acquire_device(cleanup);
-
-		if (!device) {
-			tst_resm(TINFO, "Failed to obtain block device");
-			skip_noatime = 1;
-			goto end;
-		}
-
-		tst_mkfs(cleanup, device, fs_type, NULL, NULL);
-
-		SAFE_MOUNT(cleanup, device, MNTPOINT, fs_type, MS_STRICTATIME, NULL);
-		mount_flag = 1;
-	}
-
-end:
-	SAFE_FILE_PRINTF(cleanup, TEST_FILE, TEST_FILE);
+	SAFE_FILE_PRINTF(TEST_FILE, TEST_FILE);
 }
 
 static void test_append(void)
 {
 	off_t len1, len2;
 
-	TEST(open(TEST_FILE, O_RDWR | O_APPEND, 0777));
+	tst_res(TINFO, "Testing O_APPEND");
+
+	fd = TST_EXP_FD_SILENT(open(TEST_FILE, O_RDWR | O_APPEND, 0644));
 
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "open failed");
+	if (!TST_PASS)
 		return;
-	}
 
-	len1 = SAFE_LSEEK(cleanup, TEST_RETURN, 0, SEEK_CUR);
-	SAFE_WRITE(cleanup, SAFE_WRITE_ALL, TEST_RETURN, TEST_FILE,
-		sizeof(TEST_FILE));
-	len2 = SAFE_LSEEK(cleanup, TEST_RETURN, 0, SEEK_CUR);
-	SAFE_CLOSE(cleanup, TEST_RETURN);
+	len1 = SAFE_LSEEK(fd, 0, SEEK_CUR);
+	SAFE_WRITE(1, fd, TEST_FILE, strlen(TEST_FILE));
+	len2 = SAFE_LSEEK(fd, 0, SEEK_CUR);
+	SAFE_CLOSE(fd);
 
 	if (len2 > len1)
-		tst_resm(TPASS, "test O_APPEND for open success");
+		tst_res(TPASS, "O_APPEND works as expected");
 	else
-		tst_resm(TFAIL, "test O_APPEND for open failed");
+		tst_res(TFAIL, "O_APPEND did not move write cursor");
 }
 
 static void test_noatime(void)
@@ -136,31 +69,23 @@ static void test_noatime(void)
 	char read_buf;
 	struct stat old_stat, new_stat;
 
-	if (skip_noatime) {
-		tst_resm(TCONF,
-		         "test O_NOATIME flag for open needs filesystems which "
-		         "is mounted without noatime and relatime");
-		return;
-	}
-
-	SAFE_STAT(cleanup, TEST_FILE, &old_stat);
+	tst_res(TINFO, "Testing O_NOATIME");
 
+	SAFE_STAT(TEST_FILE, &old_stat);
 	sleep(1);
+	fd = TST_EXP_FD_SILENT(open(TEST_FILE, O_RDONLY | O_NOATIME, 0644));
 
-	TEST(open(TEST_FILE, O_RDONLY | O_NOATIME, 0777));
-
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "open failed");
+	if (!TST_PASS)
 		return;
-	}
-	SAFE_READ(cleanup, 1, TEST_RETURN, &read_buf, 1);
-	SAFE_CLOSE(cleanup, TEST_RETURN);
-	SAFE_STAT(cleanup, TEST_FILE, &new_stat);
+
+	SAFE_READ(1, fd, &read_buf, 1);
+	SAFE_CLOSE(fd);
+	SAFE_STAT(TEST_FILE, &new_stat);
 
 	if (old_stat.st_atime == new_stat.st_atime)
-		tst_resm(TPASS, "test O_NOATIME for open success");
+		tst_res(TPASS, "File access time was not modified");
 	else
-		tst_resm(TFAIL, "test O_NOATIME for open failed");
+		tst_res(TFAIL, "File access time changed");
 }
 
 static void test_cloexec(void)
@@ -169,80 +94,88 @@ static void test_cloexec(void)
 	int status;
 	char buf[20];
 
-	TEST(open(TEST_FILE, O_RDWR | O_APPEND | O_CLOEXEC, 0777));
-
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "open failed");
-		return;
-	}
-
-	sprintf(buf, "%ld", TEST_RETURN);
+	tst_res(TINFO, "Testing O_CLOEXEC");
 
-	pid = tst_fork();
-	if (pid < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "fork() failed");
+	fd = TST_EXP_FD_SILENT(open(TEST_FILE, O_RDWR | O_APPEND | O_CLOEXEC,
+		0644));
+	sprintf(buf, "%d", fd);
+	pid = SAFE_FORK();
 
 	if (pid == 0) {
 		if (execlp("open12_child", "open12_child", buf, NULL))
 			exit(2);
 	}
 
-	SAFE_CLOSE(cleanup, TEST_RETURN);
+	SAFE_CLOSE(fd);
 
 	if (wait(&status) != pid)
-		tst_brkm(TBROK | TERRNO, cleanup, "wait() failed");
+		tst_brk(TBROK | TERRNO, "wait() failed");
 
-	if (WIFEXITED(status)) {
-		switch ((int8_t)WEXITSTATUS(status)) {
-		case 0:
-			tst_resm(TPASS, "test O_CLOEXEC for open success");
+	if (!WIFEXITED(status))
+		tst_brk(TBROK, "open12_child exited with unexpected error");
+
+	switch (WEXITSTATUS(status)) {
+	case 0:
+		tst_res(TPASS, "File descriptor was closed by execlp()");
 		break;
-		case 1:
-			tst_resm(TFAIL, "test O_CLOEXEC for open failed");
+
+	case 1:
+		tst_res(TFAIL, "File descriptor remained open after execlp()");
 		break;
-		default:
-			tst_brkm(TBROK, cleanup, "execlp() failed");
-		}
-	} else {
-		tst_brkm(TBROK, cleanup,
-				 "open12_child exits with unexpected error");
+
+	default:
+		tst_brk(TBROK, "execlp() failed");
 	}
 }
 
 static void test_largefile(void)
 {
-	int fd;
 	off_t offset;
 
-	fd = SAFE_OPEN(cleanup, LARGE_FILE,
-				O_LARGEFILE | O_RDWR | O_CREAT, 0777);
+	tst_res(TINFO, "Testing O_LARGEFILE");
 
-	offset = lseek(fd, 4.1*1024*1024*1024, SEEK_SET);
-	if (offset == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "lseek failed");
+	fd = TST_EXP_FD_SILENT(open(LARGE_FILE, O_LARGEFILE | O_RDWR | O_CREAT,
+		0644));
 
-	SAFE_WRITE(cleanup, SAFE_WRITE_ALL, fd, LARGE_FILE,
-		sizeof(LARGE_FILE));
+	if (!TST_PASS)
+		return;
 
-	SAFE_CLOSE(cleanup, fd);
+	offset = lseek(fd, 4.1*1024*1024*1024, SEEK_SET);
 
-	TEST(open(LARGE_FILE, O_LARGEFILE | O_RDONLY, 0777));
+	if (offset < 0) {
+		tst_res(TFAIL | TERRNO, "lseek() past 4GB range failed");
+		return;
+	}
 
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL, "test O_LARGEFILE for open failed");
+	SAFE_WRITE(1, fd, LARGE_FILE, strlen(LARGE_FILE));
+	SAFE_CLOSE(fd);
+	fd = open(LARGE_FILE, O_LARGEFILE | O_RDONLY, 0644);
+
+	if (fd < 0) {
+		tst_res(TFAIL, "Cannot open large file again");
 	} else {
-		tst_resm(TPASS, "test O_LARGEFILE for open success");
-		SAFE_CLOSE(cleanup, TEST_RETURN);
+		tst_res(TPASS, "O_LARGEFILE works as expected");
+		SAFE_CLOSE(fd);
 	}
 }
 
 static void cleanup(void)
 {
-	if (mount_flag && tst_umount(MNTPOINT) == -1)
-		tst_brkm(TWARN | TERRNO, NULL, "umount(2) failed");
-
-	if (device)
-		tst_release_device(device);
-
-	tst_rmdir();
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.test = run,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(test_func),
+	.forks_child = 1,
+	.needs_root = 1,
+	.all_filesystems = 1,
+	.mntpoint = MNTPOINT,
+	.filesystems = (struct tst_fs[]){
+		{ .type = NULL, .mnt_flags = MS_STRICTATIME },
+		{}
+	}
+};
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
