Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 056CA7B2DFA
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Sep 2023 10:39:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A15383CDC1C
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Sep 2023 10:39:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6230B3CB62A
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 10:39:29 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 170D468725A
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 10:39:28 +0200 (CEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38T8P0ro000385
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 08:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=A9wmMjW34xe38MZ7niOMzVJuGDOD5Iogvyto4kKKZOU=;
 b=n3vV1qa+9mqeDZ6WlEUnx1twaTFYSCqwYxKwJQ0vUryQFAbZ7qkgHCelvV22MxN4hhtn
 ovNH9HhzjdRQl+ZKRU4IeJd0E71yaKr7Fb9f0X2x4du/Cm+63V3QP2yJuN9xY3484asQ
 eLRM+NJ+zy8Ri6QnTcSZh6I+JNanD7x1d8HHB693t6OiPSKqiZR2rqleIfTJN+rs7RDg
 +rWAnfeJrumlmzWdDo2N5daNIstFZ1lpEu5/5SPONEux6RP1oVXTOxVTNkEhu9TwT+34
 F/jANNRAf1cEAa20CuSm0uuy2zOPuGDl9AkrW52k71N6ayrpe0ginMv2TS1HduOz6cml zg== 
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdu1xg7f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 08:39:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38T7ouk0008445
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 08:39:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3taabtbrg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 29 Sep 2023 08:39:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38T8dMGP12255770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Sep 2023 08:39:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 931A520043;
 Fri, 29 Sep 2023 08:39:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7CF420040;
 Fri, 29 Sep 2023 08:39:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.116.90])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 29 Sep 2023 08:39:21 +0000 (GMT)
From: Geetika <geetika@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri, 29 Sep 2023 14:09:16 +0530
Message-Id: <20230929083916.72813-1-geetika@linux.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4Ow_gV48NZO9ZhFmx_beMb4OEEqEdBtX
X-Proofpoint-GUID: 4Ow_gV48NZO9ZhFmx_beMb4OEEqEdBtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_07,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxlogscore=899 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290073
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Migrating the
 libhugetlbfs/testcases/truncate_above_4GB.c test
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

Test Description:

A misconversion of hugetlb_vmtruncate_list to a prio_tree meant that
on 32-bit machines, truncates at or above 4GB could truncate lower pages,
resulting in BUG_ON()s. This kernel bug was fixed with
'commit 856fc2950555'.

The purpose of this test is to check whether huge pages are handled correctly
when a file is truncated above the 4GB boundary. It ensures that the memory is
not corrupted or lost during the truncation process, and that the expected data
is still present in the memory after truncation.

Signed-off-by: Geetika <geetika@linux.ibm.com>
---
v2:
 -Corrected typo
---
 runtest/hugetlb                               |   1 +
 testcases/kernel/mem/.gitignore               |   1 +
 .../kernel/mem/hugetlb/hugemmap/hugemmap39.c  | 171 ++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 testcases/kernel/mem/hugetlb/hugemmap/hugemmap39.c

diff --git a/runtest/hugetlb b/runtest/hugetlb
index 299c07ac9..26587ecc0 100644
--- a/runtest/hugetlb
+++ b/runtest/hugetlb
@@ -35,6 +35,7 @@ hugemmap29 hugemmap29
 hugemmap30 hugemmap30
 hugemmap31 hugemmap31
 hugemmap32 hugemmap32
+hugemmap39 hugemmap39
 hugemmap05_1 hugemmap05 -m
 hugemmap05_2 hugemmap05 -s
 hugemmap05_3 hugemmap05 -s -m
diff --git a/testcases/kernel/mem/.gitignore b/testcases/kernel/mem/.gitignore
index 7258489ed..4c55d5c8c 100644
--- a/testcases/kernel/mem/.gitignore
+++ b/testcases/kernel/mem/.gitignore
@@ -34,6 +34,7 @@
 /hugetlb/hugemmap/hugemmap30
 /hugetlb/hugemmap/hugemmap31
 /hugetlb/hugemmap/hugemmap32
+/hugetlb/hugemmap/hugemmap39
 /hugetlb/hugeshmat/hugeshmat01
 /hugetlb/hugeshmat/hugeshmat02
 /hugetlb/hugeshmat/hugeshmat03
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap39.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap39.c
new file mode 100644
index 000000000..be5cba69f
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap39.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2005-2006 David Gibson & Adam Litke, IBM Corporation.
+ * Copyright (C) 2006 Hugh Dickins <hugh@veritas.com>
+ */
+
+/*\
+ *[Descripiton]
+ *
+ * At one stage, a misconversion of hugetlb_vmtruncate_list to a
+ * prio_tree meant that on 32-bit machines, truncates at or above 4GB
+ * could truncate lower pages, resulting in BUG_ON()s.
+ *
+ * WARNING: The offsets and addresses used within are specifically
+ * calculated to trigger the bug as it existed.  Don't mess with them
+ * unless you *really* know what you're doing.
+ *
+ */
+
+#define _GNU_SOURCE
+#define _LARGEFILE64_SOURCE
+#define FOURGIG ((off64_t)0x100000000ULL)
+#define MNTPOINT "hugetlbfs/"
+
+#include <signal.h>
+#include <setjmp.h>
+#include "hugetlb.h"
+
+static int page_size;
+static long hpage_size;
+static int fd = -1;
+static volatile int test_pass;
+static int err;
+static int sigbus_count;
+static sigjmp_buf sig_escape;
+
+static void sigbus_handler_fail(int signum, siginfo_t *si, void *uc)
+{
+	siglongjmp(sig_escape, 17);
+}
+
+static void sigbus_handler_pass(int signum, siginfo_t *si, void *uc)
+{
+	test_pass = 1;
+	siglongjmp(sig_escape, 17);
+}
+
+static void run_test(void)
+{
+	long long buggy_offset, truncate_point;
+	void *p, *q;
+	volatile unsigned int *pi, *qi;
+
+	struct sigaction sa_pass = {
+		.sa_sigaction = sigbus_handler_pass,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	struct sigaction sa_fail = {
+		.sa_sigaction = sigbus_handler_pass,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	sigbus_count = 0;
+	test_pass = 0;
+
+	buggy_offset = truncate_point / (hpage_size / page_size);
+	buggy_offset = PALIGN(buggy_offset, hpage_size);
+
+	/* First get arena of three hpages size, at file offset 4GB */
+	q = mmap64(NULL, 3*hpage_size, PROT_READ|PROT_WRITE,
+		 MAP_PRIVATE, fd, truncate_point);
+	if (q == MAP_FAILED)
+		tst_brk(TBROK, "mmap() offset 4GB: %s", strerror(errno));
+	qi = q;
+	/* Touch the high page */
+	*qi = 0;
+
+	/* This part of the test makes the problem more obvious, but
+	 * is not essential.  It can't be done on segmented powerpc, where
+	 * segment restrictions prohibit us from performing such a
+	 * mapping, so skip it there. Similarly, ia64's address space
+	 * restrictions prevent this.
+	 */
+#if (defined(__powerpc__) && defined(PPC_NO_SEGMENTS)) \
+	|| !defined(__powerpc__) && !defined(__powerpc64__) \
+	&& !defined(__ia64__)
+	/* Replace middle hpage by tinypage mapping to trigger
+	 * nr_ptes BUG
+	 */
+	p = mmap64(q + hpage_size, hpage_size, PROT_READ|PROT_WRITE,
+		   MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
+	if (p != q + hpage_size)
+		tst_brk(TBROK, "mmap() offset 4GB: %s", strerror(errno));
+	pi = p;
+	/* Touch one page to allocate its page table */
+	*pi = 0;
+#endif
+
+	/* Replace top hpage by hpage mapping at confusing file offset */
+	p = mmap64(q + 2*hpage_size, hpage_size, PROT_READ|PROT_WRITE,
+		 MAP_FIXED|MAP_PRIVATE, fd, buggy_offset);
+	if (p != q + 2*hpage_size)
+		tst_brk(TBROK, "mmap() buggy offset 0x%llx", buggy_offset);
+	pi = p;
+	/* Touch the low page with something non-zero */
+	*pi = 1;
+
+	err = ftruncate64(fd, truncate_point);
+	if (err) {
+		tst_res(TFAIL, "ftruncate failed");
+		goto cleanup;
+	}
+
+	SAFE_SIGACTION(SIGBUS, &sa_fail, NULL);
+	if (sigsetjmp(sig_escape, 1) == 0)
+		if (*pi != 1) {
+			tst_res(TFAIL, "Data 1 has changed!");
+			goto cleanup;
+		}
+
+	SAFE_SIGACTION(SIGBUS, &sa_pass, NULL);
+	if (sigsetjmp(sig_escape, 1) == 0)
+		*qi;
+	else
+		sigbus_count++;
+	if (sigbus_count != 1)
+		/* Should have SIGBUSed above */
+		tst_res(TFAIL, "Didn't SIGBUS on truncated page.");
+	if (test_pass == 1)
+		tst_res(TPASS, "Expected SIGBUS");
+
+cleanup:
+	SAFE_MUNMAP(q, 3*hpage_size);
+	SAFE_MUNMAP(p, hpage_size);
+}
+
+static void setup(void)
+{
+	long long truncate_point;
+
+	page_size = getpagesize();
+	hpage_size = tst_get_hugepage_size();
+	fd = tst_creat_unlinked(MNTPOINT, 0);
+	truncate_point = FOURGIG;
+	if (hpage_size > truncate_point)
+		tst_brk(TCONF, "Huge page size is too large!");
+	if (truncate_point % hpage_size > 0)
+		tst_brk(TCONF, "Truncation point is not aligned to huge page size!");
+}
+
+static void cleanup(void)
+{
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.tags = (struct tst_tag[]) {
+		{"linux-git", "856fc2950555"},
+		{}
+	},
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.needs_hugetlbfs = 1,
+	.hugepages = {4, TST_NEEDS},
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_test,
+};
+
-- 
2.39.2 (Apple Git-143)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
