Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7511571F7A
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jul 2022 17:36:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A63D3CA705
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jul 2022 17:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02AB33CA4E4
 for <ltp@lists.linux.it>; Tue, 12 Jul 2022 17:34:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 808C360096E
 for <ltp@lists.linux.it>; Tue, 12 Jul 2022 17:34:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C11FD1F980
 for <ltp@lists.linux.it>; Tue, 12 Jul 2022 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657640088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HdZsfHk+7fcBUIQnliOIy3CnmffIsX6aSjHAJGlcaA=;
 b=ffdMc/gRkR2TvBF0v29TNXfOCtKrm/nS7Gh65W821RWuTMwwQ+eNgGdzkrZ2EXTXEpCK+D
 3Bvs1GeGE2weI4c8yC3l8b9hErbxYZfyDnjUqRg/0kcWIXtn1R+v/OhAaG/mFi6WF/NdMS
 bvVPd9SGhzlr1ACYI8x/+K36FpYz4TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657640088;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HdZsfHk+7fcBUIQnliOIy3CnmffIsX6aSjHAJGlcaA=;
 b=pjaPe5uTrAKJ54DKaixxrjr2qtpGuOotOEPlxADivEmwo65ql3xZirZHXPMqq17QVkV7nH
 E3zriezhtkDV1lDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E3DC13A94
 for <ltp@lists.linux.it>; Tue, 12 Jul 2022 15:34:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CKkWAJiUzWJQfAAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Tue, 12 Jul 2022 15:34:48 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Tue, 12 Jul 2022 21:04:16 +0530
Message-Id: <20220712153417.14551-9-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712153417.14551-1-akumar@suse.de>
References: <20220712153417.14551-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 8/9] Rewrite rename08.c using new LTP API
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

Rewrite using new LTP API and enable all filesystems

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/rename/rename08.c | 205 +++-----------------
 1 file changed, 29 insertions(+), 176 deletions(-)

diff --git a/testcases/kernel/syscalls/rename/rename08.c b/testcases/kernel/syscalls/rename/rename08.c
index 2efdfd390..8a9a9b344 100644
--- a/testcases/kernel/syscalls/rename/rename08.c
+++ b/testcases/kernel/syscalls/rename/rename08.c
@@ -1,190 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
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
+ * Copyright (c) International Business Machines  Corp., 2001
+ *  07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * NAME
- *	rename08
- *
- * DESCRIPTION
- *	This test will verify that rename(2) syscall failed in EFAULT
- *
- * ALGORITHM
- *	Setup:
- *		Setup signal handling.
- *		Create temporary directory.
- *		Pause for SIGUSR1 if option specified.
- *		Create a valid file to use in the rename() call.
- *
- *	Test:
- *		Loop if the proper options are given.
- *              1.  "old" is a valid file, newpath points to address
- *                   outside allocated address space
- *                  rename the "old" to the "new" file
- *                  verify rename() failed with error EFAULT
- *
- *              2.  "old" points to address outside allocated address space
- *                  ,"new" is a valid file
- *                  rename the "old" to the "new"
- *                  verify rename() failed with error EFAULT
- *
- *              3.  oldpath and newpath are all NULL
- *                  try to rename NULL to NULL
- *                  verify rename() failed with error EFAULT
- *	Cleanup:
- *		Print errno log and/or timing stats if options given
- *		Delete the temporary directory created.*
- * USAGE
- *	rename08 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+/*\
+ * [Description]
  *
- * RESTRICTIONS
- *	None.
+ * Verify that rename(2) fails with EFAULT, when
+ * oldpath or newpath points outside of accessible address space.
  */
-#include <sys/types.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-#include <unistd.h>
-#include <errno.h>
 
-#include "test.h"
+#include <stdio.h>
+#include "tst_test.h"
 
-void setup();
-void cleanup();
+#define MNT_POINT "mntpoint"
+#define TEMP_FILE "tmpfile"
+#define INVALID_PATH ((void *)-1)
 
-char *TCID = "rename08";
-
-char *bad_addr = 0;
-
-int fd;
-char fname[255];
-
-struct test_case_t {
-	char *fd;
-	char *fd2;
-	int error;
-} TC[] = {
-#if !defined(UCLINUX)
-	/* "new" file is invalid - EFAULT */
-	{
-	fname, (char *)-1, EFAULT},
-	    /* "old" file is invalid - EFAULT */
-	{
-	(char *)-1, fname, EFAULT},
-#endif
-	    /* both files are NULL - EFAULT */
-	{
-	NULL, NULL, EFAULT}
-};
-
-int TST_TOTAL = ARRAY_SIZE(TC);
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-	int i;
-
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/*
-	 * check looping state if -i option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(rename(TC[i].fd, TC[i].fd2));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS, "expected failure - "
-					 "errno = %d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TFAIL, "unexpected error - %d : %s - "
-					 "expected %d", TEST_ERRNO,
-					 strerror(TEST_ERRNO), TC[i].error);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
-
+	SAFE_CHDIR(MNT_POINT);
+	SAFE_TOUCH(TEMP_FILE, 0700, NULL);
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void run(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* Create a temporary directory and make it current. */
-	tst_tmpdir();
-
-	sprintf(fname, "./tfile_%d", getpid());
-
-	SAFE_TOUCH(cleanup, fname, 0700, NULL);
-
-#if !defined(UCLINUX)
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED) {
-		tst_brkm(TBROK, cleanup, "mmap failed");
-	}
-	TC[0].fd2 = bad_addr;
-	TC[1].fd = bad_addr;
-#endif
+	TST_EXP_FAIL(rename(INVALID_PATH, TEMP_FILE),
+				EFAULT);
+	TST_EXP_FAIL(rename(TEMP_FILE, INVALID_PATH),
+				EFAULT);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *              completion or premature exit.
- */
-void cleanup(void)
-{
-
-	/*
-	 * Remove the temporary directory.
-	 */
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNT_POINT,
+	.all_filesystems = 1
+};
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
