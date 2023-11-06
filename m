Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3E7E1D48
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Nov 2023 10:31:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4E653CE04F
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Nov 2023 10:31:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B9E43CE87E
 for <ltp@lists.linux.it>; Mon,  6 Nov 2023 10:30:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0F4586011F5
 for <ltp@lists.linux.it>; Mon,  6 Nov 2023 10:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699263043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jg/bp10tsM5UUFdyVOh2+hK1Gb0wvduyG0XgCKZ/RUk=;
 b=Bh6jFWerT+qdZLVK1Ye/gtoX+RL2SiQI2md6wbugLxeZuJrlYMT5iKaPOH35Fxa+LQlcpy
 I1F1ciqZzSVpztT2lp9v4mlQOmbTyIf14HKfuOx6xnZxwU3pTXj9E2U6wwmzJLKP+biKc7
 nVlPmHGAVgJRtxm41b//qgz2J8vKyIk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-ceWqLhM5PsO4x-MThPCf1Q-1; Mon,
 06 Nov 2023 04:30:40 -0500
X-MC-Unique: ceWqLhM5PsO4x-MThPCf1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 587483C100B2
 for <ltp@lists.linux.it>; Mon,  6 Nov 2023 09:30:40 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5729E1C060AE
 for <ltp@lists.linux.it>; Mon,  6 Nov 2023 09:30:39 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  6 Nov 2023 17:30:31 +0800
Message-Id: <20231106093031.1844129-4-liwang@redhat.com>
In-Reply-To: <20231106093031.1844129-1-liwang@redhat.com>
References: <20231106093031.1844129-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] hugemmap34: Test to detect bug with migrating
 gigantic pages
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 runtest/hugetlb                               |   1 +
 testcases/kernel/mem/.gitignore               |   1 +
 .../kernel/mem/hugetlb/hugemmap/hugemmap34.c  | 129 ++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 testcases/kernel/mem/hugetlb/hugemmap/hugemmap34.c

diff --git a/runtest/hugetlb b/runtest/hugetlb
index 299c07ac9..0c812c780 100644
--- a/runtest/hugetlb
+++ b/runtest/hugetlb
@@ -35,6 +35,7 @@ hugemmap29 hugemmap29
 hugemmap30 hugemmap30
 hugemmap31 hugemmap31
 hugemmap32 hugemmap32
+hugemmap34 hugemmap34
 hugemmap05_1 hugemmap05 -m
 hugemmap05_2 hugemmap05 -s
 hugemmap05_3 hugemmap05 -s -m
diff --git a/testcases/kernel/mem/.gitignore b/testcases/kernel/mem/.gitignore
index 7258489ed..41f547edf 100644
--- a/testcases/kernel/mem/.gitignore
+++ b/testcases/kernel/mem/.gitignore
@@ -34,6 +34,7 @@
 /hugetlb/hugemmap/hugemmap30
 /hugetlb/hugemmap/hugemmap31
 /hugetlb/hugemmap/hugemmap32
+/hugetlb/hugemmap/hugemmap34
 /hugetlb/hugeshmat/hugeshmat01
 /hugetlb/hugeshmat/hugeshmat02
 /hugetlb/hugeshmat/hugeshmat03
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap34.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap34.c
new file mode 100644
index 000000000..2e55e5f15
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap34.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2023
+ * Copyright (C) 2023, Red Hat, Inc.
+ *
+ * Author: David Hildenbrand <david@redhat.com>
+ * Port-to-LTP: Li Wang <liwang@redhat.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Migration code will first unmap the old page and replace the present PTE
+ * by a migration entry. Then migrate the page. Once that succeeded (and there
+ * are no unexpected page references), we replace the migration entries by
+ * proper present PTEs pointing at the new page.
+ *
+ * For ordinary pages we handle PTEs. For 2 MiB hugetlb/THP, it's PMDs.
+ * For 1 GiB hugetlb, it's PUDs.
+ *
+ * So without below commit, GUP-fast code was simply not aware that we could
+ * have migration entries stored in PUDs. Migration + GUP-fast code should be
+ * able to handle any such races.
+ *
+ * For example, GUP-fast will re-verify the PUD after pinning to make sure it
+ * didn't change. If it did change, it backs off.
+ *
+ * Migration code should detect the additional page references and back off
+ * as well.
+ *
+ *  commit 15494520b776aa2eadc3e2fefae524764cab9cea
+ *  Author: Qiujun Huang <hqjagain@gmail.com>
+ *  Date:   Thu Jan 30 22:12:10 2020 -0800
+ *
+ *      mm: fix gup_pud_range
+ *
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <pthread.h>
+#include <unistd.h>
+#include <stdbool.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/ioctl.h>
+#include <linux/mempolicy.h>
+#include <linux/mman.h>
+
+#include "lapi/syscalls.h"
+#include "tst_safe_pthread.h"
+#include "numa_helper.h"
+#include "hugetlb.h"
+
+static char *mem;
+static size_t pagesize;
+static size_t hugetlbsize;
+static volatile int looping = 1;
+
+static void *migration_thread_fn(void *arg LTP_ATTRIBUTE_UNUSED)
+{
+	while (looping) {
+		TST_EXP_PASS_SILENT(syscall(__NR_mbind, mem, hugetlbsize,
+			MPOL_LOCAL, NULL, 0x7fful, MPOL_MF_MOVE));
+	}
+
+	return NULL;
+}
+
+static void run_test(void)
+{
+	ssize_t transferred;
+	struct iovec iov;
+	int fds[2];
+
+	pthread_t migration_thread;
+
+	pagesize = getpagesize();
+	hugetlbsize = 1 * 1024 * 1024 * 1024u;
+
+	mem = mmap(NULL, hugetlbsize, PROT_READ|PROT_WRITE,
+		   MAP_PRIVATE|MAP_ANON|MAP_HUGETLB|MAP_HUGE_1GB,
+		   -1, 0);
+	if (mem == MAP_FAILED)
+		tst_brk(TBROK | TERRNO, "mmap() failed");
+
+	memset(mem, 1, hugetlbsize);
+
+	/* Keep migrating the page around ... */
+	SAFE_PTHREAD_CREATE(&migration_thread, NULL, migration_thread_fn, NULL);
+
+	while (looping) {
+		SAFE_PIPE(fds);
+
+		iov.iov_base = mem;
+		iov.iov_len = pagesize;
+		transferred = vmsplice(fds[1], &iov, 1, 0);
+		if (transferred <= 0)
+			tst_brk(TBROK | TERRNO, "vmsplice() failed");
+
+		SAFE_CLOSE(fds[0]);
+		SAFE_CLOSE(fds[1]);
+
+		if (!tst_remaining_runtime()) {
+			tst_res(TINFO, "Runtime exhausted, exiting");
+			looping = 0;
+		}
+	}
+
+	SAFE_PTHREAD_JOIN(migration_thread, NULL);
+
+	tst_res(TPASS, "Test completed successfully");
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.test_all = run_test,
+	.max_runtime = 60,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.hugepages = {2, TST_NEEDS, TST_GIGANTIC},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_NUMA=y",
+		NULL
+	},
+	.tags = (struct tst_tag[]) {
+	    {"linux-git", "15494520b776"},
+	    {}
+	},
+};
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
