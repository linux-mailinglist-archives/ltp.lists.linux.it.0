Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 307992C696A
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 17:31:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1DE93C687E
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 17:31:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 119ED3C5DEA
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 17:30:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8946D2011DB
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 17:30:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23CD5AD2D
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:30:58 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Nov 2020 17:31:49 +0100
Message-Id: <20201127163150.22903-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127163150.22903-1-chrubis@suse.cz>
References: <20201127163150.22903-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: tst_test.c: Add TBROK counter.
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

This ensures that TBROK is never lost.

If test process forks a child and the child calls SAFE_MACRO() the
failure will be lost unless the test process handles the exit value
properly and propagates the TBROK.

It is also strange that TBROK is the only return value that is solely
propagated by the exit value and not by the counters. This has been
mistake to begin with.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/.gitignore |  1 +
 lib/newlib_tests/test22.c   | 34 ++++++++++++++++++++++++++++++++++
 lib/tst_test.c              | 13 +++++++++++--
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 lib/newlib_tests/test22.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index ac1d19be0..6fc549cf2 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -25,6 +25,7 @@ test18
 test19
 test20
 test21
+test22
 tst_expiration_timer
 test_assert
 test_timer
diff --git a/lib/newlib_tests/test22.c b/lib/newlib_tests/test22.c
new file mode 100644
index 000000000..520b8dad8
--- /dev/null
+++ b/lib/newlib_tests/test22.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Test that TBROK is propagated correctly to the results even if we wait on
+ * child and throw away the status.
+ */
+#include "tst_test.h"
+
+static void do_test(void)
+{
+	int pid = SAFE_FORK();
+
+	if (pid) {
+		tst_res(TPASS, "Test main pid");
+		SAFE_WAITPID(pid, NULL, 0);
+		return;
+	}
+
+	if (tst_variant == 1)
+		tst_brk(TBROK, "Test child!");
+	else
+		tst_brk(TCONF, "Test child!");
+
+	tst_res(TPASS, "Test child");
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.test_variants = 2,
+	.forks_child = 1,
+};
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 535c0ff4c..128058e6e 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -56,6 +56,7 @@ struct results {
 	int skipped;
 	int failed;
 	int warnings;
+	int broken;
 	unsigned int timeout;
 };
 
@@ -179,6 +180,9 @@ static void update_results(int ttype)
 	case TFAIL:
 		tst_atomic_inc(&results->failed);
 	break;
+	case TBROK:
+		tst_atomic_inc(&results->broken);
+	break;
 	}
 }
 
@@ -368,10 +372,8 @@ static void check_child_status(pid_t pid, int status)
 	ret = WEXITSTATUS(status);
 	switch (ret) {
 	case TPASS:
-	break;
 	case TBROK:
 	case TCONF:
-		tst_brk(ret, "Reported by child (%i)", pid);
 	break;
 	default:
 		tst_brk(TBROK, "Invalid child (%i) exit value %i", pid, ret);
@@ -698,9 +700,13 @@ static void do_exit(int ret)
 		if (results->warnings)
 			ret |= TWARN;
 
+		if (results->broken)
+			ret |= TBROK;
+
 		printf("\nSummary:\n");
 		printf("passed   %d\n", results->passed);
 		printf("failed   %d\n", results->failed);
+		printf("broken   %d\n", results->broken);
 		printf("skipped  %d\n", results->skipped);
 		printf("warnings %d\n", results->warnings);
 	}
@@ -737,6 +743,9 @@ static int results_equal(struct results *a, struct results *b)
 	if (a->skipped != b->skipped)
 		return 0;
 
+	if (a->broken != b->broken)
+		return 0;
+
 	return 1;
 }
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
