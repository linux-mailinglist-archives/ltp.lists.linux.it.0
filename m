Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B33C7404
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23C973C8776
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:14:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3AE4D3C9CBF
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:39 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1ACA9200972
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:37 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D294E40596
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626192813;
 bh=TUydvIL4WCw9DF//PsH7ynbDUp2wosd+9HFcZHRyLV0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=dNAv/aZdjh53p99DNyywQu07HyUsypaRCTefK7+NTLqXapEUmSXQ2MhxsqKb8Tych
 YJYzuElFl7mUv5KmD89dXO5mrgBD6BCVXl9r8yv1XcYvkFLOr2Nb7vW1nM8AFSilQa
 NxRKspl8zb2uSxOnLJ+YeT07HKlKkpPO4NEIfz3nb+6qUkcsQkW6R4Hk2mRmM5bcqX
 91+q/wRRtkqeH7Pp+O/xNYvPSlVFBOKeZVb/31ZFtH+nV0sWtFv/X6wKZHGCL5b9Mg
 8uTObrKLaP71zxg3K+s0GIkAMalf3xEdYLgGB6xDoqvDDG7blAb2umNX+23Hjobx3S
 otgsF9JsK9V1Q==
Received: by mail-ed1-f71.google.com with SMTP id
 c21-20020aa7d6150000b02903ab03a06e86so359478edr.14
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUydvIL4WCw9DF//PsH7ynbDUp2wosd+9HFcZHRyLV0=;
 b=OwG1dYKOKDvIZla3ZEM0rSxlaBWgzJdvCnQKqGJqTD9iULnlJalBBwPVwc8pK7M0Td
 7uNfb8FfAUduHUnaNIyVjg/7J79RLOLf/n2dmY3vI2AnktQqzIb7NdgnVqU0WXEUTeM4
 bjZmRZ+BxknR9c2pZC+THEVSuwIy/73AA7qyo55loyI9hcAYguQMMp4CzFJ9J+l/PqCq
 91f4XetdsKpgWbAKqunFf5z/sRNHX69z5A9zS6UauKzFJ4VUazBkdQn9qqz1dThvs9yF
 3WwS/Kv6j7Fmtxv3isslMIW40hJpIlcVlswZb9RrowGRI61KGJijHn9hseCnMIi2zGO9
 6agg==
X-Gm-Message-State: AOAM53153/+3VGXBdQIOmqNxmBorALqmaC8BjIR7ue91TQqVQXsMpHst
 nN5Sr2MB/kjYzz3UcnwFxUrf+RwqIawcSmrW91isbRbfr/W+fhajLGZ/RCPRcHDb41aHYfEO7TA
 740rfuxSpqhCdRZS9QJkM2kbJQZhV
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr6736891ejc.237.1626192813440; 
 Tue, 13 Jul 2021 09:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx99G8HvXYFuRC8hiMvGLneTwPBbIUQrLInz2EwtudLr6W+fVtGLVzN3Nfxo2GzadZwPiNqcQ==
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr6736880ejc.237.1626192813333; 
 Tue, 13 Jul 2021 09:13:33 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id qp12sm8331122ejb.90.2021.07.13.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:13:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 18:13:26 +0200
Message-Id: <20210713161328.62560-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
References: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] controllers/memcg: fix memcg_stat_test on two
 node machines
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
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
