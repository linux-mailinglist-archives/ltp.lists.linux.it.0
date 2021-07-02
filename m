Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E738D3BA0C3
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 684633C85FC
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5EFE73C8E02
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:56 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E123A600435
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:55 +0200 (CEST)
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg7-0001eJ-Ck
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:55 +0000
Received: by mail-ed1-f72.google.com with SMTP id
 n13-20020a05640206cdb029039589a2a771so5050246edy.5
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EDC46LT3O4aj/p1iWKMRPSHT/vLiU3fXF+N8pBk1030=;
 b=snSPKFgSWvJYXYVjR3CQMmlr0kJdRuFKsj7CscBB2FyhDAO01odwRRsbm62WWt6AXe
 uwf4rM6pIcfJFrZnCl69wMfNxTNwEscVSKmBHSeU184MvNhF0YHbYSFSQ4gAXU15a27o
 O/wJykOkWqGCn+BBsGg+XuethFw63OZ3cOymeeSszim6bdceno13xInMZjViNCtOkI55
 u0sxEFb9BVNv4StAC9aLYvZBBpXqerVIg/ELXycMjN8gfJLfVMmpCDTZqE3Qx/Qf+Zzj
 byWDv3f1OYgBJvhI1HgMDH2hvB1UHB0YpkB9H+V7D2THOA4izXOz4o5iI8mnr5iDX2fG
 RsbA==
X-Gm-Message-State: AOAM533g5dXY/TKBYonwvUxOen4trcnPqYD4gUsPZG3vf0Z1YkVGRMEe
 s27xy71FQbh+yMOSu//vKBuDy5XifJ87SMNQPyQXDSXAExT4AIxMAsf1/hm8cJJadAISJtiPZrP
 Eix9RW26HNPfprRkucYVGKn70o5ec
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr5069691ejo.394.1625230434486; 
 Fri, 02 Jul 2021 05:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw5q6quc4W67f/D+p9q7d9H/yZ0XQcKCQ6JrMuKAPYYWKc0qzj/2Cb948ICj167eW9Upfr/Q==
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr5069677ejo.394.1625230434326; 
 Fri, 02 Jul 2021 05:53:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:38 +0200
Message-Id: <20210702125338.43248-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 5/5] controllers/memcg: offset kernel memory
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

The memory allocated by kernel with __GFP_ACCOUNT is counted as well in
memory group usage limits.  Add it to fix failures like:

    memcg_max_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -s 4194304
    memcg_max_usage_in_bytes_test 1 TINFO: Warming up pid: 925811
    memcg_max_usage_in_bytes_test 1 TINFO: Process is still here after warm up: 925811
    memcg_max_usage_in_bytes_test 1 TFAIL: memory.max_usage_in_bytes is 4333568, 4194304-4325376 expected

    (where memory.kmem.max_usage_in_bytes:8192)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_lib.sh     | 10 ++++++++++
 .../functional/memcg_max_usage_in_bytes_test.sh   | 15 ++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index 9634eb7e9f42..dad66c798e19 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -251,6 +251,7 @@ test_mem_stat()
 	local exp_stat_size_low=$5
 	local exp_stat_size_up=$6
 	local check_after_free=$7
+	local kmem_stat_name="${stat_name##*.}"
 
 	start_memcg_process $memtypes -s $size
 
@@ -261,6 +262,15 @@ test_mem_stat()
 	echo $MEMCG_PROCESS_PID > tasks
 	signal_memcg_process $size
 
+	if [ "$kmem_stat_name" = "max_usage_in_bytes" ] ||
+	   [ "$kmem_stat_name" = "usage_in_bytes" ]; then
+		local kmem=$(cat "memory.kmem.${kmem_stat_name}")
+		if [ $? -eq 0 ]; then
+			exp_stat_size_low=$((exp_stat_size_low + kmem))
+			exp_stat_size_up=$((exp_stat_size_up + kmem))
+		fi
+	fi
+
 	if [ "$exp_stat_size_low" = "$exp_stat_size_up" ]; then
 		check_mem_stat $stat_name $exp_stat_size_low
 	else
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index 2d494ac3a78f..24e9d115c19e 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -22,6 +22,10 @@ test_max_usage_in_bytes()
 	local item="memory.max_usage_in_bytes"
 	[ $1 -eq 1 ] && item="memory.memsw.max_usage_in_bytes"
 	local check_after_reset=$2
+	local exp_stat_size_low=$MEM_TO_ALLOC
+	local exp_stat_size_up=$MEM_EXPECTED_UPPER
+	local kmem_stat_name="${item##*.}"
+
 	start_memcg_process --mmap-anon -s $MEM_TO_ALLOC
 
 	warmup
@@ -33,7 +37,16 @@ test_max_usage_in_bytes()
 	signal_memcg_process $MEM_TO_ALLOC
 	signal_memcg_process $MEM_TO_ALLOC
 
-	check_mem_stat $item $MEM_TO_ALLOC $MEM_EXPECTED_UPPER
+	if [ "$kmem_stat_name" = "max_usage_in_bytes" ] ||
+	   [ "$kmem_stat_name" = "usage_in_bytes" ]; then
+		local kmem=$(cat "memory.kmem.${kmem_stat_name}")
+		if [ $? -eq 0 ]; then
+			exp_stat_size_low=$((exp_stat_size_low + kmem))
+			exp_stat_size_up=$((exp_stat_size_up + kmem))
+		fi
+	fi
+
+	check_mem_stat $item $exp_stat_size_low $exp_stat_size_up
 
 	if [ $check_after_reset -eq 1 ]; then
 		echo 0 > $item
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
