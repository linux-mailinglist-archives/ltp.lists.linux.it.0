Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864B3C6D3A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:23:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57323C77ED
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:23:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 132ED3C876A
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:22 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AB5CF600266
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:21 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3C2CD4057D
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168141;
 bh=EDC46LT3O4aj/p1iWKMRPSHT/vLiU3fXF+N8pBk1030=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=nYoHZUESbaa0cV9Tohf4KITGYm8gjiaoiFKM07P5+VMTpTjU2cYX5BBvevf9YSC04
 zEuwtR1rN9PGWaIPYKOOS1pcwtPvps5+y9YwEjg4rEdFGHHYM/ubxC1De4lStTDIOs
 VOn5sH0EtRsOsxmbllUZhHIb68vm8zo4MqUMhW6BSuBa1z9QoRZEqp/5AGuQHnBg6S
 Y1NjTJc02JeaDXQ80zAaxdiZxg1SVujkUviYRY+iQRHcRniJfEbMsjHamgqPczO5+t
 OyQwokBuEnm3rq4gud7Qoq6xOjyri6HAv4K2N1DDv23/OOxOfrs5jmll6hTR8To+6L
 MVyvr8g8vDs3w==
Received: by mail-wm1-f70.google.com with SMTP id
 b26-20020a7bc25a0000b0290218757e2783so1164545wmj.7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EDC46LT3O4aj/p1iWKMRPSHT/vLiU3fXF+N8pBk1030=;
 b=dMXuXImFVmvlBlCy6US0Wj+zVdT+HW7hvIjBEFEXHyrx5O4nYZ+jGkoIzJ7Uj48lsy
 9jqcL9pRJzs/BAS1CNJG0LtFTuu5siCUKxqyOMY82XT19hvpG0pQ2qtGuWKZkaAssa/N
 yu+grQ60dp8Sy0uO0UkaBXFJYgGylK9kC5p4g07m4ggeEQatiBLBTHtyTxgbyqkLFbrV
 2CeWvglpJ2gBl1bA1lxKlAIk1gJtKQVxKbGHkYKmbhmUzjSffVmqLsygBnDspJRFy3Pa
 wP1Glb+xjVb218r2nem8NQwVRZu6+HLttdAJNNuDL7S6/PzLdCLm5YwW/OPkpr51i/jj
 EPIg==
X-Gm-Message-State: AOAM532YZFx2o5lhwZkFjPXDPGtDJIoUmu0/YZbCOYR1esVJMhcIThV4
 fDGQbbJ2CPDaGvzAZ2voQfaHmmovwlPvTbZjQZQSQQ9h6ZKfu+W/PnN5GbJGlrlA6LGoiI9gouF
 yGb1SJ06BBjP21Iri1UTP4yezmfVK
X-Received: by 2002:a05:600c:2142:: with SMTP id
 v2mr3872538wml.121.1626168140773; 
 Tue, 13 Jul 2021 02:22:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyan3JGnFpcVFr6tGY1KwdB8Q/g5jLh3Gupmvy+fJoKugXsx80BWgG4cZRpJ1j7Btq5F8ggbg==
X-Received: by 2002:a05:600c:2142:: with SMTP id
 v2mr3872526wml.121.1626168140654; 
 Tue, 13 Jul 2021 02:22:20 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:10 +0200
Message-Id: <20210713092210.17141-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/5] controllers/memcg: offset kernel memory
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
