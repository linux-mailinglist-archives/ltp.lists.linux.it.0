Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A517F3E8E36
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BAE03C7013
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE31A3C6FF0
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:41 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 25CFE600739
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:41 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A067F3F109
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676700;
 bh=8hSlKObQgk5y4rARW3nTE1/3g3t6QtUiv+WuO5bPdLg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dur9ECYX8hMElwrDY8XWIIT3+2f5L7MybGZBK661PSwwtFN5lEDzwuMtimBY1kzJx
 bEl5uf1bMDpjC+GxQo4kQO/flMe5w4Mj1MG4TE3vpyB7WhgKP1VrLPlCNWGr31RWTr
 2LcRqYX4TzBvDXdgW5w3Nk7bZ44MONWy0h4O5hHo3ik86y47MJSHrB8HWAYRBdDwG9
 YCyJWgrXngEoehYMX2Vten9bqacUiuyb8qgf3D7ZiXDXTqvQlXIlYnMv95BWPyadpY
 ewMdXcsxxC16sFZvguuwecKN5b6Upk5IME9wYvtjwzMv2hQFTRCpYbvls563gVuZCQ
 AszisECVZmvew==
Received: by mail-ed1-f70.google.com with SMTP id
 b25-20020a05640202d9b02903be7281a80cso982127edx.3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hSlKObQgk5y4rARW3nTE1/3g3t6QtUiv+WuO5bPdLg=;
 b=OYbPxxZe2vO7EHR23YWfes+MYq6b1AOKcSRPs/7N3epguuN3EMz/X+Va1Bs5uaSCnq
 nrs5i5H21XlZG5M3zhNYX/vKtSB0ExTxqV37lLVdOAejWIdxA7T6pa352dabOk/7n+RD
 2BYe/srUkor8utqnSpaeYwrfz8OcXq2SAXlaIycvpKBzYJrgbkjPmibCZ3d7xHgqdSUO
 7LLJOKgkqq7KystRUrFiy4cwev9ScddkhLXe2K9R+DTi0XdZIqBGll3P2WBXsPHq/saY
 PtpzvnIzD0YC4Yn8a5hhp0NKFuKptUn+chTCY1NMva4h4+zb+s0U21KMXLHepuGr7EU0
 Darg==
X-Gm-Message-State: AOAM532VgRPuwaPbX/UO2yuqhuQHC2u/a4q1e1upMSslp3mt/WsvIUE4
 r+EiDJXz94w3MoXkHXaJrxfREVklR/+Erc7hiWp20aSxc6qY6/snxvkto1g4nDj+KDdr8FifDsW
 XL6w/9CtQYJqZd49tfx2lZt7EEEnj
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr10296633edx.288.1628676700152; 
 Wed, 11 Aug 2021 03:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZHXwoj9gXjk2q2m1Ki4VwQ1bKI6fsOg86T8KtEWLM+UcFgbEx+6i4Jc8UdUWhbxFaMB+93Q==
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr10296611edx.288.1628676699991; 
 Wed, 11 Aug 2021 03:11:39 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id c6sm7938345eje.105.2021.08.11.03.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:11:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 12:10:57 +0200
Message-Id: <20210811101058.36695-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
References: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RESEND PATCH 3/4] controllers/memcg: fail early to avoid
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
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
