Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547E3C6D39
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:23:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FDD53C8772
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:23:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6AA893C7836
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:21 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ECDFB1000A59
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:20 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3C0AE4057E
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168140;
 bh=s/AHBoVVHYAcFgqWbnXVZ8RKSidDuXAyLdMQMbzmkwg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IWf0O/PIx4O1bhly/KZaPwqR0HiFrLiHTTqBZ5BJZL7M/k8TxqBlFmvA1UWMQ1i0j
 CPfsbmlFPVxc9ySeJxM5tGdBk/bmIHIxsjsm/KqfCG3O00cfv0VGpzJNiMBhiZ4I4+
 oK2da3l/FUoHciS1xy9GyDD4JqBI+UqTRYSB6WQcQGBR5qOlY+T8NzXDfGnSlax1YB
 6wzwZX3HNmHqoT88WZaqEOQOxAt+vH642SHqcAP08bJhT56Al4bX4nz6MjRqyCnubr
 xHJLpAP8mZbYf/pop0HEmFO+hmrrDJpkMd+peQn0EW3DkgMjD+Trc09EarQ8dPRPIH
 6gD+L89lsgfdg==
Received: by mail-wm1-f72.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso1186479wmj.0
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/AHBoVVHYAcFgqWbnXVZ8RKSidDuXAyLdMQMbzmkwg=;
 b=ej5oqx5QM7P5j4Yn7j/wb5c/CvPs9+kI/DMMJ8s6EP/Jnfu6UVKd9yDLsfTybIZMmI
 EWO5iOip6RbMHEniTT11rR9PaIenvH2GDK0NBvhY0ErswLadnjHU0iI5RtF7Py+qlmEW
 Lup/Cio+bHktIYPI8z2e8lbQWqpNTI0p7L0xgY/+km61o6pqrXbLhR2j9WywM27O6azz
 DTEjNI1950WO90izDI8Bdj8/N7BqT+hEs2HZ1bXqaoFud7Epuj3nnXDPA6bTAK7jOWCE
 0eQwT1lVYgLoY9jHHJvpPIC/jEYiU3vCDOt55Z4rdrOP76hWKhux4fJpPrCkz4qpN6Fy
 /XFg==
X-Gm-Message-State: AOAM531bVuTVPM+2JWg4cJVtKFYQOZVbEEQGW1UFAJb4n1GuNbCXB2fB
 WEg9rw3idbbZgujt12mmdJOUQViSemCnXGwh+kSj37oVSrq9UrgvwrXqFKYpy3dG5Wa/jm5lHIi
 iUgC1DNGg1aZpddMoNLV+3e34vj87
X-Received: by 2002:a05:600c:3793:: with SMTP id
 o19mr4082666wmr.31.1626168139514; 
 Tue, 13 Jul 2021 02:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4U+DFmKhlMhnKE16LZm1Ft8Xkojwm5fm25l1Z0kvrxpxpzuDcCeHNvCH9Ij804y53uoy3Sg==
X-Received: by 2002:a05:600c:3793:: with SMTP id
 o19mr4082651wmr.31.1626168139356; 
 Tue, 13 Jul 2021 02:22:19 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:09 +0200
Message-Id: <20210713092210.17141-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/5] controllers/memcg: increase memory limit in
 subgroup charge
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

The memcg_subgroup_charge was failing on kernel v5.8 in around 10% cases
with:

    memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 135168
    memcg_subgroup_charge 1 TINFO: Warming up pid: 19289
    memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 19289
    memcg_subgroup_charge 1 TFAIL: rss is 0, 135168 expected
    memcg_subgroup_charge 1 TPASS: rss is 0 as expected

In dmesg one could see that OOM killer killed the process even though
group memory limit was matching the usage:

    memcg_process invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
    CPU: 4 PID: 19289 Comm: memcg_process Not tainted 5.8.0-1031-oracle #32~20.04.2-Ubuntu
    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/03/2020
    ...
    memory: usage 132kB, limit 132kB, failcnt 9
    memory+swap: usage 132kB, limit 9007199254740988kB, failcnt 0
    kmem: usage 4kB, limit 9007199254740988kB, failcnt 0
    ...
    Tasks state (memory values in pages):
    [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
    [  19289]     0 19289      669      389    40960        0             0 memcg_process
    oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/ltp_19257,task_memcg=/ltp_19257,task=memcg_process,pid=19289,uid=0
    Memory cgroup out of memory: Killed process 19289 (memcg_process) total-vm:2676kB, anon-rss:84kB, file-rss:1468kB, shmem-rss:4kB, UID:0 pgtables:40kB oom_score_adj:0
    oom_reaper: reaped process 19289 (memcg_process), now anon-rss:0kB, file-rss:0kB, shmem-rss:4kB

It seems actual kernel memory usage by a given group depends on number
of CPUs, where at least one page is allocated per-cpu beside regular
(expected) allocation.  Fix the test on machines with more CPUs by
including this per-CPU memory in group limits, plus some slack of 4
PAGES.  Increase also memory allocation from 32 to 64 pages to be more
distinctive from kernel per-CPU memory.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../memcg/functional/memcg_subgroup_charge.sh | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 9b23177a4dc5..0d2b235aff7c 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -14,16 +14,33 @@ TST_CNT=3
 
 . memcg_lib.sh
 
+# Allocate memory bigger than per-cpu kernel memory
+MEM_TO_ALLOC=$((PAGESIZES * 2))
+
 # Test the memory charge won't move to subgroup
 # $1 - memory.limit_in_bytes in parent group
 # $2 - memory.limit_in_bytes in sub group
 test_subgroup()
 {
+	local limit_parent=$1
+	local limit_subgroup=$2
+	local total_cpus=`tst_ncpus`
+
+	# Kernel memory allocated for the process is also charged.
+	# It might depend on the number of CPUs. For example on kernel v5.11
+	# additionally total_cpus plus 1-2 pages are charged to the group.
+	if [ $limit_parent -ne 0 ]; then
+		limit_parent=$((limit_parent + 4 * PAGESIZE + total_cpus * PAGESIZE))
+	fi
+	if [ $limit_subgroup -ne 0 ]; then
+		limit_subgroup=$((limit_subgroup + 4 * PAGESIZE + total_cpus * PAGESIZE))
+	fi
+
 	mkdir subgroup
-	echo $1 > memory.limit_in_bytes
-	echo $2 > subgroup/memory.limit_in_bytes
+	echo $limit_parent > memory.limit_in_bytes
+	echo $limit_subgroup > subgroup/memory.limit_in_bytes
 
-	start_memcg_process --mmap-anon -s $PAGESIZES
+	start_memcg_process --mmap-anon -s $MEM_TO_ALLOC
 
 	warmup
 	if [ $? -ne 0 ]; then
@@ -31,8 +48,8 @@ test_subgroup()
 	fi
 
 	echo $MEMCG_PROCESS_PID > tasks
-	signal_memcg_process $PAGESIZES
-	check_mem_stat "rss" $PAGESIZES
+	signal_memcg_process $MEM_TO_ALLOC
+	check_mem_stat "rss" $MEM_TO_ALLOC
 
 	cd subgroup
 	echo $MEMCG_PROCESS_PID > tasks
@@ -47,17 +64,17 @@ test_subgroup()
 test1()
 {
 	tst_res TINFO "Test that group and subgroup have no relationship"
-	test_subgroup $PAGESIZES $((2 * PAGESIZES))
+	test_subgroup $MEM_TO_ALLOC $((2 * MEM_TO_ALLOC))
 }
 
 test2()
 {
-	test_subgroup $PAGESIZES $PAGESIZES
+	test_subgroup $MEM_TO_ALLOC $MEM_TO_ALLOC
 }
 
 test3()
 {
-	test_subgroup $PAGESIZES 0
+	test_subgroup $MEM_TO_ALLOC 0
 }
 
 tst_run
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
