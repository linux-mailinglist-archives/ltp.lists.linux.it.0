Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52672973
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:03:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27013C1CF8
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:03:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 332C33C02C2
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:03:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A426601009
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:03:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEE95ADEF
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 08:03:50 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 10:03:28 +0200
Message-Id: <20190724080328.16145-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724080328.16145-1-rpalethorpe@suse.com>
References: <20190724080328.16145-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] BPF: Sanity check creating and updating maps
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bpf/.gitignore  |   1 +
 testcases/kernel/syscalls/bpf/Makefile    |  10 ++
 testcases/kernel/syscalls/bpf/bpf_map01.c | 138 ++++++++++++++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
 create mode 100644 testcases/kernel/syscalls/bpf/Makefile
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 67dfed661..46880ee1d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -32,6 +32,8 @@ bind01 bind01
 bind02 bind02
 bind03 bind03
 
+bpf_map01 bpf_map01
+
 brk01 brk01
 
 capget01 capget01
diff --git a/testcases/kernel/syscalls/bpf/.gitignore b/testcases/kernel/syscalls/bpf/.gitignore
new file mode 100644
index 000000000..f33532484
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/.gitignore
@@ -0,0 +1 @@
+bpf_map01
diff --git a/testcases/kernel/syscalls/bpf/Makefile b/testcases/kernel/syscalls/bpf/Makefile
new file mode 100644
index 000000000..990c8c83c
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Linux Test Project
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CFLAGS			+= -D_GNU_SOURCE
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/bpf/bpf_map01.c b/testcases/kernel/syscalls/bpf/bpf_map01.c
new file mode 100644
index 000000000..81416b790
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_map01.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ *
+ * Trivial Extended Berkeley Packet Filter (eBPF) test.
+ *
+ * Sanity check creating and updating maps.
+ */
+
+#include <limits.h>
+#include <string.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/bpf.h"
+
+#define KEY_SZ 8
+#define VAL_SZ 1024
+
+struct map_type {
+	uint32_t id;
+	char *name;
+};
+
+static const struct map_type map_types[] = {
+	{BPF_MAP_TYPE_HASH, "hash"},
+	{BPF_MAP_TYPE_ARRAY, "array"}
+};
+
+static void *key;
+static void *val0;
+static void *val1;
+
+static void setup(void)
+{
+	key = SAFE_MALLOC(KEY_SZ);
+	memset(key, 0, (size_t) KEY_SZ);
+	val0 = SAFE_MALLOC(VAL_SZ);
+	val1 = SAFE_MALLOC(VAL_SZ);
+	memset(val1, 0, (size_t) VAL_SZ);
+}
+
+void run(unsigned int n)
+{
+	int fd, i;
+	union bpf_attr attr;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_type = map_types[n].id;
+	attr.key_size = n == 0 ? KEY_SZ : 4;
+	attr.value_size = VAL_SZ;
+	attr.max_entries = 1;
+
+	if ((fd = bpf(BPF_MAP_CREATE, &attr, sizeof(attr))) == -1) {
+		tst_brk(TFAIL | TERRNO, "Failed to create %s map",
+			map_types[n].name);
+	} else {
+		tst_res(TPASS, "Created %s map", map_types[n].name);
+	}
+
+	if (n == 0)
+		memcpy(key, "12345678", KEY_SZ);
+	else
+		memset(key, 0, 4);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_fd = fd;
+	attr.key = ptr_to_u64(key);
+	attr.value = ptr_to_u64(val1);
+
+	TEST(bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr)));
+	if (n == 0) {
+		if (TST_RET != -1 || TST_ERR != ENOENT) {
+			tst_res(TFAIL | TTERRNO,
+				"Empty hash map lookup should fail with ENOENT");
+		} else {
+			tst_res(TPASS | TTERRNO, "Empty hash map lookup");
+		}
+	} else if (TST_RET != -1) {
+		for (i = 0;;) {
+			if (*(char *) val1 != 0) {
+				tst_res(TFAIL,
+					"Preallocated array map val not zero");
+			} else if (++i >= VAL_SZ) {
+				tst_res(TPASS,
+					"Preallocated array map lookup");
+				break;
+			}
+		}
+	} else {
+		tst_res(TFAIL | TERRNO, "Prellocated array map lookup");
+	}
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_fd = fd;
+	attr.key = ptr_to_u64(key);
+	attr.value = ptr_to_u64(val0);
+	attr.flags = BPF_ANY;
+
+	TEST(bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr)));
+	if (TST_RET == -1) {
+		tst_brk(TFAIL | TTERRNO,
+			"Update %s map element",
+			map_types[n].name);
+	} else {
+		tst_res(TPASS,
+			"Update %s map element",
+			map_types[n].name);
+	}
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_fd = fd;
+	attr.key = ptr_to_u64(key);
+	attr.value = ptr_to_u64(val1);
+
+	TEST(bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"%s map lookup missing",
+			map_types[n].name);
+	} else if (memcmp(val0, val1, (size_t) VAL_SZ)) {
+		tst_res(TFAIL,
+			"%s map lookup returned different value",
+			map_types[n].name);
+	} else {
+		tst_res(TPASS, "%s map lookup", map_types[n].name);
+	}
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.tcnt = 2,
+	.needs_root = 1,
+	.setup = setup,
+	.test = run,
+	.min_kver = "3.18",
+};
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
