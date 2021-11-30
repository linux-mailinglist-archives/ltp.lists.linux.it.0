Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFF4637A0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 15:52:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D6643C7FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 15:52:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5C083C60CA
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 15:52:10 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E58DD140055B
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 15:52:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29F8F1FD59;
 Tue, 30 Nov 2021 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1638283929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L1rjR5DNCPTOx1LdW8wRb8WpytGKgoOstgnXxtelv2A=;
 b=htlSbDlxRSniHx8GlsyUhpgACFD7jfy33O5OEDNQpusEDZOVMYhIcy5MmCHPqUOTHVIj2G
 e11rEji0jl387avhtDLi+c4INyYOAUyIh9tVfMcx6BGtdJaWsnN5+PYcMYmhGtfbTUbnnf
 q6H3NE2V1iciT1p7OZuY7p//+J88XhA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE41113D4E;
 Tue, 30 Nov 2021 14:52:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7iqKLJg6pmGoRAAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 30 Nov 2021 14:52:08 +0000
To: ltp@lists.linux.it
Date: Tue, 30 Nov 2021 15:52:06 +0100
Message-Id: <20211130145206.32124-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Refactoring dio_append.c test using LTP API
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/io/ltp-aiodio/dio_append.c | 174 ++++++++------------
 1 file changed, 71 insertions(+), 103 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index b1b4dc039..d6999064d 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -1,143 +1,111 @@
-
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2004 Daniel McNeil <daniel@osdl.org>
- *               2004 Open Source Development Lab
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
+ *				 2004 Open Source Development Lab
+ *				 2004  Marty Ridgeway <mridge@us.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
- * Change History:
- *
- * 2/2004  Marty Ridgeway (mridge@us.ibm.com) Changes to adapt to LTP
+/*\
+ * [Description]
  *
+ * Append zeroed data to a file using O_DIRECT while other processes are doing
+ * buffered reads and check if the buffer reads always see zero.
  */
-/*
- * dio_append - append zeroed data to a file using O_DIRECT while
- *	a 2nd process is doing buffered reads and check if the buffer
- *	reads always see zero.
- */
+
 #define _GNU_SOURCE
 
 #include <stdlib.h>
-#include <sys/types.h>
-#include <signal.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <stdio.h>
 #include <unistd.h>
-#include <memory.h>
-#include <limits.h>
+#include <fcntl.h>
+#include "tst_test.h"
+#include "common.h"
 
-#include "test.h"
-#define NUM_CHILDREN 8
+#define NUM_CHILDREN 16
+#define FILE_SIZE (64 * 1024)
 
-#include "common_checkzero.h"
+static int *run_child;
 
-int read_eof(char *filename)
+static void read_eof(const char *filename, size_t bs)
 {
 	int fd;
-	int i;
 	int r;
-	char buf[4096];
+	char *bufptr;
 
-	while ((fd = open(filename, O_RDONLY)) < 0) {
-		sleep(1);	/* wait for file to be created */
-	}
+	bufptr = SAFE_MEMALIGN(getpagesize(), bs);
+
+	while ((fd = open(filename, O_RDONLY, 0666)) < 0)
+		usleep(100);
 
-	for (i = 0; i < 1000000; i++) {
+	tst_res(TINFO, "child %i reading file", getpid());
+	while (*run_child) {
 		off_t offset;
 		char *bufoff;
 
-		offset = lseek(fd, SEEK_END, 0);
-		r = read(fd, buf, 4096);
-		if (r > 0) {
-			if ((bufoff = check_zero(buf, r))) {
-				fprintf(stderr, "non-zero read at offset %p\n",
-					offset + bufoff);
-				exit(1);
+		offset = SAFE_LSEEK(fd, 0, SEEK_SET);
+		do {
+			r = read(fd, bufptr, bs);
+			if (r > 0) {
+				bufoff = check_zero(bufptr, r);
+				if (bufoff) {
+					tst_res(TINFO, "non-zero read at offset %zu",
+						offset + (bufoff - bufptr));
+					free(bufptr);
+					SAFE_CLOSE(fd);
+					return;
+				}
+				offset += r;
 			}
-		}
+		} while (r > 0);
 	}
-	return 0;
+
+	free(bufptr);
+	SAFE_CLOSE(fd);
 }
 
-void dio_append(char *filename)
+static void setup(void)
 {
-	int fd;
-	void *bufptr = NULL;
-	int i;
-	int w;
-
-	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
-
-	if (fd < 0) {
-		perror("cannot create file");
-		return;
-	}
-
-	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
-	if (TEST_RETURN) {
-		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
-		close(fd);
-		return;
-	}
+	run_child = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+}
 
-	memset(bufptr, 0, 64 * 1024);
-	for (i = 0; i < 1000; i++) {
-		if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
-			fprintf(stderr, "write %d returned %d\n", i, w);
-		}
-	}
+static void cleanup(void)
+{
+	SAFE_MUNMAP(run_child, sizeof(int));
 }
 
-int main(void)
+static void run(void)
 {
-	char filename[PATH_MAX];
-	int pid[NUM_CHILDREN];
-	int num_children = 1;
+	char *filename = "file";
+	int filesize = FILE_SIZE;
+	int num_children = NUM_CHILDREN;
+	int status;
 	int i;
 
-	snprintf(filename, sizeof(filename), "%s/aiodio/file",
-		 getenv("TMP") ? getenv("TMP") : "/tmp");
-
-	printf("Begin dio_append test...\n");
+	*run_child = 1;
 
 	for (i = 0; i < num_children; i++) {
-		if ((pid[i] = fork()) == 0) {
-			/* child */
-			return read_eof(filename);
-		} else if (pid[i] < 0) {
-			/* error */
-			perror("fork error");
-			break;
-		} else {
-			/* Parent */
-			continue;
+		if (!SAFE_FORK()) {
+			read_eof(filename, filesize);
+			return;
 		}
 	}
 
-	/*
-	 * Parent appends to end of file using direct i/o
-	 */
+	tst_res(TINFO, "parent append to file");
 
-	dio_append(filename);
+	io_append(filename, 0, O_DIRECT | O_WRONLY | O_CREAT, filesize, 1000);
 
-	for (i = 0; i < num_children; i++) {
-		kill(pid[i], SIGTERM);
-	}
-	return 0;
+	if (SAFE_WAITPID(-1, &status, WNOHANG))
+		tst_res(TFAIL, "Non zero bytes read");
+	else
+		tst_res(TPASS, "All bytes read were zeroed");
+
+	*run_child = 0;
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+};
-- 
2.34.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
