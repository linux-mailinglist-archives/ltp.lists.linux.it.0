Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA862BBDC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Nov 2022 12:27:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 783783CD035
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Nov 2022 12:27:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1FE23CD034
 for <ltp@lists.linux.it>; Wed, 16 Nov 2022 12:26:39 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B2FD210005BD
 for <ltp@lists.linux.it>; Wed, 16 Nov 2022 12:26:38 +0100 (CET)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGAn4GQ010363; Wed, 16 Nov 2022 11:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rj+Yi3fllLCrVDCYzy0K1UM6Ats3OlmPjPgn2+W5O0k=;
 b=ac8QGAT6u/c95eLA/HouSrNiR/Vt/PxlHn1IxkdXrDOyWx6hCnQrMOCvYl6nyCyupRes
 AV4fRntbwr0Fr1lqHdZN3mS1qUKH6td8mXe/uMwpYD9aZFSaDdRhm6H36JjA/RcU+69F
 R6wyUjU3+/MR+JiYw0JplkSNxMtET4L55lazRrWCej7En1fRPcdSMIkOFgjzsmk0wxHf
 qNnB8w7Phz5leL7oW+AJ55AgkeSWbfDPZmjC0WLYQtPmiihO4kA2eDtlgs/6QU3uwk7O
 gl5vZBlvpdUZ7HLlz6JT9evycjGRgigteqZafi5T0tc6eoP7V3Df8a1lnpv/An7wLDw7 bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvxeg0x1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:26:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGAo79D014387;
 Wed, 16 Nov 2022 11:26:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvxeg0x0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:26:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGBKeif016555;
 Wed, 16 Nov 2022 11:26:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjdtqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:26:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AGBQU6g62128430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Nov 2022 11:26:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09EFA4203F;
 Wed, 16 Nov 2022 11:26:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF86642041;
 Wed, 16 Nov 2022 11:26:27 +0000 (GMT)
Received: from tarunpc.in.ibm.com (unknown [9.199.157.25])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Nov 2022 11:26:27 +0000 (GMT)
From: Tarun Sahu <tsahu@linux.ibm.com>
To: ltp@lists.linux.it
Date: Wed, 16 Nov 2022 16:55:15 +0530
Message-Id: <20221116112516.261535-7-tsahu@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221116112516.261535-1-tsahu@linux.ibm.com>
References: <20221116112516.261535-1-tsahu@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mc5Xs5CIocp-AUvAqaGYV4SGGdnvv6WG
X-Proofpoint-ORIG-GUID: 1j91RtOx1gfZU5rNeAXFHrg4bHRjMBph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_01,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160074
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 6/7] Hugetlb: Migrating libhugetlbfs fallocate_align
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
 vaibhav@linux.ibm.com, mike.kravetz@oracle.com
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
 .../kernel/mem/hugetlb/hugefallocate/Makefile |  10 ++
 .../hugetlb/hugefallocate/hugefallocate01.c   | 169 ++++++++++++++++++
 4 files changed, 182 insertions(+)
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
index 000000000..1ec0dd000
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2015 Oracle Corporation
+ * Author: Mike Kravetz
+ */
+
+/*\
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
+	unsigned long free_initial, free_after, free_after_delete;
+
+	fd = tst_creat_unlinked(MNTPOINT, 0);
+
+	free_initial = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
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
+	if (free_initial - free_after != 1) {
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
+	if (free_after == free_initial) {
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
+	if (free_after != free_initial) {
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
+	if (free_initial - free_after != 2) {
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
+	if (free_initial - free_after != 2) {
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
+	free_after_delete = SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE);
+	TST_EXP_EQ_LU(free_after_delete, free_initial);
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
