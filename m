Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFC79252F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 18:01:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EB713CBC79
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 18:01:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 347313CB78F
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 18:01:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 24DD2201DC7
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 18:01:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 520B521C92
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693929706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zU9VFBQl62K80zdoxyeTJg1NuzXLOXUCUh7hfDf22AY=;
 b=srM8K3R5RJkzv5YLw4GT47KWy4ol1Lwfl3kj+VYGWaD7/SohitITv/emGBWFaASuAvkR47
 vcc+r2fdtiB+InNHf53oGAn9gsO7BY5hRMFK9Fgsh+PhqSIGOFrOBFuXk7x/g2UVZBhQqv
 V4xU2/vmw/7lATwf+n+X8wt8p4pWQ2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693929706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zU9VFBQl62K80zdoxyeTJg1NuzXLOXUCUh7hfDf22AY=;
 b=b5Hch9jmCmUkvJ6buq/47dIvaSHMqK8TJU6rcRWpP9iaZqJNtmg/h+B5cCl7FaV/onfZM0
 QApVEegclao2tkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D98CD13499
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 16:01:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BUX8KelQ92RMDgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Tue, 05 Sep 2023 16:01:45 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Tue,  5 Sep 2023 21:31:42 +0530
Message-ID: <20230905160143.1076-1-akumar@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <87pm2yffmx.fsf@suse.de>
References: <87pm2yffmx.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/mmap15: Rewrite test using new LTP API
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
 testcases/kernel/syscalls/mmap/mmap15.c | 116 +++++++-----------------
 1 file changed, 35 insertions(+), 81 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap15.c b/testcases/kernel/syscalls/mmap/mmap15.c
index 443a37eb8..763b2ecbf 100644
--- a/testcases/kernel/syscalls/mmap/mmap15.c
+++ b/testcases/kernel/syscalls/mmap/mmap15.c
@@ -1,113 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2004
  *  Written by Robbie Williamson
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
+ * Copyright (c) 2023 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Test Description: Test that a normal page cannot be mapped into a high
- * memory region.
+/*\
+ * [Description]
+ *
+ * Verify that, a normal page cannot be mapped into a high memory region,
+ * and mmap() call fails with either ENOMEM or EINVAL errno.
  */
 
-#include <sys/types.h>
-#include <sys/mman.h>
-#include <sys/mount.h>
-#include <sys/stat.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include "test.h"
-#include "safe_macros.h"
-#include "lapi/abisize.h"
-
-char *TCID = "mmap15";
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
 #ifdef __ia64__
-# define HIGH_ADDR (void *)(0xa000000000000000UL)
+# define HIGH_ADDR ((void *)(0xa000000000000000UL))
 #else
-# define HIGH_ADDR (void *)(-page_size)
+# define HIGH_ADDR ((void *)(-page_size))
 #endif
 
+#define TEMPFILE "mmapfile"
 static long page_size;
+static int fd;
 
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc, fd;
-	void *addr;
-
 #ifdef TST_ABI32
-	tst_brkm(TCONF, NULL, "This test is only for 64bit");
+	tst_brk(TCONF, "Test is not applicable for 32-bit systems.");
 #endif
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT, 0666);
 
-	setup();
+	TESTPTR(mmap(HIGH_ADDR, page_size, PROT_READ, MAP_SHARED | MAP_FIXED, fd, 0));
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		fd = SAFE_OPEN(cleanup, "testfile", O_RDWR | O_CREAT, 0666);
-
-		/* Attempt to mmap into highmem addr, should get ENOMEM */
-		addr = mmap(HIGH_ADDR, page_size, PROT_READ,
-			    MAP_SHARED | MAP_FIXED, fd, 0);
-		if (addr != MAP_FAILED) {
-			tst_resm(TFAIL, "mmap into high region "
-				 "succeeded unexpectedly");
-			munmap(addr, page_size);
-			close(fd);
-			continue;
-		}
-
-		if (errno != ENOMEM && errno != EINVAL) {
-			tst_resm(TFAIL | TERRNO, "mmap into high region "
-				 "failed unexpectedly");
-		} else {
-			tst_resm(TPASS | TERRNO, "mmap into high region "
-				 "failed as expected");
-		}
-
-		SAFE_CLOSE(cleanup, fd);
+	if (TST_RET_PTR != MAP_FAILED) {
+		tst_res(TFAIL, "mmap() into high mem region succeeded unexpectedly");
+		SAFE_MUNMAP(TST_RET_PTR, page_size);
+		return;
+	} else if (TST_RET_PTR == MAP_FAILED && (TST_ERR == ENOMEM || TST_ERR == EINVAL)) {
+		tst_res(TPASS | TERRNO, "mmap() failed with expected errno");
+	} else {
+		tst_res(TFAIL | TERRNO, "mmap() failed with unexpected errno");
 	}
 
-	cleanup();
-	tst_exit();
+	SAFE_CLOSE(fd);
 }
 
 static void setup(void)
 {
-	tst_require_root();
-
-	tst_tmpdir();
-
 	page_size = getpagesize();
-
-	TEST_PAUSE;
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
+	if (fd > 0)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_root = 1,
+	.needs_tmpdir = 1
+};
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
