Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F7F0EC5
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 07:18:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C40BB3C23C1
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 07:18:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7C2823C0E60
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 07:18:23 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C1781A013BE
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 07:18:22 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.176])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 06D4E9F747;
 Wed,  6 Nov 2019 06:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1573021101; bh=4nAG5Mw9OfH+FK3aeaPxFuT+bKrBhHGGxQvsEka0scM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=uKUbmRcuhR6aKzg4uvE6doGcyBSJCZcnkfGZz5QFgxLYb5bQrnurab5TaiMJFm8Yl
 BqyZIWN6rDd0qpPv38StF9lpIsUlkJgxa+c0XiTpc91v1U3UR6XJBdxsnw+7/aNnOc
 pxg5U4juZX6iAE4nnM5fquT/HziYYqIJc4GkhslU=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  6 Nov 2019 07:18:08 +0100
Message-Id: <20191106061808.67330-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] memcg_subgroup_charge: Remove memory limitation
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

The test is supposed to verify, that memory used by a task
is not migrated to a subgroup, when the task is migrated.
In order to test this, it is not required, to limit
the memory at all, because accounting is done anyway and
the test checks the memory statistics.

Therefore all memory limiting is removed. This also gets
rid of a faulty assumption when writing the test:
The test allocates 33 pages using mmap. It is expected,
that it does not need more than 33 * pagesize of memory.
But sometimes the kernel has to allocate new page tables.
This is accounted as kmem AND user memory.
(See kernel doc cgroup-v1/memory.txt section 2.7)
If this happend, the test failed, if the system has no swap,
because the oom killer kills the process.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../kernel/controllers/memcg/functional/memcg_lib.sh |  4 ----
 .../memcg/functional/memcg_subgroup_charge.sh        | 12 +-----------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index aadaae4d2..aec8a00ab 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -404,13 +404,9 @@ test_hugepage()
 }
 
 # Test the memory charge won't move to subgroup
-# $1 - memory.limit_in_bytes in parent group
-# $2 - memory.limit_in_bytes in sub group
 test_subgroup()
 {
 	mkdir subgroup
-	echo $1 > memory.limit_in_bytes
-	echo $2 > subgroup/memory.limit_in_bytes
 
 	tst_resm TINFO "Running memcg_process --mmap-anon -s $PAGESIZES"
 	memcg_process --mmap-anon -s $PAGESIZES &
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 9b11f7b58..98e5ad68d 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -26,7 +26,7 @@
 ################################################################################
 
 TCID="memcg_subgroup_charge"
-TST_TOTAL=3
+TST_TOTAL=1
 
 . memcg_lib.sh
 
@@ -36,15 +36,5 @@ testcase_1()
 	test_subgroup $PAGESIZES $((2*PAGESIZES))
 }
 
-testcase_2()
-{
-	test_subgroup $PAGESIZES $PAGESIZES
-}
-
-testcase_3()
-{
-	test_subgroup $PAGESIZES 0
-}
-
 run_tests
 tst_exit
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
