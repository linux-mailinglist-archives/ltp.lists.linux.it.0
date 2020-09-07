Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77C25FC85
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:02:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCC233C542F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 17:02:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C9B9A3C2D7D
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3427A600A94
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 17:01:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3551B6CE
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 15:01:30 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 17:01:51 +0200
Message-Id: <20200907150157.23886-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907150157.23886-1-chrubis@suse.cz>
References: <20200907150157.23886-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 04/10] syscalls/ipc: shmctl04: Rewrite from scratch.
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

Write the test from a scratch and validate the content of the shm_info
structure and the return value.

The return value is highest used index to a kernel table, so we call
shmctl() with SHM_STAT_ANY which shouldn't fail if the value is correct.

We also parse /proc/sysvipc/shm and check that the information is
consistent with the content of shm_info structure.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ipc/shmctl/Makefile |   4 +-
 .../kernel/syscalls/ipc/shmctl/shmctl04.c     | 203 +++++++++++-------
 2 files changed, 122 insertions(+), 85 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index 176592e85..789fd4227 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -10,7 +10,7 @@ shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-shmctl01 shmctl04 shmctl05: LTPLDLIBS = -lltpipc
-shmctl02 shmctl06: LTPLDLIBS = -lltpnewipc
+shmctl01 shmctl05: LTPLDLIBS = -lltpipc
+shmctl02 shmctl04 shmctl06: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 40cfa9419..bf3c8546f 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -1,115 +1,152 @@
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
+ * Copyright (C) 2020 Cyril Hrubis <chrubis@suse.cz>
  */
-
 /*
- * NAME
- *	shmctl04.c
+ * Call shmctl() with SHM_INFO flag and check that:
  *
- * DESCRIPTION
- *	shmctl04 - test the SHM_INFO command
- *		   they are used with shmctl() in ipcs
+ * * The returned index points to a valid SHM by calling SHM_STAT_ANY
+ * * Also count that valid indexes < returned max index sums up to used_ids
+ * * And the data are consistent with /proc/sysvipc/shm
  *
- * USAGE:  <for command-line>
- *  shmctl04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
+ * There is a possible race between the call to the shmctl() and read from the
+ * proc file so this test cannot be run in parallel with any IPC testcases that
+ * adds or removes SHM segments.
  *
- * HISTORY
- *	09/2002 - Written by Mingming Cao
- *
- * RESTRICTIONS
- *	none
+ * Note what we create a SHM segment in the test setup to make sure that there
+ * is at least one during the testrun.
  */
 
-#include "ipcshm.h"
-
-char *TCID = "shmctl04";
-int TST_TOTAL = 1;
+#define _GNU_SOURCE
+#include <stdio.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+#include "lapi/shm.h"
 
-struct shm_info shm_info;
-int max_ids;
+#define SHM_SIZE 2048
 
-/*
- * These are the various setup and check functions for the commands
- * that we are checking.
- */
+static int shm_id = -1;
 
-int main(int ac, char **av)
+static void parse_proc_sysvipc(struct shm_info *info)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	int page_size = getpagesize();
+	FILE *f = fopen("/proc/sysvipc/shm", "r");
+	int used_ids = 0;
+	int shmid_max = 0;
+	unsigned long shm_rss = 0;
+	unsigned long shm_swp = 0;
+	unsigned long shm_tot = 0;
+
+	/* Eat header */
+	for (;;) {
+		int c = fgetc(f);
+
+		if (c == '\n' || c == EOF)
+			break;
+	}
 
-	/* The following loop checks looping state if -i option given */
+	int shmid, size, rss, swap;
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-		TEST(shmctl(0, SHM_INFO, (struct shmid_ds *)&shm_info));
+	/*
+	 * Sum rss, swap and size for all elements listed, which should equal
+	 * the data returned in the shm_info structure.
+	 *
+	 * Note that the size has to be rounded up to nearest multiple of page
+	 * size.
+	 */
+	while (fscanf(f, "%*i %i %*i %i %*i %*i %*i %*i %*i %*i %*i %*i %*i %*i %i %i",
+	              &shmid, &size, &rss, &swap) > 0) {
+		used_ids++;
+		shm_rss += rss/page_size;
+		shm_swp += swap/page_size;
+		shm_tot += (size + page_size - 1) / page_size;
+		if (shmid > shmid_max)
+			shmid_max = shmid;
+	}
 
-		if (TEST_RETURN != -1) {
-			tst_resm(TPASS, "SHM_INFO call succeeded");
-			continue;
-		}
+	if (info->used_ids != used_ids) {
+		tst_res(TFAIL, "used_ids = %i, expected %i",
+		        info->used_ids, used_ids);
+	} else {
+		tst_res(TPASS, "used_ids = %i", used_ids);
+	}
 
-		tst_resm(TFAIL, "SHM_INFO call failed with an unexpected error"
-			 " - %d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
+	if (info->shm_rss != shm_rss) {
+		tst_res(TFAIL, "shm_rss = %li, expected %li",
+		        info->shm_rss, shm_rss);
+	} else {
+		tst_res(TPASS, "shm_rss = %li", shm_rss);
+	}
 
+	if (info->shm_swp != shm_swp) {
+		tst_res(TFAIL, "shm_swp = %li, expected %li",
+		        info->shm_swp, shm_swp);
+	} else {
+		tst_res(TPASS, "shm_swp = %li", shm_swp);
 	}
 
-	cleanup();
+	if (info->shm_tot != shm_tot) {
+		tst_res(TFAIL, "shm_tot = %li, expected %li",
+		        info->shm_tot, shm_tot);
+	} else {
+		tst_res(TPASS, "shm_tot = %li", shm_tot);
+	}
 
-	tst_exit();
+	fclose(f);
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void verify_shminfo(void)
 {
+	struct shm_info info;
+	struct shmid_ds ds;
+	int i, shmid, cnt = 0;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	TEST(shmctl(0, SHM_INFO, (struct shmid_ds *)&info));
 
-	TEST_PAUSE;
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "shmctl(0, SHM_INFO, ...)");
+		return;
+	}
 
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
+	shmid = shmctl(TST_RET, SHM_STAT_ANY, &ds);
+
+	if (shmid == -1) {
+		tst_res(TFAIL | TTERRNO, "SHM_INFO haven't returned a valid index");
+	} else {
+		tst_res(TPASS,
+			"SHM_INFO returned valid index %li maps to shmid %i",
+			TST_RET, shmid);
+	}
+
+	for (i = 0; i <= TST_RET; i++) {
+		if (shmctl(i, SHM_STAT_ANY, &ds) != -1)
+			cnt++;
+	}
 
+	if (cnt == info.used_ids) {
+		tst_res(TPASS, "Counted used = %i", cnt);
+	} else {
+		tst_res(TFAIL, "Counted used = %i, used_ids = %i",
+		        cnt, info.used_ids);
+	}
+
+	parse_proc_sysvipc(&info);
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void setup(void)
 {
+	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
+}
 
-	tst_rmdir();
-
+static void cleanup(void)
+{
+	if (shm_id >= 0)
+		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_shminfo,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
