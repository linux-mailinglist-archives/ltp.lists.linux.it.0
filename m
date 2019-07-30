Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C627A9F6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 15:45:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FFBC3C1D79
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 15:45:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F245B3C1C70
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 15:45:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 18925201173
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 15:45:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54F04AF41
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 13:45:31 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 30 Jul 2019 15:44:57 +0200
Message-Id: <20190730134457.27845-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190730134457.27845-1-rpalethorpe@suse.com>
References: <20190724080328.16145-1-rpalethorpe@suse.com>
 <20190730134457.27845-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] BPF: Sanity check creating a program
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
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/bpf/.gitignore   |   1 +
 testcases/kernel/syscalls/bpf/bpf_prog01.c | 138 +++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 46880ee1d..678a601d3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -33,6 +33,7 @@ bind02 bind02
 bind03 bind03
 
 bpf_map01 bpf_map01
+bpf_prog01 bpf_prog01
 
 brk01 brk01
 
diff --git a/testcases/kernel/syscalls/bpf/.gitignore b/testcases/kernel/syscalls/bpf/.gitignore
index f33532484..7eb5f7c92 100644
--- a/testcases/kernel/syscalls/bpf/.gitignore
+++ b/testcases/kernel/syscalls/bpf/.gitignore
@@ -1 +1,2 @@
 bpf_map01
+bpf_prog01
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog01.c b/testcases/kernel/syscalls/bpf/bpf_prog01.c
new file mode 100644
index 000000000..faccd2219
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_prog01.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ *
+ * Trivial Extended Berkeley Packet Filter (eBPF) test.
+ *
+ * Sanity check loading and running bytecode.
+ *
+ * Test flow:
+ * 1. Create array map
+ * 2. Load eBPF program
+ * 3. Attach program to socket
+ * 4. Send packet on socket
+ * 5. This should trigger eBPF program which writes to array map
+ * 6. Verify array map was written to
+ */
+
+#include <limits.h>
+#include <string.h>
+#include <stdio.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/socket.h"
+#include "lapi/bpf.h"
+
+static int map_fd, prog_fd;
+static int sk[2];
+
+/*
+ * r0 - r10 = registers 0 to 10
+ * r0 = return code
+ * fp/r10 = stack frame pointer
+ */
+int load_prog(int fd)
+{
+	char log_buf[BUFSIZ] = { 0 };
+	struct bpf_insn prog[] = {
+		/* Load the map FD into r1*/
+		BPF_LD_MAP_FD(BPF_REG_1, fd),
+		/* Put (key = 0) on stack and key ptr into r2 */
+		BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),   /* r2 = fp */
+		BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -8),  /* r2 = r2 - 8 */
+		BPF_ST_MEM(BPF_DW, BPF_REG_2, 0, 0),    /* *r2 = 0 */
+		/* r0 = bpf_map_lookup_elem(r1, r2) */
+		BPF_EMIT_CALL(BPF_FUNC_map_lookup_elem),
+		/* if r0 == 0 goto exit */
+		BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 3),
+		/* Set map[0] = 1 */
+		BPF_MOV64_REG(BPF_REG_1, BPF_REG_0),     /* r1 = r0 */
+		BPF_ST_MEM(BPF_DW, BPF_REG_1, 0, 1),     /* *r1 = 1 */
+		BPF_MOV64_IMM(BPF_REG_0, 0),             /* r0 = 0 */
+		BPF_EXIT_INSN(),		         /* return r0 */
+	};
+	union bpf_attr attr = { 0 };
+
+	attr.prog_type = BPF_PROG_TYPE_SOCKET_FILTER;
+	attr.insns = ptr_to_u64(prog);
+	attr.insn_cnt = ARRAY_SIZE(prog);
+	attr.license = ptr_to_u64("GPL");
+	attr.log_buf = ptr_to_u64(log_buf);
+	attr.log_size = sizeof(log_buf);
+	attr.log_level = 1;
+
+	TEST(bpf(BPF_PROG_LOAD, &attr, sizeof(attr)));
+	if (TST_RET == -1) {
+		if (log_buf[0] != 0) {
+			tst_brk(TFAIL | TTERRNO,
+				"Failed verification: %s",
+				log_buf);
+		} else {
+			tst_brk(TFAIL | TTERRNO, "Failed to load program");
+		}
+	} else {
+		tst_res(TPASS, "Loaded program");
+	}
+
+	return TST_RET;
+}
+
+void run(void)
+{
+	uint32_t key = 0;
+	uint64_t val;
+	char buf[5];
+	union bpf_attr attr;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_type = BPF_MAP_TYPE_ARRAY;
+	attr.key_size = 4;
+	attr.value_size = 8;
+	attr.max_entries = 1;
+
+	TEST(bpf(BPF_MAP_CREATE, &attr, sizeof(attr)));
+	if (TST_RET == -1) {
+		if (TST_ERR == EPERM) {
+			tst_brk(TCONF | TTERRNO,
+				"bpf() requires CAP_SYS_ADMIN on this system");
+		} else {
+			tst_brk(TBROK | TTERRNO, "Failed to create array map");
+		}
+	}
+	map_fd = TST_RET;
+
+	prog_fd = load_prog(map_fd);
+
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
+	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
+			&prog_fd, sizeof(prog_fd));
+
+	SAFE_WRITE(1, sk[0], "Ahoj!", sizeof(buf));
+
+	memset(&attr, 0, sizeof(attr));
+	attr.map_fd = map_fd;
+	attr.key = ptr_to_u64(&key);
+	attr.value = ptr_to_u64(&val);
+
+	TEST(bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "array map lookup");
+	} else if (val != 1) {
+		tst_res(TFAIL,
+			"val = %lu, but should be val = 1",
+			val);
+        } else {
+	        tst_res(TPASS, "val = 1");
+	}
+
+	SAFE_CLOSE(prog_fd);
+	SAFE_CLOSE(map_fd);
+	SAFE_CLOSE(sk[0]);
+	SAFE_CLOSE(sk[1]);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.min_kver = "3.18",
+};
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
