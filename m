Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1637A734
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 14:56:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4C683C8B35
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 14:56:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50A413C4E74
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:56:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B0CB2200743
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:56:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8975CAF3E
 for <ltp@lists.linux.it>; Tue, 11 May 2021 12:56:11 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 May 2021 14:56:06 +0200
Message-Id: <20210511125606.20425-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] netns_netlink: Rewrite into new API
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

cleanup:
- stop using legacy libclone.h, checks done by requiring CONFIG_NET_NS=y
- remove check for iproute 100519 (v2.6.34 => old enough to drop this check)
- remove check for unshare() CLONE_NEWNET support (since 2.6.24, old enough)
This allow us to remove netns_helper.h. If ever needed iproute2 version
check, it can be added separately. Current implementation also does work
with the new iproute2 version scheme v5.7.0-77-gb687d1067169 (released
in iproute2 v5.8.0).
- simplify check for child result

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v2->v3
Implement Cyril's requirements:

- simplify check for child result, use safe macros
- require CONFIG_NET_NS=y
- adding static
- further cleanup

Not sure if while (tries < MAX_TRIES) section can be cleaned more.

Kind regards,
Petr

 .../kernel/containers/netns/netns_helper.h    |  80 --------
 .../kernel/containers/netns/netns_netlink.c   | 176 ++++++------------
 2 files changed, 61 insertions(+), 195 deletions(-)
 delete mode 100644 testcases/kernel/containers/netns/netns_helper.h

diff --git a/testcases/kernel/containers/netns/netns_helper.h b/testcases/kernel/containers/netns/netns_helper.h
deleted file mode 100644
index 8b876454f..000000000
--- a/testcases/kernel/containers/netns/netns_helper.h
+++ /dev/null
@@ -1,80 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2008
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- *
- * Author: Veerendra C <vechandr@in.ibm.com>
- *
- * Net namespaces were introduced around 2.6.25.  Kernels before that,
- * assume they are not enabled.  Kernels after that, check for -EINVAL
- * when trying to use CLONE_NEWNET and CLONE_NEWNS.
- ***************************************************************************/
-
-#define _GNU_SOURCE
-#include <sched.h>
-#include "config.h"
-#include "libclone.h"
-#include "lapi/syscalls.h"
-#include "test.h"
-#include "safe_macros.h"
-
-#ifndef CLONE_NEWNS
-#define CLONE_NEWNS -1
-#endif
-
-static void check_iproute(unsigned int spe_ipver)
-{
-	FILE *ipf;
-	int n;
-	unsigned int ipver = 0;
-
-	ipf = popen("ip -V", "r");
-	if (ipf == NULL)
-		tst_brkm(TCONF, NULL,
-				"Failed while opening pipe for iproute check");
-
-	n = fscanf(ipf, "ip utility, iproute2-ss%u", &ipver);
-	if (n < 1) {
-		tst_brkm(TCONF, NULL,
-			"Failed while obtaining version for iproute check");
-	}
-	if (ipver < spe_ipver) {
-		tst_brkm(TCONF, NULL, "The commands in iproute tools do "
-			"not support required objects");
-	}
-
-	pclose(ipf);
-}
-
-static int dummy(void *arg)
-{
-	(void) arg;
-	return 0;
-}
-
-static void check_netns(void)
-{
-	int pid, status;
-	/* Checking if the kernel supports unshare with netns capabilities. */
-	if (CLONE_NEWNS == -1)
-		tst_brkm(TCONF | TERRNO, NULL, "CLONE_NEWNS (%d) not supported",
-			 CLONE_NEWNS);
-
-	pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET | CLONE_NEWNS,
-	                            dummy, NULL);
-	if (pid == -1)
-		tst_brkm(TCONF | TERRNO, NULL,
-				"unshare syscall smoke test failed");
-
-	SAFE_WAIT(NULL, &status);
-}
diff --git a/testcases/kernel/containers/netns/netns_netlink.c b/testcases/kernel/containers/netns/netns_netlink.c
index 47e8235d6..1e8e78fc5 100644
--- a/testcases/kernel/containers/netns/netns_netlink.c
+++ b/testcases/kernel/containers/netns/netns_netlink.c
@@ -1,33 +1,26 @@
-/* Copyright (c) 2014 Red Hat, Inc.
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of version 2 the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- ***********************************************************************
- * File: netns_netlink.c
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 Red Hat, Inc.
+ * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+ */
+
+/*\
+ * [DESCRIPTION]
  *
  * Tests a netlink interface inside a new network namespace.
- * Description:
- * 1. Unshares a network namespace (so network related actions
- *    have no effect on a real system)
- * 2. Forks a child which creates a NETLINK_ROUTE netlink socket
- *    and listens to RTMGRP_LINK (network interface create/delete/up/down)
- *    multicast group.
- * 4. Child then waits for parent approval to receive data from socket
- * 3. Parent creates a new TAP interface (dummy0) and immediately
- *    removes it (which should generate some data in child's netlink socket).
- *    Then it allows child to continue.
- * 4. As the child was listening to RTMGRP_LINK multicast group, it should
- *    detect the new interface creation/deletion (by reading data from netlink
- *    socket), if so, the test passes, otherwise it fails.
+ *
+ * - Unshares a network namespace (so network related actions
+ *   have no effect on a real system).
+ * - Forks a child which creates a NETLINK_ROUTE netlink socket
+ *   and listens to RTMGRP_LINK (network interface create/delete/up/down)
+ *   multicast group.
+ * - Child then waits for parent approval to receive data from socket
+ * - Parent creates a new TAP interface (dummy0) and immediately
+ *   removes it (which should generate some data in child's netlink socket).
+ *   Then it allows child to continue.
+ * - As the child was listening to RTMGRP_LINK multicast group, it should
+ *   detect the new interface creation/deletion (by reading data from netlink
+ *   socket), if so, the test passes, otherwise it fails.
  */
 
 #define _GNU_SOURCE
@@ -40,67 +33,43 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <errno.h>
-#include "netns_helper.h"
-#include "test.h"
-#include "safe_macros.h"
-
-#define MAX_TRIES 1000
-#define IP_TUNTAP_MIN_VER 100519
+#include <sched.h>
 
-char *TCID	= "netns_netlink";
-int TST_TOTAL	= 1;
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "lapi/namespaces_constants.h"
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
-
-static void setup(void)
-{
-	tst_require_root();
-	check_iproute(IP_TUNTAP_MIN_VER);
-	check_netns();
-	tst_tmpdir();
-	TST_CHECKPOINT_INIT(tst_rmdir);
-}
+#define MAX_TRIES 1000
 
-int child_func(void)
+static void child_func(void)
 {
 	int fd, len, event_found, tries;
 	struct sockaddr_nl sa;
 	char buffer[4096];
 	struct nlmsghdr *nlh;
 
-	/* child will listen to a network interface create/delete/up/down
-	 * events */
+	/* child will listen to a network interface create/delete/up/down events */
 	memset(&sa, 0, sizeof(sa));
 	sa.nl_family = AF_NETLINK;
 	sa.nl_groups = RTMGRP_LINK;
 
-	fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
-	if (fd == -1) {
-		perror("socket");
-		return 1;
-	}
-	if (bind(fd, (struct sockaddr *) &sa, sizeof(sa)) == -1) {
-		perror("bind");
-		close(fd);
-		return 1;
-	}
+	fd = SAFE_SOCKET(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	SAFE_BIND(fd, (struct sockaddr *) &sa, sizeof(sa));
 
 	/* waits for parent to create an interface */
-	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
+	TST_CHECKPOINT_WAIT(0);
 
-	/* To get rid of "resource temporarily unavailable" errors
-	 * when testing with -i option */
+	/*
+	 * To get rid of "resource temporarily unavailable" errors
+	 * when testing with -i option
+	 */
 	tries = 0;
 	event_found = 0;
 	nlh = (struct nlmsghdr *) buffer;
 	while (tries < MAX_TRIES) {
 		len = recv(fd, nlh, sizeof(buffer), MSG_DONTWAIT);
 		if (len > 0) {
-			/* stop receiving only on interface create/delete
-			 * event */
+			/* stop receiving only on interface create/delete event */
 			if (nlh->nlmsg_type == RTM_NEWLINK ||
 			    nlh->nlmsg_type == RTM_DELLINK) {
 				event_found++;
@@ -111,70 +80,47 @@ int child_func(void)
 		tries++;
 	}
 
-	close(fd);
+	SAFE_CLOSE(fd);
 
-	if (!event_found) {
-		perror("recv");
-		return 1;
-	}
+	if (event_found)
+		tst_res(TPASS, "interface changes detected");
+	else
+		tst_res(TFAIL, "failed to detect interface changes");
 
-	return 0;
+	exit(0);
 }
 
-static void test(void)
+static void test_netns_netlink(void)
 {
-	pid_t pid;
-	int status;
-
 	/* unshares the network namespace */
-	if (unshare(CLONE_NEWNET) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "unshare failed");
+	SAFE_UNSHARE(CLONE_NEWNET);
 
-	pid = tst_fork();
-	if (pid < 0) {
-		tst_brkm(TBROK | TERRNO, cleanup, "fork failed");
-	}
-	if (pid == 0) {
-		_exit(child_func());
-	}
+	if (SAFE_FORK() == 0)
+		child_func();
 
 	/* creates TAP network interface dummy0 */
 	if (WEXITSTATUS(system("ip tuntap add dev dummy0 mode tap")))
-		tst_brkm(TBROK, cleanup, "system() failed");
+		tst_brk(TBROK, "adding interface failed");
 
 	/* removes previously created dummy0 device */
 	if (WEXITSTATUS(system("ip tuntap del mode tap dummy0")))
-		tst_brkm(TBROK, cleanup, "system() failed");
+		tst_brk(TBROK, "removing interface failed");
 
 	/* allow child to continue */
-	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
-
-
-	SAFE_WAITPID(cleanup, pid, &status, 0);
-	if (WIFEXITED(status) && WEXITSTATUS(status) != 0) {
-		tst_resm(TFAIL, "netlink interface fail");
-		return;
-	}
-	if (WIFSIGNALED(status)) {
-		tst_resm(TFAIL, "child was killed with signal %s",
-			 tst_strsig(WTERMSIG(status)));
-		return;
-	}
+	TST_CHECKPOINT_WAKE(0);
 
-	tst_resm(TPASS, "netlink interface pass");
+	tst_reap_children();
 }
 
-int main(int argc, char *argv[])
-{
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++)
-		test();
-
-	cleanup();
-	tst_exit();
-}
+static struct tst_test test = {
+	.test_all = test_netns_netlink,
+	.needs_checkpoints = 1,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_NET_NS=y",
+		NULL
+	},
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
