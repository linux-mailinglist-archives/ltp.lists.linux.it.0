Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F531CA9D
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 13:38:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C31E23C66DA
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 13:38:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5F14E3C2BEF
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 13:38:56 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B53101A0011F
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 13:38:55 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 789E6A07FA;
 Tue, 16 Feb 2021 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1613479133; bh=oqcpnP+M50HgcJDkGBjHt8JWvA+hJtjln9O5Ay9kyxM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ALNG1ADN5J1RnZve7n8g8Vxn5L2sMlT77T3ovVvHA3B/31KNPWrK8EjR2dx/oYhNm
 MqH/Fui7Ac8SUo9Cc9IQ7FB3Z5Apm+KymNQXizORYn3JiOgl9r3Uqjf31oYGCfoCY1
 yOzGRTHhZ2HOYRwxLqDr7v59+8lJSO4SUXqpvSeg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 16 Feb 2021 13:38:41 +0100
Message-Id: <20210216123841.3424969-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] memcg/stat_test: Use more memory for tests
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

f0b9d187d increased the memory used by a lot of
memcg tests to 33*pagesize, because some counters in
memory.stat are only updated in batches of 32.
With kernel commit 766a4c19d this batching is also applied
to some more counters.

Use 33 * pagesize for all test now should make them pass
before and after this commit.

Fixes: #780
This should also fix part of #93 and #783

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../memcg/functional/memcg_stat_test.sh       | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index 3a6239134..cc4550cb6 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -27,15 +27,15 @@ test2()
 test3()
 {
 	tst_res TINFO "Test unevictable with MAP_LOCKED"
-	test_mem_stat "--mmap-lock1" $PAGESIZE $PAGESIZE \
-		"unevictable" $PAGESIZE false
+	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES \
+		"unevictable" $PAGESIZES false
 }
 
 test4()
 {
 	tst_res TINFO "Test unevictable with mlock"
-	test_mem_stat "--mmap-lock2" $PAGESIZE $PAGESIZE \
-		"unevictable" $PAGESIZE false
+	test_mem_stat "--mmap-lock2" $PAGESIZES $PAGESIZES \
+		"unevictable" $PAGESIZES false
 }
 
 test5()
@@ -44,11 +44,11 @@ test5()
 	echo 1 > memory.use_hierarchy
 
 	mkdir subgroup
-	echo $PAGESIZE > memory.limit_in_bytes
-	echo $((PAGESIZE*2)) > subgroup/memory.limit_in_bytes
+	echo $PAGESIZES > memory.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
 	cd subgroup
-	check_mem_stat "hierarchical_memory_limit" $PAGESIZE
+	check_mem_stat "hierarchical_memory_limit" $PAGESIZES
 
 	cd ..
 	rmdir subgroup
@@ -62,11 +62,11 @@ test6()
 	echo 0 > memory.use_hierarchy
 
 	mkdir subgroup
-	echo $PAGESIZE > memory.limit_in_bytes
-	echo $((PAGESIZE * 2)) > subgroup/memory.limit_in_bytes
+	echo $PAGESIZES > memory.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
 	cd subgroup
-	check_mem_stat "hierarchical_memory_limit" $((PAGESIZE * 2))
+	check_mem_stat "hierarchical_memory_limit" $((PAGESIZES * 2))
 
 	cd ..
 	rmdir subgroup
@@ -80,13 +80,13 @@ test7()
 	ROD echo 1 \> memory.use_hierarchy
 
 	mkdir subgroup
-	echo $PAGESIZE > memory.limit_in_bytes
-	echo $PAGESIZE > memory.memsw.limit_in_bytes
-	echo $((PAGESIZE*2)) > subgroup/memory.limit_in_bytes
-	echo $((PAGESIZE*2)) > subgroup/memory.memsw.limit_in_bytes
+	echo $PAGESIZES > memory.limit_in_bytes
+	echo $PAGESIZES > memory.memsw.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.memsw.limit_in_bytes
 
 	cd subgroup
-	check_mem_stat "hierarchical_memsw_limit" $PAGESIZE
+	check_mem_stat "hierarchical_memsw_limit" $PAGESIZES
 
 	cd ..
 	rmdir subgroup
@@ -101,13 +101,13 @@ test8()
 	ROD echo 0 \> memory.use_hierarchy
 
 	mkdir subgroup
-	echo $PAGESIZE > memory.limit_in_bytes
-	echo $PAGESIZE > memory.memsw.limit_in_bytes
-	echo $((PAGESIZE*2)) > subgroup/memory.limit_in_bytes
-	echo $((PAGESIZE*2)) > subgroup/memory.memsw.limit_in_bytes
+	echo $PAGESIZES > memory.limit_in_bytes
+	echo $PAGESIZES > memory.memsw.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	echo $((PAGESIZES * 2)) > subgroup/memory.memsw.limit_in_bytes
 
 	cd subgroup
-	check_mem_stat "hierarchical_memsw_limit" $((PAGESIZE*2))
+	check_mem_stat "hierarchical_memsw_limit" $((PAGESIZES * 2))
 
 	cd .
 	rmdir subgroup
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
