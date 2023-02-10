Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E3692449
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Feb 2023 18:18:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DB8A3CC096
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Feb 2023 18:18:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 350203CC07C
 for <ltp@lists.linux.it>; Fri, 10 Feb 2023 18:18:22 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D86741A000BA
 for <ltp@lists.linux.it>; Fri, 10 Feb 2023 18:18:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 206AE2016D;
 Fri, 10 Feb 2023 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1676049500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31zmoh5bWAcWxRv3vdWThmQ1Qb/q/wXMbU9oTezT+H8=;
 b=iNoUnLbti8AC2dGOY6HeqLGvJHLtOxgAHJ/rcHBvosXypsgYfdE/KCKVgKvGEZjLqqgtAG
 Gjy3uqsuq+T2JH+aqH756O6fwkwbr78Ub+n9I2hAFPTRfWcDrmrk4JUuDkL5pRSdSrJEzh
 ZCYVpCo41cOnyK8MV889La4s1yLS8jE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56E2613206;
 Fri, 10 Feb 2023 17:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YINsHlh85mOlHQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 10 Feb 2023 17:18:16 +0000
To: ltp@lists.linux.it
Date: Fri, 10 Feb 2023 18:16:01 +0100
Message-Id: <20230210171601.19047-3-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230210171601.19047-1-andrea.cervesato@suse.com>
References: <20230210171601.19047-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/2] Rewrite utsname testing suite
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Deleted utstest.c and created the following new tests:
- utsname01
- utsname02
- utsname03
- utsname04

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Deleted utsname.h
Usage of tst_reap_children
Cleaner code

 runtest/containers                            |  16 +-
 .../kernel/containers/utsname/.gitignore      |   5 +-
 testcases/kernel/containers/utsname/Makefile  |  23 +-
 .../containers/utsname/runutstests_noltp.sh   |  41 --
 .../kernel/containers/utsname/utsname01.c     |  56 +++
 .../kernel/containers/utsname/utsname02.c     |  81 ++++
 .../kernel/containers/utsname/utsname03.c     | 118 ++++++
 .../kernel/containers/utsname/utsname04.c     |  52 +++
 testcases/kernel/containers/utsname/utstest.c | 353 ------------------
 9 files changed, 320 insertions(+), 425 deletions(-)
 delete mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
 create mode 100644 testcases/kernel/containers/utsname/utsname01.c
 create mode 100644 testcases/kernel/containers/utsname/utsname02.c
 create mode 100644 testcases/kernel/containers/utsname/utsname03.c
 create mode 100644 testcases/kernel/containers/utsname/utsname04.c
 delete mode 100644 testcases/kernel/containers/utsname/utstest.c

diff --git a/runtest/containers b/runtest/containers
index 2637b62fe..23f394579 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -62,16 +62,12 @@ semtest_2ns_clone semtest_2ns -m clone
 semtest_2ns_unshare semtest_2ns -m unshare
 sem_comm sem_comm
 
-utstest_unshare_1 utstest unshare 1
-utstest_unshare_2 utstest unshare 2
-utstest_unshare_3 utstest unshare 3
-utstest_unshare_4 utstest unshare 4
-utstest_unshare_5 utstest unshare 5
-utstest_clone_1 utstest clone 1
-utstest_clone_2 utstest clone 2
-utstest_clone_3 utstest clone 3
-utstest_clone_4 utstest clone 4
-utstest_clone_5 utstest clone 5
+utsname01 utsname01
+utsname02 utsname02
+utsname03_clone utsname03 -m clone
+utsname03_unshare utsname03 -m unshare
+utsname04_clone utsname04 -m clone
+utsname04_unshare utsname04 -m unshare
 
 mountns01 mountns01
 mountns02 mountns02
diff --git a/testcases/kernel/containers/utsname/.gitignore b/testcases/kernel/containers/utsname/.gitignore
index 0e1f41dc8..945ed280e 100644
--- a/testcases/kernel/containers/utsname/.gitignore
+++ b/testcases/kernel/containers/utsname/.gitignore
@@ -1 +1,4 @@
-/utstest
+/utsname01
+/utsname02
+/utsname03
+/utsname04
diff --git a/testcases/kernel/containers/utsname/Makefile b/testcases/kernel/containers/utsname/Makefile
index 5efcbf648..9c0158c01 100644
--- a/testcases/kernel/containers/utsname/Makefile
+++ b/testcases/kernel/containers/utsname/Makefile
@@ -1,28 +1,11 @@
-################################################################################
-##                                                                            ##
-## Copyright (c) International Business Machines  Corp., 2007                 ##
-##                                                                            ##
-## This program is free software;  you can redistribute it and#or modify      ##
-## it under the terms of the GNU General Public License as published by       ##
-## the Free Software Foundation; either version 2 of the License, or          ##
-## (at your option) any later version.                                        ##
-##                                                                            ##
-## This program is distributed in the hope that it will be useful, but        ##
-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-## for more details.                                                          ##
-##                                                                            ##
-## You should have received a copy of the GNU General Public License          ##
-## along with this program;  if not, write to the Free Software               ##
-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-##                                                                            ##
-################################################################################
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
 
 top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 include $(abs_srcdir)/../Makefile.inc
 
-LDLIBS			:= -lclone -lpthread -lrt $(LDLIBS)
+LDLIBS			:= -lclone $(LDLIBS)
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/containers/utsname/runutstests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
deleted file mode 100755
index 43cb7e26b..000000000
--- a/testcases/kernel/containers/utsname/runutstests_noltp.sh
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-################################################################################
-##                                                                            ##
-## Copyright (c) International Business Machines  Corp., 2007                 ##
-##                                                                            ##
-## This program is free software;  you can redistribute it and#or modify      ##
-## it under the terms of the GNU General Public License as published by       ##
-## the Free Software Foundation; either version 2 of the License, or          ##
-## (at your option) any later version.                                        ##
-##                                                                            ##
-## This program is distributed in the hope that it will be useful, but        ##
-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-## for more details.                                                          ##
-##                                                                            ##
-## You should have received a copy of the GNU General Public License          ##
-## along with this program;  if not, write to the Free Software               ##
-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-##                                                                            ##
-################################################################################
-
-oldhostname=`hostname`
-exit_code=0
-echo "unshare tests"
-for i in `seq 1 5`; do
-	echo "test $i (unshare)"
-	./utstest_noltp unshare $i
-	if [ $? -ne 0 ]; then
-		exit_code=$?
-	fi
-done
-echo "clone tests"
-for i in `seq 1 5`; do
-	echo "test $i (clone)"
-	./utstest_noltp clone $i
-	if [ $? -ne 0 ]; then
-		exit_code=$?
-	fi
-done
-hostname "$oldhostname"
-exit $exit_code
diff --git a/testcases/kernel/containers/utsname/utsname01.c b/testcases/kernel/containers/utsname/utsname01.c
new file mode 100644
index 000000000..fc5c1a271
--- /dev/null
+++ b/testcases/kernel/containers/utsname/utsname01.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Clone two plain processes and check if both read the same hostname.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+
+static char *hostname1;
+static char *hostname2;
+
+static void run(void)
+{
+	memset(hostname1, 0, HOST_NAME_MAX);
+	memset(hostname2, 0, HOST_NAME_MAX);
+
+	if (!SAFE_FORK()) {
+		SAFE_GETHOSTNAME(hostname1, HOST_NAME_MAX);
+		return;
+	}
+
+	if (!SAFE_FORK()) {
+		SAFE_GETHOSTNAME(hostname2, HOST_NAME_MAX);
+		return;
+	}
+
+	tst_reap_children();
+
+	TST_EXP_PASS(strcmp(hostname1, hostname2));
+}
+
+static void setup(void)
+{
+	hostname1 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	hostname2 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+}
+
+static void cleanup(void)
+{
+	SAFE_MUNMAP(hostname1, HOST_NAME_MAX);
+	SAFE_MUNMAP(hostname2, HOST_NAME_MAX);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+};
diff --git a/testcases/kernel/containers/utsname/utsname02.c b/testcases/kernel/containers/utsname/utsname02.c
new file mode 100644
index 000000000..aa90596d4
--- /dev/null
+++ b/testcases/kernel/containers/utsname/utsname02.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Clone two plain processes, change hostname in the first one then check if
+ * hostaname has changed inside the second one as well.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+
+#define HOSTNAME "LTP_HOSTNAME"
+
+static char *hostname1;
+static char *hostname2;
+static char originalhost[HOST_NAME_MAX];
+
+static void reset_hostname(void)
+{
+	SAFE_SETHOSTNAME(originalhost, strlen(originalhost));
+}
+
+static void run(void)
+{
+	memset(hostname1, 0, HOST_NAME_MAX);
+	memset(hostname2, 0, HOST_NAME_MAX);
+
+	if (!SAFE_FORK()) {
+		SAFE_SETHOSTNAME(HOSTNAME, strlen(HOSTNAME));
+		SAFE_GETHOSTNAME(hostname1, HOST_NAME_MAX);
+
+		TST_CHECKPOINT_WAKE(0);
+		return;
+	}
+
+	if (!SAFE_FORK()) {
+		TST_CHECKPOINT_WAIT(0);
+
+		SAFE_GETHOSTNAME(hostname2, HOST_NAME_MAX);
+		return;
+	}
+
+	tst_reap_children();
+
+	TST_EXP_PASS(strcmp(hostname1, HOSTNAME));
+	TST_EXP_PASS(strcmp(hostname2, HOSTNAME));
+
+	reset_hostname();
+}
+
+static void setup(void)
+{
+	hostname1 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	hostname2 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+
+	memset(originalhost, 0, HOST_NAME_MAX);
+
+	SAFE_GETHOSTNAME(originalhost, HOST_NAME_MAX);
+}
+
+static void cleanup(void)
+{
+	SAFE_MUNMAP(hostname1, HOST_NAME_MAX);
+	SAFE_MUNMAP(hostname2, HOST_NAME_MAX);
+
+	reset_hostname();
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
diff --git a/testcases/kernel/containers/utsname/utsname03.c b/testcases/kernel/containers/utsname/utsname03.c
new file mode 100644
index 000000000..6b94b452e
--- /dev/null
+++ b/testcases/kernel/containers/utsname/utsname03.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines Corp., 2007
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Clone two processes using CLONE_NEWUTS, change hostname from the first
+ * container and check if hostname didn't change inside the second one.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "lapi/sched.h"
+
+#define HOSTNAME "LTP_HOSTNAME"
+
+static char *str_op;
+static char *hostname1;
+static char *hostname2;
+static char originalhost[HOST_NAME_MAX];
+
+static void reset_hostname(void)
+{
+	SAFE_SETHOSTNAME(originalhost, strlen(originalhost));
+}
+
+static void child1_run(void)
+{
+	SAFE_SETHOSTNAME(HOSTNAME, strlen(HOSTNAME));
+	SAFE_GETHOSTNAME(hostname1, HOST_NAME_MAX);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static void child2_run(void)
+{
+	TST_CHECKPOINT_WAIT(0);
+
+	SAFE_GETHOSTNAME(hostname2, HOST_NAME_MAX);
+}
+
+static void run(void)
+{
+	const struct tst_clone_args cargs = { CLONE_NEWUTS, SIGCHLD };
+
+	memset(hostname1, 0, HOST_NAME_MAX);
+	memset(hostname2, 0, HOST_NAME_MAX);
+
+	if (!str_op || !strcmp(str_op, "clone")) {
+		tst_res(TINFO, "clone() with CLONE_NEWUTS");
+
+		if (!SAFE_CLONE(&cargs)) {
+			child1_run();
+			return;
+		}
+
+		if (!SAFE_CLONE(&cargs)) {
+			child2_run();
+			return;
+		}
+	} else {
+		tst_res(TINFO, "unshare() with CLONE_NEWUTS");
+
+		if (!SAFE_FORK()) {
+			SAFE_UNSHARE(CLONE_NEWUTS);
+			child1_run();
+			return;
+		}
+
+		if (!SAFE_FORK()) {
+			SAFE_UNSHARE(CLONE_NEWUTS);
+			child2_run();
+			return;
+		}
+	}
+
+	tst_reap_children();
+
+	TST_EXP_PASS(strcmp(hostname1, HOSTNAME));
+	TST_EXP_PASS(strcmp(hostname2, originalhost));
+
+	reset_hostname();
+}
+
+static void setup(void)
+{
+	hostname1 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	hostname2 = SAFE_MMAP(NULL, HOST_NAME_MAX, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+
+	memset(originalhost, 0, HOST_NAME_MAX);
+
+	SAFE_GETHOSTNAME(originalhost, HOST_NAME_MAX);
+}
+
+static void cleanup(void)
+{
+	SAFE_MUNMAP(hostname1, HOST_NAME_MAX);
+	SAFE_MUNMAP(hostname2, HOST_NAME_MAX);
+
+	reset_hostname();
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Test execution mode <clone|unshare>" },
+		{},
+	},
+};
diff --git a/testcases/kernel/containers/utsname/utsname04.c b/testcases/kernel/containers/utsname/utsname04.c
new file mode 100644
index 000000000..e8d636d0d
--- /dev/null
+++ b/testcases/kernel/containers/utsname/utsname04.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Drop root privileges, create a container with CLONE_NEWUTS and verify that
+ * we receive a permission error.
+ */
+
+#define _GNU_SOURCE
+
+#include <pwd.h>
+#include "tst_test.h"
+#include "lapi/sched.h"
+
+static char *str_op;
+
+static void run(void)
+{
+	const struct tst_clone_args cargs = { CLONE_NEWUTS, SIGCHLD };
+	struct passwd *pw;
+
+	tst_res(TINFO, "Dropping root privileges");
+
+	pw = SAFE_GETPWNAM("nobody");
+	SAFE_SETRESUID(pw->pw_uid, pw->pw_uid, pw->pw_uid);
+
+	if (!str_op || !strcmp(str_op, "clone")) {
+		TST_EXP_EQ_LI(tst_clone(&cargs), -1);
+		TST_EXP_PASS(errno == EPERM);
+	} else {
+		if (!SAFE_FORK()) {
+			TST_EXP_EQ_LI(unshare(CLONE_NEWUTS), -1);
+			TST_EXP_PASS(errno == EPERM);
+			return;
+		}
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Test execution mode <clone|unshare>" },
+		{},
+	},
+};
diff --git a/testcases/kernel/containers/utsname/utstest.c b/testcases/kernel/containers/utsname/utstest.c
deleted file mode 100644
index 9ad19b6b2..000000000
--- a/testcases/kernel/containers/utsname/utstest.c
+++ /dev/null
@@ -1,353 +0,0 @@
-/*
-* Copyright (c) International Business Machines Corp., 2007
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-***************************************************************************
- * Copyright 2007 IBM
- * Author: Serge Hallyn <serue@us.ibm.com>
- *
- * test1:
-	P1: A=gethostname
-	P2: B=gethostname
-	Ensure(A==B)
-
- * test2:
-	P1: sethostname(A);
-	P2: (wait); B=gethostname
-	Ensure (A==B)
-
- * test3:
-	P1: A=gethostname; unshare(utsname); sethostname(newname); C=gethostname
-	P2: B=gethostname; (wait); (wait); D=gethostname
-	Ensure (A==B && A==D && C!=D)
-
- * test4:
-	P1: A=gethostname; unshare(utsname); (wait); C=gethostname
-	P2: B=gethostname; (wait); sethostname(newname); D=gethostname
-	Ensure (A==B && A==C && C!=D)
-
- * test5:
-	P1: drop_privs(); unshare(utsname); (wait); C=gethostname
-	P2: (wait); sethostname(B); D=gethostname
-	Ensure (B==C==D) and state is ok.
- *
- */
-
-#define _GNU_SOURCE 1
-#include <sys/wait.h>
-#include <assert.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-#include "libclone.h"
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "uts_namespace";
-int TST_TOTAL = 1;
-
-static int dummy_child(void *v)
-{
-	(void) v;
-	return 0;
-}
-
-static void check_newuts(void)
-{
-	int pid, status;
-
-	pid = do_clone_unshare_test(T_CLONE, CLONE_NEWUTS, dummy_child, NULL);
-	if (pid == -1)
-		tst_brkm(TCONF | TERRNO, NULL, "CLONE_NEWUTS not supported");
-
-	SAFE_WAIT(NULL, &status);
-}
-
-int drop_root(void)
-{
-	int ret;
-	ret = setresuid(1000, 1000, 1000);
-	if (ret) {
-		perror("setresuid");
-		exit(4);
-	}
-	return 1;
-}
-
-#define HLEN 100
-#define NAME1 "serge1"
-#define NAME2 "serge2"
-
-int p1fd[2], p2fd[2];
-static char oldhost[HLEN];
-pid_t cpid;
-
-void picknewhostname(char *orig, char *new)
-{
-	memset(new, 0, HLEN);
-	if (strcmp(orig, NAME1) == 0)
-		strcpy(new, NAME2);
-	else
-		strcpy(new, NAME1);
-}
-
-void zeroize(char *s)
-{
-	memset(s, 0, HLEN);
-}
-
-char *tsttype;
-int P1(void *vtest)
-{
-	char hostname[HLEN], newhostname[HLEN], rhostname[HLEN];
-	int err;
-	int len;
-	int testnum;
-
-	testnum = atoi((char *)vtest);
-
-	close(p1fd[1]);
-	close(p2fd[0]);
-
-	switch (testnum) {
-	case 1:
-		gethostname(hostname, HLEN);
-		zeroize(rhostname);
-		len = read(p1fd[0], rhostname, HLEN);
-		if (strcmp(hostname, rhostname) == 0) {
-			tst_resm(TPASS, "test 1 (%s): success", tsttype);
-			tst_exit();
-		}
-		tst_brkm(TFAIL, NULL,
-			 "test 1 (%s): hostname 1 %s, hostname 2 %s",
-			 tsttype, hostname, rhostname);
-	case 2:
-		gethostname(hostname, HLEN);
-		picknewhostname(hostname, newhostname);
-		err = sethostname(newhostname, strlen(newhostname));
-		write(p2fd[1], "1", 1);
-		if (err == -1) {
-			tst_brkm(TFAIL, NULL,
-				 "test 2 (%s): failed to sethostname",
-				 tsttype);
-		}
-		zeroize(rhostname);
-		len = read(p1fd[0], rhostname, HLEN);
-		if (strcmp(newhostname, rhostname) == 0) {
-			tst_resm(TPASS, "test 2 (%s): success", tsttype);
-			tst_exit();
-		}
-		tst_brkm(TFAIL, NULL,
-			 "test 2 (%s) hostname 1 %s, hostname 2 %s",
-			 tsttype, newhostname, rhostname);
-	case 3:
-		gethostname(hostname, HLEN);
-		picknewhostname(hostname, newhostname);
-		err = sethostname(newhostname, strlen(newhostname));
-		write(p2fd[1], "1", 1);
-		if (err == -1) {
-			tst_brkm(TFAIL, NULL,
-				 "test 3 (%s): failed to sethostname",
-				 tsttype);
-		}
-
-		zeroize(rhostname);
-		len = read(p1fd[0], rhostname, HLEN);
-		if (strcmp(newhostname, rhostname) == 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "test 3 (%s): hostname 1 %s, hostname 2 %s, these should have been different",
-				 tsttype, newhostname, rhostname);
-		}
-		if (strcmp(hostname, rhostname) == 0) {
-			tst_resm(TPASS, "test 3 (%s): success", tsttype);
-			tst_exit();
-		}
-		tst_brkm(TFAIL,
-			 NULL,
-			 "test 3 (%s): hostname 1 %s, hostname 2 %s, should have been same",
-			 tsttype, hostname, rhostname);
-
-	case 4:
-		gethostname(hostname, HLEN);
-		write(p2fd[1], "1", 1);	/* tell p2 to go ahead and sethostname */
-		zeroize(rhostname);
-		len = read(p1fd[0], rhostname, HLEN);
-		gethostname(newhostname, HLEN);
-		if (strcmp(hostname, newhostname) != 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "test 4 (%s): hostname 1 %s, hostname 2 %s, should be same",
-				 tsttype, hostname, newhostname);
-		}
-		if (strcmp(hostname, rhostname) == 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "test 4 (%s): hostname 1 %s, hostname 2 %s, should be different",
-				 tsttype, hostname, rhostname);
-		}
-		tst_resm(TPASS, "test 4 (%s): successful", tsttype);
-		tst_exit();
-	case 5:
-		write(p2fd[1], "1", 1);	/* tell p2 to go ahead and sethostname */
-		zeroize(rhostname);
-		len = read(p1fd[0], rhostname, HLEN);
-		gethostname(newhostname, HLEN);
-		if (strcmp(rhostname, newhostname) != 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "test 5 (%s): hostnames %s and %s should be same",
-				 tsttype, rhostname, newhostname);
-		}
-		tst_resm(TPASS, "test 5 (%s): successful", tsttype);
-		tst_exit();
-	default:
-		break;
-	}
-	tst_exit();
-}
-
-int P2(void *vtest)
-{
-	char hostname[HLEN], newhostname[HLEN];
-	int len;
-	int testnum;
-
-	testnum = atoi((char *)vtest);
-
-	close(p1fd[0]);
-	close(p2fd[1]);
-
-	switch (testnum) {
-	case 1:
-		gethostname(hostname, HLEN);
-		write(p1fd[1], hostname, strlen(hostname));
-		break;
-	case 2:
-	case 3:
-		len = 0;
-		while (!len) {
-			len = read(p2fd[0], hostname, 1);
-		}
-		gethostname(hostname, HLEN);
-		write(p1fd[1], hostname, strlen(hostname));
-		break;
-	case 4:
-	case 5:
-		len = 0;
-		while (!len) {
-			len = read(p2fd[0], hostname, 1);
-		}
-		if (hostname[0] == '0') {
-			tst_resm(TPASS, "P2: P1 claims error");
-			return 0;
-		}
-		gethostname(hostname, HLEN);
-		picknewhostname(hostname, newhostname);
-		sethostname(newhostname, strlen(newhostname));
-		write(p1fd[1], newhostname, strlen(newhostname));
-		break;
-	default:
-		tst_resm(TFAIL, "undefined test: %d", testnum);
-		break;
-	}
-	return 0;
-}
-
-static void setup(void)
-{
-	gethostname(oldhost, HLEN);
-	tst_require_root();
-	check_newuts();
-}
-
-static void cleanup(void)
-{
-	sethostname(oldhost, strlen(oldhost));
-}
-
-#define UNSHARESTR "unshare"
-#define CLONESTR "clone"
-int main(int argc, char *argv[])
-{
-	int r, pid, use_clone = T_UNSHARE;
-	int testnum;
-	void *vtest;
-
-	setup();
-	if (argc != 3) {
-		tst_resm(TFAIL, "Usage: %s <clone|unshare> <testnum>",
-			 argv[0]);
-		tst_resm(TFAIL,
-			 " where clone or unshare specifies unshare method,");
-		tst_resm(TFAIL, " and testnum is between 1 and 5 inclusive");
-		exit(2);
-	}
-	if (pipe(p1fd) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
-	if (pipe(p2fd) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
-
-	tsttype = UNSHARESTR;
-	if (strcmp(argv[1], "clone") == 0) {
-		use_clone = T_CLONE;
-		tsttype = CLONESTR;
-	}
-
-	testnum = atoi(argv[2]);
-
-	vtest = (void *)argv[2];
-	switch (testnum) {
-	case 1:
-	case 2:
-		r = do_clone_unshare_tests(T_NONE, 0, P1, vtest, P2, vtest);
-		break;
-	case 3:
-	case 4:
-		r = do_clone_unshare_tests(use_clone, CLONE_NEWUTS,
-					   P1, vtest, P2, vtest);
-		break;
-	case 5:
-		pid = fork();
-		if (pid == -1) {
-			perror("fork");
-			exit(2);
-		}
-		if (pid == 0) {
-			if (!drop_root()) {
-				tst_brkm(TFAIL, NULL, "failed to drop root.");
-			}
-			r = do_clone_unshare_test(use_clone, CLONE_NEWUTS,
-						  P1, vtest);
-			write(p2fd[1], "0", 1);	/* don't let p2 hang */
-			exit(0);
-		} else {
-			P2(vtest);
-		}
-		break;
-	default:
-		tst_resm(TFAIL,
-			 "testnum should be between 1 and 5 inclusive.");
-		break;
-	}
-
-	cleanup();
-	tst_exit();
-}
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
