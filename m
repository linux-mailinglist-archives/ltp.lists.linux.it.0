Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF05F64D7
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 13:08:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D49A3CAC3A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 13:08:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3C4B3CABDE
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 13:07:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C5C0A6010DE
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 13:07:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C3461F8BD;
 Thu,  6 Oct 2022 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665054476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xp1J/uz2ZZufYPcXklVg6srvxjTe2vcDp72mlhWy32s=;
 b=Yv1kouFEpFxUp0QmJgUiDLH9DD9GXWDxZqycZBsLg4QYUoYM9XsC53P3ley9OwHcPEEm42
 GgDTM2Dd3yz4Y89/WVOEw6OXVMWJX6SOYwfI+XsBFATclStvQ0rGzKQzKNTMdw9FALfZPj
 TIvuKzDRHhGJjZXhtSgc2xZEGoFeSKE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 019D31376E;
 Thu,  6 Oct 2022 11:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SEIOOgu3PmNmBQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Thu, 06 Oct 2022 11:07:55 +0000
To: ltp@lists.linux.it
Date: Thu,  6 Oct 2022 13:06:39 +0200
Message-Id: <20221006110642.12410-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221006110642.12410-1-andrea.cervesato@suse.com>
References: <20221006110642.12410-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/3] Add process_madvise01 test
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test for checking MADV_COLD support in process_madvise syscall.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/cma/.gitignore      |   1 +
 testcases/kernel/syscalls/cma/cma.h           | 101 ++++++++++++
 .../kernel/syscalls/cma/process_madvise01.c   | 153 ++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 testcases/kernel/syscalls/cma/cma.h
 create mode 100644 testcases/kernel/syscalls/cma/process_madvise01.c

diff --git a/testcases/kernel/syscalls/cma/.gitignore b/testcases/kernel/syscalls/cma/.gitignore
index 1ee39d93e..846704294 100644
--- a/testcases/kernel/syscalls/cma/.gitignore
+++ b/testcases/kernel/syscalls/cma/.gitignore
@@ -2,3 +2,4 @@
 /process_vm_readv02
 /process_vm_readv03
 /process_vm_writev02
+/process_madvise01
diff --git a/testcases/kernel/syscalls/cma/cma.h b/testcases/kernel/syscalls/cma/cma.h
new file mode 100644
index 000000000..08a0d9319
--- /dev/null
+++ b/testcases/kernel/syscalls/cma/cma.h
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef CMA_H__
+#define CMA_H__
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include "tst_safe_stdio.h"
+
+struct addr_mapping {
+	int size;
+	int rss;
+	int pss;
+	int shared_clean;
+	int shared_dirty;
+	int private_clean;
+	int private_dirty;
+	int referenced;
+	int anonymous;
+	int anon_huge_pages;
+	int shmem_huge_pages;
+	int shmem_pmd_mapped;
+	int swap;
+	int kernel_page_size;
+	int mmu_page_size;
+	int locked;
+	int protection_key;
+};
+
+static inline void read_address_mapping(unsigned long address, struct addr_mapping *mapping)
+{
+	FILE *f;
+	int found = 0;
+	char label[BUFSIZ];
+	char line[BUFSIZ];
+	char smaps[BUFSIZ];
+	char ptr_str[BUFSIZ];
+	int value;
+
+	snprintf(smaps, BUFSIZ, "/proc/%i/smaps", getpid());
+	snprintf(ptr_str, BUFSIZ, "%lx", address);
+
+	f = SAFE_FOPEN(smaps, "r");
+
+	while (fgets(line, BUFSIZ, f) != NULL) {
+		if (strncmp(ptr_str, line, strlen(ptr_str)) == 0)
+			found = 1;
+
+		if (!found)
+			continue;
+
+		if (found && strcmp(line, "VmFlags") >= 0)
+			break;
+
+		if (sscanf(line, "%31[^:]: %d", label, &value) > 0) {
+			if (strcmp(label, "Size") == 0)
+				mapping->size = value;
+			else if (strcmp(label, "Rss") == 0)
+				mapping->rss = value;
+			else if (strcmp(label, "Pss") == 0)
+				mapping->pss = value;
+			else if (strcmp(label, "Shared_Clean") == 0)
+				mapping->shared_clean = value;
+			else if (strcmp(label, "Shared_Dirty") == 0)
+				mapping->shared_dirty = value;
+			else if (strcmp(label, "Private_Clean") == 0)
+				mapping->private_clean = value;
+			else if (strcmp(label, "Private_Dirty") == 0)
+				mapping->private_dirty = value;
+			else if (strcmp(label, "Referenced") == 0)
+				mapping->referenced = value;
+			else if (strcmp(label, "Anonymous") == 0)
+				mapping->anonymous = value;
+			else if (strcmp(label, "AnonHugePages") == 0)
+				mapping->anon_huge_pages = value;
+			else if (strcmp(label, "ShmemHugePages") == 0)
+				mapping->shmem_huge_pages = value;
+			else if (strcmp(label, "ShmemPmdMapped") == 0)
+				mapping->shmem_pmd_mapped = value;
+			else if (strcmp(label, "Swap") == 0)
+				mapping->swap = value;
+			else if (strcmp(label, "KernelPageSize") == 0)
+				mapping->kernel_page_size = value;
+			else if (strcmp(label, "MMUPageSize") == 0)
+				mapping->mmu_page_size = value;
+			else if (strcmp(label, "Locked") == 0)
+				mapping->locked = value;
+			else if (strcmp(label, "ProtectionKey") == 0)
+				mapping->protection_key = value;
+		}
+	}
+
+	SAFE_FCLOSE(f);
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/cma/process_madvise01.c b/testcases/kernel/syscalls/cma/process_madvise01.c
new file mode 100644
index 000000000..d907d982c
--- /dev/null
+++ b/testcases/kernel/syscalls/cma/process_madvise01.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Spawn child inside cgroup and set max memory. Allocate anonymous memory
+ * pages inside child and deactivate them with MADV_COLD. Then apply memory
+ * pressure and check if memory pages have been swapped out.
+ *
+ * The advice might be ignored for some pages in the range when it is
+ * not applicable, so test passes if swap memory increases after
+ * reclaiming memory with MADV_COLD.
+ */
+
+#define _GNU_SOURCE
+
+#include <sys/mman.h>
+#include "tst_test.h"
+#include "lapi/mmap.h"
+#include "lapi/syscalls.h"
+#include "cma.h"
+
+#define MEM_LIMIT	(50 * 1024 * 1024)
+#define MEM_CHILD	(10 * 1024 * 1024)
+#define MEM_PRESS	MEM_LIMIT
+
+static void **data_ptr;
+
+static void child_alloc(void)
+{
+	char *ptr;
+	char *data;
+	size_t cmem;
+	size_t cswap;
+	int freed = 1;
+	struct addr_mapping map_before;
+	struct addr_mapping map_after;
+
+	tst_res(TINFO, "Set memory limit");
+
+	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
+	SAFE_CG_PRINTF(tst_cg, "memory.max", "%d", MEM_LIMIT);
+
+	tst_res(TINFO, "Allocate memory");
+
+	*data_ptr = SAFE_MMAP(NULL, MEM_CHILD,
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	memset(*data_ptr, 'a', MEM_CHILD);
+
+	read_address_mapping((unsigned long)*data_ptr, &map_before);
+
+	SAFE_CG_SCANF(tst_cg, "memory.current", "%zu", &cmem);
+	tst_res(TINFO, "Allocated %lu / %d bytes", cmem, MEM_LIMIT);
+
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
+
+	tst_res(TINFO, "Apply memory pressure");
+
+	data = SAFE_MMAP(NULL, MEM_PRESS,
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	memset(data, 'b', MEM_PRESS);
+	SAFE_MUNMAP(data, MEM_PRESS);
+
+	SAFE_CG_SCANF(tst_cg, "memory.swap.current", "%zu", &cswap);
+	tst_res(TINFO, "Swap now contains %lu bytes", cswap);
+
+	for (ptr = *data_ptr; *ptr != '\0'; ptr++) {
+		if (*ptr == 'a') {
+			freed = 0;
+			break;
+		}
+	}
+
+	if (freed) {
+		tst_res(TFAIL, "Memory has been freed");
+		return;
+	}
+
+	read_address_mapping((unsigned long)*data_ptr, &map_after);
+
+	SAFE_MUNMAP(*data_ptr, MEM_CHILD);
+
+	if (map_before.swap < map_after.swap)
+		tst_res(TPASS, "Memory has been swapped out");
+	else
+		tst_res(TFAIL, "Swap memory has decreased");
+}
+
+static void setup(void)
+{
+	data_ptr = SAFE_MMAP(NULL, sizeof(void *),
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+}
+
+static void cleanup(void)
+{
+	if (*data_ptr)
+		SAFE_MUNMAP(*data_ptr, MEM_CHILD);
+
+	if (data_ptr)
+		SAFE_MUNMAP(data_ptr, sizeof(void *));
+}
+
+static void run(void)
+{
+	int ret;
+	int pidfd;
+	pid_t pid_alloc;
+	struct iovec vec;
+
+	pid_alloc = SAFE_FORK();
+	if (!pid_alloc) {
+		child_alloc();
+		return;
+	}
+
+	TST_CHECKPOINT_WAIT(0);
+
+	tst_res(TINFO, "Apply MADV_COLD advise rule");
+
+	pidfd = SAFE_PIDFD_OPEN(pid_alloc, 0);
+
+	vec.iov_base = *data_ptr;
+	vec.iov_len = MEM_CHILD;
+
+	ret = tst_syscall(__NR_process_madvise, pidfd, &vec, 1UL,
+			MADV_COLD, 0UL);
+
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "process_madvise failed");
+
+	if (ret != MEM_CHILD)
+		tst_brk(TBROK, "process_madvise reclaimed only %d bytes", ret);
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.forks_child = 1,
+	.min_kver = "5.10",
+	.needs_checkpoints = 1,
+	.needs_cgroup_ver = TST_CG_V2,
+	.needs_cgroup_ctrls = (const char *const []){ "memory", NULL },
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
