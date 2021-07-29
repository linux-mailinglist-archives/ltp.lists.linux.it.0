Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E53D9E27
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:14:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 256233C8F7E
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:14:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC7153C62F5
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:14:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 26A5A600961
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:13:59 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 28BAD2000D;
 Thu, 29 Jul 2021 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627542839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZTeHwtrmvzZvK6ehRvYeyqZCYkZr1X8vUOF4nksDBk=;
 b=dUaAxyFalt50AB577IeCPM1K03Ip4ct1fIwYxleV0joi2iEpd8IF9robP4QWAkgtC7j+7y
 waVkaS6Txgi4auWahfU0CmVW+EJf0EEgl+mZ1lyIUZmzXuqgbbOb4jTGdvDhGoCVeS0ymQ
 DGes6+WKLYpp1TLZOrhIBRmYAsjtf2w=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id EDE63A3B81;
 Thu, 29 Jul 2021 07:13:58 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 29 Jul 2021 08:13:48 +0100
Message-Id: <20210729071348.8911-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YQALVdEAGOVa+g4H@yuki>
References: <YQALVdEAGOVa+g4H@yuki>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add set_mempolicy05, CVE-2017-7616
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
* Explicitly include libs for tests except 05

 runtest/cve                                   |   1 +
 runtest/numa                                  |   1 +
 .../kernel/syscalls/set_mempolicy/.gitignore  |   1 +
 .../kernel/syscalls/set_mempolicy/Makefile    |   6 +-
 .../syscalls/set_mempolicy/set_mempolicy05.c  | 128 ++++++++++++++++++
 5 files changed, 135 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c

diff --git a/runtest/cve b/runtest/cve
index 226b5ea44..96cc98f20 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -22,6 +22,7 @@ cve-2017-2671 cve-2017-2671
 cve-2017-6951 request_key05
 cve-2017-7308 setsockopt02
 cve-2017-7472 keyctl04
+cve-2017-7616 set_mempolicy05
 cve-2017-10661 timerfd_settime02
 cve-2017-12192 keyctl07
 cve-2017-12193 add_key04
diff --git a/runtest/numa b/runtest/numa
index 7b9c2ae9d..3b9a9a7c5 100644
--- a/runtest/numa
+++ b/runtest/numa
@@ -20,3 +20,4 @@ set_mempolicy01 set_mempolicy01
 set_mempolicy02 set_mempolicy02
 set_mempolicy03 set_mempolicy03
 set_mempolicy04 set_mempolicy04
+set_mempolicy05 set_mempolicy05
diff --git a/testcases/kernel/syscalls/set_mempolicy/.gitignore b/testcases/kernel/syscalls/set_mempolicy/.gitignore
index 52ae73b52..4c121d2e0 100644
--- a/testcases/kernel/syscalls/set_mempolicy/.gitignore
+++ b/testcases/kernel/syscalls/set_mempolicy/.gitignore
@@ -2,3 +2,4 @@
 /set_mempolicy02
 /set_mempolicy03
 /set_mempolicy04
+/set_mempolicy05
diff --git a/testcases/kernel/syscalls/set_mempolicy/Makefile b/testcases/kernel/syscalls/set_mempolicy/Makefile
index e6e699808..100780dc3 100644
--- a/testcases/kernel/syscalls/set_mempolicy/Makefile
+++ b/testcases/kernel/syscalls/set_mempolicy/Makefile
@@ -5,7 +5,9 @@ LTPLIBS = ltpnuma
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += $(NUMA_LIBS)
-LTPLDLIBS = -lltpnuma
+NEEDS_LIBS = set_mempolicy01 set_mempolicy02 set_mempolicy03 set_mempolicy04
+
+$(NEEDS_LIBS): LDLIBS  += $(NUMA_LIBS)
+$(NEEDS_LIBS): LTPLDLIBS = -lltpnuma
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c
new file mode 100644
index 000000000..86f6a95dc
--- /dev/null
+++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+/*\
+ *
+ * [Description]
+ *
+ * This will reproduce an information leak in the set_mempolicy 32-bit
+ * compat syscall. The catch is that the 32-bit compat syscall is not
+ * used in x86_64 upstream. So at the time of writing, 32-bit programs
+ * on large x86_64 numa systems will be broken if they use
+ * set_mempolicy. OTOH they could not have been exploited either.
+ *
+ * On other architectures the compat syscall is connected. Including
+ * PowerPC which has also been included as well. It is possible some
+ * vendors connected the x86_64 compat call in their kernel branch.
+ *
+ * The kernel allocates memory from the user's stack as a temporary
+ * work area. Allowing it to copy the node array of 32-bit fields to
+ * 64-bit fields. It uses user memory so that it can share the
+ * non-compatability syscall functions which use copy_from_user()
+ * internally.
+ *
+ * Originally the compat call would copy a chunk of the
+ * uninitialized kernel stack to the user stack before checking the
+ * validation result. This meant when the user passed in an invalid
+ * node_mask_ptr. They would get kernel stack data somewhere below
+ * their stack pointer.
+ *
+ * So we allocate and set an array on the stack (larger than any
+ * redzone). Then move the stack pointer to the beginning of the
+ * array. Then move it back after the syscall. We can then check to
+ * see if the array has been modified.
+ */
+
+#include "config.h"
+#include "tst_test.h"
+
+#if defined(__i386__) || defined(__powerpc__)
+
+#include <string.h>
+
+static unsigned int i;
+static int sys_ret;
+#ifdef __i386__
+static const int sys_num = 276;
+static const int mode;
+static const int node_mask_ptr = UINT_MAX;
+static const int node_mask_sz = UINT_MAX;
+#endif
+static volatile char *stack_ptr;
+
+static void run(void)
+{
+#ifdef __powerpc__
+	register long sys_num __asm__("r0");
+	register long mode __asm__("r3");
+	register long node_mask_ptr __asm__("r4");
+	register long node_mask_sz __asm__("r5");
+#endif
+	char stack_pattern[0x400];
+
+	stack_ptr = stack_pattern;
+	memset(stack_pattern, 0xA5, sizeof(stack_pattern));
+	tst_res(TINFO, "stack pattern is in %p-%p", stack_ptr, stack_ptr + 0x400);
+
+#ifdef __powerpc__
+	sys_num = 261;
+	mode = 0;
+	node_mask_ptr = ~0UL;
+	node_mask_sz = ~0UL;
+	asm volatile (
+		"addi 1,1,1024\n\t"
+		"sc\n\t"
+		"addi 1,1,-1024\n\t" :
+		"+r"(sys_num), "+r"(mode), "+r"(node_mask_ptr), "+r"(node_mask_sz) :
+		:
+		"memory", "cr0", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
+	sys_ret = mode;
+#else /* __i386__ */
+	asm volatile (
+		"add $0x400, %%esp\n\t"
+		"int $0x80\n\t"
+		"sub $0x400, %%esp\n\t" :
+		"=a"(sys_ret) :
+		"a"(sys_num), "b"(mode), "c"(node_mask_ptr), "d"(node_mask_sz) :
+		"memory");
+	sys_ret = -sys_ret;
+#endif
+
+	for (i = 0; i < sizeof(stack_pattern); i++) {
+		if (stack_ptr[i] != (char)0xA5) {
+			tst_brk(TFAIL,
+				"User stack was overwritten with something at %d", i);
+		}
+	}
+
+	switch (sys_ret) {
+	case EFAULT:
+		tst_res(TPASS,
+			"set_mempolicy returned EFAULT (compat assumed)");
+		break;
+	case EINVAL:
+		tst_res(TCONF,
+			"set_mempolicy returned EINVAL (non compat assumed)");
+		break;
+	default:
+		tst_res(TFAIL,
+			"set_mempolicy should fail with EFAULT or EINVAL, instead returned %ld",
+			(long)sys_ret);
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "cf01fb9985e8"},
+		{"CVE", "CVE-2017-7616"},
+		{}
+	}
+};
+
+#else /* #if defined(__x86_64__) || defined(__powerpc__) */
+
+TST_TEST_TCONF("not i386 or powerpc");
+
+#endif /* #else #if defined(__x86_64__) || defined(__powerpc__) */
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
