Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D206D3AAD03
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:07:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 941313C717E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF2D33C6C84
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:36 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2CBC21A01448
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:35 +0200 (CEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ltm7j-00040A-9O
 for ltp@lists.linux.it; Thu, 17 Jun 2021 07:07:35 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so996589edq.4
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZtxgQSaNq1bNeJ5KGC3bsLfhWxUGqziDCPwpDnLaAk=;
 b=fkVLabKLQ9noixOuBWB/eUbILYGY98fdJhZuA2vxS+NzNwk8hol1fgu4tr4vZWkj9m
 b1T/spkyK3PzCNiuq21FC2pH1X3Uu75A49i4m5UuizDKyNHSd6NoCoScrZeUNlz+7LA7
 h3u8SX0ZI1va8j1PuEpQ1cjv02Bc1DD81gL7+yJMZojSZn1wJUnZKO/ZqoAiDzvCAq0Y
 MJvEkh69RYPyfpt413MSRgvcWDh50EVQMu+8JiHLVlPUSOPzbsNcDbKz+G0DiLsnQ7l4
 DWVjjm/dbpWKXV6C26dO2uFSIkYVtBmhYJcsQICeKoYAqPBuxeE4FtXUZ296vint5pjk
 Tqvw==
X-Gm-Message-State: AOAM533zNCM8QesQ8sxxkjXcVVKHqt3Tw6lSJezdPGGblt5K+Gm5ZiBT
 Cv7AWmVuxyu2eo0BUmmL9N4TLH0o96LT8nfs/tF8bRugWI3YxLXQ6AaognwHihk1yNOz/IUqz8J
 v0gmYi7IgdaxsWU42E29Fc1Az0Xhz
X-Received: by 2002:a05:6402:1e8b:: with SMTP id
 f11mr4645340edf.86.1623913654780; 
 Thu, 17 Jun 2021 00:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjisDEo4tyW7maje83weX/Efmz4fMDUrx+rUUceT8FNNQWLTkrSTowE8/lCQMhCSlrPX4/Vw==
X-Received: by 2002:a05:6402:1e8b:: with SMTP id
 f11mr4645317edf.86.1623913654635; 
 Thu, 17 Jun 2021 00:07:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u17sm3531258edx.16.2021.06.17.00.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:07:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 17 Jun 2021 09:07:28 +0200
Message-Id: <20210617070730.7699-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] controllers/memcg: accept range of
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

It seems that recent Linux kernel reports more memory used than
expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../kernel/controllers/memcg/functional/memcg_lib.sh  | 11 +++++++++--
 .../memcg/functional/memcg_max_usage_in_bytes_test.sh |  6 +++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index d9bb6d94324d..083ef376e120 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -140,7 +140,8 @@ shmmax_cleanup()
 
 # Check size in memcg
 # $1 - Item name
-# $2 - Expected size
+# $2 - Expected size lower bound
+# $3 - Expected size upper bound (optional)
 check_mem_stat()
 {
 	local item_size
@@ -151,7 +152,13 @@ check_mem_stat()
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
index 14daa4651798..a940606cbd34 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -12,6 +12,10 @@ TST_CNT=4
 . memcg_lib.sh
 
 MEM_TO_ALLOC=$((PAGESIZE * 1024))
+# Recent Linux kernels (at least v5.4) started reporting memory usage of 32
+# pages higher than requested allocation. Cause is not known, so let's just be
+# flexible.
+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + PAGESIZE * 32))
 MEM_LIMIT=$((MEM_TO_ALLOC * 2))
 
 # Run test cases which checks memory.[memsw.]max_usage_in_bytes after make
@@ -32,7 +36,7 @@ test_max_usage_in_bytes()
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
