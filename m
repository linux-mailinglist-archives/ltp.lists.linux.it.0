Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B334B9B62
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Feb 2022 09:45:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6C7C3C9F31
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Feb 2022 09:45:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBD233C030D
 for <ltp@lists.linux.it>; Thu, 17 Feb 2022 09:45:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7BB6A20113C
 for <ltp@lists.linux.it>; Thu, 17 Feb 2022 09:45:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8D7621991;
 Thu, 17 Feb 2022 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645087553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nBO5V2MMRFhdhJGPca9VNL5jYrz0ePdLCf8ukfGTGrc=;
 b=I9vvqf+aawgqzj6TK9G+Gf9qn2DoFLL7o+Kw5okmO+8R7n1yZzV0rY2odEP/7P/L+LaDZq
 1KEkvIz8nDY3G0nN96xO4apFyem91i1mIL9AwboME/vIpUFEqUJ+VPt+Mi2w3ok7PKskr9
 5QEhCiCzNbxmN8oUjzeqxKPAoalIJIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645087553;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nBO5V2MMRFhdhJGPca9VNL5jYrz0ePdLCf8ukfGTGrc=;
 b=t6mhkCewolwwAHGVVmNZASTaQu6VJ06BSb7uYYFOr+0gLJL4CauQ23VHm4DvQvo2TUhMkS
 dGjZPghW/u/aA/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9851413B9E;
 Thu, 17 Feb 2022 08:45:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1hQvI0ELDmInLQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 17 Feb 2022 08:45:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 17 Feb 2022 09:45:52 +0100
Message-Id: <20220217084552.21706-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Split waitid02.c test using new LTP API
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

waitid02.c has been splitted into multiple tests which are testing a
specific waitid functionality. TST_CHECKPOINT_INIT has been replaced by
.needs_checkpoints

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
v2 introduces more TST_EXP_ macros and removed waitpid to let library handling
process status.

 runtest/syscalls                            |   7 +
 testcases/kernel/syscalls/waitid/.gitignore |   7 +
 testcases/kernel/syscalls/waitid/waitid02.c | 311 ++------------------
 testcases/kernel/syscalls/waitid/waitid03.c |  31 ++
 testcases/kernel/syscalls/waitid/waitid04.c |  43 +++
 testcases/kernel/syscalls/waitid/waitid05.c |  41 +++
 testcases/kernel/syscalls/waitid/waitid06.c |  39 +++
 testcases/kernel/syscalls/waitid/waitid07.c |  47 +++
 testcases/kernel/syscalls/waitid/waitid08.c |  53 ++++
 testcases/kernel/syscalls/waitid/waitid09.c |  44 +++
 10 files changed, 333 insertions(+), 290 deletions(-)
 create mode 100644 testcases/kernel/syscalls/waitid/waitid03.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid04.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid05.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid06.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid07.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid08.c
 create mode 100644 testcases/kernel/syscalls/waitid/waitid09.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 3b2deb64e..306cc255f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1696,6 +1696,13 @@ waitpid13 waitpid13
 
 waitid01 waitid01
 waitid02 waitid02
+waitid03 waitid03
+waitid04 waitid04
+waitid05 waitid05
+waitid06 waitid06
+waitid07 waitid07
+waitid08 waitid08
+waitid09 waitid09
 
 write01 write01
 write02 write02
diff --git a/testcases/kernel/syscalls/waitid/.gitignore b/testcases/kernel/syscalls/waitid/.gitignore
index e200a061b..315af1690 100644
--- a/testcases/kernel/syscalls/waitid/.gitignore
+++ b/testcases/kernel/syscalls/waitid/.gitignore
@@ -1,2 +1,9 @@
 /waitid01
 /waitid02
+/waitid03
+/waitid04
+/waitid05
+/waitid06
+/waitid07
+/waitid08
+/waitid09
diff --git a/testcases/kernel/syscalls/waitid/waitid02.c b/testcases/kernel/syscalls/waitid/waitid02.c
index dced6fadc..15b807476 100644
--- a/testcases/kernel/syscalls/waitid/waitid02.c
+++ b/testcases/kernel/syscalls/waitid/waitid02.c
@@ -1,300 +1,31 @@
-/******************************************************************************/
-/* Copyright (c) Crackerjack Project., 2007                                   */
-/*                                                                            */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or          */
-/* (at your option) any later version.                                        */
-/*                                                                            */
-/* This program is distributed in the hope that it will be useful,            */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
-/* the GNU General Public License for more details.                           */
-/*                                                                            */
-/* You should have received a copy of the GNU General Public License along    */
-/* with this program; if not, write to the Free Software Foundation,  Inc.,   */
-/* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA                 */
-/*                                                                            */
-/******************************************************************************/
-/******************************************************************************/
-/*                                                                            */
-/* File:        waitid02.c                                           	      */
-/*                                                                            */
-/* Description: This tests the waitid() syscall                               */
-/*                                                                            */
-/* Usage:  <for command-line>                                                 */
-/* waitid02 [-c n] [-e][-i n] [-I x] [-p x] [-t]                              */
-/*      where,  -c n : Run n copies concurrently.                             */
-/*              -e   : Turn on errno logging.                                 */
-/*              -i n : Execute test n times.                                  */
-/*              -I x : Execute test for x seconds.                            */
-/*              -P x : Pause for x seconds between iterations.                */
-/*              -t   : Turn on syscall timing.                                */
-/*                                                                            */
-/* Total Tests: 1                                                             */
-/*                                                                            */
-/* Test Name:   waitid02                                                      */
-/* History:     Porting from Crackerjack to LTP is done by                    */
-/*              Manas Kumar Nayak maknayak@in.ibm.com>                        */
-/******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall returns EINVAL when passing
+ * invalid set of input values.
+ */
 
-#define _XOPEN_SOURCE 500
-#include <stdio.h>
-#include <errno.h>
-#include <stdlib.h>
 #include <sys/wait.h>
-#include <sys/types.h>
-#include <unistd.h>
-#include <sys/stat.h>
+#include "tst_test.h"
 
-#include "test.h"
-#include "safe_macros.h"
-#include "lapi/syscalls.h"
-
-struct testcase_t {
-	const char *msg;
-	idtype_t idtype;
-	id_t id;
-	pid_t child;
-	int options;
-	int exp_ret;
-	int exp_errno;
-	void (*setup) (struct testcase_t *);
-	void (*cleanup) (struct testcase_t *);
-};
-
-static void setup(void);
-static void cleanup(void);
-
-static void setup2(struct testcase_t *);
-static void setup3(struct testcase_t *);
-static void setup4(struct testcase_t *);
-static void setup5(struct testcase_t *);
-static void setup6(struct testcase_t *);
-static void cleanup2(struct testcase_t *);
-static void cleanup5(struct testcase_t *);
-static void cleanup6(struct testcase_t *);
-
-struct testcase_t tdat[] = {
-	{
-		.msg = "WNOHANG",
-		.idtype = P_ALL,
-		.id = 0,
-		.options = WNOHANG,
-		.exp_ret = -1,
-		.exp_errno = EINVAL,
-	},
-	{
-		.msg = "WNOHANG | WEXITED no child",
-		.idtype = P_ALL,
-		.id = 0,
-		.options = WNOHANG | WEXITED,
-		.exp_ret = -1,
-		.exp_errno = ECHILD,
-	},
-	{
-		.msg = "WNOHANG | WEXITED with child",
-		.idtype = P_ALL,
-		.id = 0,
-		.options = WNOHANG | WEXITED,
-		.exp_ret = 0,
-		.setup = setup2,
-		.cleanup = cleanup2
-	},
-	{
-		.msg = "P_PGID, WEXITED wait for child",
-		.idtype = P_PGID,
-		.options = WEXITED,
-		.exp_ret = 0,
-		.setup = setup3,
-	},
-	{
-		.msg = "P_PID, WEXITED wait for child",
-		.idtype = P_PID,
-		.options = WEXITED,
-		.exp_ret = 0,
-		.setup = setup4,
-	},
-	{
-		.msg = "P_PID, WSTOPPED | WNOWAIT",
-		.idtype = P_PID,
-		.options = WSTOPPED | WNOWAIT,
-		.exp_ret = 0,
-		.setup = setup5,
-		.cleanup = cleanup5
-	},
-	{
-		.msg = "P_PID, WCONTINUED",
-		.idtype = P_PID,
-		.options = WCONTINUED,
-		.exp_ret = 0,
-		.setup = setup6,
-		.cleanup = cleanup6
-	},
-	{
-		.msg = "P_PID, WEXITED not a child of the calling process",
-		.idtype = P_PID,
-		.id = 1,
-		.options = WEXITED,
-		.exp_ret = -1,
-		.exp_errno = ECHILD,
-		.setup = setup2,
-		.cleanup = cleanup2
-	},
-
-};
-
-char *TCID = "waitid02";
-static int TST_TOTAL = ARRAY_SIZE(tdat);
-
-static void makechild(struct testcase_t *t, void (*childfn)(void))
-{
-	t->child = fork();
-	switch (t->child) {
-	case -1:
-		tst_brkm(TBROK | TERRNO, cleanup, "fork");
-		break;
-	case 0:
-		childfn();
-		exit(0);
-	}
-}
-
-static void wait4child(pid_t pid)
-{
-	int status;
-	SAFE_WAITPID(cleanup, pid, &status, 0);
-	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-		tst_resm(TFAIL, "child returns %d", status);
-}
-
-static void dummy_child(void)
-{
-}
-
-static void waiting_child(void)
-{
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
-}
-
-static void stopped_child(void)
-{
-	kill(getpid(), SIGSTOP);
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
-}
-
-static void setup2(struct testcase_t *t)
-{
-	makechild(t, waiting_child);
-}
-
-static void cleanup2(struct testcase_t *t)
-{
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-	wait4child(t->child);
-}
-
-static void setup3(struct testcase_t *t)
-{
-	t->id = getpgid(0);
-	makechild(t, dummy_child);
-}
-
-static void setup4(struct testcase_t *t)
-{
-	makechild(t, dummy_child);
-	t->id = t->child;
-}
-
-static void setup5(struct testcase_t *t)
-{
-	makechild(t, stopped_child);
-	t->id = t->child;
-}
-
-static void cleanup5(struct testcase_t *t)
-{
-	kill(t->child, SIGCONT);
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-	wait4child(t->child);
-}
-
-static void setup6(struct testcase_t *t)
+static void run(void)
 {
 	siginfo_t infop;
-	makechild(t, stopped_child);
-	t->id = t->child;
-	if (waitid(P_PID, t->child, &infop, WSTOPPED) != 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "waitpid setup6");
-	kill(t->child, SIGCONT);
-}
 
-static void cleanup6(struct testcase_t *t)
-{
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-	wait4child(t->child);
-}
-
-static void setup(void)
-{
-	TEST_PAUSE;
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(tst_rmdir);
-}
-
-static void cleanup(void)
-{
-	tst_rmdir();
-	tst_exit();
-}
-
-static void test_waitid(struct testcase_t *t)
-{
-	siginfo_t infop;
-
-	if (t->setup)
-		t->setup(t);
-
-	tst_resm(TINFO, "%s", t->msg);
-	tst_resm(TINFO, "(%d) waitid(%d, %d, %p, %d)", getpid(), t->idtype,
-			t->id, &infop, t->options);
 	memset(&infop, 0, sizeof(infop));
+	TST_EXP_FAIL(waitid(P_ALL, 0, &infop, WNOHANG), EINVAL);
 
-	TEST(waitid(t->idtype, t->id, &infop, t->options));
-	if (TEST_RETURN == t->exp_ret) {
-		if (TEST_RETURN == -1) {
-			if (TEST_ERRNO == t->exp_errno)
-				tst_resm(TPASS, "exp_errno=%d", t->exp_errno);
-			else
-				tst_resm(TFAIL|TTERRNO, "exp_errno=%d",
-					t->exp_errno);
-		} else {
-			tst_resm(TPASS, "ret: %d", t->exp_ret);
-		}
-	} else {
-		tst_resm(TFAIL|TTERRNO, "ret=%ld expected=%d",
-			TEST_RETURN, t->exp_ret);
-	}
-	tst_resm(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
-			infop.si_pid, infop.si_code,
-			infop.si_status);
-
-	if (t->cleanup)
-		t->cleanup(t);
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
 }
 
-int main(int ac, char **av)
-{
-	int lc, testno;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		for (testno = 0; testno < TST_TOTAL; testno++)
-			test_waitid(&tdat[testno]);
-	}
-	cleanup();
-	tst_exit();
-}
+static struct tst_test test = {
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid03.c b/testcases/kernel/syscalls/waitid/waitid03.c
new file mode 100644
index 000000000..1dbb578da
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid03.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall returns ECHILD when the calling
+ * process has no existing unwaited-for child processes.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_FAIL(waitid(P_ALL, 0, &infop, WNOHANG | WEXITED), ECHILD);
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid04.c b/testcases/kernel/syscalls/waitid/waitid04.c
new file mode 100644
index 000000000..32c652dba
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid04.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall filters a child in WNOHANG status.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_child;
+
+	pid_child = SAFE_FORK();
+	if (!pid_child) {
+		TST_CHECKPOINT_WAIT(0);
+		return;
+	}
+
+	tst_res(TINFO, "filter all children by WNOHANG | WEXITED");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_PASS(waitid(P_ALL, pid_child, &infop, WNOHANG | WEXITED));
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid05.c b/testcases/kernel/syscalls/waitid/waitid05.c
new file mode 100644
index 000000000..3c0a80cc1
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid05.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall filters children which exited from
+ * the same group ID.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_group;
+
+	/* dummy fork to spawn child in the same group ID */
+	if (!SAFE_FORK())
+		return;
+
+	pid_group = getpgid(0);
+
+	tst_res(TINFO, "filter child by group ID and WEXITED");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_PASS(waitid(P_PGID, pid_group, &infop, WEXITED));
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid06.c b/testcases/kernel/syscalls/waitid/waitid06.c
new file mode 100644
index 000000000..886c9b2fd
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid06.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall filters children which exited.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_child;
+
+	/* dummy fork */
+	pid_child = SAFE_FORK();
+	if (!pid_child)
+		return;
+
+	tst_res(TINFO, "filter child by WEXITED");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_PASS(waitid(P_PID, pid_child, &infop, WEXITED));
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid07.c b/testcases/kernel/syscalls/waitid/waitid07.c
new file mode 100644
index 000000000..23ae24f35
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid07.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall filters children killed with
+ * SIGSTOP.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_child;
+
+	pid_child = SAFE_FORK();
+	if (!pid_child) {
+		SAFE_KILL(getpid(), SIGSTOP);
+		TST_CHECKPOINT_WAIT(0);
+		return;
+	}
+
+	tst_res(TINFO, "filter child by WSTOPPED | WNOWAIT");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_PASS(waitid(P_PID, pid_child, &infop, WSTOPPED | WNOWAIT));
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+
+	SAFE_KILL(pid_child, SIGCONT);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid08.c b/testcases/kernel/syscalls/waitid/waitid08.c
new file mode 100644
index 000000000..86a134d99
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid08.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking if waitid() syscall filters children killed with
+ * SIGCONT.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_child;
+
+	pid_child = SAFE_FORK();
+	if (!pid_child) {
+		SAFE_KILL(getpid(), SIGSTOP);
+		TST_CHECKPOINT_WAIT(0);
+		return;
+	}
+
+	tst_res(TINFO, "send SIGCONT to child");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_PASS(waitid(P_PID, pid_child, &infop, WSTOPPED));
+
+	SAFE_KILL(pid_child, SIGCONT);
+
+	tst_res(TINFO, "filter child by WCONTINUED");
+
+	TST_EXP_PASS(waitid(P_PID, pid_child, &infop, WCONTINUED));
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+
+	SAFE_KILL(pid_child, SIGCONT);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
diff --git a/testcases/kernel/syscalls/waitid/waitid09.c b/testcases/kernel/syscalls/waitid/waitid09.c
new file mode 100644
index 000000000..3ee443831
--- /dev/null
+++ b/testcases/kernel/syscalls/waitid/waitid09.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Copyright (c) Manas Kumar Nayak maknayak@in.ibm.com>
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test is checking that waitid() syscall filters not a child of the
+ * current process.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	siginfo_t infop;
+	pid_t pid_child;
+
+	pid_child = SAFE_FORK();
+	if (!pid_child) {
+		TST_CHECKPOINT_WAIT(0);
+		return;
+	}
+
+	tst_res(TINFO, "filter not a child of the current process by WEXITED");
+
+	memset(&infop, 0, sizeof(infop));
+	TST_EXP_FAIL(waitid(P_PID, 1, &infop, WEXITED), ECHILD);
+
+	tst_res(TINFO, "si_pid = %d ; si_code = %d ; si_status = %d",
+		infop.si_pid, infop.si_code, infop.si_status);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
