Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8832F5FE
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 23:39:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6D473C6DF8
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 23:39:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 493423C4CFE
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 23:39:26 +0100 (CET)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4CE792003AC
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 23:39:26 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id s7so3677875qkg.4
 for <ltp@lists.linux.it>; Fri, 05 Mar 2021 14:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUPUOg/ItvcRYKkpbV/r6G5kPvTorJlv+4dbD3F0sSM=;
 b=e6qNP5CIY8rg2yA3UucdyNv0gcuRgcj198Ajz4bVbCFBegDIfFbb7F/iJgpZPT/9TA
 2Uezts0AMurCOXsyEE+ERA5dVeldKPWLhkJk6YUJv0orFjktKAhuhGm0Wzp8FTQhjOH9
 /CVBQPQ4/4ctISCLEcp9Lz3KH46ELBqf3z0vMcKl3RrkTNJ4pJdzdeS+fLaEtsS5hsJq
 BQlWCDb0bdujef8kx7MQTq/VOTfKkn6MWuxZjSnwOXpURF+GxGVLM1e22m6lLIwSbAml
 VYiPU6Zzq3Pp7GVZqmPK7JtE3a5pOxo/nwTUj3Qreb29bVv4KxoEe41Y/il1P2DD2l/X
 bJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUPUOg/ItvcRYKkpbV/r6G5kPvTorJlv+4dbD3F0sSM=;
 b=mAL9tVlC7sJbwugmfNDb9BVFoS75G/3vyrlXx2ifEIRn+mT59kqGRV1pgHUXrc27WL
 Y3rRHHtH6ISQJ01bTxoOdDFTc/xXO45zPxP0NgCHNB/bRNCRHx+ggaFHXn4SbIygG0oi
 QxuITH/WjFlYbqx6G59osc1fZi3cDUVa7vyTd4/TQT9DGS3j0KDnqlBsW1EmawqfXeCv
 c4YHE0yyPGY6EPWxacngPC7qD91xk/pm9xMInJG8GlQWI4EOxki0OfoW/c0BPc11kS3C
 UwBJ2ZLHkpy1cnDr/wwbARXdKBguYVK60KqKbfFZM7WxOydBAhjo+MEpY+baAzse6TmJ
 3fTA==
X-Gm-Message-State: AOAM532lYFA3RirExaa7RritXJVAmEeqP9y7xJpJWWw0MPXASpTZHLay
 VRJsT2i4eHULVZ9uYfD3qaa4GN5k2g==
X-Google-Smtp-Source: ABdhPJxpHdhG2rSvQnZkD1iCISnOZ+rJEbwf4R9Lu5lM779uqsZOLa+K09CdrUv6R7+JqNEcaYPUQg==
X-Received: by 2002:ae9:e64b:: with SMTP id x11mr11156562qkl.290.1614983965010; 
 Fri, 05 Mar 2021 14:39:25 -0800 (PST)
Received: from localhost
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id h6sm2831370qtj.75.2021.03.05.14.39.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 14:39:24 -0800 (PST)
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: ltp@lists.linux.it
Date: Fri,  5 Mar 2021 17:27:14 -0500
Message-Id: <20210305222714.257839-1-msys.mizuma@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] memcg: memcg_subgroup_charge.sh: Fix the parent
 memory limit
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

memcg_subgroup_charge.sh fails on v5.9 and later kernel.
That's because memory.limit_in_bytes isn't set the suitable value
so mem_process is killed by OOM accidentally.

The memory.limit_in_bytes is now wrong value because commit
3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup")
changed the charging memory usage. The percpu memory, which is
needed to create the subgroup, is charged to the parent's usage.

Since we can get the amount of the percpu memory as memory.usage_in_bytes
after the subgroup is created, extend the limit to limit_in_bytes + usage_in_bytes.

Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 .../memcg/functional/memcg_subgroup_charge.sh            | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
index 9b23177a4..512a4e3dd 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
@@ -20,9 +20,16 @@ TST_CNT=3
 test_subgroup()
 {
 	mkdir subgroup
-	echo $1 > memory.limit_in_bytes
 	echo $2 > subgroup/memory.limit_in_bytes
 
+	# v5.9 and later kernel, percpu memory which is needed to create
+	# the subgroup is charged to the parent's usage.
+	# Extend the parent limit so that we can observe the rss of
+	# memcg_process correctly.
+	pre_used=$(cat memory.usage_in_bytes)
+	newlimit=$(( $1 + pre_used ))
+	echo $newlimit > memory.limit_in_bytes
+
 	start_memcg_process --mmap-anon -s $PAGESIZES
 
 	warmup
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
