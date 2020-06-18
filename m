Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D421FEC84
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 09:33:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 796E03C2CAE
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 09:33:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B3F963C23CD
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 09:33:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 205CA60096B
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 09:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592465589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=I72FsaiMUHepzuZ2zwalSHjQkwYCxWISrmpaZ6y9/4E=;
 b=gabwUHim6m0BVFFvc9VDrpcrHi5Iq0P0miUH3u85tB/8OmySMH13F4sjtXs+/hBC525SAf
 lIN4RwSwfohwbdzz1vC4KH6HlIDKFT9qibz/ro5l5+eLyQgz5Ou6r9meyXTHteSQd/H83R
 QX3sXTunyTWO7y3d35RhVrcpfpvi6/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Iy6juZD_Ocy1PfDn6uED4Q-1; Thu, 18 Jun 2020 03:33:05 -0400
X-MC-Unique: Iy6juZD_Ocy1PfDn6uED4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE91B107B270;
 Thu, 18 Jun 2020 07:33:04 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3A7B60BF3;
 Thu, 18 Jun 2020 07:33:03 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 18 Jun 2020 09:33:01 +0200
Message-Id: <fbfc0935275f40efd2ac70685724e31806ed156e.1592465232.git.jstancek@redhat.com>
In-Reply-To: <20200617151135.GA7370@yuki.lan>
References: <20200617151135.GA7370@yuki.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/setns: convert to new API
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Both tests are converted in single commit since they share setns.h.
Some small warnings are also fixed.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/setns/setns.h   |  42 +----
 testcases/kernel/syscalls/setns/setns01.c | 216 ++++++++--------------
 testcases/kernel/syscalls/setns/setns02.c | 154 ++++++---------
 3 files changed, 143 insertions(+), 269 deletions(-)

Changes in v2:
- relace GPL comment with SPDX
- include "lapi/namespaces_constants.h" and drop ifdefs
- move setup/cleanup functions and remove forward declarations
- open regular fd once in setup(), drop cleanup1()
- modify messages to print expected errno also as string
- don't check child exit code, not needed in newlib
- use SAFE_GETPWNAM, SAFE_MALLOC, SAFE_GETCWD, SAFE_SHMGET

diff --git a/testcases/kernel/syscalls/setns/setns.h b/testcases/kernel/syscalls/setns/setns.h
index a05e6736c64a..c2097f2e5105 100644
--- a/testcases/kernel/syscalls/setns/setns.h
+++ b/testcases/kernel/syscalls/setns/setns.h
@@ -1,27 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2013 Linux Test Project, Inc.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of version 2 of the GNU General Public
- * License as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it
- * is free of the rightful claim of any third person regarding
- * infringement or the like.  Any license provided herein, whether
- * implied or otherwise, applies only to this software file.  Patent
- * licenses, if any, provided herein do not apply to combinations of
- * this program with other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
+ * Copyright (c) Linux Test Project, 2014-2020
  */
 
+#include <stdio.h>
+#include "lapi/namespaces_constants.h"
+
 #define NS_MAX 5
 static int ns_types[NS_MAX];
 static int ns_fds[NS_MAX];
@@ -37,10 +21,10 @@ static int get_ns_fd(int pid, const char *ns)
 	if (stat(tmp, &st) == 0) {
 		fd = open(tmp, O_RDONLY);
 		if (fd == -1)
-			tst_brkm(TBROK|TERRNO, NULL, "failed to open %s", tmp);
+			tst_brk(TBROK|TERRNO, "failed to open %s", tmp);
 	} else {
 		if (errno != ENOENT)
-			tst_brkm(TBROK|TERRNO, NULL, "failed to stat %s", tmp);
+			tst_brk(TBROK|TERRNO, "failed to stat %s", tmp);
 	}
 	return fd;
 }
@@ -53,7 +37,7 @@ static void init_ns_type(int clone_type, const char *proc_name)
 	if (fd != -1) {
 		ns_types[ns_total] = clone_type;
 		ns_fds[ns_total] = fd;
-		tst_resm(TINFO, "ns_name=%s, ns_fds[%d]=%d, ns_types[%d]=0x%x",
+		tst_res(TINFO, "ns_name=%s, ns_fds[%d]=%d, ns_types[%d]=0x%x",
 			 proc_name, ns_total, fd, ns_total, clone_type);
 		ns_total++;
 	}
@@ -61,21 +45,11 @@ static void init_ns_type(int clone_type, const char *proc_name)
 
 static void init_available_ns(void)
 {
-#if defined(CLONE_NEWIPC)
 	init_ns_type(CLONE_NEWIPC, "ipc");
-#endif
-#if defined(CLONE_NEWNS)
 	init_ns_type(CLONE_NEWNS, "mnt");
-#endif
-#if defined(CLONE_NEWNET)
 	init_ns_type(CLONE_NEWNET, "net");
-#endif
-#if defined(CLONE_NEWPID)
 	init_ns_type(CLONE_NEWPID, "pid");
-#endif
-#if defined(CLONE_NEWUTS)
 	init_ns_type(CLONE_NEWUTS, "uts");
-#endif
 }
 
 static void close_ns_fds(void)
diff --git a/testcases/kernel/syscalls/setns/setns01.c b/testcases/kernel/syscalls/setns/setns01.c
index 864899205aa8..b0704406013a 100644
--- a/testcases/kernel/syscalls/setns/setns01.c
+++ b/testcases/kernel/syscalls/setns/setns01.c
@@ -1,47 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2013 Linux Test Project, Inc.
+ * Copyright (c) Linux Test Project, 2014-2020
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of version 2 of the GNU General Public
- * License as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it
- * is free of the rightful claim of any third person regarding
- * infringement or the like.  Any license provided herein, whether
- * implied or otherwise, applies only to this software file.  Patent
- * licenses, if any, provided herein do not apply to combinations of
- * this program with other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
- */
-/*
  * errno tests for setns(2) - reassociate thread with a namespace
  */
 #define _GNU_SOURCE
 #include <sys/stat.h>
-#include <sys/syscall.h>
 #include <sys/types.h>
 #include <errno.h>
 #include <sched.h>
 #include <pwd.h>
 #include <string.h>
 #include "config.h"
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-#include "safe_macros.h"
-
-char *TCID = "setns01";
-
-#if defined(__NR_setns)
 #include "setns.h"
 
+static const char nobody_uid[] = "nobody";
+static struct passwd *ltpuser;
+static int regular_fd;
+
 struct testcase_t {
 	const char *msg;
 	int fd;
@@ -53,57 +31,6 @@ struct testcase_t {
 	void (*cleanup) (struct testcase_t *);
 };
 
-static void setup(void);
-static void cleanup(void);
-static void setup0(struct testcase_t *, int);
-static void setup1(struct testcase_t *, int);
-static void setup2(struct testcase_t *, int);
-static void setup3(struct testcase_t *, int);
-static void setup4(struct testcase_t *, int);
-static void cleanup1(struct testcase_t *);
-static void cleanup4(struct testcase_t *);
-
-struct testcase_t tdat[] = {
-	{
-		.msg = "invalid fd",
-		.fd = -1,
-		.exp_ret = -1,
-		.exp_errno = EBADF,
-		.setup = setup0,
-	},
-	{
-		.msg = "regular file fd",
-		.exp_ret = -1,
-		.exp_errno = EINVAL,
-		.setup = setup1,
-		.cleanup = cleanup1
-	},
-	{
-		.msg = "invalid ns_type",
-		.ns_type = -1,
-		.exp_ret = -1,
-		.exp_errno = EINVAL,
-		.setup = setup2,
-	},
-	{
-		.msg = "mismatch ns_type/fd",
-		.exp_ret = -1,
-		.exp_errno = EINVAL,
-		.setup = setup3,
-	},
-	{
-		.msg = "without CAP_SYS_ADMIN",
-		.exp_ret = -1,
-		.exp_errno = EPERM,
-		.setup = setup4,
-		.cleanup = cleanup4,
-	}
-};
-
-static int TST_TOTAL = sizeof(tdat) / sizeof(tdat[0]);
-static const char nobody_uid[] = "nobody";
-static struct passwd *ltpuser;
-
 static void setup0(struct testcase_t *t, int i)
 {
 	t->ns_type = ns_types[i];
@@ -112,15 +39,7 @@ static void setup0(struct testcase_t *t, int i)
 static void setup1(struct testcase_t *t, int i)
 {
 	t->ns_type = ns_types[i];
-	t->fd = open("dummy", O_RDWR|O_CREAT, 0600);
-	if (t->fd == -1)
-		tst_brkm(TFAIL|TERRNO, cleanup, "setup1:open failed");
-	unlink("dummy");
-}
-
-static void cleanup1(struct testcase_t *t)
-{
-	close(t->fd);
+	t->fd = regular_fd;
 }
 
 static void setup2(struct testcase_t *t, int i)
@@ -141,42 +60,82 @@ static void setup3(struct testcase_t *t, int i)
 
 static void setup4(struct testcase_t *t, int i)
 {
-	SAFE_SETEUID(NULL, ltpuser->pw_uid);
+	SAFE_SETEUID(ltpuser->pw_uid);
 
 	t->fd = ns_fds[i];
 	t->ns_type = ns_types[i];
 }
 
-static void cleanup4(struct testcase_t *t)
+static void cleanup4(LTP_ATTRIBUTE_UNUSED struct testcase_t *t)
 {
-	SAFE_SETEUID(NULL, 0);
+	SAFE_SETEUID(0);
 }
 
-static void test_setns(struct testcase_t *t)
+static struct testcase_t tcases[] = {
+	{
+		.msg = "invalid fd",
+		.fd = -1,
+		.exp_ret = -1,
+		.exp_errno = EBADF,
+		.setup = setup0,
+	},
+	{
+		.msg = "regular file fd",
+		.exp_ret = -1,
+		.exp_errno = EINVAL,
+		.setup = setup1,
+	},
+	{
+		.msg = "invalid ns_type",
+		.ns_type = -1,
+		.exp_ret = -1,
+		.exp_errno = EINVAL,
+		.setup = setup2,
+	},
+	{
+		.msg = "mismatch ns_type/fd",
+		.exp_ret = -1,
+		.exp_errno = EINVAL,
+		.setup = setup3,
+	},
+	{
+		.msg = "without CAP_SYS_ADMIN",
+		.exp_ret = -1,
+		.exp_errno = EPERM,
+		.setup = setup4,
+		.cleanup = cleanup4,
+	}
+};
+
+static void test_setns(unsigned int testno)
 {
 	int ret, i;
+	struct testcase_t *t = &tcases[testno];
 
 	for (i = 0; i < ns_total; i++) {
 		if (t->setup)
 			t->setup(t, i);
 
 		if (t->skip) {
-			tst_resm(TINFO, "skip %s", tdat->msg);
+			tst_res(TINFO, "skip %s", t->msg);
 			continue;
 		}
 
-		tst_resm(TINFO, "setns(%d, 0x%x)", t->fd, t->ns_type);
-		ret = syscall(__NR_setns, t->fd, t->ns_type);
+		tst_res(TINFO, "setns(%d, 0x%x)", t->fd, t->ns_type);
+		ret = tst_syscall(__NR_setns, t->fd, t->ns_type);
 		if (ret == t->exp_ret) {
-			if (ret == -1 && errno == t->exp_errno)
-				tst_resm(TPASS, "%s exp_errno=%d", t->msg,
-						t->exp_errno);
-			else
-				tst_resm(TFAIL|TERRNO, "%s exp_errno=%d",
-					t->msg, t->exp_errno);
+			if (ret == -1 && errno == t->exp_errno) {
+				tst_res(TPASS, "%s exp_errno=%d (%s)",
+					t->msg,	t->exp_errno,
+					tst_strerrno(t->exp_errno));
+			} else {
+				tst_res(TFAIL|TERRNO, "%s exp_errno=%d (%s)",
+					t->msg, t->exp_errno,
+					tst_strerrno(t->exp_errno));
+			}
 		} else {
-			tst_resm(TFAIL, "%s ret=%d expected=%d", t->msg,
-					ret, t->exp_ret);
+			tst_res(TFAIL, "%s ret=%d expected=%d",
+				t->msg,	ret, t->exp_ret);
 		}
 
 		if (t->cleanup)
@@ -184,50 +143,33 @@ static void test_setns(struct testcase_t *t)
 	}
 }
 
-int main(int argc, char *argv[])
-{
-	int lc, testno;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		for (testno = 0; testno < TST_TOTAL; testno++)
-			test_setns(&tdat[testno]);
-	}
-	cleanup();
-	tst_exit();
-}
-
 static void setup(void)
 {
-	tst_require_root();
-
 	/* runtime check if syscall is supported */
-	ltp_syscall(__NR_setns, -1, 0);
+	tst_syscall(__NR_setns, -1, 0);
 
 	init_available_ns();
 	if (ns_total == 0)
-		tst_brkm(TCONF, NULL, "no ns types/proc entries");
+		tst_brk(TCONF, "no ns types/proc entries");
 
-	ltpuser = getpwnam(nobody_uid);
-	if (ltpuser == NULL)
-		tst_brkm(TBROK | TERRNO, NULL, "getpwnam failed");
-
-
-	tst_tmpdir();
-	TEST_PAUSE;
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	regular_fd = SAFE_OPEN("dummy", O_RDWR|O_CREAT, 0600);
+	SAFE_UNLINK("dummy");
 }
 
 static void cleanup(void)
 {
 	close_ns_fds();
-	tst_rmdir();
+	if (regular_fd)
+		SAFE_CLOSE(regular_fd);
 }
-#else
-int main(int argc, char *argv[])
-{
-	tst_brkm(TCONF, NULL, "__NR_setns is not defined on your system.");
 
-}
-#endif
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = test_setns,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
+
diff --git a/testcases/kernel/syscalls/setns/setns02.c b/testcases/kernel/syscalls/setns/setns02.c
index 0f49028450b7..0e20c52e4f18 100644
--- a/testcases/kernel/syscalls/setns/setns02.c
+++ b/testcases/kernel/syscalls/setns/setns02.c
@@ -1,27 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2013 Linux Test Project, Inc.
+ * Copyright (c) Linux Test Project, 2014-2020
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of version 2 of the GNU General Public
- * License as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it
- * is free of the rightful claim of any third person regarding
- * infringement or the like.  Any license provided herein, whether
- * implied or otherwise, applies only to this software file.  Patent
- * licenses, if any, provided herein do not apply to combinations of
- * this program with other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
- */
-/*
  * functional test for setns(2) - reassociate thread with a namespace
  * 1. create child with CLONE_NEWUTS, set different hostname in child,
  *    set namespace back to parent ns and check that hostname has changed
@@ -33,24 +13,21 @@
 #include <sys/ipc.h>
 #include <sys/shm.h>
 #include <sys/stat.h>
-#include <sys/syscall.h>
 #include <sys/types.h>
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <errno.h>
 #include <sched.h>
+#include <stdlib.h>
 #include <string.h>
 #include "config.h"
-#include "test.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
 #include "lapi/syscalls.h"
-#include "safe_macros.h"
+#include "setns.h"
 
 #define CHILD_STACK_SIZE (1024*1024)
 #define CP "(child) "
-char *TCID = "setns02";
-
-#if defined(__NR_setns) && defined(CLONE_NEWIPC) && defined(CLONE_NEWUTS)
-#include "setns.h"
 
 static char *dummy_hostname = "setns_dummy_uts";
 static int ns_ipc_fd;
@@ -67,37 +44,37 @@ static int do_child_newuts(void *arg)
 	int ns_flag = *(int *)arg;
 
 	if (uname(&uts_parent) == -1)
-		tst_resm(TFAIL|TERRNO, CP"uname");
-	tst_resm(TINFO, CP"hostname (inherited from parent): %s",
+		tst_res(TFAIL|TERRNO, CP"uname");
+	tst_res(TINFO, CP"hostname (inherited from parent): %s",
 		uts_parent.nodename);
 
 	if (sethostname(dummy_hostname, strlen(dummy_hostname)) == -1)
-		tst_resm(TFAIL|TERRNO, CP"sethostname");
+		tst_res(TFAIL|TERRNO, CP"sethostname");
 	if (uname(&uts) == -1)
-		tst_resm(TFAIL|TERRNO, CP"uname");
+		tst_res(TFAIL|TERRNO, CP"uname");
 
-	tst_resm(TINFO, CP"hostname changed to: %s", uts.nodename);
+	tst_res(TINFO, CP"hostname changed to: %s", uts.nodename);
 	if (strcmp(uts_parent.nodename, uts.nodename) == 0) {
-		tst_resm(TFAIL, CP"expected hostname to be different");
+		tst_res(TFAIL, CP"expected hostname to be different");
 		return 1;
 	} else {
-		tst_resm(TPASS, CP"hostname is different in parent/child");
+		tst_res(TPASS, CP"hostname is different in parent/child");
 	}
 
-	tst_resm(TINFO, CP"attempting to switch ns back to parent ns");
-	if (syscall(__NR_setns, ns_uts_fd, ns_flag) == -1) {
-		tst_resm(TFAIL|TERRNO, CP"setns");
+	tst_res(TINFO, CP"attempting to switch ns back to parent ns");
+	if (tst_syscall(__NR_setns, ns_uts_fd, ns_flag) == -1) {
+		tst_res(TFAIL|TERRNO, CP"setns");
 		return 2;
 	}
 	if (uname(&uts) == -1)
-		tst_resm(TFAIL|TERRNO, CP"uname");
+		tst_res(TFAIL|TERRNO, CP"uname");
 
-	tst_resm(TINFO, CP"hostname: %s", uts.nodename);
+	tst_res(TINFO, CP"hostname: %s", uts.nodename);
 	if (strcmp(uts_parent.nodename, uts.nodename) != 0) {
-		tst_resm(TFAIL, CP"expected hostname to match parent");
+		tst_res(TFAIL, CP"expected hostname to match parent");
 		return 3;
 	} else {
-		tst_resm(TPASS, CP"hostname now as expected");
+		tst_res(TPASS, CP"hostname now as expected");
 	}
 	return 0;
 }
@@ -109,25 +86,25 @@ static int do_child_newipc(void *arg)
 
 	p = shmat(shmid, NULL, 0);
 	if (p == (void *) -1) {
-		tst_resm(TPASS|TERRNO, CP"shmat failed as expected");
+		tst_res(TPASS|TERRNO, CP"shmat failed as expected");
 	} else {
-		tst_resm(TFAIL, CP"shmat unexpectedly suceeded");
+		tst_res(TFAIL, CP"shmat unexpectedly suceeded");
 		shmdt(p);
 		return 1;
 	}
 
-	tst_resm(TINFO, CP"attempting to switch ns back to parent ns");
-	if (syscall(__NR_setns, ns_ipc_fd, ns_flag) == -1) {
-		tst_resm(TFAIL|TERRNO, CP"setns");
+	tst_res(TINFO, CP"attempting to switch ns back to parent ns");
+	if (tst_syscall(__NR_setns, ns_ipc_fd, ns_flag) == -1) {
+		tst_res(TFAIL|TERRNO, CP"setns");
 		return 2;
 	}
 
 	p = shmat(shmid, NULL, 0);
 	if (p == (void *) -1) {
-		tst_resm(TFAIL|TERRNO, CP"shmat failed after setns");
+		tst_res(TFAIL|TERRNO, CP"shmat failed after setns");
 		return 3;
 	} else {
-		tst_resm(TPASS, CP"shmat suceeded");
+		tst_res(TPASS, CP"shmat suceeded");
 		shmdt(p);
 	}
 
@@ -139,72 +116,53 @@ static void test_flag(int clone_flag, int ns_flag, int (*fn) (void *arg))
 	void *child_stack;
 	int ret, status;
 
-	child_stack = malloc(CHILD_STACK_SIZE);
-	if (child_stack == NULL)
-		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
 
-	tst_resm(TINFO, "creating child with clone_flag=0x%x, ns_flag=0x%x",
+	tst_res(TINFO, "creating child with clone_flag=0x%x, ns_flag=0x%x",
 		clone_flag, ns_flag);
 	ret = ltp_clone(SIGCHLD|clone_flag, fn, &ns_flag,
 		CHILD_STACK_SIZE, child_stack);
 	if (ret == -1)
-		tst_brkm(TBROK|TERRNO, cleanup, "ltp_clone");
+		tst_brk(TBROK|TERRNO, "ltp_clone");
 
-	SAFE_WAITPID(cleanup, ret, &status, 0);
-	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-		tst_resm(TFAIL, "child returns %d", status);
-	else
-		tst_resm(TPASS, "child finished succesfully");
+	SAFE_WAITPID(ret, &status, 0);
 	free(child_stack);
 }
 
-int main(int argc, char *argv[])
+void test_all(void)
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		if (ns_uts_fd != -1) {
-			tst_resm(TINFO, "test_newuts");
-			test_flag(CLONE_NEWUTS, CLONE_NEWUTS, do_child_newuts);
-			test_flag(CLONE_NEWUTS, 0, do_child_newuts);
-		}
-		if (ns_ipc_fd != -1) {
-			tst_resm(TINFO, "test_newipc");
-			test_flag(CLONE_NEWIPC, CLONE_NEWIPC, do_child_newipc);
-			test_flag(CLONE_NEWIPC, 0, do_child_newipc);
-		}
-	}
-	cleanup();
-	tst_exit();
+	if (ns_uts_fd != -1) {
+		tst_res(TINFO, "test_newuts");
+		test_flag(CLONE_NEWUTS, CLONE_NEWUTS, do_child_newuts);
+		test_flag(CLONE_NEWUTS, 0, do_child_newuts);
+	} else
+		tst_res(TCONF, "CLONE_NEWUTS is not supported");
+
+	if (ns_ipc_fd != -1) {
+		tst_res(TINFO, "test_newipc");
+		test_flag(CLONE_NEWIPC, CLONE_NEWIPC, do_child_newipc);
+		test_flag(CLONE_NEWIPC, 0, do_child_newipc);
+	} else
+		tst_res(TCONF, "CLONE_NEWIPC is not supported");
 }
 
 static void setup(void)
 {
 	char tmp[PATH_MAX];
 
-	tst_require_root();
-
 	/* runtime check if syscall is supported */
-	ltp_syscall(__NR_setns, -1, 0);
+	tst_syscall(__NR_setns, -1, 0);
 
 	/* check if kernel has CONFIG_*_NS set and exports /proc entries */
 	ns_ipc_fd = get_ns_fd(getpid(), "ipc");
 	ns_uts_fd = get_ns_fd(getpid(), "uts");
 	if (ns_ipc_fd == -1 && ns_uts_fd == -1)
-		tst_brkm(TCONF, NULL, "your kernel has CONFIG_IPC_NS, "
+		tst_brk(TCONF, "your kernel has CONFIG_IPC_NS, "
 			"CONFIG_UTS_NS or CONFIG_PROC disabled");
 
-	if (getcwd(tmp, PATH_MAX) == NULL)
-		tst_brkm(TBROK|TERRNO, NULL, "getcwd");
+	SAFE_GETCWD(tmp, PATH_MAX);
 	ipc_key = ftok(tmp, 65);
-	shmid = shmget(ipc_key, getpagesize(), IPC_CREAT | 0666);
-	if (shmid == -1)
-		tst_brkm(TBROK|TERRNO, NULL, "shmget");
-
-	TEST_PAUSE;
+	shmid = SAFE_SHMGET(ipc_key, getpagesize(), IPC_CREAT | 0666);
 }
 
 static void cleanup(void)
@@ -216,10 +174,10 @@ static void cleanup(void)
 
 	shmctl(shmid, IPC_RMID, NULL);
 }
-#else
-int main(int argc, char *argv[])
-{
-	tst_brkm(TCONF, NULL, "__NR_setns, CLONE_NEWIPC or CLONE_NEWUTS "
-		" is not defined on your system.");
-}
-#endif
+
+static struct tst_test test = {
+	.test_all = test_all,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+};
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
