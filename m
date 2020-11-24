Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC02C2520
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 13:00:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B04933C3028
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 13:00:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E78EC3C23F5
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 13:00:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 067361000375
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 13:00:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36FF6AC2D;
 Tue, 24 Nov 2020 12:00:33 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Nov 2020 13:01:54 +0100
Message-Id: <20201124120154.27017-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/select03: Fix segfaults on aarch64
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The select() syscall is implemented via pselect6() in aarch64 glibc, which
means that glibc has to convert the timeout from timeval to timespec hence it
will segfault rather than return EFAULT.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/select/select03.c   | 30 ++++++++++++++++++-
 testcases/kernel/syscalls/select/select_var.h |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
index fb52284ce..1cec3a4c7 100644
--- a/testcases/kernel/syscalls/select/select03.c
+++ b/testcases/kernel/syscalls/select/select03.c
@@ -7,8 +7,10 @@
 
 #include <unistd.h>
 #include <errno.h>
+#include <stdlib.h>
 #include <sys/time.h>
 #include <sys/types.h>
+#include <sys/wait.h>
 #include <fcntl.h>
 #include "select_var.h"
 
@@ -40,7 +42,7 @@ static struct tcases {
 	{ "Faulty timeout", &maxfds, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
 };
 
-static void run(unsigned int n)
+static void verify_select(unsigned int n)
 {
 	struct tcases *tc = &tests[n];
 
@@ -61,6 +63,31 @@ static void run(unsigned int n)
 	}
 
 	tst_res(TPASS | TTERRNO, "%s: select() failed as expected", tc->name);
+
+	exit(0);
+}
+
+static void run(unsigned int n)
+{
+	int pid, status;
+
+	pid = SAFE_FORK();
+	if (!pid)
+		verify_select(n);
+
+	SAFE_WAITPID(pid, &status, 0);
+
+	if (WIFEXITED(status))
+		return;
+
+	if (tst_variant == GLIBC_SELECT_VARIANT &&
+	    tests[n].timeout == &invalid_to &&
+	    WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
+		tst_res(TPASS, "%s: select() killed by signal", tests[n].name);
+		return;
+	}
+
+	tst_res(TFAIL, "Child %s", tst_strstatus(status));
 }
 
 static void setup(void)
@@ -94,4 +121,5 @@ static struct tst_test test = {
 	.test_variants = TEST_VARIANTS,
 	.setup = setup,
 	.needs_tmpdir = 1,
+	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index c8a8eb64e..a17b2fdd6 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -16,6 +16,8 @@ struct compat_sel_arg_struct {
 	long _tvp;
 };
 
+#define GLIBC_SELECT_VARIANT 0
+
 static int do_select_faulty_to(int nfds, fd_set *readfds, fd_set *writefds,
 		fd_set *exceptfds, struct timeval *timeout, int faulty_to)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
