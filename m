Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C73BA0C2
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D50E3C8569
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BBA73C8E76
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:54 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 610BA1A0175D
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:54 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg5-0001e7-Sq
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:53 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 mh17-20020a170906eb91b0290477da799023so3512144ejb.1
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtLt9YtVk/Uk5PrxgrpUA9fXL6Rngf9hAE1abgZE8pU=;
 b=Cuy+Ux27ufsMIiHERffbJk5FR0ES8gXL1Y2zE+/BGQO3BYJtrASNWD5OTlUA4iGjHP
 YvzveziiU06AATVZfvEsQcw7uQ2wniPCNBrkRGMNAd8+XqF6t/DnYpEfK9nA0w49kbgA
 zuiH1VrRmxlMyBBL6Dae7SekLAIMGQGvNOqRJ+sniT8ZvuFfi1+agALfk1e0vyzcS1Gh
 ddI+pt+u8j8rS4giH1s2ulvJfJ2czN55u+1vFPyc4pV7UweEqYBrphLGi1RxZcFtnA+k
 c4+PzysyPk1olys/+jHUiC8Wgte4HB4GHG+RLCDBMcdaieQurizVOqWHBsyKy2YxEtRi
 CUyg==
X-Gm-Message-State: AOAM533iYZY5tM2AmU64rYgGunN6R4gvhTAMVsteHI4P4E/v5pBjTzHK
 jLCsGG2Bgo4gshJ5TWcwleWNUhQJlGAUEWcu37oFbMXDRaeNuYvqlkge0fdE55Zcb8fWnWrSEiA
 t6cwvGb9PX5f3ccpHwAx+83xkw++e
X-Received: by 2002:a17:906:2f15:: with SMTP id
 v21mr5069683eji.220.1625230433352; 
 Fri, 02 Jul 2021 05:53:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsnKJ+OXC+UKhfcm+KCiOfozGWK64YO3UZiUGDdAGuJrtkTTw4Rkjd0O5UcpSj/AZshveJHA==
X-Received: by 2002:a17:906:2f15:: with SMTP id
 v21mr5069670eji.220.1625230433208; 
 Fri, 02 Jul 2021 05:53:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:37 +0200
Message-Id: <20210702125338.43248-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] controllers/memcg: increase memory limit in
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

It seems using 100% of memory assigned to given group might trigger OOM,
so add a space of at least one page.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../memcg/functional/memcg_subgroup_charge.sh    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 9b23177a4dc5..88ddbabf7fa9 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -19,9 +19,21 @@ TST_CNT=3
 # $2 - memory.limit_in_bytes in sub group
 test_subgroup()
 {
+	local limit_parent=$1
+	local limit_subgroup=$2
+
+	# OOM might start killing if memory usage is 100%, so give it
+	# always one page size more:
+	if [ $limit_parent -ne 0 ]; then
+		limit_parent=$((limit_parent + PAGESIZE))
+	fi
+	if [ $limit_subgroup -ne 0 ]; then
+		limit_subgroup=$((limit_subgroup + PAGESIZE))
+	fi
+
 	mkdir subgroup
-	echo $1 > memory.limit_in_bytes
-	echo $2 > subgroup/memory.limit_in_bytes
+	echo $limit_parent > memory.limit_in_bytes
+	echo $limit_subgroup > subgroup/memory.limit_in_bytes
 
 	start_memcg_process --mmap-anon -s $PAGESIZES
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
