Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 972713C7403
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F9CC3C951A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 661EA3C9CA1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:39 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 077031400BC3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:37 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id EDBCE405D2
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626192814;
 bh=2I0FurmoYZjFwtYwB65QA4iJS+6uIb1s1FR/5RtfDyU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=lxluVbeFMJ4FnmWoVkhwseMJR5WkROmhCqcoGA/wjgQBbmef8axClmDSoKLgydg2O
 gnA7arFxqvDk8/1DOpttUcG/qPFVK4mZRucCfYfUjei6BsvTy+9Pmgmfcp4f9dCTL6
 Sx4ZH6bX+qUz3QtiuWu0/9xXVmSb6JfkmKZtkbYm2Y0L09n+HrBp5x9Yg+y9DwoG4t
 lSf0LSjxSXz6DkSHR8w3bx5w4X1OiCczjCY/aUtb7qjGAOSk8INz8dtW1XMqpP6wY6
 efgMyTYgzQshiy88KNiXaoJ1kF6qLL3BzgzEvowtVtdDAxvkfBdPHYRQwvZdP4z9j+
 8l2Y+jlC8RJ/A==
Received: by mail-ej1-f72.google.com with SMTP id
 t8-20020a1709063e48b0290501cd965554so5333645eji.8
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2I0FurmoYZjFwtYwB65QA4iJS+6uIb1s1FR/5RtfDyU=;
 b=N5d2LDqX3VVtiRwwOslE/RduIbIsm6htb9Vbq8cHMNOWkf8Xe8mTgdI1iX1q+jkpvN
 uJs6tVOKFyFj5g+/Wl5sKWuIOTghTd8iQHJ+ynQtR6XrF8IHmfx0aa0cZDrbpHeWZroB
 I8eVsq+XOeCTkvUAkQCUnmP3yJf/SRQKgzKSRQJJTCQh5LJQJclHwNJ+DwcWJ+qbiSNx
 X/OX6x7HE8208vRjdemp733aKi+6B6HmL7N2tTNi6ISae1Qjnk9GHpgaWpXGO+GJdFbp
 Fn5Fh3tKUsHmoZ10jx1ZyKAtAtTza0ISeusvFQTIegeLojEOdkSnqt5hYYtPBb5V8B+3
 f6DQ==
X-Gm-Message-State: AOAM532wFSJ4gYXuuiswLOwNzGelRyONAgjQa0aUW6Ah7/qimLg63cPV
 TGdL2lIT6FWFwkAF6yCMMv2qBchV+DSSoFgXCatZZddA1MuzeL4TFTv+yFvtemhuKDrIkRj7KSk
 bsi5ge10QUiQJltRDxQXh8CvdfjR9
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr6634964eju.295.1626192814426; 
 Tue, 13 Jul 2021 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpjdnDx9qNHXeFXaAUUUjC0xLqDcoV2MtrKOH2iOvXCMoJXuqkFDI8lBO8FRoPPeuRPvs2PQ==
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr6634956eju.295.1626192814291; 
 Tue, 13 Jul 2021 09:13:34 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id qp12sm8331122ejb.90.2021.07.13.09.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:13:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 18:13:27 +0200
Message-Id: <20210713161328.62560-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
References: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] controllers/memcg: fail early to avoid possible
 false-positives
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
index f6b5aa84e31e..b86331f0fc26 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -46,7 +46,7 @@ test5()
 	local limit=$PAGESIZES
 	memcg_adjust_limit_for_kmem limit
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $limit > memory.limit_in_bytes
 	echo $((limit + PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
@@ -62,9 +62,9 @@ test6()
 	tst_res TINFO "Test hierarchical_memory_limit with disabling hierarchical accounting"
 	memcg_require_hierarchy_disabled
 
-	echo 0 > memory.use_hierarchy
+	ROD echo 0 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
@@ -82,7 +82,7 @@ test7()
 
 	ROD echo 1 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $PAGESIZES > memory.memsw.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
@@ -103,7 +103,7 @@ test8()
 
 	ROD echo 0 \> memory.use_hierarchy
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $PAGESIZES > memory.limit_in_bytes
 	echo $PAGESIZES > memory.memsw.limit_in_bytes
 	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 7650128e3605..e831097dab3e 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -32,7 +32,7 @@ test_subgroup()
 		memcg_adjust_limit_for_kmem limit_subgroup
 	fi
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	echo $limit_parent > memory.limit_in_bytes
 	echo $limit_subgroup > subgroup/memory.limit_in_bytes
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
index b645f9b44a86..4b19480b2ff9 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
@@ -19,10 +19,10 @@ test1()
 	local limit=$PAGESIZE
 	memcg_adjust_limit_for_kmem limit
 
-	echo 1 > memory.use_hierarchy
-	echo $limit > memory.limit_in_bytes
+	ROD echo 1 \> memory.use_hierarchy
+	ROD echo $limit \> memory.limit_in_bytes
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	cd subgroup
 	test_proc_kill $((limit + PAGESIZE * 3)) "--mmap-lock1" $((limit + PAGESIZE * 2)) 0
 
@@ -36,7 +36,7 @@ test2()
 
 	memcg_require_hierarchy_disabled
 
-	mkdir subgroup
+	ROD mkdir subgroup
 	EXPECT_FAIL echo 1 \> memory.use_hierarchy
 
 	rmdir subgroup
@@ -48,7 +48,7 @@ test3()
 
 	memcg_require_hierarchy_disabled
 
-	echo 1 > memory.use_hierarchy
+	ROD echo 1 > memory.use_hierarchy
 	mkdir subgroup
 	EXPECT_FAIL echo 0 \> subgroup/memory.use_hierarchy
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
