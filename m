Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D25382D9364
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 07:55:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 997073C2AF2
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 07:55:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DC44B3C2A1C
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 07:55:36 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 181E61000930
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 07:55:35 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5D4D99F616;
 Mon, 14 Dec 2020 06:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1607928934; bh=u9EyYwup2ZMjxjrSy2KovSGhYZYLjc8Te3mMSs6lvMk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Qf41U5IUHg9bC4D2H7yxqWxCXnmNC28aNWn854aUq5DH4TYRrsNX7C6m6nrWUyzyP
 m28eohUF77rla3hADUV593pWfCLcki4rg1DHC3MTGw1kjgtF5thHueuohsEtyY9R17
 wFaqk3M6AMWVc95HOAAaFq/krtpsaF0Z8yYgbBwc=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	rpalethorpe@suse.de
Date: Mon, 14 Dec 2020 07:55:28 +0100
Message-Id: <20201214065528.453216-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Changes to v3:
 - Change total_batch_size to kB. All sizes used in this test are in kB,
   using bytes was wrong here
 - Calculate total_batch_size during setup
 - Formating of MIN/MAX construct

The test sets overcommit policy to never overcommit and then tries
to allocate the commit limit reported by /proc/meminfo. This value is an exact
value (at least at that point in time) of memory, that can be allocated
according to the policy and ratio settings. This should fail, since there
is already some memory allocated for running the test programm, but due to
inaccurate memory accounting in mm/util.c __vm_enough_memory(), the allocation
can still succeed.

The commited memory is stored in a percpu counter, that counts in 1 + ncpu
variables. For small allocations and deallocations, the memory is counted
in a counter per cpu, without locking. If this counter reaches a threshold,
the value is committed to a global counter. Due to this the global counter
can become negative. This global counter is the only thing taken into
account in __vm_enough_memory, propably for performance reasons, because
otherwise a lock is required.

Because of the inaccuracy the system can overcommit a bit by number of cpus
times threshold value. By adding this value to the exact commit limit
reported by /proc/meminfo, we can be sure, that we really always hit the
memory limit.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../kernel/mem/tunable/overcommit_memory.c    | 56 +++++++++++++------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
index f77939908..3982530b7 100644
--- a/testcases/kernel/mem/tunable/overcommit_memory.c
+++ b/testcases/kernel/mem/tunable/overcommit_memory.c
@@ -1,18 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) Linux Test Project, 2012-2020
- * Copyright (C) 2012-2017  Red Hat, Inc.
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * Descriptions:
+ * Copyright (c) 2012-2020 Linux Test Project
+ * Copyright (c) 2012-2017 Red Hat, Inc.
  *
  * There are two tunables overcommit_memory and overcommit_ratio under
  * /proc/sys/vm/, which can control memory overcommitment.
@@ -53,12 +42,16 @@
  * the system is limited to CommitLimit(Swap+RAM*overcommit_ratio)
  * commit_left(allocatable memory) = CommitLimit - Committed_AS
  * a. less than commit_left:    commit_left / 2, alloc should pass
- * b. greater than commit_left: commit_left * 2, alloc should fail
- * c. overcommit limit:         CommitLimit,     alloc should fail
+ * b. overcommit limit:         CommitLimit + TotalBatchSize, should fail
+ * c. greater than commit_left: commit_left * 2, alloc should fail
  * *note: CommitLimit is the current overcommit limit.
  *        Committed_AS is the amount of memory that system has used.
  * it couldn't choose 'equal to commit_left' as a case, because
  * commit_left rely on Committed_AS, but the Committed_AS is not stable.
+ * *note2: TotalBatchSize is the total number of bytes, that can be
+ *         accounted for in the per cpu counters for the vm_committed_as
+ *         counter. Since the check used by malloc only looks at the
+ *         global counter of vm_committed_as, it can overallocate a bit.
  *
  * References:
  * - Documentation/sysctl/vm.txt
@@ -89,11 +82,13 @@ static long sum_total;
 static long free_total;
 static long commit_limit;
 static long commit_left;
+static long total_batch_size;
 
 static int heavy_malloc(long size);
 static void alloc_and_check(long size, int expect_result);
 static void update_mem(void);
 static void update_mem_commit(void);
+static void calculate_total_batch_size(void);
 
 static void setup(void)
 {
@@ -133,6 +128,9 @@ static void setup(void)
 	}
 
 	set_sys_tune("overcommit_ratio", overcommit_ratio, 1);
+
+	calculate_total_batch_size();
+	tst_res(TINFO, "TotalBatchSize is %ld kB", total_batch_size);
 }
 
 static void cleanup(void)
@@ -154,7 +152,7 @@ static void overcommit_memory_test(void)
 
 	update_mem_commit();
 	alloc_and_check(commit_left * 2, EXPECT_FAIL);
-	alloc_and_check(commit_limit, EXPECT_FAIL);
+	alloc_and_check(commit_limit + total_batch_size, EXPECT_FAIL);
 	update_mem_commit();
 	alloc_and_check(commit_left / 2, EXPECT_PASS);
 
@@ -210,7 +208,7 @@ static void alloc_and_check(long size, int expect_result)
 			tst_res(TFAIL, "alloc passed, expected to fail");
 		break;
 	default:
-		tst_brk(TBROK, "Invaild numbler parameter: %d",
+		tst_brk(TBROK, "Invalid number parameter: %d",
 			 expect_result);
 	}
 }
@@ -247,6 +245,28 @@ static void update_mem_commit(void)
 	}
 }
 
+static void calculate_total_batch_size(void)
+{
+	struct sysinfo info;
+	long ncpus = tst_ncpus_conf();
+	long pagesize = getpagesize();
+	SAFE_SYSINFO(&info);
+
+	/* see linux source mm/mm_init.c mm_compute_batch() (This is in pages) */
+	long batch_size = MAX(ncpus * 2,
+			MAX(32,
+				MIN(INT32_MAX,
+					(long)(info.totalram / pagesize) / ncpus / 256
+				)
+			)
+		);
+
+	/* there are ncpu separate counters, that can all grow up to
+	 * batch_size. So the maximum error for __vm_enough_memory is
+	 * batch_size * ncpus. */
+	total_batch_size = (batch_size * ncpus * pagesize) / KB;
+}
+
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = options,
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
