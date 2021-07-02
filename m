Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AFF3BA0BF
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E85253C91A7
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CCAB3C8259
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:51 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3BEBD1001388
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:51 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg2-0001dg-NI
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:50 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 y17-20020a0564023591b02903951740fab5so5067817edc.23
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjrAacdtq2FTFsLMbQ7Yx9oVs+AMtknBlsq+moz2cwI=;
 b=VTUHqZtnySV5UuhZfHcYv0hB0dtJnJVmr6LQDuNyQmy/4AeQhvzB8DNSCTskhiMHUR
 fAcsZ7JeQFo/X/3ws0QHGbB311cDDYRLXg7/p7Ya26cSn5yWzazJ1czJvkIhmwjfrcZW
 57YrhUrYEoRlEqarpvZnYU+PpMJ/P3zx6kCQLOCi+/zvRWGh8wGvoCiG490XQ3jWlF0c
 xczVu3WWzgEf7gpXhqGXwDMrVPdPMY218mn4kLUEgPaawEHZFpSRfhT3ANUENOpGpIbh
 G8G7QHwTrbNffiK7gHA7Yfyr+DHdJXFm3A//UvvTfbU4WBfw+naYiznj7OxcLkdRAyL2
 KWHQ==
X-Gm-Message-State: AOAM533v43SOGZZBLWyfGHMUT9AzMXm6fcTEAojypHqYurmElhEASzzB
 5ahWOtP8KDN17GXujXYYxzwR5EHPN08R6Hj06TbsOYiEXuI1K7ZW7YszA8KWwegmXC27e4gzmv7
 oUMAYMTPG6U7zQAAXOCh6DJNmun54
X-Received: by 2002:a17:906:26c7:: with SMTP id
 u7mr5067206ejc.211.1625230429961; 
 Fri, 02 Jul 2021 05:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxooUeIstHKdTO+/Y4Cw6o7e0Ik7IpPJzO1o3MqI5Xk4ICXuUAS8xZJDxHqPz7LHwAeOgFvjQ==
X-Received: by 2002:a17:906:26c7:: with SMTP id
 u7mr5067196ejc.211.1625230429796; 
 Fri, 02 Jul 2021 05:53:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:34 +0200
Message-Id: <20210702125338.43248-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/5] controllers/memcg: accept range of
 max_usage_in_bytes
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

Several Linux kernel versions report higher max_usage_in_bytes than
expected size of 1024 pages. For example v5.4, v5.8, v5.10
and 5.13.0-rc5:

    memcg_max_usage_in_bytes_test 1 TINFO: Test memory.max_usage_in_bytes
    memcg_max_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -s 4194304
    memcg_max_usage_in_bytes_test 1 TINFO: Warming up pid: 1393215
    memcg_max_usage_in_bytes_test 1 TINFO: Process is still here after warm up: 1393215
    memcg_max_usage_in_bytes_test 1 TFAIL: memory.max_usage_in_bytes is 4325376, 4194304 expected

It seems that recent Linux kernel caches the statistics more
aggressively (especially on multi-CPU systems) and the batch updates of
32 pages are visible in usage_in_bytes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_lib.sh | 20 +++++++++++++++++--
 .../memcg_max_usage_in_bytes_test.sh          |  3 ++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index d9bb6d94324d..4c47e63745ff 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -27,6 +27,15 @@ fi
 # Post 4.16 kernel updates stat in batch (> 32 pages) every time
 PAGESIZES=$(($PAGESIZE * 33))
 
+# On recent Linux kernels (at least v5.4) updating stats happens in batches
+# (PAGESIZES) and also might depend on workload and number of CPUs.  The kernel
+# caches the data and does not prioritize stats precision.  This is especially
+# visible for max_usage_in_bytes where it usually exceeds
+# actual memory allocation.
+# When checking for usage_in_bytes and max_usage_in_bytes accept also higher values
+# from given range:
+MEM_USAGE_RANGE=$((PAGESIZES))
+
 HUGEPAGESIZE=$(awk '/Hugepagesize/ {print $2}' /proc/meminfo)
 [ -z $HUGEPAGESIZE ] && HUGEPAGESIZE=0
 HUGEPAGESIZE=$(($HUGEPAGESIZE * 1024))
@@ -140,7 +149,8 @@ shmmax_cleanup()
 
 # Check size in memcg
 # $1 - Item name
-# $2 - Expected size
+# $2 - Expected size lower bound
+# $3 - Expected size upper bound (optional)
 check_mem_stat()
 {
 	local item_size
@@ -151,7 +161,13 @@ check_mem_stat()
 		item_size=$(grep -w $1 memory.stat | cut -d " " -f 2)
 	fi
 
-	if [ "$2" = "$item_size" ]; then
+	if [ "$3" ]; then
+		if [ $item_size -ge $2 ] && [ $item_size -le $3 ]; then
+			tst_res TPASS "$1 is ${2}-${3} as expected"
+		else
+			tst_res TFAIL "$1 is $item_size, ${2}-${3} expected"
+		fi
+	elif [ "$2" = "$item_size" ]; then
 		tst_res TPASS "$1 is $2 as expected"
 	else
 		tst_res TFAIL "$1 is $item_size, $2 expected"
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index 14daa4651798..8831f1937070 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -12,6 +12,7 @@ TST_CNT=4
 . memcg_lib.sh
 
 MEM_TO_ALLOC=$((PAGESIZE * 1024))
+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
 MEM_LIMIT=$((MEM_TO_ALLOC * 2))
 
 # Run test cases which checks memory.[memsw.]max_usage_in_bytes after make
@@ -32,7 +33,7 @@ test_max_usage_in_bytes()
 	signal_memcg_process $MEM_TO_ALLOC
 	signal_memcg_process $MEM_TO_ALLOC
 
-	check_mem_stat $item $MEM_TO_ALLOC
+	check_mem_stat $item $MEM_TO_ALLOC $MEM_EXPECTED_UPPER
 
 	if [ $check_after_reset -eq 1 ]; then
 		echo 0 > $item
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
