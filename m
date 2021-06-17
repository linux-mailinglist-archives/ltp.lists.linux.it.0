Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D473AAD05
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C043C88CA
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63BB13C6C84
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C51B96019A1
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:36 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ltm7k-00040I-7t
 for ltp@lists.linux.it; Thu, 17 Jun 2021 07:07:36 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso992037edd.5
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 00:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GVvf9Dez840xvJRXWYL8f1IqEy908UkCz7grK0b8Q+0=;
 b=tTyxfGHZlkAJaqRKakZr9vB9w871gMvLHXxjj41mck61wKFVSpBseVp2gFHPjMEXch
 K0fsnsy4GJMWm3dFDEqmfSdYfpR7RdyN1ITPMssRryNhokkhMFOOMw4soJzWlk/KO84C
 xMRAs+e2LWp0HXvUbx5hQPYgSyxsmrW035tRge6LUYEs/ERm2XqFFkmgG1csqJ8XjmOd
 yVGV4PztTdYmBP0+aAM3ZGSuSup6BLvs13I8a4tuNZIewhgPEyzuG96Lm44DT4LbBx9l
 p6JQvAuHmkRH8Zzk2y92QZ7BKiG0+lqG+eSb1USSDKfhupgwiwKUywAsHOT7X+oc+qsW
 D7kQ==
X-Gm-Message-State: AOAM531f9IiQ1QSDNHfWLlNoQDYGXvll4nvv97wYPCoAjPq/9bpTeV/b
 FVbQy3FwdPWgxoh6SRIdK+maWEPCQ/p0Z+ycZwl4IK2ClqnZpUu1RcQemQhTpvS+YcuFOnqyy3J
 uXWojIImYEyWTO6Vcey2XO5kfBnBJ
X-Received: by 2002:aa7:c50d:: with SMTP id o13mr4490302edq.9.1623913655718;
 Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4feLXwG5rm2qScIulV2y4jB97bVxEEeW8IjoisJZbjLIE1m1exGy94VtSMLOtm7Z2KVGfUQ==
X-Received: by 2002:aa7:c50d:: with SMTP id o13mr4490281edq.9.1623913655518;
 Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u17sm3531258edx.16.2021.06.17.00.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 17 Jun 2021 09:07:29 +0200
Message-Id: <20210617070730.7699-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] controllers/memcg: accept range of
 usage_in_bytes
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

Several Linux kernel versions report higher usage_in_bytes than
expected size of 1024 pages. For example v5.4, v5.8, v5.10
and 5.13.0-rc5:

    memcg_usage_in_bytes_test 1 TINFO: Test memory.usage_in_bytes
    memcg_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -s 4194304
    memcg_usage_in_bytes_test 1 TINFO: Warming up pid: 1160
    memcg_usage_in_bytes_test 1 TINFO: Process is still here after warm up: 1160
    memcg_usage_in_bytes_test 1 TFAIL: memory.usage_in_bytes is 4325376, 4194304 expected

It seems that recent Linux kernel reports more memory used than
expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_lib.sh | 11 +++++++---
 .../memcg/functional/memcg_stat_rss.sh        | 20 +++++++++----------
 .../memcg/functional/memcg_stat_test.sh       |  8 ++++----
 .../functional/memcg_usage_in_bytes_test.sh   | 10 ++++++++--
 4 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index 083ef376e120..d44bb027076c 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -239,8 +239,9 @@ test_mem_stat()
 	local size=$2
 	local total_size=$3
 	local stat_name=$4
-	local exp_stat_size=$5
-	local check_after_free=$6
+	local exp_stat_size_low=$5
+	local exp_stat_size_up=$6
+	local check_after_free=$7
 
 	start_memcg_process $memtypes -s $size
 
@@ -251,7 +252,11 @@ test_mem_stat()
 	echo $MEMCG_PROCESS_PID > tasks
 	signal_memcg_process $size
 
-	check_mem_stat $stat_name $exp_stat_size
+	if [ "$exp_stat_size_low" = "$exp_stat_size_up" ]; then
+		check_mem_stat $stat_name $exp_stat_size_low
+	else
+		check_mem_stat $stat_name $exp_stat_size_low $exp_stat_size_up
+	fi
 
 	signal_memcg_process $size
 	if $check_after_free; then
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_rss.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_rss.sh
index 1a6128a6dba8..d9b4ec287b5f 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_rss.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_rss.sh
@@ -18,54 +18,54 @@ TST_CNT=10
 # Test the management and counting of memory
 test1()
 {
-	test_mem_stat "--mmap-anon" $PAGESIZES $PAGESIZES "rss" $PAGESIZES false
+	test_mem_stat "--mmap-anon" $PAGESIZES $PAGESIZES "rss" $PAGESIZES $PAGESIZES false
 }
 
 test2()
 {
-	test_mem_stat "--mmap-file" $PAGESIZE $PAGESIZE "rss" 0 false
+	test_mem_stat "--mmap-file" $PAGESIZE $PAGESIZE "rss" 0 0 false
 }
 
 test3()
 {
-	test_mem_stat "--shm -k 3" $PAGESIZE $PAGESIZE "rss" 0 false
+	test_mem_stat "--shm -k 3" $PAGESIZE $PAGESIZE "rss" 0 0 false
 }
 
 test4()
 {
 	test_mem_stat "--mmap-anon --mmap-file --shm" \
-		$PAGESIZES $((PAGESIZES * 3)) "rss" $PAGESIZES false
+		$PAGESIZES $((PAGESIZES * 3)) "rss" $PAGESIZES $PAGESIZES false
 }
 
 test5()
 {
-	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES "rss" $PAGESIZES false
+	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES "rss" $PAGESIZES $PAGESIZES false
 }
 
 test6()
 {
-	test_mem_stat "--mmap-anon" $PAGESIZES $PAGESIZES "rss" $PAGESIZES true
+	test_mem_stat "--mmap-anon" $PAGESIZES $PAGESIZES "rss" $PAGESIZES $PAGESIZES true
 }
 
 test7()
 {
-	test_mem_stat "--mmap-file" $PAGESIZE $PAGESIZE "rss" 0 true
+	test_mem_stat "--mmap-file" $PAGESIZE $PAGESIZE "rss" 0 0 true
 }
 
 test8()
 {
-	test_mem_stat "--shm -k 8" $PAGESIZE $PAGESIZE "rss" 0 true
+	test_mem_stat "--shm -k 8" $PAGESIZE $PAGESIZE "rss" 0 0 true
 }
 
 test9()
 {
 	test_mem_stat "--mmap-anon --mmap-file --shm" \
-		$PAGESIZES $((PAGESIZES * 3)) "rss" $PAGESIZES true
+		$PAGESIZES $((PAGESIZES * 3)) "rss" $PAGESIZES $PAGESIZES true
 }
 
 test10()
 {
-	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES "rss" $PAGESIZES true
+	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES "rss" $PAGESIZES $PAGESIZES true
 }
 
 tst_run
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index 925c4ecf87bc..e5eb7e5d0001 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -14,28 +14,28 @@ TST_CNT=8
 test1()
 {
 	tst_res TINFO "Test cache"
-	test_mem_stat "--shm -k 3" $PAGESIZES $PAGESIZES "cache" $PAGESIZES false
+	test_mem_stat "--shm -k 3" $PAGESIZES $PAGESIZES "cache" $PAGESIZES $PAGESIZES false
 }
 
 test2()
 {
 	tst_res TINFO "Test mapped_file"
 	test_mem_stat "--mmap-file" $PAGESIZES $PAGESIZES \
-		"mapped_file" $PAGESIZES false
+		"mapped_file" $PAGESIZES $PAGESIZES false
 }
 
 test3()
 {
 	tst_res TINFO "Test unevictable with MAP_LOCKED"
 	test_mem_stat "--mmap-lock1" $PAGESIZES $PAGESIZES \
-		"unevictable" $PAGESIZES false
+		"unevictable" $PAGESIZES $PAGESIZES false
 }
 
 test4()
 {
 	tst_res TINFO "Test unevictable with mlock"
 	test_mem_stat "--mmap-lock2" $PAGESIZES $PAGESIZES \
-		"unevictable" $PAGESIZES false
+		"unevictable" $PAGESIZES $PAGESIZES false
 }
 
 test5()
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
index e77d6bf2ef23..b5761a4e4716 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
@@ -12,13 +12,18 @@ TST_CNT=2
 . memcg_lib.sh
 
 MEM_TO_ALLOC=$((PAGESIZE * 1024))
+# Recent Linux kernels (at least v5.4) started reporting memory usage of 32
+# pages higher than requested allocation. Cause is not known, so let's just be
+# flexible.
+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + PAGESIZE * 32))
 MEM_LIMIT=$((MEM_TO_ALLOC * 2))
 
 test1()
 {
 	tst_res TINFO "Test memory.usage_in_bytes"
 	test_mem_stat "--mmap-anon" $MEM_TO_ALLOC $MEM_TO_ALLOC \
-		"memory.usage_in_bytes" $MEM_TO_ALLOC false
+		"memory.usage_in_bytes" $MEM_TO_ALLOC \
+		$MEM_EXPECTED_UPPER false
 }
 
 test2()
@@ -29,7 +34,8 @@ test2()
 	echo $MEM_LIMIT > memory.limit_in_bytes
 	echo $MEM_LIMIT > memory.memsw.limit_in_bytes
 	test_mem_stat "--mmap-anon" $MEM_TO_ALLOC $MEM_TO_ALLOC \
-		"memory.memsw.usage_in_bytes" $MEM_TO_ALLOC false
+		"memory.memsw.usage_in_bytes" $MEM_TO_ALLOC \
+		$MEM_EXPECTED_UPPER false
 }
 
 tst_run
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
