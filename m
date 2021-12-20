Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297D47AA35
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 14:11:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21CB3C91BF
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 14:11:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 243133C6EA0
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 14:11:12 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 85FDB600F10
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 14:11:11 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2A89D218F3;
 Mon, 20 Dec 2021 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1640005871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEE8+Qu4pdp/7+VEAL7BYTtjssyqim93rR+z0Cxp0UM=;
 b=qt8Wn+fTZHs3CR1D1CRLxZrmnwaibg/zm10aHwCrdf3gF0OyqFul8cSBaoT/Nl6mHkNB1v
 DEs0+nfVap1veYMEU1YiZepVpUMHzx9d2eEKLXnPR9fpq1eU6oCPArFozDrkh6TcHKuCdD
 IUM9qNTBrBUiubBRKvyFKpDL7pYSpq4=
Received: from g78.suse.de (unknown [10.163.24.42])
 by relay2.suse.de (Postfix) with ESMTP id ED951A3B85;
 Mon, 20 Dec 2021 13:11:10 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 20 Dec 2021 13:10:43 +0000
Message-Id: <20211220131043.18894-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211220131043.18894-1-rpalethorpe@suse.com>
References: <20211220131043.18894-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] cgroup: Add memcontrol02
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

Conversion of the second kself test.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/controllers                           |   1 +
 testcases/kernel/controllers/memcg/.gitignore |   1 +
 .../kernel/controllers/memcg/memcontrol02.c   | 151 ++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 testcases/kernel/controllers/memcg/memcontrol02.c

diff --git a/runtest/controllers b/runtest/controllers
index 2b41a94d3..09e0107e4 100644
--- a/runtest/controllers
+++ b/runtest/controllers
@@ -18,6 +18,7 @@ memcg_control		memcg_control_test.sh
 
 # kselftest ports
 memcontrol01 memcontrol01
+memcontrol02 memcontrol02
 
 cgroup_fj_function_debug cgroup_fj_function.sh debug
 cgroup_fj_function_cpuset cgroup_fj_function.sh cpuset
diff --git a/testcases/kernel/controllers/memcg/.gitignore b/testcases/kernel/controllers/memcg/.gitignore
index c3565f85c..f7de40d53 100644
--- a/testcases/kernel/controllers/memcg/.gitignore
+++ b/testcases/kernel/controllers/memcg/.gitignore
@@ -6,3 +6,4 @@
 /regression/memcg_test_4
 /stress/memcg_process_stress
 memcontrol01
+memcontrol02
diff --git a/testcases/kernel/controllers/memcg/memcontrol02.c b/testcases/kernel/controllers/memcg/memcontrol02.c
new file mode 100644
index 000000000..002637db0
--- /dev/null
+++ b/testcases/kernel/controllers/memcg/memcontrol02.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*\
+ *
+ * [Description]
+ *
+ * Conversion of second kself test in cgroup/test_memcontrol.c.
+ *
+ * This test creates a memory cgroup, allocates some anonymous memory
+ * and some pagecache and check memory.current and some memory.stat
+ * values.
+ *
+ * Note that the V1 rss and cache counters were renamed to anon and
+ * file in V2. Besides error reporting, this test mainly differs from
+ * the kselftest in that it supports V1.
+ */
+#define _GNU_SOURCE
+
+#include <stdlib.h>
+#include <stdio.h>
+
+#include "tst_test.h"
+#include "tst_cgroup.h"
+
+#define MB(x) (x << 20)
+
+static size_t page_size;
+static const struct tst_cgroup_group *cg_test;
+static int is_v1_memcg;
+static struct tst_cgroup_group *cg_child;
+static int fd;
+
+/*
+ * Checks if two given values differ by less than err% of their sum.
+ */
+static inline int values_close(const ssize_t a,
+			       const ssize_t b,
+			       const ssize_t err)
+{
+	return labs(a - b) <= (a + b) / 100 * err;
+}
+
+static void alloc_anon_50M_check(void)
+{
+	const ssize_t size = MB(50);
+	char *buf, *ptr;
+	ssize_t anon, current;
+	const char *const anon_key_fmt = is_v1_memcg ? "rss %zd" : "anon %zd";
+
+	buf = SAFE_MALLOC(size);
+	for (ptr = buf; ptr < buf + size; ptr += page_size)
+		*ptr = 0;
+
+	SAFE_CGROUP_SCANF(cg_child, "memory.current", "%zd", &current);
+	TST_EXP_POSITIVE(current >= size,
+			 "(memory.current=%zd) >= (size=%zd)", current, size);
+
+	SAFE_CGROUP_LINES_SCANF(cg_child, "memory.stat", anon_key_fmt, &anon);
+
+	TST_EXP_POSITIVE(anon > 0, "(memory.stat.anon=%zd) > 0", anon);
+
+	TST_EXP_POSITIVE(values_close(size, current, 3),
+			 "(size=%zd) ~= (memory.stat.anon=%zd)", size, current);
+	TST_EXP_POSITIVE(values_close(anon, current, 3),
+			 "(memory.current=%zd) ~= (memory.stat.anon=%zd)",
+			 current, anon);
+}
+
+static void alloc_pagecache(const int fd, size_t size)
+{
+	char buf[BUFSIZ];
+	struct stat st;
+	size_t i;
+
+	SAFE_FSTAT(fd, &st);
+	size += st.st_size;
+
+	SAFE_FTRUNCATE(fd, size);
+
+	for (i = 0; i < size; i += sizeof(buf))
+		SAFE_READ(0, fd, buf, sizeof(buf));
+}
+
+static void alloc_pagecache_50M_check(void)
+{
+	const size_t size = MB(50);
+	size_t current, file;
+	const char *const file_key_fmt = is_v1_memcg ? "cache %zd" : "file %zd";
+
+	fd = SAFE_OPEN("page_cache", O_RDWR | O_CREAT);
+	alloc_pagecache(fd, size);
+
+	SAFE_CGROUP_SCANF(cg_child, "memory.current", "%zu", &current);
+	TST_EXP_POSITIVE(current >= size,
+			 "(memory.current=%zu) >= (size=%zu)", current, size);
+
+	SAFE_CGROUP_LINES_SCANF(cg_child, "memory.stat", file_key_fmt, &file);
+	TST_EXP_POSITIVE(file > 0, "(memory.stat.file=%zd) > 0", file);
+
+	TST_EXP_POSITIVE(values_close(file, current, 10),
+			 "(memory.current=%zd) ~= (memory.stat.file=%zd)",
+			 current, file);
+
+	SAFE_CLOSE(fd);
+}
+
+static void test_memcg_current(unsigned int n)
+{
+	size_t current;
+
+	cg_child = tst_cgroup_group_mk(cg_test, "child");
+	SAFE_CGROUP_SCANF(cg_child, "memory.current", "%zu", &current);
+	TST_EXP_POSITIVE(current == 0, "(current=%zu) == 0", current);
+
+	if (!SAFE_FORK()) {
+		SAFE_CGROUP_PRINTF(cg_child, "cgroup.procs", "%d", getpid());
+		if (!n)
+			alloc_anon_50M_check();
+		else
+			alloc_pagecache_50M_check();
+	} else {
+		tst_reap_children();
+		cg_child = tst_cgroup_group_rm(cg_child);
+	}
+}
+
+static void setup(void)
+{
+	page_size = SAFE_SYSCONF(_SC_PAGESIZE);
+
+	tst_cgroup_require("memory", NULL);
+	cg_test = tst_cgroup_get_test_group();
+
+	is_v1_memcg = TST_CGROUP_VER(cg_test, "memory") == TST_CGROUP_V1;
+}
+
+static void cleanup(void)
+{
+	if (cg_child)
+		cg_child = tst_cgroup_group_rm(cg_child);
+
+	tst_cgroup_cleanup();
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = 2,
+	.test = test_memcg_current,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+};
-- 
2.34.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
