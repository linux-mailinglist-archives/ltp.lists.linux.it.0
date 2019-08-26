Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A35259CDD2
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:11:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 526D33C1D82
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 13:11:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CCBD63C1CFE
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:10:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67FD9200C3C
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 13:10:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50F70AF8D
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:10:26 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 13:10:22 +0200
Message-Id: <20190826111024.19053-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826111024.19053-1-chrubis@suse.cz>
References: <20190826111024.19053-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/4] BPF: Sanity check creating and updating maps
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

From: Richard Palethorpe <rpalethorpe@suse.com>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bpf/.gitignore  |   1 +
 testcases/kernel/syscalls/bpf/Makefile    |  10 ++
 testcases/kernel/syscalls/bpf/bpf_map01.c | 158 ++++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bpf/.gitignore
 create mode 100644 testcases/kernel/syscalls/bpf/Makefile
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_map01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index c41ba2a0d..6ddfc2178 100644
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
index 000000000..597a98417
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_map01.c
@@ -0,0 +1,158 @@
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
+#define VAL_SZ 1024
+
+static void *key4;
+static void *key8;
+static char *val_set;
+static char *val_get;
+static union bpf_attr *attr;
+
+struct map_type {
+	uint32_t id;
+	char *name;
+	int key_size;
+	void **key;
+};
+
+static const struct map_type map_types[] = {
+	{BPF_MAP_TYPE_HASH, "hash", 8, &key8},
+	{BPF_MAP_TYPE_ARRAY, "array", 4, &key4}
+};
+
+void run(unsigned int n)
+{
+	int fd, i;
+	void *key = *map_types[n].key;
+
+	memset(attr, 0, sizeof(*attr));
+	attr->map_type = map_types[n].id;
+	attr->key_size = map_types[n].key_size;
+	attr->value_size = VAL_SZ;
+	attr->max_entries = 1;
+
+	TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));
+	if (TST_RET == -1) {
+		if (TST_ERR == EPERM) {
+			tst_brk(TCONF | TTERRNO,
+				"bpf() requires CAP_SYS_ADMIN on this system");
+		} else {
+			tst_res(TFAIL | TTERRNO, "Failed to create %s map",
+				map_types[n].name);
+			return;
+		}
+	}
+	tst_res(TPASS, "Created %s map", map_types[n].name);
+	fd = TST_RET;
+
+	memset(attr, 0, sizeof(*attr));
+	attr->map_fd = fd;
+	attr->key = ptr_to_u64(key);
+	attr->value = ptr_to_u64(val_get);
+
+	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
+
+	switch (n) {
+	case 0:
+		if (TST_RET != -1 || TST_ERR != ENOENT) {
+			tst_res(TFAIL | TTERRNO,
+				"Empty hash map lookup should fail with ENOENT");
+		} else {
+			tst_res(TPASS | TTERRNO, "Empty hash map lookup");
+		}
+	break;
+	case 1:
+		if (TST_RET != -1) {
+			for (i = 0;;) {
+				if (val_get[i] != 0) {
+					tst_res(TFAIL,
+						"Preallocated array map val not zero");
+				} else if (++i >= VAL_SZ) {
+					tst_res(TPASS,
+						"Preallocated array map lookup");
+					break;
+				}
+			}
+		} else {
+			tst_res(TFAIL | TERRNO, "Prellocated array map lookup");
+		}
+	break;
+	}
+
+	memset(attr, 0, sizeof(*attr));
+	attr->map_fd = fd;
+	attr->key = ptr_to_u64(key);
+	attr->value = ptr_to_u64(val_set);
+	attr->flags = BPF_ANY;
+
+	TEST(bpf(BPF_MAP_UPDATE_ELEM, attr, sizeof(*attr)));
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
+	memset(attr, 0, sizeof(*attr));
+	attr->map_fd = fd;
+	attr->key = ptr_to_u64(key);
+	attr->value = ptr_to_u64(val_get);
+
+	TEST(bpf(BPF_MAP_LOOKUP_ELEM, attr, sizeof(*attr)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"%s map lookup missing",
+			map_types[n].name);
+	} else if (memcmp(val_set, val_get, (size_t) VAL_SZ)) {
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
+static void setup(void)
+{
+	unsigned int i;
+
+	memcpy(key8, "12345678", 8);
+	memset(key4, 0, 4);
+
+	for (i = 0; i < VAL_SZ; i++)
+		val_set[i] = i % 256;
+}
+
+static struct tst_test test = {
+	.tcnt = 2,
+	.test = run,
+	.setup = setup,
+	.min_kver = "3.18",
+	.bufs = (struct tst_buffers []) {
+		{&key4, .size = 4},
+		{&key8, .size = 8},
+		{&val_set, .size = VAL_SZ},
+		{&val_get, .size = VAL_SZ},
+		{&attr, .size = sizeof(*attr)},
+		{},
+	},
+};
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
