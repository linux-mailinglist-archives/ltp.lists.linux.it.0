Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AB63F087
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 13:30:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 307823CC499
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 13:30:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AFE0C3CC4B6
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 13:29:14 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D3D6D6104B0
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 13:29:13 +0100 (CET)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1B2Fcw000973; Thu, 1 Dec 2022 12:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VpEWAwcjm3pPkpLey0OdLrMRWGje+QKElrsOkvB0iKA=;
 b=c00g3W5jGLi57gdmgKL9rU09Yq+HrFrLtnwWX39Khm15+po6L5Jm4zVXSG0rJXK6LFO3
 jGWlkmiX02ftRISjRp3lh1HwAENgWLwWQLmIJ8THUoecEoYW+kj8/Ar3nZEYA+N3weoS
 v0ZnoSqmaXdQHKekFRCCfK6g+/KyLjtMJ8Rb0JtpvXVZryUghCnFkZi09kMLOhcn32ps
 c+z7hFMOmZVfJA/KTIt/FNJKYi/3N+Eb3lyoeKLQuotDLeQJukPT14l3ewNmbit+Awt6
 gCauuCy/0agnkmPnIRhSOI2Z+jJtcyCQ9m2g0ijnJod1ExGHmJ7sUZF82jyWNntAmc9T DQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6u1vsyt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 12:29:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1CM1Pb012663;
 Thu, 1 Dec 2022 12:29:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9fagy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 12:29:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2B1CMYKE3801756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Dec 2022 12:22:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15A955204E;
 Thu,  1 Dec 2022 12:29:06 +0000 (GMT)
Received: from tarunpc.in.ibm.com (unknown [9.199.157.25])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 47DAC52051;
 Thu,  1 Dec 2022 12:29:04 +0000 (GMT)
From: Tarun Sahu <tsahu@linux.ibm.com>
To: ltp@lists.linux.it
Date: Thu,  1 Dec 2022 17:58:44 +0530
Message-Id: <20221201122844.142062-9-tsahu@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221201122844.142062-1-tsahu@linux.ibm.com>
References: <20221201122844.142062-1-tsahu@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xD3_q8x8hmlllIFU-l8Nh1uOvUSa2LdL
X-Proofpoint-ORIG-GUID: xD3_q8x8hmlllIFU-l8Nh1uOvUSa2LdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010086
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 8/8] Hugetlb: Migrating libhugetlbfs misaligned_offset
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
 vaibhav@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Migrating the libhugetlbfs/testcases/misaligned_offset.c test

Test Name: Misaligned offset

Test Description: At one stage, a misconversion of hugetlb_vmtruncate_list
to a prio_tree meant that on 32-bit machines, truncates at or above 4GB
could truncate lower pages, resulting in BUG_ON()s.

WARNING: The offsets and addresses used within are specifically
calculated to trigger the bug as it existed.  Don't mess with them
unless you *really* know what you're doing.

The kernel bug in question was fixed with
'commit 856fc2950555 ("[PATCH] hugetlb: fix prio_tree unit")'.

Signed-off-by: Tarun Sahu <tsahu@linux.ibm.com>
---
 runtest/hugetlb                               |   1 +
 testcases/kernel/mem/.gitignore               |   1 +
 .../kernel/mem/hugetlb/hugemmap/hugemmap19.c  | 147 ++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c

diff --git a/runtest/hugetlb b/runtest/hugetlb
index de76cdaf2..4da1525a7 100644
--- a/runtest/hugetlb
+++ b/runtest/hugetlb
@@ -20,6 +20,7 @@ hugemmap15 hugemmap15
 hugemmap16 hugemmap16
 hugemmap17 hugemmap17
 hugemmap18 hugemmap18
+hugemmap19 hugemmap19
 hugemmap05_1 hugemmap05 -m
 hugemmap05_2 hugemmap05 -s
 hugemmap05_3 hugemmap05 -s -m
diff --git a/testcases/kernel/mem/.gitignore b/testcases/kernel/mem/.gitignore
index daee70586..b6b3e5ddd 100644
--- a/testcases/kernel/mem/.gitignore
+++ b/testcases/kernel/mem/.gitignore
@@ -19,6 +19,7 @@
 /hugetlb/hugemmap/hugemmap16
 /hugetlb/hugemmap/hugemmap17
 /hugetlb/hugemmap/hugemmap18
+/hugetlb/hugemmap/hugemmap19
 /hugetlb/hugeshmat/hugeshmat01
 /hugetlb/hugeshmat/hugeshmat02
 /hugetlb/hugeshmat/hugeshmat03
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c
new file mode 100644
index 000000000..c5b29a701
--- /dev/null
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2005-2006 David Gibson & Adam Litke, IBM Corporation.
+ * Copyright (C) 2006 Hugh Dickins <hugh@veritas.com>
+ * Author: David Gibson & Adam Litke
+ */
+
+/*\
+ * [Descripiton]
+ *
+ * At one stage, a misconversion of hugetlb_vmtruncate_list to a
+ * prio_tree meant that on 32-bit machines, truncates at or above 4GB
+ * could truncate lower pages, resulting in BUG_ON()s.
+ *
+ * WARNING: The offsets and addresses used within are specifically
+ * calculated to trigger the bug as it existed.  Don't mess with them
+ * unless you *really* know what you're doing.
+ *
+ * The kernel bug in question was fixed with commit
+ * 856fc29505556cf263f3dcda2533cf3766c14ab6.
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
+#define RANDOM_CONSTANT	0x1234ABCD
+#define MNTPOINT "hugetlbfs/"
+static int page_size;
+static long hpage_size;
+static int  fd = -1;
+
+static void run_test(void)
+{
+	off_t buggy_offset;
+	void *p, *q;
+	volatile int *pi;
+	int err;
+
+	/*
+	 * First, we make a 2 page sane hugepage mapping.  Then we
+	 * memset() it to ensure that the ptes are instantiated for
+	 * it.  Then we attempt to replace the second half of the map
+	 * with one at a bogus offset.  We leave the first page of
+	 * sane mapping in place to ensure that the corresponding
+	 * pud/pmd/whatever entries aren't cleaned away.  It's those
+	 * bad entries which can trigger bad_pud() checks if the
+	 * backout path for the bogus mapping is buggy, which it was
+	 * in some kernels.
+	 */
+	tst_res(TINFO, "Initial free hugepages: %lu",
+		SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE));
+
+	/* First get arena of three hpages size, at file offset 4GB */
+	p = SAFE_MMAP(NULL, 2*hpage_size, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd, 0);
+
+	tst_res(TINFO, "After Mapping reference map, Free hugepages: %lu",
+		SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE));
+	tst_res(TINFO, "Mapped Address Range: %p-%p", p, p+2*hpage_size-1);
+
+	memset(p, 0, 2*hpage_size);
+	pi = p;
+	*pi = RANDOM_CONSTANT;
+
+	tst_res(TINFO, "After instantiate the pages, Free hugepages: %lu",
+		   SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE));
+
+	/*
+	 * Toggle the permissions on the first page.  This forces TLB
+	 * entries (including hash page table on powerpc) to be
+	 * flushed, so that the page tables must be accessed for the
+	 * test further down.  In the buggy case, those page tables
+	 * can get thrown away by a pud_clear()
+	 */
+	err = mprotect(p, hpage_size, PROT_READ);
+	if (err)
+		tst_brk(TBROK|TERRNO, "mprotect(%p, 0x%lx, PROT_READ)", p, hpage_size);
+
+	/* Replace top hpage by hpage mapping at confusing file offset */
+	buggy_offset = page_size;
+	tst_res(TINFO, "Replacing map at %p with map from offset 0x%lx...",
+	       p + hpage_size, (unsigned long)buggy_offset);
+	q = mmap(p + hpage_size, hpage_size, PROT_READ|PROT_WRITE,
+		 MAP_FIXED|MAP_PRIVATE, fd, buggy_offset);
+	if (q != MAP_FAILED) {
+		tst_res(TFAIL|TERRNO, "bogus offset mmap() succeeded at %p", q);
+		goto cleanup;
+	}
+	if (errno != EINVAL) {
+		tst_res(TFAIL|TERRNO, "bogus mmap() failed should be \"%s\" but it is",
+		     tst_strerrno(EINVAL));
+		goto cleanup;
+	}
+
+	tst_res(TINFO, "After Mapping with buggy offset, Free hugepages: %lu",
+		SAFE_READ_MEMINFO(MEMINFO_HPAGE_FREE));
+
+	if (*pi != RANDOM_CONSTANT) {
+		tst_res(TFAIL, "Pre-existing mapping clobbered: %x instead of %x",
+		     *pi, RANDOM_CONSTANT);
+		goto cleanup;
+	}
+
+	/*
+	 * The real test is whether we got a bad_pud() or similar
+	 * during the run.  The check above, combined with the earlier
+	 * mprotect()s to flush the TLB are supposed to catch it, but
+	 * it's hard to be certain.  Once bad_pud() is called
+	 * behaviour can be very strange.
+	 */
+
+	tst_res(TPASS, "Successful but inconclusive");
+cleanup:
+	SAFE_MUNMAP(p, 2*hpage_size);
+}
+
+static void setup(void)
+{
+	page_size = getpagesize();
+	hpage_size = SAFE_READ_MEMINFO("Hugepagesize:")*1024;
+	fd = tst_creat_unlinked(MNTPOINT, 0);
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
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_test,
+	.hugepages = {4, TST_NEEDS},
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
