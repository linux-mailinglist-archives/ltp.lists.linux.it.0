Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 194812DBE28
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFE9F3C5A58
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5DBC93C29D6
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DB0481A00FAA
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608112923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqTu4xJMS6UHprGnFDz9P35X3l6xkJceoi2USQCgvWU=;
 b=SdogsuJl3ENyIZ5Rx1uXBw+gDkhKbiPjHDh3XYQBW1HkfsPCRb/Q74j6NteJkrh+AiQUJA
 SMXsG1sirt6PaZNX26atv4FfBhX6coIdG4PQVqXow5sjE61DrSDtR+/KAADpGEVR6bh4XS
 blPn7dyIufExOC1+TRSE9X/vL7f2PZU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 699AAAE91;
 Wed, 16 Dec 2020 10:02:03 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 10:01:19 +0000
Message-Id: <20201216100121.16683-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216100121.16683-1-rpalethorpe@suse.com>
References: <20201216100121.16683-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 3/5] CGroup API tests
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

Rewrite of existing test and new test for the CGroups API.
---
 lib/newlib_tests/.gitignore   |  1 +
 lib/newlib_tests/test21.c     | 30 +++++------------
 lib/newlib_tests/tst_cgroup.c | 61 +++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 22 deletions(-)
 create mode 100644 lib/newlib_tests/tst_cgroup.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 6c2612259..799f088ba 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -16,6 +16,7 @@ test15
 test16
 tst_capability01
 tst_capability02
+tst_cgroup
 tst_device
 tst_safe_fileops
 tst_res_hexd
diff --git a/lib/newlib_tests/test21.c b/lib/newlib_tests/test21.c
index f29a2f702..4d40c2e1e 100644
--- a/lib/newlib_tests/test21.c
+++ b/lib/newlib_tests/test21.c
@@ -11,8 +11,6 @@
 #include "tst_test.h"
 #include "tst_cgroup.h"
 
-#define PATH_CGROUP1 "/mnt/liwang1"
-#define PATH_CGROUP2 "/mnt/liwang2"
 #define MEMSIZE 1024 * 1024
 
 static void do_test(void)
@@ -21,19 +19,16 @@ static void do_test(void)
 
 	switch (pid) {
 	case 0:
-		tst_cgroup_move_current(PATH_CGROUP1);
-		tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, MEMSIZE);
-		tst_cgroup_mem_set_maxswap(PATH_CGROUP1, MEMSIZE);
-
-		tst_cgroup_move_current(PATH_CGROUP2);
-
+		tst_cgroup_move_current(TST_CGROUP_MEMORY);
+		tst_cgroup_mem_set_maxbytes(MEMSIZE);
+		tst_cgroup_mem_set_maxswap(MEMSIZE);
 	break;
 	default:
-		tst_cgroup_move_current(PATH_TMP_CG_CST);
+		tst_cgroup_move_current(TST_CGROUP_CPUSET);
 
-		tst_cgroup_move_current(PATH_TMP_CG_MEM);
-		tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, MEMSIZE);
-		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, MEMSIZE);
+		tst_cgroup_move_current(TST_CGROUP_MEMORY);
+		tst_cgroup_mem_set_maxbytes(MEMSIZE);
+		tst_cgroup_mem_set_maxswap(MEMSIZE);
 	break;
 	}
 
@@ -42,20 +37,11 @@ static void do_test(void)
 
 static void setup(void)
 {
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
-
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
 }
 
 static void cleanup(void)
 {
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
-	tst_cgroup_umount(PATH_CGROUP1);
-
-	tst_cgroup_umount(PATH_TMP_CG_CST);
-	tst_cgroup_umount(PATH_CGROUP2);
 }
 
 static struct tst_test test = {
diff --git a/lib/newlib_tests/tst_cgroup.c b/lib/newlib_tests/tst_cgroup.c
new file mode 100644
index 000000000..e4e7d8f28
--- /dev/null
+++ b/lib/newlib_tests/tst_cgroup.c
@@ -0,0 +1,61 @@
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
+	char buf[BUFSIZ];
+	pid_t pid = SAFE_FORK();
+
+	if (!pid) {
+		tst_cgroup_mem_set_maxbytes((1UL << 24) - 1);
+		tst_cgroup_mem_set_maxswap(1UL << 31);
+		tst_cgroup_move_current(TST_CGROUP_MEMORY);
+
+		tst_cgroup_cpuset_read_files("mems", buf, sizeof(buf));
+		tst_cgroup_cpuset_write_files("mems", buf);
+		tst_cgroup_move_current(TST_CGROUP_CPUSET);
+
+		tst_res(TPASS, "Cgroup mount test");
+	}
+
+	tst_reap_children();
+}
+
+static void setup(void)
+{
+	cgopts.only_mount_v1 = !!only_mount_v1,
+	cgopts.cleanup =
+		no_cleanup ? TST_CGROUP_CLEANUP_NONE : TST_CGROUP_CLEANUP_ROOT;
+
+	tst_cgroup_scan();
+	tst_cgroup_print_config();
+
+	tst_cgroup_require(TST_CGROUP_MEMORY, &cgopts);
+	tst_cgroup_print_config();
+	tst_cgroup_require(TST_CGROUP_CPUSET, &cgopts);
+	tst_cgroup_print_config();
+}
+
+static void cleanup(void)
+{
+	tst_cgroup_cleanup(&cgopts);
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
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
