Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF6F3C7400
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E85E3C9D3F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF7A83C759E
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:38 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0DF947CEC74
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:37 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id D7E734060B
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626192815;
 bh=7CTPtmwoU9X7aP73MH1LZOzX7VEPJ1EGhRyCdFa3aP0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=RAPTDjLYrKmNWhfF46LLA2vfhMS+wpbNpSTCpZlyTK2o7JXOqD0hCy70d8uNbl9vQ
 9+mld2DXLCMZQ8/B/ym7IghSTQUmAzzAubaCS1N9F0yZt3iLZH17Ba6GUF2K07bLVo
 3iP/kSi+pbeHSvqCb8E+wqGPzbutnFw8yrOTarbD2kpy+NE6PNIGqgkbn8zMjykSvu
 pR33W7B2QRZhsBrgAYOxQRpWEoVPjIcAqbOofYHP3CLmZG+G2GVwGyV7t9aHD8REdO
 apow9BQbkeq7pDh3zlu8rPt9oMyQrImdGnaKLWs9yCS7et66Yu0QGxVmn3ZGa8UgXn
 MbCOVO7HnbXdw==
Received: by mail-ej1-f69.google.com with SMTP id
 r10-20020a170906350ab02904f12f4a8c69so6966674eja.12
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CTPtmwoU9X7aP73MH1LZOzX7VEPJ1EGhRyCdFa3aP0=;
 b=HmVH0zaH59oNzNOPtgO8p84YR/zhDryL7gw7zmK9atV3OFtwV09BnfUZa9FiS+8wo/
 1zyXhUv6TRTw54Q7Vb6M6VnHQAaA0uq5KsdHv0LfC9rJY2ppqKNKi+ZvN97SFdov4P2q
 1B3ymAGnq/aIQCdquILxU3cmmvMjicqgVsNGtufgFr3rMozORwNMB0rnEeypTTXePzp3
 ZvvXYyM76xjChVm6IobxLHUdQ9qhS2eXxLSR/OfuIfa42c90vbzRTmj56e7ZM/9F6Eeo
 Ey0/h+Zi1nHW6HaLIPV/0mqXaNFU9ksLRCkRuJ5OS4y+ArKcuZNeH7fP5J/jHJwk0B1B
 uu/w==
X-Gm-Message-State: AOAM532s8ej3vR4502qQweyKbMY+QKJ5k01IyGuK2NR0ObF9GWN6vMgd
 F6EoS6ilf7mGyH1UlUk0oeInWvWiEiudIhWKg/icgZmdrVSTqVmeIqbiT7IlcWznjMmnEvPc08X
 0NfXNfWgFR1NnARp7eKaoN0lAEbB+
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr6855280ejc.114.1626192815447; 
 Tue, 13 Jul 2021 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG0pTHk9l6o4HTPU1WvZhdPiMU/4EHVBHZPGIsnVPpVH1ZXmdZRcOse6jTKdjhgd0/xv/DBw==
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr6855273ejc.114.1626192815290; 
 Tue, 13 Jul 2021 09:13:35 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id qp12sm8331122ejb.90.2021.07.13.09.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:13:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 18:13:28 +0200
Message-Id: <20210713161328.62560-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
References: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] controllers/memcg: check status of commands using
 interface
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
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
