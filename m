Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAA78FDB5
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 14:48:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 419CA3CE136
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 14:48:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE73B3CBF3B
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:48:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0EA8014010FA
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 14:48:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 36D5A1F86C
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693572502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpGRLjlFz4icComuZWmAGvigD0QwMkGWhHvCygodxiI=;
 b=fiBE7pIi+f2vA30QvH6Hbp1gONkJshl5YrKXm3xIbqv9EaWqdBnhYpGX6TGzn2QCIRFy+j
 JEpr1uMQn9QLpDNCiqeCwwks3cFPxeru3/+lU+qZoRoHQ+kqvaQUoPQWVc63sqLya0meh5
 3iO+1ZF5Avby/bm2qHj6GW8vcFCbsTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693572502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpGRLjlFz4icComuZWmAGvigD0QwMkGWhHvCygodxiI=;
 b=SLdAvVmBdUq2pusSMKlDnAW6WA3hCjdnHtKcP5Jb/ulwbrKe3AcQX0uMCZcJRlNRSWhLvn
 7TKl4RKP9AnLmzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CABD11358B
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q0ixJpXd8WTJLQAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Fri, 01 Sep 2023 12:48:21 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri,  1 Sep 2023 18:18:14 +0530
Message-ID: <20230901124816.30437-2-akumar@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901124816.30437-1-akumar@suse.de>
References: <20230901124816.30437-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/mmap02: Rewrite the test using new
 LTP API
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
 testcases/kernel/syscalls/mmap/mmap02.c | 204 +++++-------------------
 1 file changed, 41 insertions(+), 163 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap02.c b/testcases/kernel/syscalls/mmap/mmap02.c
index 566cc323a..7ffe61fa3 100644
--- a/testcases/kernel/syscalls/mmap/mmap02.c
+++ b/testcases/kernel/syscalls/mmap/mmap02.c
@@ -1,186 +1,64 @@
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
+ *  07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2023 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test Description:
- *  Call mmap() with prot parameter set to PROT_READ and with the file
- *  descriptor being open for read, to  map a file creating mapped memory
- *  with read access. The minimum file permissions should be 0444.
- *
- *  The call should succeed to create the mapped region with required
- *  attributes.
+/*\
+ * [Description]
  *
- * Expected Result:
- *  mmap() should succeed returning the address of the mapped region,
- *  the mapped region should contain the contents of the mapped file.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * Verify that, mmap() call with PROT_READ and a file descriptor which is
+ * open for read only, succeeds to map a file creating mapped memory with
+ * read access.
  */
-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-
-#include "test.h"
 
-#define TEMPFILE	"mmapfile"
-
-char *TCID = "mmap02";
-int TST_TOTAL = 1;
+#include <stdlib.h>
+#include "tst_test.h"
 
+#define TEMPFILE "mmapfile"
+static ssize_t page_sz;
+static int fd;
 static char *addr;
-static char *dummy;
-static size_t page_sz;
-static int fildes;
-
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
-{
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
-		 * Call mmap to map the temporary file 'TEMPFILE'
-		 * with read access.
-		 */
-		errno = 0;
-		addr = mmap(0, page_sz, PROT_READ,
-			    MAP_FILE | MAP_SHARED, fildes, 0);
-
-		/* Check for the return value of mmap() */
-		if (addr == MAP_FAILED) {
-			tst_resm(TFAIL | TERRNO, "mmap of %s failed", TEMPFILE);
-			continue;
-		}
-
-		/*
-		 * Read the file contents into the dummy
-		 * string.
-		 */
-		if (read(fildes, dummy, page_sz) < 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "reading %s failed", TEMPFILE);
-		}
-
-		/*
-		 * Check whether mapped memory region has
-		 * the file contents.
-		 */
-		if (memcmp(dummy, addr, page_sz)) {
-			tst_resm(TFAIL, "mapped memory area contains "
-				 "invalid data");
-		} else {
-			tst_resm(TPASS,
-				 "Functionality of mmap() successful");
-		}
-
-		/* Clean up things in case we are looping */
-		/* Unmap the mapped memory */
-		if (munmap(addr, page_sz) != 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup, "munmapping failed");
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
+static char *buf;
 
 static void setup(void)
 {
-	char *tst_buff;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
 	page_sz = getpagesize();
+	buf = SAFE_MALLOC(page_sz);
+	memset(buf, 'A', page_sz);
 
-	/* Allocate space for the test buffer */
-	if ((tst_buff = calloc(page_sz, sizeof(char))) == NULL) {
-		tst_brkm(TFAIL, NULL, "calloc failed (tst_buff)");
-	}
-
-	/* Fill the test buffer with the known data */
-	memset(tst_buff, 'A', page_sz);
+	fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT, 0666);
+	SAFE_WRITE(SAFE_WRITE_ALL, fd, buf, page_sz);
 
-	tst_tmpdir();
-
-	/* Creat a temporary file used for mapping */
-	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0) {
-		free(tst_buff);
-		tst_brkm(TFAIL | TERRNO, cleanup, "opening %s failed",
-			 TEMPFILE);
-	}
-
-	/* Write test buffer contents into temporary file */
-	if (write(fildes, tst_buff, page_sz) < (int)page_sz) {
-		free(tst_buff);
-		tst_brkm(TFAIL | TERRNO, cleanup,
-			 "writing to %s failed", TEMPFILE);
-	}
-
-	/* Free the memory allocated for test buffer */
-	free(tst_buff);
-
-	/* Change Mode permissions on Temporary file */
-	if (fchmod(fildes, 0444) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup, "fchmod(%s, 0444) failed",
-			 TEMPFILE);
-	}
-
-	/* Close the temporary file */
-	if (close(fildes) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup, "closing %s failed",
-			 TEMPFILE);
-	}
+	SAFE_FCHMOD(fd, 0444);
+	SAFE_CLOSE(fd);
+	fd = SAFE_OPEN(TEMPFILE, O_RDONLY);
+}
 
-	/* Open the temporary file again, - Readonly mode */
-	if ((fildes = open(TEMPFILE, O_RDONLY)) < 0) {
-		tst_brkm(TFAIL, cleanup, "reopening %s readonly failed",
-			 TEMPFILE);
-	}
+static void run(void)
+{
+	addr = SAFE_MMAP(NULL, page_sz, PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
 
-	/* Allocate and initialize dummy string of system page size bytes */
-	if ((dummy = calloc(page_sz, sizeof(char))) == NULL) {
-		tst_brkm(TFAIL, cleanup, "calloc failed (dummy)");
-	}
+	if (memcmp(buf, addr, page_sz) == 0)
+		tst_res(TPASS, "mmap() functionality successful");
+	else
+		tst_res(TFAIL, "mapped memory area contains invalid data");
 
+	SAFE_MUNMAP(addr, page_sz);
 }
 
 static void cleanup(void)
 {
-	close(fildes);
-	free(dummy);
-	tst_rmdir();
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+
+	free(buf);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_tmpdir = 1
+};
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
