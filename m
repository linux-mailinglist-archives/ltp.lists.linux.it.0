Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B5A5EF57
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Mar 2025 10:16:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F5FF3CA4DB
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Mar 2025 10:16:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A42343CA4F8
 for <ltp@lists.linux.it>; Thu, 13 Mar 2025 10:15:56 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DC47610007C8
 for <ltp@lists.linux.it>; Thu, 13 Mar 2025 10:15:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 163B11F453;
 Thu, 13 Mar 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741857350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8HpS4WSS4qkBT2YxOC8SsQAnp3vpDkxH1doAV1uPA8=;
 b=HMafU0aBh/QmpJDIa52pEdWFewJoVnsgtFViipLOKMnDMCdFqotG1lTOs43FZyMokfGh6B
 iXraSKaTm5D1wqX5waED9J/MYbDY+OchgfPlj8ccWI+G2C6L7m5QeO2+o+d/9f3Q10ECfS
 Jct7fbUx4suR4IQnNtnQN14N8SmwYgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741857350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8HpS4WSS4qkBT2YxOC8SsQAnp3vpDkxH1doAV1uPA8=;
 b=Xw7W0A4wF7pmMHSXcmwjx1lGtl/Vo1anUkCOfiekWHMaWdaNa+puUXNzvZJsNp04Sc1RRi
 DC13vDXQuRHvVEDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741857350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8HpS4WSS4qkBT2YxOC8SsQAnp3vpDkxH1doAV1uPA8=;
 b=HMafU0aBh/QmpJDIa52pEdWFewJoVnsgtFViipLOKMnDMCdFqotG1lTOs43FZyMokfGh6B
 iXraSKaTm5D1wqX5waED9J/MYbDY+OchgfPlj8ccWI+G2C6L7m5QeO2+o+d/9f3Q10ECfS
 Jct7fbUx4suR4IQnNtnQN14N8SmwYgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741857350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8HpS4WSS4qkBT2YxOC8SsQAnp3vpDkxH1doAV1uPA8=;
 b=Xw7W0A4wF7pmMHSXcmwjx1lGtl/Vo1anUkCOfiekWHMaWdaNa+puUXNzvZJsNp04Sc1RRi
 DC13vDXQuRHvVEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFF62139D2;
 Thu, 13 Mar 2025 09:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eH9BOkWi0mczNQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 13 Mar 2025 09:15:49 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 13 Mar 2025 10:15:34 +0100
MIME-Version: 1.0
Message-Id: <20250313-mmap_suite_refactoring-v3-1-eb9172686230@suse.com>
References: <20250313-mmap_suite_refactoring-v3-0-eb9172686230@suse.com>
In-Reply-To: <20250313-mmap_suite_refactoring-v3-0-eb9172686230@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741857349; l=8960;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=8VsrCZZQZxoVjADBOZyVdDTZkRg7YUNFZP4I9mY6DPA=;
 b=iGtVWraqID6AFK+dt6WYWEUtrO9o5njzW/aUNE7fgrpt0ZYcN5vHLI/t2QXPF7U5+ZCGzp1pQ
 d4oijXtOVZ+BSAVGaK/3i+uYRGHxHuZjkv5BSPyDaY3v8hzlynD2E31
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:email,
 suse.com:mid]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/8] Refactor mmap03 test
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/mmap/mmap03.c | 263 +++++++++-----------------------
 1 file changed, 69 insertions(+), 194 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap03.c b/testcases/kernel/syscalls/mmap/mmap03.c
index 9d94d2653661387d22f811cd959a87b8112c1167..45fb50fbf5cfceea1043b1cd736cb87aaf3aab4b 100644
--- a/testcases/kernel/syscalls/mmap/mmap03.c
+++ b/testcases/kernel/syscalls/mmap/mmap03.c
@@ -1,230 +1,105 @@
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
+ *               07/2001 Ported by Wayne Boyer
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
- * Test Description:
- *  Call mmap() to map a file creating a mapped region with execute access
- *  under the following conditions -
- *	- The prot parameter is set to PROT_EXE
- *	- The file descriptor is open for read
- *	- The file being mapped has execute permission bit set.
- *	- The minimum file permissions should be 0555.
+/*\
+ * Map a file with mmap() syscall, creating a mapped region with execute access
+ * under the following conditions:
  *
- *  The call should succeed to map the file creating mapped memory with the
- *  required attributes.
+ * - file descriptor is open for read
+ * - minimum file permissions should be 0555
+ * - file being mapped has PROT_EXEC execute permission bit set
  *
- * Expected Result:
- *  mmap() should succeed returning the address of the mapped region,
- *  and the mapped region should contain the contents of the mapped file.
- *  but with ia64 and PARISC/hppa,
- *  an attempt to access the contents of the mapped region should give
- *  rise to the signal SIGSEGV.
+ * mmap() should succeed returning the address of the mapped region
+ * and the mapped region should contain the contents of the mapped file.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * With ia64 and PARISC/hppa, an attempt to access the contents of the
+ * mapped region should rise signal SIGSEGV.
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
-#include <setjmp.h>
-
-#include "test.h"
 
-#define TEMPFILE	"mmapfile"
+#include "tst_test.h"
 
-char *TCID = "mmap03";
-int TST_TOTAL = 1;
+#define TEMPFILE "mmapfile"
 
+static void *addr;
+static char *tmpdata;
 static size_t page_sz;
-static char *addr;
-static char *dummy;
-static int fildes;
-static volatile int pass = 0;
-static sigjmp_buf env;
+static int fdesc = -1;
 
-static void setup(void);
-static void cleanup(void);
-static void sig_handler(int sig);
-
-int main(int ac, char **av)
+static void run_child(void)
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
-		 * Call mmap to map the temporary file 'TEMPFILE'
-		 * with execute access.
-		 */
-		errno = 0;
-		addr = mmap(0, page_sz, PROT_EXEC,
-			    MAP_FILE | MAP_SHARED, fildes, 0);
-
-		/* Check for the return value of mmap() */
-		if (addr == MAP_FAILED) {
-			tst_resm(TFAIL | TERRNO, "mmap() failed on %s",
-				 TEMPFILE);
-			continue;
-		}
-
-		/*
-		 * Read the file contents into the dummy
-		 * variable.
-		 */
-		if (read(fildes, dummy, page_sz) < 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "reading %s failed", TEMPFILE);
-		}
-
-		/*
-		 * Check whether the mapped memory region
-		 * has the file contents.
-		 *
-		 * with ia64 and PARISC/hppa, this should
-		 * generate a SIGSEGV which will be caught below.
-		 *
-		 */
-
-		if (sigsetjmp(env, 1) == 0) {
-			if (memcmp(dummy, addr, page_sz)) {
-				tst_resm(TFAIL,
-					 "mapped memory region "
-					 "contains invalid data");
-			} else {
-				tst_resm(TPASS,
-					 "mmap() functionality is "
-					 "correct");
-			}
-		}
-#if defined(__ia64__) || defined(__hppa__) || defined(__mips__)
-		if (pass) {
-			tst_resm(TPASS, "Got SIGSEGV as expected");
-		} else {
-			tst_resm(TFAIL, "Mapped memory region with NO "
-				 "access is accessible");
-		}
-#endif
-
-		/* Clean up things in case we are looping */
-		/* Unmap the mapped memory */
-		if (munmap(addr, page_sz) != 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "failed to unmap the mmapped pages");
-		}
-		pass = 0;
+	char *data;
 
-	}
+	tst_res(TINFO, "Map temporary file in memory with PROT_EXEC");
 
-	cleanup();
-	tst_exit();
-}
+	addr = SAFE_MMAP(0, page_sz, PROT_EXEC,
+		  MAP_FILE | MAP_SHARED, fdesc, 0);
 
-static void setup(void)
-{
-	char *tst_buff;
+	data = SAFE_MALLOC(page_sz);
+	memset(data, 0, page_sz);
 
-	tst_sig(NOFORK, sig_handler, cleanup);
+	tst_res(TINFO, "Read data back from mapped file");
 
-	TEST_PAUSE;
+	SAFE_READ(0, fdesc, data, page_sz);
+	SAFE_LSEEK(fdesc, 0, SEEK_SET);
 
-	page_sz = getpagesize();
+	TST_EXP_EQ_LI(memcmp(data, tmpdata, page_sz), 0);
 
-	/* Allocate space for the test buffer */
-	if ((tst_buff = calloc(page_sz, sizeof(char))) == NULL) {
-		tst_brkm(TFAIL, NULL, "calloc failed (tst_buff)");
-	}
-
-	/* Fill the test buffer with the known data */
-	memset(tst_buff, 'A', page_sz);
-
-	tst_tmpdir();
+	SAFE_MUNMAP(addr, page_sz);
+	free(data);
+}
 
-	/* Creat a temporary file used for mapping */
-	if ((fildes = open(TEMPFILE, O_WRONLY | O_CREAT, 0666)) < 0) {
-		free(tst_buff);
-		tst_brkm(TFAIL | TERRNO, cleanup, "opening %s failed",
-			 TEMPFILE);
-	}
+static void run(void)
+{
+	pid_t pid;
+	int status;
 
-	/* Write test buffer contents into temporary file */
-	if (write(fildes, tst_buff, page_sz) < (long)page_sz) {
-		free(tst_buff);
-		tst_brkm(TFAIL | TERRNO, cleanup, "writing to %s failed",
-			 TEMPFILE);
+	pid = SAFE_FORK();
+	if (!pid) {
+		run_child();
+		exit(0);
 	}
 
-	/* Free the memory allocated for test buffer */
-	free(tst_buff);
+	SAFE_WAITPID(pid, &status, 0);
 
-	/* Make sure proper permissions set on file */
-	if (fchmod(fildes, 0555) < 0) {
-		tst_brkm(TFAIL, cleanup, "fchmod of %s failed", TEMPFILE);
+#if defined(__ia64__) || defined(__hppa__) || defined(__mips__)
+	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
+		tst_res(TPASS, "SIGSEGV has been received");
+	} else {
+		tst_res(TFAIL, "Mapped memory region with NO "
+			"access is accessible");
 	}
+#endif
+}
 
-	/* Close the temporary file opened for write */
-	if (close(fildes) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup, "closing %s failed",
-			 TEMPFILE);
-	}
+static void setup(void)
+{
+	page_sz = getpagesize();
 
-	/* Allocate and initialize dummy string of system page size bytes */
-	if ((dummy = calloc(page_sz, sizeof(char))) == NULL) {
-		tst_brkm(TFAIL, cleanup, "calloc failed (dummy)");
-	}
+	tmpdata = SAFE_MALLOC(page_sz);
+	memset(tmpdata, 'a', page_sz);
 
-	/* Open the temporary file again for reading */
-	if ((fildes = open(TEMPFILE, O_RDONLY)) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup,
-			 "opening %s read-only failed", TEMPFILE);
-	}
-}
+	tst_res(TINFO, "Create temporary file");
 
-/*
- *   This function gets executed when the test process receives
- *   the signal SIGSEGV while trying to access the contents of memory which
- *   is not accessible.
- */
-static void sig_handler(int sig)
-{
-	if (sig == SIGSEGV) {
-		/* set the global variable and jump back */
-		pass = 1;
-		siglongjmp(env, 1);
-	} else
-		tst_brkm(TBROK, cleanup, "received an unexpected signal");
+	tst_fill_file(TEMPFILE, 'a', page_sz, 1);
+	fdesc = SAFE_OPEN(TEMPFILE, O_RDONLY, 0555);
 }
 
 static void cleanup(void)
 {
-	close(fildes);
-	free(dummy);
-	tst_rmdir();
+	free(tmpdata);
+
+	if (fdesc != -1)
+		SAFE_CLOSE(fdesc);
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
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
