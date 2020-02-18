Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919C1623C6
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:45:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A98153C25A4
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:45:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 42BE73C2493
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:45:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 05F771401809
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:45:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C28EAF3B;
 Tue, 18 Feb 2020 09:45:41 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Li Wang <liwang@redhat.com>,
	ltp@lists.linux.it
Date: Tue, 18 Feb 2020 10:45:40 +0100
Message-Id: <20200218094541.27201-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217141622.26912-1-mdoucha@suse.cz>
References: <20200217141622.26912-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/3] Split off executable code from bpf/bpf_common.h
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: This patch was split off from the v1 BPF fix. Code cleanup
to prevent future bugs and make the common code more readable.

Changes since v2: None.

Changes since v3: Don't generate separate .o files for test programs.

 testcases/kernel/syscalls/bpf/Makefile     |  3 ++
 testcases/kernel/syscalls/bpf/bpf_common.c | 45 ++++++++++++++++++++++
 testcases/kernel/syscalls/bpf/bpf_common.h | 39 ++-----------------
 3 files changed, 51 insertions(+), 36 deletions(-)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_common.c

diff --git a/testcases/kernel/syscalls/bpf/Makefile b/testcases/kernel/syscalls/bpf/Makefile
index 990c8c83c..4305dfcf0 100644
--- a/testcases/kernel/syscalls/bpf/Makefile
+++ b/testcases/kernel/syscalls/bpf/Makefile
@@ -5,6 +5,9 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
+FILTER_OUT_MAKE_TARGETS	:= bpf_common
 CFLAGS			+= -D_GNU_SOURCE
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+$(MAKE_TARGETS): %: bpf_common.o
diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
new file mode 100644
index 000000000..fce364af8
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019-2020 Linux Test Project
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "lapi/bpf.h"
+#include "bpf_common.h"
+
+void rlimit_bump_memlock(void)
+{
+	struct rlimit memlock_r;
+
+	SAFE_GETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	memlock_r.rlim_cur += BPF_MEMLOCK_ADD;
+	tst_res(TINFO, "Raising RLIMIT_MEMLOCK to %ld",
+		(long)memlock_r.rlim_cur);
+
+	if (memlock_r.rlim_cur <= memlock_r.rlim_max) {
+		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	} else if ((geteuid() == 0)) {
+		memlock_r.rlim_max += BPF_MEMLOCK_ADD;
+		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	} else {
+		tst_res(TINFO, "Can't raise RLIMIT_MEMLOCK, test may fail "
+			"due to lack of max locked memory");
+	}
+}
+
+int bpf_map_create(union bpf_attr *attr)
+{
+	TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));
+	if (TST_RET == -1) {
+		if (TST_ERR == EPERM) {
+			tst_res(TCONF, "Hint: check also /proc/sys/kernel/unprivileged_bpf_disabled");
+			tst_brk(TCONF | TTERRNO,
+				"bpf() requires CAP_SYS_ADMIN on this system");
+		} else {
+			tst_brk(TBROK | TTERRNO, "Failed to create array map");
+		}
+	}
+
+	return TST_RET;
+}
diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
index f700bede2..e46a519eb 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.h
+++ b/testcases/kernel/syscalls/bpf/bpf_common.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (c) 2019 Linux Test Project
+ * Copyright (c) 2019-2020 Linux Test Project
  */
 
 #ifndef LTP_BPF_COMMON_H
@@ -8,40 +8,7 @@
 
 #define BPF_MEMLOCK_ADD (256*1024)
 
-void rlimit_bump_memlock(void)
-{
-	struct rlimit memlock_r;
-
-	SAFE_GETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
-	memlock_r.rlim_cur += BPF_MEMLOCK_ADD;
-	tst_res(TINFO, "Raising RLIMIT_MEMLOCK to %ld",
-		(long)memlock_r.rlim_cur);
-
-	if (memlock_r.rlim_cur <= memlock_r.rlim_max) {
-		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
-	} else if ((geteuid() == 0)) {
-		memlock_r.rlim_max += BPF_MEMLOCK_ADD;
-		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
-	} else {
-		tst_res(TINFO, "Can't raise RLIMIT_MEMLOCK, test may fail "
-			"due to lack of max locked memory");
-	}
-}
-
-int bpf_map_create(union bpf_attr *attr)
-{
-	TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));
-	if (TST_RET == -1) {
-		if (TST_ERR == EPERM) {
-			tst_res(TCONF, "Hint: check also /proc/sys/kernel/unprivileged_bpf_disabled");
-			tst_brk(TCONF | TTERRNO,
-				"bpf() requires CAP_SYS_ADMIN on this system");
-		} else {
-			tst_brk(TBROK | TTERRNO, "Failed to create array map");
-		}
-	}
-
-	return TST_RET;
-}
+void rlimit_bump_memlock(void);
+int bpf_map_create(union bpf_attr *attr);
 
 #endif
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
