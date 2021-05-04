Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F95372B3B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:42:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BB273C5853
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:42:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 436F13C57E0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8F097200D09
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620135696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKIh1OV4EAcBM+Sev4nShi7gQPljNQZYsSnQNwYFxuE=;
 b=sDaQqmsyDcq5c4Gn6XdYvesUh84x2zjpD4XFDF6mjwBi/RP9F5y2I9BYLSkhGgkrVb9DUB
 VIjuSG872m5Na98OgP8gjKKWP35PqqUEk/M2Mv/+W8d8mHDRC0K3NGZr/Mo6R3W3U5uDD+
 mFG2bS7DjJeeys4ECE0d1W/8XZenws8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38AD0B305;
 Tue,  4 May 2021 13:41:36 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 14:40:57 +0100
Message-Id: <20210504134100.20666-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504134100.20666-1-rpalethorpe@suse.com>
References: <20210504134100.20666-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v6 4/7] Add new CGroups API library tests
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
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/.gitignore     |  3 +-
 lib/newlib_tests/test21.c       | 66 ------------------------
 lib/newlib_tests/tst_cgroup01.c | 51 +++++++++++++++++++
 lib/newlib_tests/tst_cgroup02.c | 90 +++++++++++++++++++++++++++++++++
 4 files changed, 143 insertions(+), 67 deletions(-)
 delete mode 100644 lib/newlib_tests/test21.c
 create mode 100644 lib/newlib_tests/tst_cgroup01.c
 create mode 100644 lib/newlib_tests/tst_cgroup02.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index bebecad8b..b95ead2c2 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -16,6 +16,8 @@ test15
 test16
 tst_capability01
 tst_capability02
+tst_cgroup01
+tst_cgroup02
 tst_device
 tst_safe_fileops
 tst_res_hexd
@@ -24,7 +26,6 @@ test17
 test18
 test19
 test20
-test21
 test22
 tst_expiration_timer
 test_assert
diff --git a/lib/newlib_tests/test21.c b/lib/newlib_tests/test21.c
deleted file mode 100644
index f29a2f702..000000000
--- a/lib/newlib_tests/test21.c
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2020 Red Hat, Inc.
- * Copyright (c) 2020 Li Wang <liwang@redhat.com>
- */
-
-/*
- * Tests tst_cgroup.h APIs
- */
-
-#include "tst_test.h"
-#include "tst_cgroup.h"
-
-#define PATH_CGROUP1 "/mnt/liwang1"
-#define PATH_CGROUP2 "/mnt/liwang2"
-#define MEMSIZE 1024 * 1024
-
-static void do_test(void)
-{
-	pid_t pid = SAFE_FORK();
-
-	switch (pid) {
-	case 0:
-		tst_cgroup_move_current(PATH_CGROUP1);
-		tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, MEMSIZE);
-		tst_cgroup_mem_set_maxswap(PATH_CGROUP1, MEMSIZE);
-
-		tst_cgroup_move_current(PATH_CGROUP2);
-
-	break;
-	default:
-		tst_cgroup_move_current(PATH_TMP_CG_CST);
-
-		tst_cgroup_move_current(PATH_TMP_CG_MEM);
-		tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, MEMSIZE);
-		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, MEMSIZE);
-	break;
-	}
-
-	tst_res(TPASS, "Cgroup mount test");
-}
-
-static void setup(void)
-{
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
-
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
-}
-
-static void cleanup(void)
-{
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
-	tst_cgroup_umount(PATH_CGROUP1);
-
-	tst_cgroup_umount(PATH_TMP_CG_CST);
-	tst_cgroup_umount(PATH_CGROUP2);
-}
-
-static struct tst_test test = {
-	.test_all = do_test,
-	.setup = setup,
-	.cleanup = cleanup,
-	.forks_child = 1,
-};
diff --git a/lib/newlib_tests/tst_cgroup01.c b/lib/newlib_tests/tst_cgroup01.c
new file mode 100644
index 000000000..54a370362
--- /dev/null
+++ b/lib/newlib_tests/tst_cgroup01.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 SUSE LLC */
+
+#include <stdio.h>
+
+#include "tst_test.h"
+#include "tst_cgroup.h"
+
+static char *only_mount_v1;
+static char *no_cleanup;
+static struct tst_option opts[] = {
+	{"v", &only_mount_v1, "-v\tOnly try to mount CGroups V1"},
+	{"n", &no_cleanup, "-n\tLeave CGroups created by test"},
+	{NULL, NULL, NULL},
+};
+struct tst_cgroup_opts cgopts;
+
+static void do_test(void)
+{
+	tst_res(TPASS, "pass");
+}
+
+static void setup(void)
+{
+	cgopts.only_mount_v1 = !!only_mount_v1,
+
+	tst_cgroup_scan();
+	tst_cgroup_print_config();
+
+	tst_cgroup_require("memory", &cgopts);
+	tst_cgroup_print_config();
+	tst_cgroup_require("cpuset", &cgopts);
+	tst_cgroup_print_config();
+}
+
+static void cleanup(void)
+{
+	if (no_cleanup) {
+		tst_res(TINFO, "no cleanup");
+	} else {
+		tst_res(TINFO, "cleanup");
+		tst_cgroup_cleanup();
+	}
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.setup = setup,
+	.cleanup = cleanup,
+	.options = opts,
+};
diff --git a/lib/newlib_tests/tst_cgroup02.c b/lib/newlib_tests/tst_cgroup02.c
new file mode 100644
index 000000000..1e2152064
--- /dev/null
+++ b/lib/newlib_tests/tst_cgroup02.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 SUSE LLC */
+
+#include <stdlib.h>
+#include <stdio.h>
+
+#include "tst_test.h"
+#include "tst_cgroup.h"
+
+static char *only_mount_v1;
+static char *no_cleanup;
+static struct tst_option opts[] = {
+	{"v", &only_mount_v1, "-v\tOnly try to mount CGroups V1"},
+	{"n", &no_cleanup, "-n\tLeave CGroups created by test"},
+	{NULL, NULL, NULL},
+};
+static struct tst_cgroup_opts cgopts;
+static const struct tst_cgroup_group *cg;
+static const struct tst_cgroup_group *cg_drain;
+static struct tst_cgroup_group *cg_child;
+
+static void do_test(void)
+{
+	char buf[BUFSIZ];
+	size_t mem;
+
+	if (TST_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
+		SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+memory");
+	if (TST_CGROUP_VER(cg, "cpuset") != TST_CGROUP_V1)
+		SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+cpuset");
+
+	cg_child = tst_cgroup_group_mk(cg, "child");
+	if (!SAFE_FORK()) {
+		SAFE_CGROUP_PRINTF(cg_child, "cgroup.procs", "%d", getpid());
+
+		SAFE_CGROUP_SCANF(cg_child, "memory.current", "%zu", &mem);
+		tst_res(TPASS, "child/memory.current = %zu", mem);
+		SAFE_CGROUP_PRINTF(cg_child, "memory.max",
+				   "%zu", (1UL << 24) - 1);
+		SAFE_CGROUP_PRINTF(cg_child, "memory.swap.max",
+				   "%zu", 1UL << 31);
+
+		SAFE_CGROUP_READ(cg_child, "cpuset.mems", buf, sizeof(buf));
+		tst_res(TPASS, "child/cpuset.mems = %s", buf);
+		SAFE_CGROUP_PRINT(cg_child, "cpuset.mems", buf);
+
+		exit(0);
+	}
+
+	SAFE_CGROUP_PRINTF(cg, "memory.max", "%zu", (1UL << 24) - 1);
+	SAFE_CGROUP_PRINTF(cg_child, "cgroup.procs", "%d", getpid());
+	SAFE_CGROUP_SCANF(cg, "memory.current", "%zu", &mem);
+	tst_res(TPASS, "memory.current = %zu", mem);
+
+	tst_reap_children();
+	SAFE_CGROUP_PRINTF(cg_drain, "cgroup.procs", "%d", getpid());
+	cg_child = tst_cgroup_group_rm(cg_child);
+}
+
+static void setup(void)
+{
+	cgopts.only_mount_v1 = !!only_mount_v1,
+
+	tst_cgroup_scan();
+	tst_cgroup_print_config();
+
+	tst_cgroup_require("memory", &cgopts);
+	tst_cgroup_require("cpuset", &cgopts);
+
+	cg = tst_cgroup_get_test_group();
+	cg_drain = tst_cgroup_get_drain_group();
+}
+
+static void cleanup(void)
+{
+	if (cg_child) {
+		SAFE_CGROUP_PRINTF(cg_drain, "cgroup.procs", "%d", getpid());
+		cg_child = tst_cgroup_group_rm(cg_child);
+	}
+	if (!no_cleanup)
+		tst_cgroup_cleanup();
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.setup = setup,
+	.cleanup = cleanup,
+	.options = opts,
+	.forks_child = 1,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
