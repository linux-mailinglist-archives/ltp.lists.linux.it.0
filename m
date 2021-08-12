Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB053EA024
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41FEF3C6EF7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B3A633C6B1B
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:25 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 36710601485
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:24 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 837863F0F8
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755404;
 bh=WnbDGIS+NTForXDYjb/XnsB5jMW8WW/5CuRwbmUxDhA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eotXwSeWDU8vpP6h010pME/zEGjdwqSaKq4s66rwdBWW20YKeKwl2/mBf+WD+Izdt
 QoD8pZsf4Za/cFrwqts4AYjMrF/GJi4/Oy6ou7KYLwyazRT5kCMz6VtqCNx3isSzXa
 DHgXL2ZXXr9VDa1rIKG3ECB0AwrSKTjAWCvWpYferJEDZ9JchYo/YmAd3uW3N9XNx/
 9LLmMKnnKc8yx0o+HnFho33Oc5banuV5ej9/yGLnVvXHnIRyGN9KEnSCeTsxs/9QeR
 q+KIhm6PhREmL1AIHKVOd+ubl/Ep0BvqsPo8rplnmIH/tlLiu8j6Vl1yMjfAC6QQen
 t1RVqUbb4Qgkg==
Received: by mail-ed1-f69.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso2660480edh.6
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 01:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnbDGIS+NTForXDYjb/XnsB5jMW8WW/5CuRwbmUxDhA=;
 b=rlK9ba8ZrxXQcgZ5l2QwnmZMMHq9ZRu8KicGK1zPQTA3GD1c0VsxJr9pf7IxRg3lBj
 JjPLB4C8B634N2F2ZaBGfI3nBuUiITL4/q07Q7gSOajmfenwBdEG9AUzYb60CupBKdKc
 aGwAKYCB4hGlRuQlqQX/YDWG6K/k0eP3HWFrFaZjNnK6olirh8/kgsOyO72vwpo2ki7S
 teXtsgyOv4TsqADAq16Wvh/madwApS8R+qURkYfQxdCC5SxcqgImBGIqN4qOvLOPmye3
 nrkLlF9FXaxeH7EsOlqK0NVGucw2vV9Paiovyvw4gf20FzkGb/qopKjt6dxEc2/Mrrsl
 dS5Q==
X-Gm-Message-State: AOAM5338WHadN5Ouy6a39E70pSJe1GIXUceadrVW258msjc9HU884j2C
 6Ikd/4KmiNFJ+TvUrRZ6J3yN5Mu9ifAZumzqrctD7qCazMWtY6hlShbnzh0Uc/vAgtBJMHGvLZB
 ormKj866Egjucjw3nvJwx9eFvfrhS
X-Received: by 2002:a17:906:a298:: with SMTP id
 i24mr2404536ejz.151.1628755404010; 
 Thu, 12 Aug 2021 01:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySnI3exVMfenA+iF688MktaPhOnT7hL+Hex75bkPeoXZE+I8cUOzPlRO/sPO10uCh90aWHng==
X-Received: by 2002:a17:906:a298:: with SMTP id
 i24mr2404527ejz.151.1628755403856; 
 Thu, 12 Aug 2021 01:03:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm759114edv.78.2021.08.12.01.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:03:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 12 Aug 2021 10:02:41 +0200
Message-Id: <20210812080242.16972-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
References: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] controllers/memcg: fail early to avoid
 possible false-positives
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

Tests require certain prerequisites. If these fail, there is no point to
continue with the test.  Trying to continue might lead to false
positives, as seen on memcg_subgroup_charge which failed to set proper
limit and did not catch actual failure:

    memcg_subgroup_charge 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
    memcg_subgroup_charge 1 TINFO: Test that group and subgroup have no relationship
    /home/ubuntu/ltp-install/testcases/bin/memcg_subgroup_charge.sh: 36: echo: echo: I/O error
    memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 270336
    memcg_subgroup_charge 1 TINFO: Warming up pid: 13496
    memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 13496

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_failcnt.sh      |  4 ++--
 .../memcg/functional/memcg_max_usage_in_bytes_test.sh  |  2 +-
 .../functional/memcg_memsw_limit_in_bytes_test.sh      |  8 ++++----
 .../functional/memcg_move_charge_at_immigrate_test.sh  |  4 ++--
 .../controllers/memcg/functional/memcg_stat_test.sh    | 10 +++++-----
 .../memcg/functional/memcg_subgroup_charge.sh          |  2 +-
 .../memcg/functional/memcg_use_hierarchy_test.sh       | 10 +++++-----
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
index ce0885b73fe7..65ad82e0a2a0 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
@@ -18,10 +18,10 @@ MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
 
 test()
 {
-	echo $MEMORY_LIMIT > memory.limit_in_bytes
+	ROD echo $MEMORY_LIMIT \> memory.limit_in_bytes
 
 	start_memcg_process $2 -s ${MEMORY_TO_ALLOCATE}
-	echo $MEMCG_PROCESS_PID > tasks
+	ROD echo $MEMCG_PROCESS_PID \> tasks
 
 	signal_memcg_process ${MEMORY_TO_ALLOCATE}
 	signal_memcg_process ${MEMORY_TO_ALLOCATE}
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index 24e9d115c19e..a0c4dd17f0f3 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -33,7 +33,7 @@ test_max_usage_in_bytes()
 		return
 	fi
 
-	echo $MEMCG_PROCESS_PID > tasks
+	ROD echo $MEMCG_PROCESS_PID \> tasks
 	signal_memcg_process $MEM_TO_ALLOC
 	signal_memcg_process $MEM_TO_ALLOC
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_memsw_limit_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_memsw_limit_in_bytes_test.sh
index e9950a0df322..ab26cb3d1768 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_memsw_limit_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_memsw_limit_in_bytes_test.sh
@@ -55,7 +55,7 @@ test9()
 {
 	memcg_require_memsw
 
-	echo 10M > memory.limit_in_bytes
+	ROD echo 10M \> memory.limit_in_bytes
 
 	if tst_kvcmp -lt "2.6.31"; then
 		EXPECT_FAIL echo -1 \> memory.memsw.limit_in_bytes
@@ -68,7 +68,7 @@ test10()
 {
 	memcg_require_memsw
 
-	echo 10M > memory.limit_in_bytes
+	ROD echo 10M \> memory.limit_in_bytes
 	EXPECT_FAIL echo 1.0 \> memory.memsw.limit_in_bytes
 }
 
@@ -76,7 +76,7 @@ test11()
 {
 	memcg_require_memsw
 
-	echo 10M > memory.limit_in_bytes
+	ROD echo 10M \> memory.limit_in_bytes
 	EXPECT_FAIL echo 1xx \> memory.memsw.limit_in_bytes
 }
 
@@ -84,7 +84,7 @@ test12()
 {
 	memcg_require_memsw
 
-	echo 10M > memory.limit_in_bytes
+	ROD echo 10M \> memory.limit_in_bytes
 	EXPECT_FAIL echo xx \> memory.memsw.limit_in_bytes
 }
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_move_charge_at_immigrate_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_move_charge_at_immigrate_test.sh
index 272d7779770d..3c1b3394bd71 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_move_charge_at_immigrate_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_move_charge_at_immigrate_test.sh
@@ -34,10 +34,10 @@ test_move_charge()
 		return
 	fi
 
-	echo $MEMCG_PROCESS_PID > subgroup_a/tasks
+	ROD echo $MEMCG_PROCESS_PID \> subgroup_a/tasks
 	signal_memcg_process $total_size "subgroup_a/"
 
-	mkdir subgroup_b
+	ROD mkdir subgroup_b
 	echo $move_charge_mask > subgroup_b/memory.move_charge_at_immigrate
 	echo $MEMCG_PROCESS_PID > subgroup_b/tasks
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index 94eaa45ce0d8..c9034f7d4b41 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -45,7 +45,7 @@ test5()
 
 	local limit=$(memcg_adjust_limit_for_kmem $PAGESIZES)
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $limit > memory.limit_in_bytes
 	echo $((limit + PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
@@ -61,9 +61,9 @@ test6()
 	tst_res TINFO "Test hierarchical_memory_limit with disabling hierarchical accounting"
 	memcg_require_hierarchy_disabled
 
-	echo 0 > memory.use_hierarchy
+	ROD echo 0 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
@@ -81,7 +81,7 @@ test7()
 
 	ROD echo 1 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $PAGESIZES > memory.memsw.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
@@ -102,7 +102,7 @@ test8()
 
 	ROD echo 0 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $PAGESIZES > memory.memsw.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 44fc7370eeff..c28c39cf4387 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -32,7 +32,7 @@ test_subgroup()
 		limit_subgroup=$(memcg_adjust_limit_for_kmem $limit_subgroup)
 	fi
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $limit_parent > memory.limit_in_bytes
 	echo $limit_subgroup > subgroup/memory.limit_in_bytes
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
index 129f91b14c0a..e219823841a5 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
@@ -17,10 +17,10 @@ test1()
 
 	local limit=$(memcg_adjust_limit_for_kmem $PAGESIZE)
 
-	echo 1 > memory.use_hierarchy
-	echo $limit > memory.limit_in_bytes
+	ROD echo 1 \> memory.use_hierarchy
+	ROD echo $limit \> memory.limit_in_bytes
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	cd subgroup
 	test_proc_kill $((limit + PAGESIZE * 3)) "--mmap-lock1" $((limit + PAGESIZE * 2)) 0
 
@@ -34,7 +34,7 @@ test2()
 
 	memcg_require_hierarchy_disabled
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	EXPECT_FAIL echo 1 \> memory.use_hierarchy
 
 	rmdir subgroup
@@ -46,7 +46,7 @@ test3()
 
 	memcg_require_hierarchy_disabled
 
-	echo 1 > memory.use_hierarchy
+	ROD echo 1 > memory.use_hierarchy
 	mkdir subgroup
 	EXPECT_FAIL echo 0 \> subgroup/memory.use_hierarchy
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
