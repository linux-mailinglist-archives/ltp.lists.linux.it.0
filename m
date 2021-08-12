Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01F3EA02C
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:04:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 378033C6F16
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:04:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B42EF3C6CFE
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:26 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 296E7601476
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:26 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id AF7883F0F8
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755405;
 bh=gK8KS+1hDI1KxvtHtUTK2atRKa2k34jPI5Hkl5VdTx4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jREKHoHRH0Tt2HaaJqmoF6/8W887VuBZK7okLIRAWKDMtLfg8nVN976xeNyudKQQ7
 ZoFGedikDIoqbxY0tT/KxXdMy4I1gRhuyaENmIyuM4/fIxZEg0YubiisMLkG6bcmrs
 AcObiZtVqpbagRTGl+7TwFNr4VhNa5d/2LbYwUBbuWDUDvSAx6k6obAcojRgwBJmP0
 zQlQY4BpeIp4cObDD4pd4jpu9FNdIocQH+C2OTSuxDeCWKWOiaEYNq+YFJNQrQuVLf
 Ay5nsJ9MpMB9TaQSrhHIhIvgeIvUGL5frRVJIGvPUePrKXJCHAHfrX20YfZCJmcwQa
 ivR1y+LUXbFGA==
Received: by mail-ed1-f69.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso2660523edh.6
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 01:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gK8KS+1hDI1KxvtHtUTK2atRKa2k34jPI5Hkl5VdTx4=;
 b=pf4yGsp8aDwkHnWAacgYtMJX4AB0fZ0bCuolcxi64RhLDxdVSTHQgM9sAHaXNbOhkJ
 yhqVPYmD6Z4XEFV903PXkWRsoEvYfNhlVAmhS7Px9CktOF/fuxXhIuV7dXGNRITaMy6h
 Gnyvm3PDEVIKE5bw0cXepyw3wR333Sh/W+31aqcYOBkO2Ld15cEtnnHczKSTi59st1MH
 2jYiaW7t5UJgL5pK8eda9dy7RO1YXeMP3kT5hzTarr5qIiL56GwkxQze0hRkz0DqSYrl
 fRDBlrJaIlFCVdW7rWX3uie+LqPm5MF007vucX3Sj5sPbQLVGP7hl6V26btjTWKqXHfG
 NWwg==
X-Gm-Message-State: AOAM532Hec9phC4okplmkhk55I1rgbvFBXNrHmAr/S8u/zr2w1ueDzKK
 QZDpat66M1s7zwzLgmdUNiRE0dKque2i9GftYWTNlgJSIiiv40yE/FUTMbyYkHRbbcqIe716cVf
 PsdS3ZCffODWoe8JAy9SG812evd6K
X-Received: by 2002:a17:906:85cc:: with SMTP id
 i12mr2379896ejy.405.1628755404951; 
 Thu, 12 Aug 2021 01:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWNZ7aXlCQguJlKCO4Ef/UBOmqubMD/CW9vG+Tnz4YLksWWaWR2UiS1/EldkoYpGlG2BcqhA==
X-Received: by 2002:a17:906:85cc:: with SMTP id
 i12mr2379888ejy.405.1628755404759; 
 Thu, 12 Aug 2021 01:03:24 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm759114edv.78.2021.08.12.01.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:03:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 12 Aug 2021 10:02:42 +0200
Message-Id: <20210812080242.16972-5-krzysztof.kozlowski@canonical.com>
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
Subject: [LTP] [PATCH v2 4/4] controllers/memcg: check status of commands
 using interface
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

Most of the cgroups interface returns some valid and meaningful error
code (e.g. ENOMEM if creating subgroup failed).  Check these to be sure
that all errors are caught, like in this example:

    memcg_subgroup_charge 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0 failed
    memcg_subgroup_charge 1 TINFO: Test that group and subgroup have no relationship
    /home/ubuntu/ltp-install/testcases/bin/memcg_subgroup_charge.sh: 36: echo: echo: I/O error
    memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 270336
    memcg_subgroup_charge 1 TINFO: Warming up pid: 13496
    memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 13496

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_lib.sh |  2 +-
 .../memcg_max_usage_in_bytes_test.sh          |  8 +++----
 .../memcg/functional/memcg_stat_test.sh       | 24 +++++++++----------
 .../memcg/functional/memcg_subgroup_charge.sh |  4 ++--
 .../functional/memcg_usage_in_bytes_test.sh   |  4 ++--
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index c8b5df2b45f7..ee14a29fae81 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -380,7 +380,7 @@ test_limit_in_bytes()
 	local use_memsw=$2
 	local elimit
 
-	echo $limit > memory.limit_in_bytes
+	EXPECT_PASS echo $limit \> memory.limit_in_bytes
 	if [ $use_memsw -eq 1 ]; then
 		memcg_require_memsw
 		echo $limit > memory.memsw.limit_in_bytes
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index a0c4dd17f0f3..6a2607c4333b 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -67,8 +67,8 @@ test2()
 	tst_res TINFO "Test memory.memsw.max_usage_in_bytes"
 	memcg_require_memsw
 
-	echo $MEM_LIMIT > memory.limit_in_bytes
-	echo $MEM_LIMIT > memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.memsw.limit_in_bytes
 	test_max_usage_in_bytes 1 0
 }
 
@@ -83,8 +83,8 @@ test4()
 	tst_res TINFO "Test reset memory.memsw.max_usage_in_bytes"
 	memcg_require_memsw
 
-	echo $MEM_LIMIT > memory.limit_in_bytes
-	echo $MEM_LIMIT > memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.memsw.limit_in_bytes
 	test_max_usage_in_bytes 1 1
 }
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index c9034f7d4b41..0308b40bab53 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -46,8 +46,8 @@ test5()
 	local limit=$(memcg_adjust_limit_for_kmem $PAGESIZES)
 
 	ROD mkdir subgroup
-	echo $limit > memory.limit_in_bytes
-	echo $((limit + PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $limit \> memory.limit_in_bytes
+	EXPECT_PASS echo $((limit + PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memory_limit" $limit
@@ -64,8 +64,8 @@ test6()
 	ROD echo 0 \> memory.use_hierarchy
 
 	ROD mkdir subgroup
-	echo $PAGESIZES > memory.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memory_limit" $((PAGESIZES * 2))
@@ -82,10 +82,10 @@ test7()
 	ROD echo 1 \> memory.use_hierarchy
 
 	ROD mkdir subgroup
-	echo $PAGESIZES > memory.limit_in_bytes
-	echo $PAGESIZES > memory.memsw.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.memsw.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memsw_limit" $PAGESIZES
@@ -103,10 +103,10 @@ test8()
 	ROD echo 0 \> memory.use_hierarchy
 
 	ROD mkdir subgroup
-	echo $PAGESIZES > memory.limit_in_bytes
-	echo $PAGESIZES > memory.memsw.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.memsw.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memsw_limit" $((PAGESIZES * 2))
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index c28c39cf4387..3fa016102151 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -33,8 +33,8 @@ test_subgroup()
 	fi
 
 	ROD mkdir subgroup
-	echo $limit_parent > memory.limit_in_bytes
-	echo $limit_subgroup > subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $limit_parent \> memory.limit_in_bytes
+	EXPECT_PASS echo $limit_subgroup \> subgroup/memory.limit_in_bytes
 
 	start_memcg_process --mmap-anon -s $MEM_TO_ALLOC
 
diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
index 9140fd9d1fd7..6c1b365057f8 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
@@ -28,8 +28,8 @@ test2()
 	tst_res TINFO "Test memory.memsw.usage_in_bytes"
 	memcg_require_memsw
 
-	echo $MEM_LIMIT > memory.limit_in_bytes
-	echo $MEM_LIMIT > memory.memsw.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.limit_in_bytes
+	EXPECT_PASS echo $MEM_LIMIT \> memory.memsw.limit_in_bytes
 	test_mem_stat "--mmap-anon" $MEM_TO_ALLOC $MEM_TO_ALLOC \
 		"memory.memsw.usage_in_bytes" $MEM_TO_ALLOC \
 		$MEM_EXPECTED_UPPER false
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
