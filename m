Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8C36ECFB
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:06:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA7A33C6197
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:06:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04A963C0F91
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 634CE600F9E
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619708720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhZJi++bWayhepsvhcXeqkbevmHdB3QNfFwUrEiO3go=;
 b=c1LS/zRUcK2SLc/mfz3Oz+EgZycwt/9/QY4fijm8w1xa3/dUqJNLVm6hfh9pT2Wf463rqS
 7bN+I58L5eE/ZDq1927jfaCPnr0uVHVOPChc4tkGbs1ogKDcxCEmKHazNp6YFih5XyY03+
 vC61U/0idhdyMbCDVMGVfeELOrHP8KI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C492B16E;
 Thu, 29 Apr 2021 15:05:20 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 29 Apr 2021 16:05:10 +0100
Message-Id: <20210429150510.21585-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429150510.21585-1-rpalethorpe@suse.com>
References: <20210429150510.21585-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/5] bpf: Check truncation on 32bit div/mod by zero
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

Add a test which checks for a number of issues surrounding division by
zero.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/cve                                |   1 +
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/bpf/.gitignore   |   1 +
 testcases/kernel/syscalls/bpf/bpf_prog05.c | 175 +++++++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog05.c

diff --git a/runtest/cve b/runtest/cve
index f650854f9..3beb88bb0 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -61,3 +61,4 @@ cve-2020-11494 pty04
 cve-2020-14386 sendto03
 cve-2020-14416 pty03
 cve-2020-29373 io_uring02
+cve-2021-3444 bpf_prog05
diff --git a/runtest/syscalls b/runtest/syscalls
index 546a988c2..60c0a7a99 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -42,6 +42,7 @@ bpf_prog01 bpf_prog01
 bpf_prog02 bpf_prog02
 bpf_prog03 bpf_prog03
 bpf_prog04 bpf_prog04
+bpf_prog05 bpf_prog05
 
 brk01 brk01
 brk02 brk02
diff --git a/testcases/kernel/syscalls/bpf/.gitignore b/testcases/kernel/syscalls/bpf/.gitignore
index 74742c0cd..42365cef5 100644
--- a/testcases/kernel/syscalls/bpf/.gitignore
+++ b/testcases/kernel/syscalls/bpf/.gitignore
@@ -3,3 +3,4 @@ bpf_prog01
 bpf_prog02
 bpf_prog03
 bpf_prog04
+bpf_prog05
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog05.c b/testcases/kernel/syscalls/bpf/bpf_prog05.c
new file mode 100644
index 000000000..ccaa2cbe1
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_prog05.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Compare the effects of 32-bit div/mod by zero with the "expected"
+ * behaviour.
+ *
+ * The commit "bpf: fix subprog verifier bypass by div/mod by 0
+ * exception", changed div/mod by zero from exiting the current
+ * program to setting the destination register to zero (div) or
+ * leaving it untouched (mod).
+ *
+ * This solved one verfier bug which allowed dodgy pointer values, but
+ * it turned out that the source register was being 32-bit truncated
+ * when it should not be. Also the destination register for mod was
+ * not being truncated when it should be.
+ *
+ * So then we have the following two fixes:
+ * "bpf: Fix 32 bit src register truncation on div/mod"
+ * "bpf: Fix truncation handling for mod32 dst reg wrt zero"
+ *
+ * Testing for all of these issues is a problem. Not least because
+ * division by zero is undefined, so in theory any result is
+ * acceptable so long as the verifier and runtime behaviour
+ * match.
+ *
+ * However to keep things simple we just check if the source and
+ * destination register runtime values match the current upstream
+ * behaviour at the time of writing.
+ *
+ * If the test fails you may have one or more of the above patches
+ * missing. In this case it is possible that you are not vulnerable
+ * depending on what other backports and fixes have been applied. If
+ * upstream changes the behaviour of division by zero, then the test
+ * will need updating.
+ *
+ * Note that we use r6 as the src register and r7 as the dst. w6 and
+ * w7 are the same registers treated as 32bit.
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include "config.h"
+#include "tst_test.h"
+#include "tst_taint.h"
+#include "tst_capability.h"
+#include "lapi/socket.h"
+#include "lapi/bpf.h"
+#include "bpf_common.h"
+
+#define BUFSIZE 8192
+
+static const char MSG[] = "Ahoj!";
+static char *msg;
+
+static int map_fd;
+static uint32_t *key;
+static uint64_t *val;
+static char *log;
+static union bpf_attr *attr;
+
+static int load_prog(void)
+{
+	struct bpf_insn_buf prog_insn = { 0 };
+        /* r6 = 1 << 32
+	 * r7 = -1
+	 */
+	const struct bpf_insn set_src_dst_insn[] = {
+		BPF_LD_IMM64(BPF_REG_6, 1ULL << 32),
+		BPF_MOV64_IMM(BPF_REG_7, -1LL),
+	};
+	/* w7 /= w6 */
+	const struct bpf_insn div_insn =
+		BPF_ALU32_REG(BPF_DIV, BPF_REG_7, BPF_REG_6);
+	/* w7 %= w6 */
+	const struct bpf_insn mod_insn =
+		BPF_ALU32_REG(BPF_MOD, BPF_REG_7, BPF_REG_6);
+	/* exit(0) */
+	const struct bpf_insn exit_insn[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN()
+	};
+
+	bpf_insn_buf_cat(&prog_insn, set_src_dst_insn, sizeof(set_src_dst_insn));
+	bpf_insn_buf_cat(&prog_insn, &div_insn, sizeof(div_insn));
+
+	bpf_insn_buf_array_set(&prog_insn, map_fd, 0, BPF_REG_6);
+	bpf_insn_buf_array_set(&prog_insn, map_fd, 1, BPF_REG_7);
+
+	bpf_insn_buf_cat(&prog_insn, set_src_dst_insn, sizeof(set_src_dst_insn));
+	bpf_insn_buf_cat(&prog_insn, &mod_insn, sizeof(mod_insn));
+
+	bpf_insn_buf_array_set(&prog_insn, map_fd, 2, BPF_REG_6);
+	bpf_insn_buf_array_set(&prog_insn, map_fd, 3, BPF_REG_7);
+
+	bpf_insn_buf_cat(&prog_insn, exit_insn, sizeof(exit_insn));
+
+        bpf_init_prog_attr(attr, prog_insn.insn, prog_insn.byte_len, log, BUFSIZE);
+
+	return bpf_load_prog(attr, log);
+}
+
+static void expect_reg_val(const char *const reg_name,
+			   const uint64_t expected_val)
+{
+        bpf_map_array_get(map_fd, key, val);
+        (*key)++;
+
+        if (*val != expected_val) {
+		tst_res(TFAIL,
+			"%s = %"PRIu64", but should be %"PRIu64,
+			reg_name, *val, expected_val);
+	} else {
+		tst_res(TPASS, "%s = %"PRIu64, reg_name, *val);
+	}
+}
+
+static void setup(void)
+{
+	rlimit_bump_memlock();
+	memcpy(msg, MSG, sizeof(MSG));
+}
+
+static void run(void)
+{
+	int prog_fd;
+
+	map_fd = bpf_map_array_create(4);
+	prog_fd = load_prog();
+	bpf_run_prog(prog_fd, msg, sizeof(MSG));
+	SAFE_CLOSE(prog_fd);
+
+	tst_res(TINFO, "Check w7(-1) /= w6(0) [r7 = -1, r6 = 1 << 32]");
+	expect_reg_val("src(r6)", 1UL << 32);
+	expect_reg_val("dst(r7)", 0);
+
+	tst_res(TINFO, "Check w7(-1) %%= w6(0) [r7 = -1, r6 = 1 << 32]");
+	expect_reg_val("src(r6)", 1UL << 32);
+	expect_reg_val("dst(r7)", (uint32_t)-1);
+
+	SAFE_CLOSE(map_fd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.min_kver = "3.18",
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		{}
+	},
+	.bufs = (struct tst_buffers []) {
+		{&key, .size = sizeof(*key)},
+		{&val, .size = sizeof(*val)},
+		{&log, .size = BUFSIZE},
+		{&attr, .size = sizeof(*attr)},
+		{&msg, .size = sizeof(MSG)},
+		{}
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "f6b1b3bf0d5f"},
+		{"linux-git", "468f6eafa6c4"},
+		{"linux-git", "e88b2c6e5a4d"},
+		{"linux-git", "9b00f1b78809"},
+		{"CVE", "CVE-2021-3444"},
+		{}
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
