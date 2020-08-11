Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8F9241B56
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4392A3C313C
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 743FE3C1CB2
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1017E100139B
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B19DB03E
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 13:05:25 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 15:05:01 +0200
Message-Id: <20200811130502.12010-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200811130502.12010-1-mdoucha@suse.cz>
References: <20200811130502.12010-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] Simplify syscalls/bind06 using new taint check API
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

The bug causes kernel crash when the process that performed the race exits.
Now that taint checks are integrated in the LTP library, forking a child is no
longer necessary.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/bind/bind06.c | 46 ++++++++-----------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/testcases/kernel/syscalls/bind/bind06.c b/testcases/kernel/syscalls/bind/bind06.c
index 47351ddbd..e971a8940 100644
--- a/testcases/kernel/syscalls/bind/bind06.c
+++ b/testcases/kernel/syscalls/bind/bind06.c
@@ -23,7 +23,6 @@
 #include <sched.h>
 #include "tst_test.h"
 #include "tst_fuzzy_sync.h"
-#include "tst_taint.h"
 
 static volatile int fd = -1;
 static struct sockaddr_ll addr1, addr2;
@@ -35,8 +34,6 @@ static void setup(void)
 	int real_gid = getgid();
 	struct ifreq ifr;
 
-	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
-
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -51,9 +48,18 @@ static void setup(void)
 	addr1.sll_family = AF_PACKET;
 	addr1.sll_ifindex = ifr.ifr_ifindex;
 	addr2.sll_family = AF_PACKET;
+
+	fzsync_pair.exec_loops = 10000;
+	tst_fzsync_pair_init(&fzsync_pair);
 }
 
-static void do_bind(void) {
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+}
+
+static void do_bind(void)
+{
 	bind(fd, (struct sockaddr *)&addr1, sizeof(addr1));
 	bind(fd, (struct sockaddr *)&addr2, sizeof(addr2));
 }
@@ -69,12 +75,10 @@ static void *thread_run(void *arg)
 	return arg;
 }
 
-static void child_run(void)
+static void run(void)
 {
 	struct ifreq ifr;
 
-	fzsync_pair.exec_loops = 10000;
-	tst_fzsync_pair_init(&fzsync_pair);
 	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
 	strcpy(ifr.ifr_name, "lo");
 
@@ -87,39 +91,17 @@ static void child_run(void)
 		ioctl(fd, SIOCSIFFLAGS, &ifr);
 		tst_fzsync_end_race_a(&fzsync_pair);
 		SAFE_CLOSE(fd);
-
-	}
-
-	tst_fzsync_pair_cleanup(&fzsync_pair);
-}
-
-static void run(void)
-{
-	pid_t child;
-
-	/* The kernel crash is triggered on process exit. */
-	child = SAFE_FORK();
-
-	if (!child) {
-		child_run();
-		exit(0);
-	}
-
-	SAFE_WAITPID(child, NULL, 0);
-
-	if (tst_taint_check()) {
-		tst_res(TFAIL, "Kernel is vulnerable");
-		return;
 	}
 
-	tst_res(TPASS, "Nothing bad happened, probably");
+	tst_res(TPASS, "Nothing bad happened (yet)");
 }
 
 static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
+	.cleanup = cleanup,
 	.timeout = 600,
-	.forks_child = 1,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.needs_kconfigs = (const char *[]) {
 		"CONFIG_USER_NS=y",
 		"CONFIG_NET_NS=y",
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
