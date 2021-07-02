Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5153BA0C0
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4773F3C8DF5
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87D403C85FB
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:52 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E00F9100138C
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:51 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg3-0001dm-CR
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:51 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 d21-20020a1709063455b02904c609ed19f1so3504600ejb.11
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BAGDm7sO8AaVWva1MqnCDz6ccowRFyCCU1iqrGX4Z58=;
 b=o4FWMdhGs0TsW0I8JVxvWXdkjCv///jXMVnPKicQq47g5JLJgt9RzgfnrASZAEdZxm
 sD/V4eIi7Uiu6RfIZXq83B/4eFn5sgJDEH1lnIfvgR/nj0xPsxgc9baGQqomskKo40ad
 jGRW/DFtLNIjicf0hsQHD/z6pe3n/JZACEdF0C2svyhgkuwIc748YLgqEdoyNUAssEov
 sCM2S7rZt9Gumb/ShBdN+dCCvETF3SZ99/1w3l/iOmqrDwdi7YeNyHwcsrNSB/DIsj1a
 HpSGKN616des8LkUOdKWjh6coiNPEhTW9Sr4hRWt8lcmoR8imL+1khLtWTdOf3G/V45p
 I2cw==
X-Gm-Message-State: AOAM530VZotEUiX6wdd6DjwsxtvPpRNJJazrF2SfgJOYhody4/vo9eWo
 gkKbQDfFWNQmhc101Q1hWFdi6LcuOAPiSALZDLa38efVbaA8p62xvFiaWoVTpFpwVEDuOFNiRuq
 zm8TroJoMlRfNJqxFeBhcdkpnSBTF
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr5252747ejc.41.1625230430696; 
 Fri, 02 Jul 2021 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd2fpzbouKK1z8MxctmIgGwUOw9hniScYlrF40h1/iqWMQrdweF92gkWaaQ9uGQExgAJ7oRw==
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr5252729ejc.41.1625230430434; 
 Fri, 02 Jul 2021 05:53:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:35 +0200
Message-Id: <20210702125338.43248-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/5] controllers/memcg: accept range of
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

It seems that recent Linux kernel caches the statistics more
aggressively (especially on multi-CPU systems) and the batch updates of
32 pages are visible in usage_in_bytes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_lib.sh | 11 +++++++---
 .../memcg/functional/memcg_stat_rss.sh        | 20 +++++++++----------
 .../memcg/functional/memcg_stat_test.sh       |  8 ++++----
 .../functional/memcg_usage_in_bytes_test.sh   |  7 +++++--
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index 4c47e63745ff..9634eb7e9f42 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -248,8 +248,9 @@ test_mem_stat()
 	local size=$2
 	local total_size=$3
 	local stat_name=$4
-	local exp_stat_size=$5
-	local check_after_free=$6
+	local exp_stat_size_low=$5
+	local exp_stat_size_up=$6
+	local check_after_free=$7
 
 	start_memcg_process $memtypes -s $size
 
@@ -260,7 +261,11 @@ test_mem_stat()
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
index e77d6bf2ef23..9140fd9d1fd7 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
@@ -12,13 +12,15 @@ TST_CNT=2
 . memcg_lib.sh
 
 MEM_TO_ALLOC=$((PAGESIZE * 1024))
+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
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
@@ -29,7 +31,8 @@ test2()
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
