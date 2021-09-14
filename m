Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D840A956
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 10:35:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A69203C7920
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 10:35:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F0693C1D5D
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 10:35:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7392E1401200
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 10:35:09 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7420321E41;
 Tue, 14 Sep 2021 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631608508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBW8JpOpz5kC2rXsupL/10tyGyENOYJ1+ElmtrFUxQU=;
 b=l805a1nlj+uY1U7jQlbL8Kpq6dV3lQOoGgOFs2bDpZxXF+ZzGc8W4h2Qh00MtyVt+42zsX
 viSK29Fv251lgpW1ZBRa/bw5n12aLDlaZZHrS9DLoDqf4hZ8G4VtCbH+SgO4R3p/i73jDD
 rEtoKovu4Yg1Ke3MyY3zWC4O2hvB+oA=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 27266A3B94;
 Tue, 14 Sep 2021 08:35:08 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 09:34:43 +0100
Message-Id: <20210914083444.23848-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <a47ecbd7-ba4a-ff2c-ead9-e731040cb845@jv-coder.de>
References: <a47ecbd7-ba4a-ff2c-ead9-e731040cb845@jv-coder.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] memcg_subgroup_charge: Remove limiting of parent
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It is not important how much memory is assigned to the parent
group. The stated purpose of the test is to check no memory is
assigned to the child group.

Also add the usage stats for the memcg_process because it appears
the test will fail because the starting memory counter already
includes some buffer/cache on linux-next. I'm not sure this
is exactly what happens, but displaying the stats might help.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 .../controllers/memcg/functional/memcg_lib.sh    |  2 +-
 .../memcg/functional/memcg_subgroup_charge.sh    | 16 +++++-----------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index ac9ad8268..1b76b6597 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -240,7 +240,7 @@ signal_memcg_process()
 
 		loops=$((loops - 1))
 		if [ $loops -le 0 ]; then
-			tst_brk TBROK "timed out on memory.usage_in_bytes"
+			tst_brk TBROK "timed out on memory.usage_in_bytes" $usage $usage_start $size
 		fi
 	done
 }
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 3fa016102..cda624923 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -18,22 +18,16 @@ TST_CNT=3
 MEM_TO_ALLOC=$((PAGESIZES * 2))
 
 # Test the memory charge won't move to subgroup
-# $1 - memory.limit_in_bytes in parent group
-# $2 - memory.limit_in_bytes in sub group
+# $1 - memory.limit_in_bytes in sub group
 test_subgroup()
 {
-	local limit_parent=$1
-	local limit_subgroup=$2
+	local limit_subgroup=$1
 
-	if [ $limit_parent -ne 0 ]; then
-		limit_parent=$(memcg_adjust_limit_for_kmem $limit_parent)
-	fi
 	if [ $limit_subgroup -ne 0 ]; then
 		limit_subgroup=$(memcg_adjust_limit_for_kmem $limit_subgroup)
 	fi
 
 	ROD mkdir subgroup
-	EXPECT_PASS echo $limit_parent \> memory.limit_in_bytes
 	EXPECT_PASS echo $limit_subgroup \> subgroup/memory.limit_in_bytes
 
 	start_memcg_process --mmap-anon -s $MEM_TO_ALLOC
@@ -60,17 +54,17 @@ test_subgroup()
 test1()
 {
 	tst_res TINFO "Test that group and subgroup have no relationship"
-	test_subgroup $MEM_TO_ALLOC $((2 * MEM_TO_ALLOC))
+	test_subgroup $((2 * MEM_TO_ALLOC))
 }
 
 test2()
 {
-	test_subgroup $MEM_TO_ALLOC $MEM_TO_ALLOC
+	test_subgroup $MEM_TO_ALLOC
 }
 
 test3()
 {
-	test_subgroup $MEM_TO_ALLOC 0
+	test_subgroup 0
 }
 
 tst_run
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
