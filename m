Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D33E8E34
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:11:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73FC23C6F4E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:11:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D32B3C6FED
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:40 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E9590600739
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:39 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 76CE83F04C
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676699;
 bh=Thjrc55Ns2Dkzfi9Bp9tXq1DNSN3USaXK/c9IP3nw2E=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=m/Ku6Ct8g3Pp9AvTdMWBlAZCZPcgpayQyOfYi+Uq6GZBBtPQdiZdLcEag3rgpNLeN
 RlIpC2UPD2cgc5rK5lgHs6U2zWWDV5MUNpKvJ5B/Y3DW7QC/e25ZqWmPwkivhq7nF3
 LVLRGhUPTgWuNqDGJpKayzpfkf1UpdpdimMkALcsJpoI0DKnh/RfOz8h+OXCTFNlf+
 CdsesFBg29fCDjlGjSxiAcUYhqdQjHaZ7jbbVNKCnUKPUwtF+HoiILEckQ9KXQPZym
 oLRQstedmTYU69P9GUnwWvGOUNGaWhp0H1w1NcR+S3ORxYvFeJW+toF3IO9yaZOHkP
 ZA2w9tBGMy9XA==
Received: by mail-ed1-f69.google.com with SMTP id
 s8-20020a0564025208b02903bd8539e1caso950300edd.22
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Thjrc55Ns2Dkzfi9Bp9tXq1DNSN3USaXK/c9IP3nw2E=;
 b=ahxDItQ5DHQSWRcKaH7Iod/P59+g+x21Zcer29aYTpbNLTjRdpZCt+/1s0aTC0DD3C
 jxcbLYImdzholcclmbnNjToiyTIUq7iDfiC97xGaSo83yv/0dRcFzevNLUrRluZUEGwD
 tdZmD+HdxgL/EftU7JoYaT2k1/2+JhfxlQKm1ERuYtKgGECqLrGtuI/DM3RdubWqTIzZ
 /o988ZwMcXUICl03WzcB/Gs7xHT8s5oLgm3WFszOe+UPj3sqzMJG1J1RnqFc9FOuPqoi
 kN5yisuK1VaWcyhysa7kfmhc3/GdvVKLIxnLAQVszX2n7/zhsJaSe6MzodETYajBK8Qw
 7kCQ==
X-Gm-Message-State: AOAM53304MinpbxTLoybJNGm3ht+ZrokhE/HbuIt7Jq4MoHHCBxoEueo
 EYV0Dt75aHc8ZKQFSjzP3jXhIZaN3NPp5JWmkcEWhSl0S9Y+jXIPALll1Ohcvgwu1iORr+0Odrq
 7HuHXyHbiVRg/Ue54cuJel3xoX7EG
X-Received: by 2002:aa7:c45a:: with SMTP id n26mr10708629edr.218.1628676698838; 
 Wed, 11 Aug 2021 03:11:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU8yRy3dvwnK3T49fdl9RFbnPYrCcNjRv67yBJajGcyHzRwNjC9bqRLgc6kb+zfWaFIL5jag==
X-Received: by 2002:aa7:c45a:: with SMTP id n26mr10708618edr.218.1628676698722; 
 Wed, 11 Aug 2021 03:11:38 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id c6sm7938345eje.105.2021.08.11.03.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:11:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 12:10:56 +0200
Message-Id: <20210811101058.36695-3-krzysztof.kozlowski@canonical.com>
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
Subject: [LTP] [RESEND PATCH 2/4] controllers/memcg: fix memcg_stat_test on
 two node machines
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

Recent Linux kernels charge groups also with kernel memory.  This is not
limited only to process-allocated memory but also cgroup-handling code
memory as well.

For example since kernel v5.9 with commit 3e38e0aaca9e ("mm: memcg:
charge memcg percpu memory to the parent cgroup") creating a subgroup
causes several kernel allocations towards this group.

These additional kernel memory allocations are proportional to number of
CPUs and number of nodes.

On c4.8xlarge AWS instance with 36 cores in two nodes with v5.11 Linux
kernel the memcg_stat_test was failing because of unable to set memory
limit lower than current kernel memory accounted to the group:

    memcg_stat_test 5 TINFO: Test hierarchical_memory_limit with enabling hierarchical accounting
        shell code from test:
        > mkdir subgroup
        > cat memory.kmem.usage_in_bytes
        > 442368
        > echo $PAGESIZE > memory.limit_in_bytes
    /home/ubuntu/ltp-install/testcases/bin/memcg_stat_test.sh: 47: echo: echo: I/O error
    memcg_stat_test 5 TFAIL: hierarchical_memory_limit is 270336, 135168 expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../controllers/memcg/functional/memcg_stat_test.sh      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index e5eb7e5d0001..f6b5aa84e31e 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -43,12 +43,15 @@ test5()
 	tst_res TINFO "Test hierarchical_memory_limit with enabling hierarchical accounting"
 	echo 1 > memory.use_hierarchy
 
+	local limit=$PAGESIZES
+	memcg_adjust_limit_for_kmem limit
+
 	mkdir subgroup
-	echo $PAGESIZES > memory.limit_in_bytes
-	echo $((PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
+	echo $limit > memory.limit_in_bytes
+	echo $((limit + PAGESIZES * 2)) > subgroup/memory.limit_in_bytes
 
 	cd subgroup
-	check_mem_stat "hierarchical_memory_limit" $PAGESIZES
+	check_mem_stat "hierarchical_memory_limit" $limit
 
 	cd ..
 	rmdir subgroup
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
