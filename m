Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E84755A6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 10:58:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4D243C8F30
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 10:58:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8965A3C092C
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 10:58:35 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B27AD1A006B0
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 10:58:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE1501F386;
 Wed, 15 Dec 2021 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1639562313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S2OcK9psRkqk7h1ZYp9vVXnHl9aGdFpPXzK4BZw1HNY=;
 b=tipksP9BDsTIL/q+gsTfnCDM9Kk7+M/SK7tXLHbtugR1qL/X3HFzhVjWELGzPyd4i2bzEW
 An00fytt4/7h5IU+Q3X4mNTlZvf3ixDfoXtpNfXQGCQIpY+xa8HZ9kFYiefDkrlTBCVDLo
 udJfgqCDCTWP9LzjZt2fbbtQq0W1aIg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A5F113B09;
 Wed, 15 Dec 2021 09:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b2J8F0m8uWGPYQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Wed, 15 Dec 2021 09:58:33 +0000
To: ltp@lists.linux.it
Date: Wed, 15 Dec 2021 10:58:31 +0100
Message-Id: <20211215095831.20505-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Create dio_read.c test
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

dio_read.c has been created to replace ltp-diorh.c

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/ltp-aiodio.part4                   |  10 +-
 testcases/kernel/io/ltp-aiodio/.gitignore  |   2 +-
 testcases/kernel/io/ltp-aiodio/dio_read.c  | 162 +++++++++++++++++++
 testcases/kernel/io/ltp-aiodio/ltp-diorh.c | 176 ---------------------
 4 files changed, 168 insertions(+), 182 deletions(-)
 create mode 100644 testcases/kernel/io/ltp-aiodio/dio_read.c
 delete mode 100644 testcases/kernel/io/ltp-aiodio/ltp-diorh.c

diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
index ef1cfdac6..88a1b492b 100644
--- a/runtest/ltp-aiodio.part4
+++ b/runtest/ltp-aiodio.part4
@@ -61,8 +61,8 @@ DIT001 dio_truncate
 DIT002 dio_truncate
 #Running read_checkzero
 #gread_checkzero
-#Running ltp-diorh
-DOR000 ltp-diorh $TMPDIR/aiodio.$$/file2
-DOR001 ltp-diorh $TMPDIR/aiodio.$$/file3
-DOR002 ltp-diorh $TMPDIR/aiodio.$$/file4
-DOR003 ltp-diorh $TMPDIR/aiodio.$$/file5
+#Running dio_read
+DOR000 dio_read
+DOR001 dio_read
+DOR002 dio_read
+DOR003 dio_read
diff --git a/testcases/kernel/io/ltp-aiodio/.gitignore b/testcases/kernel/io/ltp-aiodio/.gitignore
index 8da8e946b..f5f20d57e 100644
--- a/testcases/kernel/io/ltp-aiodio/.gitignore
+++ b/testcases/kernel/io/ltp-aiodio/.gitignore
@@ -5,6 +5,6 @@
 /dio_append
 /dio_sparse
 /dio_truncate
+/dio_read
 /dirty
-/ltp-diorh
 /read_checkzero
diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
new file mode 100644
index 000000000..aa75329b2
--- /dev/null
+++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Create a file using buffered writes while other processes are doing
+ * O_DIRECT reads and check if the buffer reads always see zero.
+ */
+
+#define _GNU_SOURCE
+
+#include <sys/wait.h>
+#include "tst_test.h"
+#include "common.h"
+
+static char *str_numchildren;
+static char *str_writesize;
+static char *str_readsize;
+static char *str_filesize;
+
+static int numchildren;
+static long long readsize;
+static long long writesize;
+static long long filesize;
+static long long alignment;
+static char *iobuf;
+
+static void do_buffered_writes(int fd, char *bufptr, long long fsize, long long wsize, int pattern)
+{
+	long long offset;
+	long long w;
+
+	memset(bufptr, pattern, wsize);
+
+	tst_res(TINFO, "child %i reading file", getpid());
+	for (offset = 0; offset + wsize <= fsize; offset += wsize) {
+		w = pwrite(fd, bufptr, wsize, offset);
+		if (w < 0)
+			tst_brk(TBROK, "pwrite: %s", tst_strerrno(-w));
+		if (w != wsize)
+			tst_brk(TBROK, "pwrite: wrote %lld bytes out of %lld", w, wsize);
+
+		fsync(fd);
+	}
+}
+
+static int do_direct_reads(char *filename, char *bufptr, long long fsize, long long rsize)
+{
+	int fd;
+	long long offset;
+	long long w;
+	int fail = 0;
+
+	while ((fd = open(filename, O_RDONLY | O_DIRECT, 0666)) < 0)
+		usleep(100);
+
+	for (offset = 0; offset + rsize < fsize; offset += rsize) {
+		char *bufoff;
+
+		w = pread(fd, bufptr, rsize, offset);
+		if (w < 0)
+			tst_brk(TBROK, "pread: %s", tst_strerrno(-w));
+		if (w != rsize)
+			tst_brk(TBROK, "pread: read %lld bytes out of %lld", w, rsize);
+
+		bufoff = check_zero(bufptr, rsize);
+		if (bufoff) {
+			fail = 1;
+			break;
+		}
+	}
+
+	SAFE_CLOSE(fd);
+	return fail;
+}
+
+static void setup(void)
+{
+	struct stat sb;
+	long long buffsize;
+
+	numchildren = 100;
+	readsize = 32 * 1024 * 1024;
+	writesize = 32 * 1024 * 1024;
+	filesize = 128 * 1024 * 1024;
+	alignment = 512;
+
+	if (tst_parse_filesize(str_filesize, &filesize, 1, LLONG_MAX))
+		tst_brk(TBROK, "Invalid file size '%s'", str_filesize);
+
+	if (tst_parse_int(str_numchildren, &numchildren, 1, INT_MAX))
+		tst_brk(TBROK, "Invalid number of children '%s'", str_numchildren);
+
+	if (tst_parse_filesize(str_writesize, &writesize, 1, filesize))
+		tst_brk(TBROK, "Invalid write blocks size '%s'", str_writesize);
+
+	if (tst_parse_filesize(str_readsize, &readsize, 1, filesize))
+		tst_brk(TBROK, "Invalid read blocks size '%s'", str_readsize);
+
+	SAFE_STAT(".", &sb);
+	alignment = sb.st_blksize;
+
+	buffsize = readsize;
+	if (writesize > readsize)
+		buffsize = writesize;
+
+	iobuf = SAFE_MEMALIGN(alignment, buffsize);
+}
+
+static void run(void)
+{
+	char *filename = "file.bin";
+	int pid[numchildren];
+	int fd;
+	int i;
+	int fail;
+
+	fd = SAFE_OPEN(filename, O_CREAT | O_TRUNC | O_RDWR, 0666);
+	SAFE_FTRUNCATE(fd, filesize);
+
+	for (i = 0; i < numchildren; i++) {
+		pid[i] = SAFE_FORK();
+		if (!pid[i]) {
+			do_buffered_writes(fd, iobuf, filesize, writesize, 0);
+			return;
+		}
+	}
+
+	fail = do_direct_reads(filename, iobuf, filesize, readsize);
+	for (i = 0; i < numchildren; i++)
+		wait4(pid[i], NULL, WNOHANG, 0);
+
+	/* Fill the file with a known pattern so that the blocks
+	 * on disk can be detected if they become exposed. */
+	do_buffered_writes(fd, iobuf, filesize, writesize, 1);
+	fsync(fd);
+
+	SAFE_FTRUNCATE(fd, 0);
+	fsync(fd);
+
+	if (fail)
+		tst_res(TFAIL, "Non zero bytes read");
+	else
+		tst_res(TPASS, "All bytes read were zeroed");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+	.options = (struct tst_option[]) {
+		{"n:", &str_numchildren, "Number of threads (default 100)"},
+		{"w:", &str_writesize, "Size of writing blocks (default 32M)"},
+		{"r:", &str_readsize, "Size of reading blocks (default 32M)"},
+		{"s:", &str_filesize, "File size (default 128M)"},
+		{}
+	},
+};
diff --git a/testcases/kernel/io/ltp-aiodio/ltp-diorh.c b/testcases/kernel/io/ltp-aiodio/ltp-diorh.c
deleted file mode 100644
index 3bdf62388..000000000
--- a/testcases/kernel/io/ltp-aiodio/ltp-diorh.c
+++ /dev/null
@@ -1,176 +0,0 @@
-/*
- *   Copyright (C) 2003,2004 Red Hat, Inc.  All rights reserved.
- *
- *   The contents of this file may be used under the terms of the GNU
- *   General Public License version 2 (the "GPL")
- *
- *   Author: Stephen C. Tweedie <sct@redhat.com>
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
- *
- * Module: .c
- */
-
-/*
- * Change History:
- *
- * 2/2004  Marty Ridgeway (mridge@us.ibm.com) Changes to adapt to LTP
- *
- */
-
-#define _XOPEN_SOURCE 600
-#define _GNU_SOURCE
-#define MAX_ITERATIONS 250
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-#include <sys/wait.h>
-
-#define BIGSIZE 128*1024*1024
-#define READSIZE 32*1024*1024
-#define WRITESIZE 32*1024*1024
-
-int pagesize;
-char *iobuf;
-int pass = 0;
-
-void assert(const char *what, int assertion)
-{
-	if (assertion)
-		return;
-	perror(what);
-	exit(1);
-}
-
-void do_buffered_writes(int fd, int pattern)
-{
-	int rc;
-	int offset;
-
-	memset(iobuf, pattern, WRITESIZE);
-	for (offset = 0; offset + WRITESIZE <= BIGSIZE; offset += WRITESIZE) {
-		rc = pwrite(fd, iobuf, WRITESIZE, offset);
-		assert("pwrite", rc >= 0);
-		if (rc != WRITESIZE) {
-			fprintf(stderr, "Pass %d: short write (%d out of %d)\n",
-				pass, rc, WRITESIZE);
-			exit(1);
-		}
-		fsync(fd);
-	}
-}
-
-int do_direct_reads(char *filename)
-{
-	int fd;
-	int offset;
-	int rc, i;
-	int *p;
-
-	fd = open(filename, O_DIRECT | O_RDONLY, 0);
-	assert("open", fd >= 0);
-
-	for (offset = 0; offset + READSIZE <= BIGSIZE; offset += READSIZE) {
-		rc = pread(fd, iobuf, READSIZE, offset);
-		assert("pread", rc >= 0);
-		if (rc != READSIZE) {
-			fprintf(stderr, "Pass: %d short read (%d out of %d)\n",
-				pass, rc, READSIZE);
-			exit(1);
-		}
-		for (i = 0, p = (int *)iobuf; i < READSIZE; i += 4) {
-			if (*p) {
-				fprintf(stderr,
-					"Pass: %d Found data (%08x) at offset %d+%d\n",
-					pass, *p, offset, i);
-				close(fd);
-				return 1;
-			}
-			p++;
-		}
-	}
-	close(fd);
-	return 0;
-}
-
-int main(int argc, char *argv[])
-{
-	char *filename;
-	int fd;
-	int pid;
-	int err;
-	int bufsize;
-
-	if (argc != 2) {
-		fprintf(stderr, "Needs a filename as an argument.\n");
-		exit(1);
-	}
-
-	filename = argv[1];
-
-	pagesize = getpagesize();
-	bufsize = READSIZE;
-	if (WRITESIZE > READSIZE)
-		bufsize = WRITESIZE;
-	err = posix_memalign((void **)&iobuf, pagesize, bufsize);
-	if (err) {
-		fprintf(stderr, "Error allocating %d aligned bytes.\n",
-			bufsize);
-		exit(1);
-	}
-
-	fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0666);
-	assert("open", fd >= 0);
-
-	do {
-
-		assert("ftruncate", ftruncate(fd, BIGSIZE) == 0);
-		fsync(fd);
-
-		pid = fork();
-		assert("fork", pid >= 0);
-
-		if (!pid) {
-			do_buffered_writes(fd, 0);
-			exit(0);
-		}
-
-		err = do_direct_reads(filename);
-
-		wait4(pid, NULL, WNOHANG, 0);
-
-		if (err)
-			break;
-
-		/* Fill the file with a known pattern so that the blocks
-		 * on disk can be detected if they become exposed. */
-		do_buffered_writes(fd, 1);
-		fsync(fd);
-
-		assert("ftruncate", ftruncate(fd, 0) == 0);
-		fsync(fd);
-	} while (pass++ < MAX_ITERATIONS);
-
-	if (!err) {
-		fprintf(stdout, "ltp-diorh: Completed %d iterations OK \n",
-			pass);
-	}
-
-	return err;
-}
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
