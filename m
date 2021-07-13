Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3963C6D35
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8392D3C75D2
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA9F13C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:18 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7CD95600266
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:18 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 04D8C4061A
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168138;
 bh=BAGDm7sO8AaVWva1MqnCDz6ccowRFyCCU1iqrGX4Z58=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Nc16BgwarFj59WgeoHd4XkyxhQQcmCt/wEqqDUPvURqaLZYzKNeMiFR/0od3r2v0X
 VeaEX6QhjpZjtbwxotGgH87PVEXgHWqH9xDQKbmQ7ob/MYshWYv324AN/5CB7diP7y
 RpI0dVFN6wUSllGS4NK3TEX0XPntRCfFtigZrKGPAxNqXqAz7id35PXauX36ltFkDP
 4Tr61zB0sRO8RzXbnx8ELo72MRPPl6rXSGI9ffdEBE0uHK/bKBckVeJxj8D+6tmsIE
 pFFtiPJYCgOBvIN//hFl5XeKlZqq5rDgL26SeR2vFox6QRwbX+BsLKufETMFhZfiVM
 R6c8nr1sosCAw==
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so8422696wrs.11
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BAGDm7sO8AaVWva1MqnCDz6ccowRFyCCU1iqrGX4Z58=;
 b=kcy/+gBwwiE6w33gyr5oWYNvZpABqlBEneXruF1SNMPKgfPb1O7t/Jz/mcKPBVNUaS
 /K+bPCwKQumacRjzuE3hfNEJuuwXIQvKMtD2UKayQnhej70mZh1BFQMQC4+OZs6pIIx6
 T4ETCmL8HOzaiKnTOn8hWYxp6CCIRBbuCO3iZtHArVIPLSsxiHv8guufnTHarlm76Icm
 2mCyqoEphHbPLpw6t6CKry87nygPJrE1RYhWv2OB0wENEUtNxXmG3ap9w4mzph3+joEp
 ZUSNtqSR0/BRi0hEoPmhbggULKbhF2iCgOkXJHpXhBa90u8DOssCcL2Y0sfk+b1rfXIF
 4iUQ==
X-Gm-Message-State: AOAM5321oCPrlUkTbHN9nkYa0rvnGHquKGsAkZ3GXmfUY3ZwTeJ7AfWm
 c/8tbIuHaWS4dpEeS9reY8fOZ3P3ZxW8pn4fqG0vmDqJ+lSGgRsXjnlmSLFaDifiwy9ZkctHsSf
 ce1ZbrlNdGyYEs66YOsz2BEzEWsdf
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr4343727wrn.117.1626168137507; 
 Tue, 13 Jul 2021 02:22:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzse7IIa4XRWGU7nsU7koNHs57Ua2PMSOw11nWx+pcnJb1a/e0/k/UhjKJkTSpQM0uIrTKM/w==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr4343708wrn.117.1626168137339; 
 Tue, 13 Jul 2021 02:22:17 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:07 +0200
Message-Id: <20210713092210.17141-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/5] controllers/memcg: accept range of
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
