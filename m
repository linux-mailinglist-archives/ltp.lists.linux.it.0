Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C43E8E37
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BA453C7028
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:12:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D9A03C6F4C
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:43 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6940A6002F4
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:42 +0200 (CEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0C51B3F109
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676702;
 bh=nLLOoOj6VV1dhGXDa468G8xFiYWRaTHM2tIv0V64Y24=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nTqxZ74pNXapoqmPZNQIDSH01GAuoBSEjjC952N6oMLE+HgJuGrdhFmkYvBhd4g/W
 usbkyaB9gU55idyHhxfn1zS4pt3171sOG2izMmdcNnezIGVYVc2D8vClZ2Mt7IQJ4Q
 HkfUXRZaYVUfdH9J6+FJeGWzA5IFXVgj3gxeP/5S+Lad9IFZ0kfg6xh4+D4F01IR2E
 8FleCok6GIFVLF6flGTBktwnFhTHleyoBe5b80+yQ4HGLQQOCf1UUgggpOuROb9XZ9
 uu/HjER4vcWhF+ML8Y/Wk/lgu+hUB+6pqeFPZpTYa34ASdavAaqtW3wmbz1g0vU7QM
 kaJZq7fzosQrA==
Received: by mail-ej1-f71.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so502251ejj.0
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLLOoOj6VV1dhGXDa468G8xFiYWRaTHM2tIv0V64Y24=;
 b=nXaDGajGQSCy8bGlxSk3OzAPQ1Ljp3H8JZiBWwre6bY/XRdDAZ6bjbx3daKmHPcxOR
 DTGPDE55e3xylzavGeD+I0AOtldXit7wzNXhzkeC4AJWmI/b4A5QeOv9t78YJoyuVAtf
 NBI82rNEBxg8Cn6phh0IVLV/Q0drbj+H6OeY1rhnSF4n4DMKL1HU1pcpj0WlH1EgKDi4
 akiK3PsMn1rd1v8rM1M5RK5jZtQw/w7KVN391r7m3HSWWnIYjkVU1dOWVuE4l98MQBna
 +h5jqC644DfJ3EOhuIEThbcxt2M8jIpsLTYtPCctDqOeTWQCdfbgSz375d0BFEEdbh/M
 ZVoQ==
X-Gm-Message-State: AOAM5335OwgldDP/gvOwE1sEk8tfYSuiVNGULiNqpKnN2Hm1FRxkbC1q
 gU38A5ANvP1LjaHmlle2qFMBwuTl/CK1/4tu2UhtVsb1wrzsT1HLZo6Y0IBDSxHyd/rUnksmzVV
 Dq+GgYQOq9TbiJYFbyfD045dadJYA
X-Received: by 2002:a17:907:2ce7:: with SMTP id
 hz7mr2855361ejc.35.1628676701225; 
 Wed, 11 Aug 2021 03:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Kl2ulqE3UGYOQeoKyydl1z9QaXJKVKEn5FSJSxN0Y9PlLdP4nUETpGKcfkFCzmqbfFuArg==
X-Received: by 2002:a17:907:2ce7:: with SMTP id
 hz7mr2855352ejc.35.1628676701054; 
 Wed, 11 Aug 2021 03:11:41 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id c6sm7938345eje.105.2021.08.11.03.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:11:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 12:10:58 +0200
Message-Id: <20210811101058.36695-5-krzysztof.kozlowski@canonical.com>
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
Subject: [LTP] [RESEND PATCH 4/4] controllers/memcg: check status of
 commands using interface
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
index 700e9e367bff..3d04c3a60700 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -389,7 +389,7 @@ test_limit_in_bytes()
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
index b86331f0fc26..5fb52bb1d24c 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -47,8 +47,8 @@ test5()
 	memcg_adjust_limit_for_kmem limit
 
 	ROD mkdir subgroup
-	echo $limit > memory.limit_in_bytes
-	echo $((limit + PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $limit \> memory.limit_in_bytes
+	EXPECT_PASS echo $((limit + PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memory_limit" $limit
@@ -65,8 +65,8 @@ test6()
 	ROD echo 0 \> memory.use_hierarchy
 
 	ROD mkdir subgroup
-	echo $PAGESIZES > memory.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	EXPECT_PASS echo $PAGESIZES \> memory.limit_in_bytes
+	EXPECT_PASS echo $((PAGESIZES * 2)) \> subgroup/memory.limit_in_bytes
 
 	cd subgroup
 	check_mem_stat "hierarchical_memory_limit" $((PAGESIZES * 2))
@@ -83,10 +83,10 @@ test7()
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
@@ -104,10 +104,10 @@ test8()
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
index e831097dab3e..4434168a7a6c 100755
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
