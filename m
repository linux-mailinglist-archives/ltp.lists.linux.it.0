Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33E7A02E9
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 13:45:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B6A83CE722
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 13:45:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6054B3CE712
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 13:45:27 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0FBF1000A6C
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 13:45:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 168911F459
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694691926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jipFCabk3Fn4hdlkdsxzE7Xx6BeRGqShp9O/JBsUN3w=;
 b=UPa9etrdeaj7G9O6syjjzQnha4ATA5wUdspqvXN/PLyONyyp2lAqsKimq0NAG4qY1TcPer
 LVDk69J/pQwmyBPBWitRFQja7NVDIQf8bdf1vG8LR16EovQMJ557ZY3xSJTc2TKH2+3yKM
 7j59fl2KhOWvjCi/8MNm2poKUFR1KOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694691926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jipFCabk3Fn4hdlkdsxzE7Xx6BeRGqShp9O/JBsUN3w=;
 b=lUrdaNtNtHNvAqMsZQiKwfyAWFvc6pXX/ijl81ye3lI/YbU0LumEx6AiWIjBDp1epYjiFB
 ukQYx8D38DweBaAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8B0A139DB
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 11:45:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ClvCHlXyAmUTGQAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 11:45:25 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu, 14 Sep 2023 17:15:19 +0530
Message-ID: <20230914114520.5212-2-akumar@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914114520.5212-1-akumar@suse.de>
References: <20230914114520.5212-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/mmap01: Rewrite the test using new LTP API
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

- use SAFE_MSYNC() macro
- fixed the test for iterations > 1

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/mmap/mmap01.c | 223 +++++++-----------------
 1 file changed, 63 insertions(+), 160 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap01.c b/testcases/kernel/syscalls/mmap/mmap01.c
index 99266b57f..a1e6e9d59 100644
--- a/testcases/kernel/syscalls/mmap/mmap01.c
+++ b/testcases/kernel/syscalls/mmap/mmap01.c
@@ -1,194 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ *	07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2023 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test Description:
- *  Verify that, mmap() succeeds when used to map a file where size of the
- *  file is not a multiple of the page size, the memory area beyond the end
- *  of the file to the end of the page is accessible. Also, verify that
- *  this area is all zeroed and the modifications done to this area are
- *  not written to the file.
- *
- * Expected Result:
- *  mmap() should succeed returning the address of the mapped region.
- *  The memory area beyond the end of file to the end of page should be
- *  filled with zero.
- *  The changes beyond the end of file should not get written to the file.
+/*\
+ * [Description]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * Verify that, mmap() succeeds when used to map a file where size of the
+ * file is not a multiple of the page size, the memory area beyond the end
+ * of the file to the end of the page is accessible. Also, verify that
+ * this area is all zeroed and the modifications done to this area are
+ * not written to the file.
  */
-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <string.h>
-#include <signal.h>
-#include <stdint.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include <sys/shm.h>
-
-#include "test.h"
-
-#define TEMPFILE	"mmapfile"
 
-char *TCID = "mmap01";
-int TST_TOTAL = 1;
+#include <stdlib.h>
+#include "tst_test.h"
 
-static char *addr;
-static char *dummy;
+#define TEMPFILE "mmapfile"
+static int fd;
 static size_t page_sz;
 static size_t file_sz;
-static int fildes;
-static char cmd_buffer[BUFSIZ];
-
-static void setup(void);
-static void cleanup(void);
+static char *dummy;
+static char *addr;
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
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
-		 * Call mmap to map the temporary file beyond EOF
-		 * with write access.
-		 */
-		errno = 0;
-		addr = mmap(NULL, page_sz, PROT_READ | PROT_WRITE,
-			    MAP_FILE | MAP_SHARED, fildes, 0);
-
-		/* Check for the return value of mmap() */
-		if (addr == MAP_FAILED) {
-			tst_resm(TFAIL | TERRNO, "mmap of %s failed", TEMPFILE);
-			continue;
-		}
-
-		/*
-		 * Check if mapped memory area beyond EOF are
-		 * zeros and changes beyond EOF are not written
-		 * to file.
-		 */
-		if (memcmp(&addr[file_sz], dummy, page_sz - file_sz)) {
-			tst_brkm(TFAIL, cleanup,
-				 "mapped memory area contains invalid "
-				 "data");
-		}
+	struct stat stat_buf;
+	char write_buf[] = "hello world\n";
 
-		/*
-		 * Initialize memory beyond file size
-		 */
-		addr[file_sz] = 'X';
-		addr[file_sz + 1] = 'Y';
-		addr[file_sz + 2] = 'Z';
-
-		/*
-		 * Synchronize the mapped memory region
-		 * with the file.
-		 */
-		if (msync(addr, page_sz, MS_SYNC) != 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "failed to synchronize mapped file");
-		}
+	fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT, 0666);
 
-		/*
-		 * Now, Search for the pattern 'XYZ' in the
-		 * temporary file.  The pattern should not be
-		 * found and the return value should be 1.
-		 */
-		if (system(cmd_buffer) != 0) {
-			tst_resm(TPASS,
-				 "Functionality of mmap() successful");
-		} else {
-			tst_resm(TFAIL,
-				 "Specified pattern found in file");
-		}
+	SAFE_WRITE(SAFE_WRITE_ALL, fd, write_buf, strlen(write_buf));
+	SAFE_LSEEK(fd, 0, SEEK_SET);
+	SAFE_STAT(TEMPFILE, &stat_buf);
 
-		/* Clean up things in case we are looping */
-		/* Unmap the mapped memory */
-		if (munmap(addr, page_sz) != 0) {
-			tst_brkm(TFAIL | TERRNO, NULL, "munmap failed");
-		}
-	}
+	file_sz = stat_buf.st_size;
+	page_sz = getpagesize();
 
-	cleanup();
-	tst_exit();
+	dummy = SAFE_MALLOC(page_sz);
+	memset(dummy, 0, page_sz);
 }
 
-static void setup(void)
+static void run(void)
 {
-	struct stat stat_buf;
-	char Path_name[PATH_MAX];
-	char write_buf[] = "hello world\n";
+	char buf[20];
+	unsigned long read_cnt;
 
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	addr = SAFE_MMAP(NULL, page_sz, PROT_READ | PROT_WRITE, MAP_FILE | MAP_SHARED, fd, 0);
 
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* Get the path of temporary file to be created */
-	if (getcwd(Path_name, sizeof(Path_name)) == NULL) {
-		tst_brkm(TFAIL | TERRNO, cleanup,
-			 "getcwd failed to get current working directory");
+	if (memcmp(&addr[file_sz], dummy, page_sz - file_sz) != 0) {
+		tst_res(TFAIL, "mapped memory area contains invalid data");
+		goto unmap;
 	}
 
-	/* Creat a temporary file used for mapping */
-	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0) {
-		tst_brkm(TFAIL, cleanup, "opening %s failed", TEMPFILE);
-	}
+	addr[file_sz] = 'X';
+	addr[file_sz + 1] = 'Y';
+	addr[file_sz + 2] = 'Z';
 
-	/* Write some data into temporary file */
-	if (write(fildes, write_buf, strlen(write_buf)) != (long)strlen(write_buf)) {
-		tst_brkm(TFAIL, cleanup, "writing to %s", TEMPFILE);
-	}
+	SAFE_MSYNC(addr, page_sz, MS_SYNC);
 
-	/* Get the size of temporary file */
-	if (stat(TEMPFILE, &stat_buf) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup, "stat of %s failed",
-			 TEMPFILE);
-	}
-	file_sz = stat_buf.st_size;
+	memset(buf, 0, sizeof(buf));
+	read_cnt = SAFE_READ(0, fd, buf, sizeof(buf));
+	if (read_cnt != file_sz)
+		tst_res(TFAIL, "unexpected data length in buf");
 
-	page_sz = getpagesize();
+	for (int i = 0; i < 3; i++)
+		if ((memchr(buf, (int)('X') + i, sizeof(buf))) != NULL) {
+			tst_res(TFAIL, "mmap() functionality failed");
+			goto unmap;
+		}
 
-	/* Allocate and initialize dummy string of system page size bytes */
-	if ((dummy = calloc(page_sz, sizeof(char))) == NULL) {
-		tst_brkm(TFAIL, cleanup, "calloc failed (dummy)");
-	}
+	tst_res(TPASS, "mmap() functionality successful");
 
-	/* Create the command which will be executed in the test */
-	sprintf(cmd_buffer, "grep XYZ %s/%s > /dev/null", Path_name, TEMPFILE);
+	SAFE_LSEEK(fd, 0, SEEK_SET);
+	memset(&addr[file_sz], 0, 3);
+
+unmap:
+	SAFE_MUNMAP(addr, page_sz);
 }
 
 static void cleanup(void)
 {
-	close(fildes);
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+
 	free(dummy);
-	tst_rmdir();
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_tmpdir = 1
+};
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
