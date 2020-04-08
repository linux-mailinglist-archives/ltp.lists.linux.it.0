Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED11A1FFA
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:39:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0558D3C2D1F
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:39:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 626333C2D12
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:39:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 350D3600BD9
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:39:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE8DCAF48;
 Wed,  8 Apr 2020 11:39:54 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 13:40:07 +0200
Message-Id: <20200408114007.4096-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clone301: Fix the test race this time for
 real
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I have messed up the first fix, sorry, the signal handler has to be
estabilished before the clone3() call, not just before the if ().

This also makes the test more verbose in case of failure, we print what
exactly went wrong which saves time on debugging.

Fixes: f17b3862dceb (syscalls/clone301: Fix race between parent and child)

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Richard Palethorpe <rpalethorpe@suse.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/clone3/clone301.c | 65 +++++++++++++++------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/syscalls/clone3/clone301.c b/testcases/kernel/syscalls/clone3/clone301.c
index 456291b67..bf009e940 100644
--- a/testcases/kernel/syscalls/clone3/clone301.c
+++ b/testcases/kernel/syscalls/clone3/clone301.c
@@ -17,7 +17,7 @@
 #define DATA	777
 
 static int pidfd, child_tid, parent_tid, parent_received_signal;
-static volatile int child_received_signal;
+static volatile int child_received_signal, child_data;
 static struct clone_args *args;
 
 static struct tcase {
@@ -40,8 +40,8 @@ static void child_rx_signal(int sig, siginfo_t *info, void *ucontext)
 {
 	(void) ucontext;
 
-	if (sig == CHILD_SIGNAL && info && info->si_value.sival_int == DATA)
-		child_received_signal = 1;
+	child_received_signal = sig;
+	child_data = info->si_value.sival_int;
 }
 
 static struct sigaction psig_action = {
@@ -60,23 +60,43 @@ static siginfo_t uinfo = {
 };
 
 
-static void do_child(int clone_pidfd, int n)
+static void do_child(int clone_pidfd)
 {
 	int count = 1000;
 
 	if (clone_pidfd) {
 		child_received_signal = 0;
+		child_data = 0;
+
 		SAFE_SIGACTION(CHILD_SIGNAL, &csig_action, NULL);
 
 		TST_CHECKPOINT_WAKE(0);
 
-		while(!child_received_signal && --count)
+		while (child_received_signal != CHILD_SIGNAL && --count)
 			usleep(100);
 
-		if (child_received_signal)
-			tst_res(TPASS, "clone3() passed: Child received correct signal (index %d)", n);
-		else
-			tst_res(TFAIL, "clone3() failed: Child received incorrect signal (index %d)", n);
+		if (!child_received_signal) {
+			tst_res(TFAIL, "Child haven't got signal");
+			exit(0);
+		}
+
+		if (child_received_signal != CHILD_SIGNAL) {
+			tst_res(TFAIL, "Child got %s (%i) signal expected %s",
+				tst_strsig(child_received_signal),
+				child_received_signal,
+				tst_strsig(CHILD_SIGNAL));
+			exit(0);
+		}
+
+		tst_res(TPASS, "Child got correct signal %s",
+			tst_strsig(CHILD_SIGNAL));
+
+		if (child_data != DATA) {
+			tst_res(TFAIL, "Child got wrong si_value=%i expected %i",
+				child_data, DATA);
+		} else {
+			tst_res(TPASS, "Child got correct si_value");
+		}
 	}
 
 	exit(0);
@@ -97,17 +117,17 @@ static void run(unsigned int n)
 	args->stack_size = 0;
 	args->tls = 0;
 
+	parent_received_signal = 0;
+	SAFE_SIGACTION(tc->exit_signal, &psig_action, NULL);
+
 	TEST(pid = clone3(args, sizeof(*args)));
 	if (pid < 0) {
 		tst_res(TFAIL | TTERRNO, "clone3() failed (%d)", n);
 		return;
 	}
 
-	parent_received_signal = 0;
-	SAFE_SIGACTION(tc->exit_signal, &psig_action, NULL);
-
 	if (!pid)
-		do_child(clone_pidfd, n);
+		do_child(clone_pidfd);
 
 	/* Need to send signal to child process */
 	if (clone_pidfd) {
@@ -122,10 +142,21 @@ static void run(unsigned int n)
 
 	SAFE_WAITPID(pid, &status, __WALL);
 
-	if (parent_received_signal == tc->exit_signal)
-		tst_res(TPASS, "clone3() passed: Parent received correct signal (index %d)", n);
-	else
-		tst_res(TFAIL, "clone3() failed: Parent received incorrect signal (index %d)", n);
+	if (!parent_received_signal) {
+		tst_res(TFAIL, "Parent haven't got signal");
+		return;
+	}
+
+	if (parent_received_signal != tc->exit_signal) {
+		tst_res(TFAIL, "Parent got %s (%i) signal expected %s",
+			tst_strsig(parent_received_signal),
+			parent_received_signal,
+			tst_strsig(tc->exit_signal));
+		return;
+	}
+
+	tst_res(TPASS, "Parent got correct signal %s",
+		tst_strsig(parent_received_signal));
 }
 
 static void setup(void)
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
