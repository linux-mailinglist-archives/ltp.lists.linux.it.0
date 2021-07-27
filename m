Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996D3D7287
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 12:04:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 964F43C9106
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 12:04:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 951E13C200C
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 12:04:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 018B4600806
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 12:04:13 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 67789220F6;
 Tue, 27 Jul 2021 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627380253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SbKlpHN7DZpRbeDgj7x3FL5DsGxwGh5gkBJQG3Mtrw=;
 b=P1oLHg41QJBkeVMby9mRkGrmrTPl6vPe1qq+dM44drSo4yCCrFQ34fJcrl6Q/AHMUFZ8T7
 Ebn0QjJnX2rWRkFU8uLXwJ0fMRnOPJqXtWb2lWAELPSNqJkrsUl7AYpuZp9ZYw7TIngYEd
 bvFe4M25pNF3qUoTAhD4TTmjWjhTU/g=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 3B397A3B81;
 Tue, 27 Jul 2021 10:04:13 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 27 Jul 2021 11:04:10 +0100
Message-Id: <20210727100410.14151-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YPbDGQ3vIRpF87vD@yuki>
References: <YPbDGQ3vIRpF87vD@yuki>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] userns08,
 CVE-2018-18955: Broken id mappings in nested namespaces
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V2:
* Formatting of cargs
* Cleaned up checkpoints
* Added O_WRONLY to open

 include/lapi/clone.h                          |   4 +
 runtest/containers                            |   1 +
 runtest/cve                                   |   1 +
 testcases/kernel/containers/.gitignore        |   1 +
 testcases/kernel/containers/userns/userns08.c | 141 ++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 testcases/kernel/containers/userns/userns08.c

diff --git a/include/lapi/clone.h b/include/lapi/clone.h
index 81db443c9..0d49c97f4 100644
--- a/include/lapi/clone.h
+++ b/include/lapi/clone.h
@@ -37,6 +37,10 @@ static inline int clone3(struct clone_args *args, size_t size)
 #define CLONE_PIDFD	0x00001000	/* set if a pidfd should be placed in parent */
 #endif
 
+#ifndef CLONE_NEWUSER
+# define CLONE_NEWUSER	0x10000000
+#endif
+
 static inline void clone3_supported_by_kernel(void)
 {
 	if ((tst_kvercmp(5, 3, 0)) < 0) {
diff --git a/runtest/containers b/runtest/containers
index 276096709..eea7bfadb 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -85,6 +85,7 @@ userns04 userns04
 userns05 userns05
 userns06 userns06
 userns07 userns07
+userns08 userns08
 
 # time namespaces
 sysinfo03 sysinfo03
diff --git a/runtest/cve b/runtest/cve
index 226b5ea44..8aa048a40 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -56,6 +56,7 @@ cve-2018-1000204 ioctl_sg01
 cve-2018-12896 timer_settime03
 cve-2018-18445 bpf_prog04
 cve-2018-18559 bind06
+cve-2018-18955 userns08
 cve-2018-19854 crypto_user01
 cve-2019-8912 af_alg07
 cve-2020-11494 pty04
diff --git a/testcases/kernel/containers/.gitignore b/testcases/kernel/containers/.gitignore
index 7dc2608f3..5c2b90312 100644
--- a/testcases/kernel/containers/.gitignore
+++ b/testcases/kernel/containers/.gitignore
@@ -11,3 +11,4 @@ userns/userns05
 userns/userns06_capcheck
 userns/userns06
 userns/userns07
+userns/userns08
diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
new file mode 100644
index 000000000..aedfc6c4e
--- /dev/null
+++ b/testcases/kernel/containers/userns/userns08.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Reproducer of CVE-2018-18955; broken uid/gid mapping for nested
+ * user namespaces with >5 ranges
+ *
+ * See original reproducer and description by Jan Horn:
+ * https://bugs.chromium.org/p/project-zero/issues/detail?id=1712
+ *
+ * Note that calling seteuid from root can cause the dumpable bit to
+ * be unset. The proc files of non dumpable processes are then owned
+ * by (the real) root. So on the second level we reset dumpable to 1.
+ *
+ */
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/prctl.h>
+#include <sys/mount.h>
+
+#include "tst_test.h"
+#include "tst_clone.h"
+#include "lapi/clone.h"
+#include "tst_safe_file_at.h"
+
+static pid_t clone_newuser(void)
+{
+	const struct tst_clone_args cargs = {
+		CLONE_NEWUSER,
+		SIGCHLD
+	};
+
+	return SAFE_CLONE(&cargs);
+}
+
+static void write_mapping(const pid_t proc_in_ns,
+			  const char *const id_mapping)
+{
+	char proc_path[PATH_MAX];
+	int proc_dir;
+
+	sprintf(proc_path, "/proc/%d", (int)proc_in_ns);
+	proc_dir = SAFE_OPEN(proc_path, O_DIRECTORY);
+
+	TEST(faccessat(proc_dir, "uid_map", F_OK, 0));
+	if (TST_RET && TST_ERR == ENOENT)
+		tst_brk(TCONF, "No uid_map file; interface was added in v3.5");
+
+	SAFE_FILE_PRINTFAT(proc_dir, "setgroups", "%s", "deny");
+	SAFE_FILE_PRINTFAT(proc_dir, "uid_map", "%s", id_mapping);
+	SAFE_FILE_PRINTFAT(proc_dir, "gid_map", "%s", id_mapping);
+
+	SAFE_CLOSE(proc_dir);
+}
+
+static void ns_level2(void)
+{
+	if (prctl(PR_SET_DUMPABLE, 1, 0, 0, 0))
+		tst_res(TINFO | TERRNO, "Failed to set dumpable flag");
+	TST_CHECKPOINT_WAKE_AND_WAIT(1);
+
+	TST_EXP_FAIL(open("restricted", O_WRONLY), EACCES,
+		     "Denied write access to ./restricted");
+
+	exit(0);
+}
+
+static void ns_level1(void)
+{
+	const char *const map_over_5 = "0 0 1\n1 1 1\n2 2 1\n3 3 1\n4 4 1\n5 5 990";
+	pid_t level2_proc;
+
+	TST_CHECKPOINT_WAIT(0);
+
+	SAFE_SETGID(0);
+	SAFE_SETUID(0);
+
+	level2_proc = clone_newuser();
+	if (!level2_proc)
+		ns_level2();
+
+	TST_CHECKPOINT_WAIT(1);
+
+	write_mapping(level2_proc, map_over_5);
+
+	TST_CHECKPOINT_WAKE(1);
+	tst_reap_children();
+
+	exit(0);
+}
+
+static void run(void)
+{
+	pid_t level1_proc;
+
+	SAFE_SETEGID(100000);
+	SAFE_SETEUID(100000);
+
+	level1_proc = clone_newuser();
+	if (!level1_proc)
+		ns_level1();
+
+	SAFE_SETEGID(0);
+	SAFE_SETEUID(0);
+
+	write_mapping(level1_proc, "0 100000 1000");
+
+	TST_CHECKPOINT_WAKE(0);
+	tst_reap_children();
+}
+
+static void setup(void)
+{
+	int fd = SAFE_OPEN("restricted", O_CREAT | O_WRONLY, 0700);
+
+	SAFE_WRITE(fd, 1, "\n", 1);
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.needs_checkpoints = 1,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "d2f007dbe7e4"},
+		{"CVE", "CVE-2018-18955"},
+		{}
+	},
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
