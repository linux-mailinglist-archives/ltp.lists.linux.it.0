Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3828167188
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 08:55:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A9933C2019
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 08:55:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6A70A3C13DB
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 08:55:12 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8DF0D200DEE
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 08:55:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83683948"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 15:54:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A0AE850A997A
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 15:45:17 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 15:54:45 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 21 Feb 2020 15:54:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 21 Feb 2020 15:55:20 +0800
Message-ID: <1582271720-27370-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A0AE850A997A.AE68D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/kill11: convert to new library
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

Also, drop checks for UCLINUX and WCOREDUMP and add SIGSTKFLT
sig test.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/kill/kill11.c | 173 ++++++------------------
 1 file changed, 44 insertions(+), 129 deletions(-)

diff --git a/testcases/kernel/syscalls/kill/kill11.c b/testcases/kernel/syscalls/kill/kill11.c
index 9b81e0095..8b69d3974 100644
--- a/testcases/kernel/syscalls/kill/kill11.c
+++ b/testcases/kernel/syscalls/kill/kill11.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /* IBM Corporation
  * 01/02/2003	Port to LTP	avenkat@us.ibm.com
  * 06/30/2001	Port to Linux	nsharoff@us.ibm.com
@@ -5,31 +6,14 @@
  *   Copyright (c) International Business Machines  Corp., 2002
  *   Copyright (c) Cyril Hrubis <chrubis@suse.cz> 2014
  *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
+ * Test checks that when a child is killed by its parent with sig, it
+ * returns the correct values(sig and core dump bit) to the waiting parent.
  *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
-
-  Test check that when a child is killed by its parent, it returns the correct
-  values to the waiting parent--default behaviour assumed by child.
-
+ * RESTRICTIONS
+ * The ulimit for core file size must be greater than 0.
  */
 
-#define _GNU_SOURCE 1
-
-#include <stdio.h>
+#define _GNU_SOURCE
 #include <errno.h>
 #include <sys/types.h>
 #include <signal.h>
@@ -38,27 +22,9 @@
 #include <sys/wait.h>
 #include <sys/resource.h>
 
-#include "test.h"
-#include "safe_macros.h"
-
-#define FAILED 0
-#define PASSED 1
-
-char *TCID = "kill11";
-
-int local_flag = PASSED;
-int block_number;
-FILE *temp;
-int TST_TOTAL = 1;
-static int sig;
+#include "tst_test.h"
 
-void setup(void);
-void do_child(void);
-
-/*
- * These signals terminate process by default, some create core file.
- */
-struct tcase {
+static struct tcase {
 	int sig;
 	int dumps_core;
 } tcases[] = {
@@ -78,6 +44,7 @@ struct tcase {
 	{SIGPIPE, 0},
 	{SIGALRM, 0},
 	{SIGTERM, 0},
+	{SIGSTKFLT, 0},
 	{SIGXCPU, 1},
 	{SIGXFSZ, 1},
 	{SIGVTALRM, 0},
@@ -87,133 +54,81 @@ struct tcase {
 	{SIGSYS, 1},
 };
 
-static void verify_kill(struct tcase *t)
+static void verify_kill(unsigned int n)
 {
 	int core;
-	int pid, npid;
-	int nsig, nexno, status;
-
-	if (t->sig != SIGKILL) {
-#ifndef BCS
-		if (t->sig != SIGSTOP)
-#endif
-			if (sigset(t->sig, SIG_DFL) == SIG_ERR) {
-				tst_brkm(TBROK | TERRNO, tst_rmdir,
-				         "sigset(%d) failed", sig);
-			}
-	}
+	pid_t pid, npid;
+	int nsig, status;
+	struct tcase *tc = &tcases[n];
 
-	pid = FORK_OR_VFORK();
-	if (pid < 0)
-		tst_brkm(TBROK | TERRNO, tst_rmdir, "fork() failed");
-
-	if (pid == 0) {
-#ifdef UCLINUX
-		if (self_exec(argv[0], "dd", t->sig) < 0)
-			exit(1);
-#else
-		do_child();
-#endif
+	if (tc->sig != SIGKILL) {
+		if (sigset(tc->sig, SIG_DFL) == SIG_ERR)
+			tst_brk(TBROK | TERRNO, "sigset(%d) failed", tc->sig);
 	}
 
-	kill(pid, t->sig);
-	npid = wait(&status);
+	pid = SAFE_FORK();
+	if (!pid)
+		pause();
+
+	SAFE_KILL(pid, tc->sig);
+	npid = SAFE_WAIT(&status);
 
 	if (npid != pid) {
-		tst_resm(TFAIL, "wait() returned %d, expected %d", npid, pid);
+		tst_res(TFAIL, "wait() returned %d, expected %d", npid, pid);
 		return;
 	}
 
 	nsig = WTERMSIG(status);
-#ifdef WCOREDUMP
 	core = WCOREDUMP(status);
-#endif
-	nexno = WIFEXITED(status);
 
-	if (t->dumps_core) {
+	if (tc->dumps_core) {
 		if (!core) {
-			tst_resm(TFAIL, "core dump bit not set for %s", tst_strsig(t->sig));
+			tst_res(TFAIL, "core dump bit not set for %s", tst_strsig(tc->sig));
 			return;
 		}
 	} else {
 		if (core) {
-			tst_resm(TFAIL, "core dump bit set for %s", tst_strsig(t->sig));
+			tst_res(TFAIL, "core dump bit set for %s", tst_strsig(tc->sig));
 			return;
 		}
 	}
 
-	if (nsig != t->sig) {
-		tst_resm(TFAIL, "wait: unexpected signal %d returned, expected %d", nsig, t->sig);
+	if (nsig != tc->sig) {
+		tst_res(TFAIL, "wait: unexpected signal %d returned, expected %d", nsig, tc->sig);
 		return;
 	}
 
-	if (nexno != 0) {
-		tst_resm(TFAIL,
-			"signal: unexpected exit number %d returned, expected 0\n",
-			nexno);
-		return;
-	}
-
-	tst_resm(TPASS, "signal %-16s%s", tst_strsig(t->sig),
-	         t->dumps_core ? " dumped core" : "");
-}
-
-int main(int argc, char **argv)
-{
-	int lc;
-	unsigned int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-#ifdef UCLINUX
-	maybe_run_child(&do_child, "dd", &sig);
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		for (i = 0; i < ARRAY_SIZE(tcases); i++)
-			verify_kill(tcases + i);
-	}
-
-	tst_rmdir();
-	tst_exit();
-}
-
-void do_child(void)
-{
-	int i;
-
-	for (i = 0; i < 180; i++)
-		sleep(1);
-
-	fprintf(stderr, "Child missed siggnal");
-	fflush(stderr);
-	exit(1);
+	tst_res(TPASS, "signal %-16s%s", tst_strsig(tc->sig),
+			tc->dumps_core ? " dumped core" : "");
 }
 
 #define MIN_RLIMIT_CORE (512 * 1024)
 
-void setup(void)
+static void setup(void)
 {
 	struct rlimit rlim;
 
-	SAFE_GETRLIMIT(NULL, RLIMIT_CORE, &rlim);
+	SAFE_GETRLIMIT(RLIMIT_CORE, &rlim);
 
 	if (rlim.rlim_max < MIN_RLIMIT_CORE) {
 		if (geteuid() != 0) {
-			tst_brkm(TCONF, NULL, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
+			tst_brk(TCONF, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
 				rlim.rlim_max, MIN_RLIMIT_CORE);
 		}
-		tst_resm(TINFO, "Raising rlim_max to %i", MIN_RLIMIT_CORE);
+		tst_res(TINFO, "Raising rlim_max to %i", MIN_RLIMIT_CORE);
 		rlim.rlim_max = MIN_RLIMIT_CORE;
 	}
 	if (rlim.rlim_cur < MIN_RLIMIT_CORE) {
-		tst_resm(TINFO, "Adjusting RLIMIT_CORE to %i", MIN_RLIMIT_CORE);
+		tst_res(TINFO, "Adjusting RLIMIT_CORE to %i", MIN_RLIMIT_CORE);
 		rlim.rlim_cur = MIN_RLIMIT_CORE;
-		SAFE_SETRLIMIT(NULL, RLIMIT_CORE, &rlim);
+		SAFE_SETRLIMIT(RLIMIT_CORE, &rlim);
 	}
-
-	temp = stderr;
-	tst_tmpdir();
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_kill,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
