Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9728620B25
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Nov 2022 09:28:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 522AE3CD8DC
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Nov 2022 09:28:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 84A393CD8AC
 for <ltp@lists.linux.it>; Tue,  8 Nov 2022 09:28:18 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 369B710009B8
 for <ltp@lists.linux.it>; Tue,  8 Nov 2022 09:28:17 +0100 (CET)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A88Ldum020231;
 Tue, 8 Nov 2022 08:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tL1c6Jko6B8eC6YO41KzzEZ8703wgxmcMXwF1mXJjng=;
 b=aDwrOhJIwf9jyv00vF6fWEOG8yKl/FYSc+0U4/QL4pg3/t/QvtaWdIhehUhoI7iNtRec
 h4av7CBX39ZL5x/DUy/DPF4F8zNTcsdvii1li326PK1nEVZ3otrNXpCieJBkjJDC3AQc
 fzosYs1KmTEgc3E0aF0R6T8nTUSfj4ExfCE+cBaDwjulk6QeGqRalgLrA6fgVOzZDdCN
 I76zYZtUvE9heK9FhRVvLXeoX9Bb3GAax/D/O6GrLizGpQiJ6ZOlIInLqsIZk2ede2vA
 KgqOg4WRAEsF9UbEzV58XKR4PNVNgpN+F3ZwQnMZCkiqwnxYWScmuzAyUwzCd0qYnSPi Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkhkr4tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 08:28:15 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A88NIuA024956;
 Tue, 8 Nov 2022 08:28:14 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkhkr4sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 08:28:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A88L3pH004557;
 Tue, 8 Nov 2022 08:28:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3kngqdbs0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 08:28:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A88MRkq49676726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Nov 2022 08:22:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 494D74203F;
 Tue,  8 Nov 2022 08:28:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E57342041;
 Tue,  8 Nov 2022 08:28:06 +0000 (GMT)
Received: from tarunpc.ibmuc.com (unknown [9.43.50.217])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Nov 2022 08:28:05 +0000 (GMT)
From: Tarun Sahu <tsahu@linux.ibm.com>
To: ltp@lists.linux.it
Date: Tue,  8 Nov 2022 13:57:46 +0530
Message-Id: <20221108082747.176492-5-tsahu@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221108082747.176492-1-tsahu@linux.ibm.com>
References: <20221108082747.176492-1-tsahu@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VvLhWgvcoRd6dOE87t5a6jDYRaiwvLXv
X-Proofpoint-GUID: tS6XtrqsU7inOPwx0DC5ocIlP2ItfyF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080043
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] Hugetlb: Migrating libhugetlbfs fallocate_align
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
Cc: geetika@linux.ibm.com, sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 vaibhav@linux.ibm.com, rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Migrating the libhugetlbfs/testcases/fallocate_align.c test

Test Description: It tests alignment of fallocate arguments. fallocate will
take non-huge page aligned offsets and addresses.  However, operations are
only performed on huge pages.  This is different that than fallocate
behavior in "normal" filesystems.

Signed-off-by: Tarun Sahu <tsahu@linux.ibm.com>
---
 runtest/hugetlb                               |   2 +
 testcases/kernel/mem/.gitignore               |   1 +
 .../kernel/mem/hugetlb/hugefallocate/Makefile |  10 +
 .../hugetlb/hugefallocate/hugefallocate01.c   | 172 ++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 testcases/kernel/mem/hugetlb/hugefallocate/Makefile
 create mode 100644 testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c

diff --git a/runtest/hugetlb b/runtest/hugetlb
index b019c4195..ca92dfcff 100644
--- a/runtest/hugetlb
+++ b/runtest/hugetlb
@@ -1,3 +1,5 @@
+hugefallocate01 hugefallocate01
+
 hugemmap01 hugemmap01
 hugemmap02 hugemmap02
 hugemmap04 hugemmap04
diff --git a/testcases/kernel/mem/.gitignore b/testcases/kernel/mem/.gitignore
index ec250592d..cafdb5259 100644
--- a/testcases/kernel/mem/.gitignore
+++ b/testcases/kernel/mem/.gitignore
@@ -1,4 +1,5 @@
 /cpuset/cpuset01
+/hugetlb/hugefallocate/hugefallocate01
 /hugetlb/hugemmap/hugemmap01
 /hugetlb/hugemmap/hugemmap02
 /hugetlb/hugemmap/hugemmap04
diff --git a/testcases/kernel/mem/hugetlb/hugefallocate/Makefile b/testcases/kernel/mem/hugetlb/hugefallocate/Makefile
new file mode 100644
index 000000000..77ebb0aef
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugefallocate/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
+# Ngie Cooper, July 2009
+
+top_srcdir		?= ../../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(abs_srcdir)/../Makefile.inc
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
diff --git a/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c b/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c
new file mode 100644
index 000000000..1e141a811
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2015 Mike Kravetz, Oracle Corporation
+ * Author: Mike Kravetz
+ */
+
+/*
+ * [Description]
+ *
+ * It tests alignment of fallocate arguments. fallocate will take non-huge
+ * page aligned offsets and addresses.  However, operations are only
+ * performed on huge pages.  This is different that than fallocate
+ * behavior in "normal" filesystems.
+ *
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <sys/mount.h>
+#include <limits.h>
+#include <sys/param.h>
+#include <sys/types.h>
+
+#include "hugetlb.h"
+
+#define MNTPOINT "hugetlbfs/"
+
+static int  fd = -1;
+static long hpage_size;
+
+static void run_test(void)
+{
+	int err;
+	unsigned long free_before, free_after;
+
+	fd = tst_creat_unlinked(MNTPOINT);
+
+	free_before = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+
+	/*
+	 * First preallocate file with just 1 byte.  Allocation sizes
+	 * are rounded up, so we should get an entire huge page.
+	 */
+	err = fallocate(fd, 0, 0, 1);
+	if (err) {
+		if (errno == EOPNOTSUPP)
+			tst_brk(TCONF, "Operation Not Supported");
+		tst_res(TFAIL|TERRNO, "fallocate()");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_before - free_after != 1) {
+		tst_res(TFAIL, "fallocate 1 byte did not preallocate entire huge page");
+		goto cleanup;
+	}
+
+	/*
+	 * Now punch a hole with just 1 byte.  On hole punch, sizes are
+	 * rounded down. So, this operation should not create a hole.
+	 */
+	err = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			0, 1);
+	if (err) {
+		tst_res(TFAIL|TERRNO, "fallocate(FALLOC_FL_PUNCH_HOLE)");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_after == free_before) {
+		tst_res(TFAIL, "fallocate hole punch 1 byte free'ed a huge page");
+		goto cleanup;
+	}
+
+	/*
+	 * Now punch a hole with of 2 * hpage_size - 1 byte.  This size
+	 * should be rounded down to a single huge page and the hole created.
+	 */
+	err = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			0, (2 * hpage_size) - 1);
+	if (err) {
+		tst_res(TFAIL|TERRNO, "fallocate(FALLOC_FL_PUNCH_HOLE)");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_after != free_before) {
+		tst_res(TFAIL, "fallocate hole punch 2 * hpage_size - 1 byte did not"
+				" free huge page");
+		goto cleanup;
+	}
+
+	/*
+	 * Perform a preallocate operation with offset 1 and size of
+	 * hpage_size.  The offset should be rounded down and the
+	 * size rounded up to preallocate two huge pages.
+	 */
+	err = fallocate(fd, 0, 1, hpage_size);
+	if (err) {
+		tst_res(TFAIL, "fallocate()");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_before - free_after != 2) {
+		tst_res(TFAIL, "fallocate 1 byte offset, huge page size did not"
+				" preallocate two huge pages");
+		goto cleanup;
+	}
+
+	/*
+	 * The hole punch code will only delete 'whole' huge pags that are
+	 * in the specified range.  The offset is rounded up, and (offset
+	 * + size) is rounded down to determine the huge pages to be deleted.
+	 * In this case, after rounding the range is (hpage_size, hpage_size).
+	 * So, no pages should be deleted.
+	 */
+	err = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			1, hpage_size);
+	if (err) {
+		tst_res(TFAIL|TERRNO, "fallocate(FALLOC_FL_PUNCH_HOLE)");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_before - free_after != 2) {
+		tst_res(TFAIL, "fallocate hole punch 1 byte offset, huge page size"
+				" incorrectly deleted a huge page");
+		goto cleanup;
+	}
+
+	/*
+	 * To delete both huge pages, the range passed to hole punch must
+	 * overlap the allocated pages
+	 */
+	err = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			0, 2 * hpage_size);
+	if (err) {
+		tst_res(TFAIL|TERRNO, "fallocate(FALLOC_FL_PUNCH_HOLE)");
+		goto cleanup;
+	}
+
+	free_after = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	if (free_after != free_before) {
+		tst_res(TFAIL, "fallocate hole punch did not delete two huge pages");
+	} else
+		tst_res(TPASS, "Successful");
+cleanup:
+	SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+{
+	hpage_size = SAFE_READ_MEMINFO(MEMINFO_HPAGE_SIZE)*1024;
+}
+
+static void cleanup(void)
+{
+	if (fd > 0)
+		SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.needs_hugetlbfs = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_test,
+	.hugepages = {2, TST_NEEDS},
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
