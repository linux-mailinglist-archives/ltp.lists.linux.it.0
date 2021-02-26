Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 392923264C9
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 16:35:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A31DD3C5A27
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 16:35:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 275D33C4E14
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 16:35:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BB9C14012C8
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 16:35:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B19E9AE53
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 15:35:43 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 26 Feb 2021 16:37:11 +0100
Message-Id: <20210226153711.13645-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getpid02: Also check the fork() retval
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

The return value from fork() in parent must be equal to getpid() in child.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/getpid/getpid02.c | 40 ++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/getpid/getpid02.c b/testcases/kernel/syscalls/getpid/getpid02.c
index 6bd9c946f..815ce985f 100644
--- a/testcases/kernel/syscalls/getpid/getpid02.c
+++ b/testcases/kernel/syscalls/getpid/getpid02.c
@@ -6,13 +6,17 @@
 /*\
  * [DESCRIPTION]
  *
- * Check that getppid() in child returns the same pid as getpid() in parent.
+ * Check that:
+ * - fork() in parent returns the same pid as getpid() in child
+ * - getppid() in child returns the same pid as getpid() in parent
 \*/
 
 #include <errno.h>
 
 #include "tst_test.h"
 
+static pid_t *child_pid;
+
 static void verify_getpid(void)
 {
 	pid_t proc_id;
@@ -21,18 +25,44 @@ static void verify_getpid(void)
 
 	proc_id = getpid();
 	pid = SAFE_FORK();
+
 	if (pid == 0) {
 		pproc_id = getppid();
 
-		if (pproc_id != proc_id)
-			tst_res(TFAIL, "child's ppid(%d) not equal to parent's pid(%d)",
+		if (pproc_id != proc_id) {
+			tst_res(TFAIL, "child getppid() (%d) != parent getpid() (%d)",
 				pproc_id, proc_id);
-		else
-			tst_res(TPASS, "getpid() functionality is correct");
+		} else {
+			tst_res(TPASS, "child getppid() == parent getpid() (%d)", proc_id);
+		}
+
+		*child_pid = getpid();
+
+		return;
 	}
+
+	tst_reap_children();
+
+	if (*child_pid != pid)
+		tst_res(TFAIL, "child getpid() (%d) != parent fork() (%d)", *child_pid, pid);
+	else
+		tst_res(TPASS, "child getpid() == parent fork() (%d)", pid);
+}
+
+static void setup(void)
+{
+	child_pid = SAFE_MMAP(NULL, sizeof(pid_t), PROT_READ | PROT_WRITE,
+                              MAP_ANONYMOUS | MAP_SHARED, -1, 0);
+}
+
+static void cleanup(void)
+{
+	SAFE_MUNMAP(child_pid, sizeof(pid_t));
 }
 
 static struct tst_test test = {
 	.forks_child = 1,
+	.setup = setup,
+	.cleanup = cleanup,
 	.test_all = verify_getpid,
 };
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
