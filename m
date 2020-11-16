Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D72B446C
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:09:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14BAB3C5F8C
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:09:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D0E0D3C4F46
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:09:25 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5FC8D600B29
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:09:25 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 44040A0807;
 Mon, 16 Nov 2020 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605532164; bh=TMvRGpBd1kErgoiCRKw2zN58HGnfXrws4mYz2pW36Qk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=O5J5yFFKfWHTguf10B5kjB5v2+VdJRyz24oJgT4fLAUezTO2JH9kaJ4sKFHi31aFQ
 GG5M1NcwOt50GMhxSwHXCYshNISua6swMc7ptfzsQk0ISB0mgY3X5AP0k+yX2qQAnr
 U5mmTWDCFxOw23xqNSnzdV0kwbpTi4O6exDueplY=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 14:09:15 +0100
Message-Id: <20201116130915.18264-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116130915.18264-1-lkml@jv-coder.de>
References: <20201116130915.18264-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] overcommit_memory: Remove unstable subtest
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

The test sets overcommit policy to never overcommit and then tries
to allocate all possible memory. This should fail, since there is already
some memory allocated for running the test programm, but due to inaccurate
memory accounting in mm/util.c __vm_enough_memory(), the allocation can still
succeed.
The commited memory is stored in a percpu counter, that counts in 1 + ncpu
variables. For small allocations and deallocations, the memory is counted
in a counter per cpu, without locking. For larger (de-)allocations, it is
counted in a unified counter under lock. This can lead to this szenario:
The counters for each cpu account for all used memory, while the unified
counter might even be negative (because it only registered deallocations).
The function __vm_enough_memory() takes only the unified counter into
account and truncates negative values. This leads to the successfull
allocation of commit_limit sometimes.
This may be a design decision to prevent lock contention, since the more
accurate percpu_counter_sum (in contrast to percpu_counter_read_positive)
needs to lock the spinlock in order to get correct values.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/mem/tunable/overcommit_memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
index f77939908..3ce0f05c8 100644
--- a/testcases/kernel/mem/tunable/overcommit_memory.c
+++ b/testcases/kernel/mem/tunable/overcommit_memory.c
@@ -154,7 +154,6 @@ static void overcommit_memory_test(void)
 
 	update_mem_commit();
 	alloc_and_check(commit_left * 2, EXPECT_FAIL);
-	alloc_and_check(commit_limit, EXPECT_FAIL);
 	update_mem_commit();
 	alloc_and_check(commit_left / 2, EXPECT_PASS);
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
