Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE544ED88C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Mar 2022 13:33:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85C9F3C9F0A
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Mar 2022 13:33:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 125E53C14BC
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 13:33:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1E632600326
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 13:33:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F1DC1F869
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648726405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef4M1Grq09noEESS2dh9g/+r9/5KpJmLqg4xbQCr1fM=;
 b=AX83w1zeIRDJr12JxI4ob5BGuXUAYxxnRWU1VhwSP8DXPDjiA2UbVGb3vNY35M3OK7JMGC
 LZh+XD/KLuPrni/MVYm/k4zpznwesgUbpAJBZg/Dg9TK0hkPWEQ0xdnkZHmjyCDZfrwjQG
 5hZ128pzBMzuKH9keKvmj7u/AfG8vLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648726405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef4M1Grq09noEESS2dh9g/+r9/5KpJmLqg4xbQCr1fM=;
 b=QVRMe9/mBZeoLDfugdZvs2aAQ3VNZ4NC+rmJh6NHkm6tA6sCAIm7950MoFp+zlB2Hjq9uS
 xUSyYbIY7t5IJ/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FD9E13AF8
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 11:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDKSFoWRRWKCeQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 11:33:25 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 31 Mar 2022 13:33:24 +0200
Message-Id: <20220331113324.14742-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331113324.14742-1-mdoucha@suse.cz>
References: <20220331113324.14742-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] Add test for CVE 2021-38198
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

Changes since v1:
- Updated .save_restore metadata to the new structure
- Use tst_parse_int() instead of sscanf()

 runtest/kvm                            |   1 +
 testcases/kernel/kvm/.gitignore        |   1 +
 testcases/kernel/kvm/kvm_pagefault01.c | 234 +++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 runtest/kvm
 create mode 100644 testcases/kernel/kvm/.gitignore
 create mode 100644 testcases/kernel/kvm/kvm_pagefault01.c

diff --git a/runtest/kvm b/runtest/kvm
new file mode 100644
index 000000000..16e7c07ff
--- /dev/null
+++ b/runtest/kvm
@@ -0,0 +1 @@
+kvm_pagefault01 kvm_pagefault01
diff --git a/testcases/kernel/kvm/.gitignore b/testcases/kernel/kvm/.gitignore
new file mode 100644
index 000000000..349260359
--- /dev/null
+++ b/testcases/kernel/kvm/.gitignore
@@ -0,0 +1 @@
+/kvm_pagefault01
diff --git a/testcases/kernel/kvm/kvm_pagefault01.c b/testcases/kernel/kvm/kvm_pagefault01.c
new file mode 100644
index 000000000..e355fa448
--- /dev/null
+++ b/testcases/kernel/kvm/kvm_pagefault01.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 SUSE LLC
+ * Author: Nicolai Stange <nstange@suse.de>
+ * LTP port: Martin Doucha <mdoucha@suse.cz>
+ */
+
+/*\
+ * CVE 2021-38198
+ *
+ * Check that x86_64 KVM correctly enforces (lack of) write permissions
+ * in 4-level and 5-level memory page table mode. Missing page faults fixed in:
+ *
+ *  commit b1bd5cba3306691c771d558e94baa73e8b0b96b7
+ *  Author: Lai Jiangshan <laijs@linux.alibaba.com>
+ *  Date:   Thu Jun 3 13:24:55 2021 +0800
+ *
+ *  KVM: X86: MMU: Use the correct inherited permissions to get shadow page
+ */
+
+#include "kvm_test.h"
+
+#ifdef COMPILE_PAYLOAD
+#ifdef __x86_64__
+
+#include "kvm_x86.h"
+
+#define PTE_BITMASK 0x1ff
+#define PAGESIZE 0x1000
+
+int handle_page_fault(void *userdata, struct kvm_interrupt_frame *ifrm,
+	unsigned long errcode)
+{
+	struct kvm_cregs buf;
+
+	kvm_read_cregs(&buf);
+
+	/* Check that the page fault was caused by write to *readonly below */
+	if (buf.cr2 == (uintptr_t)userdata) {
+		tst_res(TPASS, "KVM enforces memory write permissions");
+		kvm_exit();
+	}
+
+	/* Unexpected page fault, fall back to default handler */
+	return 0;
+}
+
+void main(void)
+{
+	uintptr_t tmp;
+	struct page_table_entry_pae *subpte, *pte = kvm_pagetable;
+	int val, *writable, *readonly, *cacher1, *cacher2;
+
+	if (!(kvm_rdmsr(MSR_EFER) & EFER_LMA))
+		tst_brk(TBROK, "Bootstrap did not enable 64bit paging");
+
+	/*
+	 * Find the first page table entry which branches. This entry was
+	 * configured by bootstrap as follows:
+	 * 0x00000000 - 0x3fffffff in pte[0] (identity mapped)
+	 * 0x40000000 - 0x7fffffff in pte[1] (identity mapped)
+	 * 0x80000000 - 0xbfffffff in pte[2] (unmapped)
+	 * 0xc0000000 - 0xffffffff in pte[3] (only last page identity mapped)
+	 */
+	while (!pte[1].present) {
+		tmp = kvm_get_page_address_pae(pte);
+		pte = (struct page_table_entry_pae *)tmp;
+	}
+
+	/*
+	 * Setup mapping above the 32bit address space. The test needs two
+	 * different unused 1GB chunks of address space. Remapping part of
+	 * the lower 4GB address space would make it harder to reproduce
+	 * the bug because any memory access in the same 1GB chunk (even
+	 * fetching instructions by the CPU) could evict entries from page
+	 * table cache and force the bypassable write permission check
+	 * to happen even on buggy kernels.
+	 *
+	 * Allocate 3 pages for page table + 2 pages for data
+	 */
+	writable = tst_heap_alloc_aligned(5 * PAGESIZE, PAGESIZE);
+	memset(writable, 0, 5 * PAGESIZE);
+	tmp = (uintptr_t)writable;
+	pte[4].address = tmp >> 12;
+	pte[4].user_access = 1;
+	pte[4].writable = 1;
+	pte[4].present = 1;
+	pte[5] = pte[4];
+	pte[5].writable = 0;
+
+	subpte = (struct page_table_entry_pae *)tmp;
+	subpte[0].address = (tmp + PAGESIZE) >> 12;
+	subpte[0].user_access = 1;
+	subpte[0].writable = 0;
+	subpte[0].present = 1;
+	subpte[1].address = (tmp + 2 * PAGESIZE) >> 12;
+	subpte[1].user_access = 1;
+	subpte[1].writable = 1;
+	subpte[1].present = 1;
+
+	subpte = (struct page_table_entry_pae *)(tmp + PAGESIZE);
+	subpte[0].address = (tmp + 3 * PAGESIZE) >> 12;
+	subpte[0].user_access = 1;
+	subpte[0].writable = 1;
+	subpte[0].present = 1;
+
+	subpte = (struct page_table_entry_pae *)(tmp + 2 * PAGESIZE);
+	subpte[0].address = (tmp + 4 * PAGESIZE) >> 12;
+	subpte[0].user_access = 1;
+	subpte[0].writable = 1;
+	subpte[0].present = 1;
+
+	/* Create pointers into the new mapping */
+	cacher1 = (int *)0x100000000ULL;
+	writable = (int *)0x100200000ULL;
+	cacher2 = (int *)0x140000000ULL;
+	readonly = (int *)0x140200000ULL;
+	tst_set_interrupt_callback(INTR_PAGE_FAULT, handle_page_fault,
+		readonly);
+
+	/* Fill page table cache */
+	val = *cacher1;
+	*writable = val;
+	val = *cacher2;
+
+	/* Trigger page fault (unless the kernel is vulnerable) */
+	*readonly = val;
+
+	/* This line should be unreachable */
+	tst_res(TFAIL, "Write to read-only address did not page fault");
+}
+
+#else /* __x86_64__ */
+TST_TEST_TCONF("Test supported only on x86_64");
+#endif /* __x86_64__ */
+
+#else /* COMPILE_PAYLOAD */
+
+#include <ctype.h>
+#include <stdio.h>
+#include <unistd.h>
+#include "tst_module.h"
+
+#define TDP_MMU_SYSFILE "/sys/module/kvm/parameters/tdp_mmu"
+#define TDP_AMD_SYSFILE "/sys/module/kvm_amd/parameters/npt"
+#define TDP_INTEL_SYSFILE "/sys/module/kvm_intel/parameters/ept"
+
+#define BUF_SIZE 64
+
+static int read_bool_sys_param(const char *filename)
+{
+	char buf[BUF_SIZE];
+	int i, fd, ret;
+
+	fd = open(filename, O_RDONLY);
+
+	if (fd < 0)
+		return -1;
+
+	ret = read(fd, buf, BUF_SIZE - 1);
+	SAFE_CLOSE(fd);
+
+	if (ret < 1)
+		return -1;
+
+	buf[ret] = '\0';
+
+	for (i = 0; buf[i] && !isspace(buf[i]); i++)
+		;
+
+	buf[i] = '\0';
+
+	if (isdigit(buf[0])) {
+		tst_parse_int(buf, &ret, INT_MIN, INT_MAX);
+		return ret;
+	}
+
+	if (!strcasecmp(buf, "N"))
+		return 0;
+
+	/* Assume that any other value than 0 or N means the param is enabled */
+	return 1;
+}
+
+static void reload_module(const char *module, char *arg)
+{
+	const char *const argv[] = {"modprobe", module, arg, NULL};
+
+	tst_res(TINFO, "Reloading module %s with parameter %s", module, arg);
+	tst_module_unload(module);
+	tst_cmd(argv, NULL, NULL, 0);
+}
+
+static void disable_tdp(void)
+{
+	if (!access(TDP_MMU_SYSFILE, F_OK)) {
+		/* FIXME: Is setting tdp_mmu=0 sufficient to disable TDP? */
+		return;
+	}
+
+	if (read_bool_sys_param(TDP_AMD_SYSFILE) > 0)
+		reload_module("kvm_amd", "npt=0");
+
+	if (read_bool_sys_param(TDP_INTEL_SYSFILE) > 0)
+		reload_module("kvm_intel", "ept=0");
+}
+
+static void setup(void)
+{
+	disable_tdp();
+	tst_kvm_setup();
+}
+
+static struct tst_test test = {
+	.test_all = tst_kvm_run,
+	.setup = setup,
+	.cleanup = tst_kvm_cleanup,
+	.needs_root = 1,
+	.save_restore = (const struct tst_path_val[]) {
+		{"?/sys/module/kvm/parameters/tdp_mmu", "0"},
+		{}
+	},
+	.supported_archs = (const char *const []) {
+		"x86_64",
+		NULL
+	},
+	.tags = (struct tst_tag[]){
+		{"linux-git", "b1bd5cba3306"},
+		{"CVE", "2021-38198"},
+		{}
+	}
+};
+
+#endif /* COMPILE_PAYLOAD */
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
