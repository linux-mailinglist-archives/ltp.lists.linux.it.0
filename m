Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3A3C6D34
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEB4A3C876F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 988FB3C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:18 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8C18D200AC3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:17 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D34F9405D1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168136;
 bh=hjrAacdtq2FTFsLMbQ7Yx9oVs+AMtknBlsq+moz2cwI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=POGO2YKIytKId+tReHYZLUUpdqD+bK4NK0Ak7dTWrF8N4FyOvqm91YQxCxtIK2IXk
 12SANBQe4nHnGEodxEjoJ1ehnHs7+IujpxyODpVHUH+vvw8+7PZm/RZPcnfDl/caK8
 sX2OTk9MvyqsfN/rV8Bq5QqmsP3g3j6XUgFatJ8h5C03DMnbDbZhZ65aTFEQ/ng3gK
 v/9oLmJ2javeDmwcfM1L/rumzwSFa0/qLWZdeFdd2hiC/jv1tK1sXHIu+Bt15uZMb4
 iiykrjGoVM4yZz3/ECZwdk25r5lD+pk1kEVVKTWncSpDilRDnipHNEU3+k8ZvdFx7I
 Id6ch2IiS+pYA==
Received: by mail-wm1-f71.google.com with SMTP id
 m6-20020a05600c4f46b0290205f5e73b37so1169919wmq.3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjrAacdtq2FTFsLMbQ7Yx9oVs+AMtknBlsq+moz2cwI=;
 b=JC283bqx6Y8G344lY0BxHUu/vXb20m0xBNjnMjtTkQ3EuRjBHFLiNcbuMh6IHz+HmF
 voP3ebMYnCzEapuVQcU4YPMvIfyVIrPZpFHxMK4twNJBhfs7He1/qInVG7nbzZMYZNHr
 y7mPusgMoaTUFymV3SBy36UrnDujKxugW7dnURklyH8Xm0eg5oxrgwfHoEtrGCxVzWjX
 qTIW1i12WZ/iA9m7iaFGgNmvJU/JydjFPmrZN+z/2jo08cLtd0IPk6RuoA/O6ZBIwKVD
 ArJqVlVswHavtXZNAtblo3ObBIdzHdag2n4BZrNMIEHy4WrVoHspKR/pPZIqN+tl3M2I
 31QA==
X-Gm-Message-State: AOAM533IQpJyYk2zFIAWP+1yKOIy5xUjLZAwAGF4ZNMsRdAOWNEoa5/C
 XU6aXEm6eH9AKd6wRdjh4sZGImXjvLFBZyMDa6BncRRV1LDRKaCg5Dw0ZU87hFE9MZexKu8rYav
 nso+1IEgdSGCr818BsJ9mFkky9XzJ
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr19145072wmo.126.1626168136376; 
 Tue, 13 Jul 2021 02:22:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw86hBUezVeE6wH7TPXwaXW2RD3VuJDxCKu8buUl76EPziyOq0Bt6NFnyElsVNvVC/8bHq8eg==
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr19145066wmo.126.1626168136240; 
 Tue, 13 Jul 2021 02:22:16 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:06 +0200
Message-Id: <20210713092210.17141-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/5] controllers/memcg: accept range of
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
