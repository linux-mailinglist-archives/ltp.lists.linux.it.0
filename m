Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF6554313
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jun 2022 09:03:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 410053C954C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jun 2022 09:03:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D38D73C94E9
 for <ltp@lists.linux.it>; Wed, 22 Jun 2022 09:02:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1540C1000946
 for <ltp@lists.linux.it>; Wed, 22 Jun 2022 09:01:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A56C1F9D7;
 Wed, 22 Jun 2022 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655881319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrCCQvt0zVJnF1wlQZJzi7umr/lzBGT5brvN2ZxZZB4=;
 b=RIEtUoaoTCJRpdS0ejEOTG7YNFfbzw5QeEuKu/jkGvB90dl8tDbUb8svgh3kv2jLJOhuw9
 EVA0w9YvqfwEtcbgeKwjzWnWf8b09IOVtf2zHpos9vKi/Gzreyts20j2gihcqAne++iNQB
 SsneAkPzt3jXwyXijxISlzpeZXKFIAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655881319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrCCQvt0zVJnF1wlQZJzi7umr/lzBGT5brvN2ZxZZB4=;
 b=vnmhy2cv7VqPJnTzvmETuTfg2O4s/OdCOfi8axlH5TPeLkvnQeVbdV7LPy7iUqyyrdyLYG
 +kJ2zKPuGgXgzkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 213EE134A9;
 Wed, 22 Jun 2022 07:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JAyJOWa+smLeWgAAMHmgww
 (envelope-from <akumar@suse.de>); Wed, 22 Jun 2022 07:01:58 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Wed, 22 Jun 2022 12:31:35 +0530
Message-Id: <20220622070137.24286-8-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622070137.24286-1-akumar@suse.de>
References: <20220622070137.24286-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 7/9] Rewrite rename07.c using new LTP API
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
 testcases/kernel/syscalls/rename/rename07.c | 166 +++-----------------
 1 file changed, 25 insertions(+), 141 deletions(-)

diff --git a/testcases/kernel/syscalls/rename/rename07.c b/testcases/kernel/syscalls/rename/rename07.c
index 5b95f84bb..debaf8cbb 100644
--- a/testcases/kernel/syscalls/rename/rename07.c
+++ b/testcases/kernel/syscalls/rename/rename07.c
@@ -1,154 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * NAME
- *	rename07
- *
- * DESCRIPTION
- *	This test will verify that rename(2) failed in ENOTDIR
- *
- * CALLS
- *	stat,open,rename,mkdir,close
- *
- * ALGORITHM
- *	Setup:
- *		Setup signal handling.
- *		Create temporary directory.
- *		Pause for SIGUSR1 if option specified.
- *              create the "old" directory and the "new" file
- *              rename the "old" directory to the "new" file
- *
- *	Test:
- *		Loop if the proper options are given.
- *                  verify rename() failed and returned ENOTDIR
- *
- *	Cleanup:
- *		Print errno log and/or timing stats if options given
- *		Delete the temporary directory created.*
- * USAGE
- *	rename07 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
+ * Copyright (c) International Business Machines  Corp., 2001
+ *  07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
+ */
+
+/*\
+ * [DESCRIPTION]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
+ * Verify that rename(2) fails and errno is set to ENOTDIR, when
+ * oldpath is a directory and newpath exists but is not a directory.
  *
- * RESTRICTIONS
- *	None.
  */
-#include <sys/types.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <errno.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();
-void cleanup();
 
-char *TCID = "rename07";
-int TST_TOTAL = 1;
+#include <stdio.h>
+#include "tst_test.h"
 
-int fd;
-char mname[255], fdir[255];
-struct stat buf1, buf2;
-dev_t olddev, olddev1;
-ino_t oldino, oldino1;
+#define TEMP_DIR "tmpdir"
+#define TEMP_FILE "tmpfile"
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	/*
-	 * perform global setup for test
-	 */
-	setup();
-
-	/*
-	 * check looping state if -i option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* rename a directory to a file */
-		/* Call rename(2) */
-		TEST(rename(fdir, mname));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "rename(%s, %s) succeeded unexpectedly",
-				 fdir, mname);
-			continue;
-		}
-
-		if (TEST_ERRNO != ENOTDIR) {
-			tst_resm(TFAIL, "Expected ENOTDIR got %d", TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "rename() returned ENOTDIR");
-		}
-	}
-
-	cleanup();
-	tst_exit();
-
+	SAFE_MKDIR(TEMP_DIR, 00770);
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
-	sprintf(fdir, "./rndir_%d", getpid());
-	sprintf(mname, "./tfile_%d", getpid());
-
-	/* create "old" directory */
-	if (stat(fdir, &buf1) != -1) {
-		tst_brkm(TBROK, cleanup, "tmp directory %s found!", fdir);
-	}
-
-	SAFE_MKDIR(cleanup, fdir, 00770);
-
-	SAFE_STAT(cleanup, fdir, &buf1);
-
-	/* save "old"'s dev and ino */
-	olddev = buf1.st_dev;
-	oldino = buf1.st_ino;
-
-	SAFE_TOUCH(cleanup, mname, 0700, NULL);
-
-	SAFE_STAT(cleanup, mname, &buf2);
-
-	/* save "new"'s dev and ino */
-	olddev1 = buf2.st_dev;
-	oldino1 = buf2.st_ino;
+	TST_EXP_FAIL(rename(TEMP_DIR, TEMP_FILE),
+				ENOTDIR);
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
+	.needs_tmpdir = 1
+};
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
