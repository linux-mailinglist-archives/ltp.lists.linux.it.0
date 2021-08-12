Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F93EA021
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F7AC3C6F1C
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A1623C2E09
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:24 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9800600198
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:23 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 50A853F04E
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755403;
 bh=ynJX/i4iLC0nwj6Xb7ZVbzAkSC4MKYe1O4P/gJuOy5Y=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Bz2p7QLvkinyWL/xDY1T4ko49zP/do6/NvGUzAOZ2SaKfGm3Cozqx0iu9SPdSeYM9
 J7W9hpfhzXy34e02viP0whDndDoKG/D6cJkxtVjm5RR8nXw0pxvFXzL7pMkN+cemYt
 aIEfViBGFImhocxYT44vVhX1Mg1dkgfZcEReihYfkastTCbLl8qnWKRfMMuaJfZ/dq
 fCDgq9NVgP8fY2nwnrm5hKpGpLmfeZPamRiO10CAbP0XNigyyOhh/Heb/j9uBSr4XZ
 JGoKfFhcmpe+cjrv5b3HHM5MoeoDNrf9GM78zOybVjUhfGXWebzvijohIWvfp+VTcL
 jEMgz32kbwLvw==
Received: by mail-ed1-f71.google.com with SMTP id
 dh21-20020a0564021d35b02903be0aa37025so2674031edb.7
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 01:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynJX/i4iLC0nwj6Xb7ZVbzAkSC4MKYe1O4P/gJuOy5Y=;
 b=r+Vt1qxsLj8eRxVp96X6vu1RlJubuu6HV2dtOVif3UXM0TAgRrQ6+jByQpVnWKc+g7
 JHI3T7b1y2eBkLTfU0YNAHIqTyFmLSs/Kexyq7j7DtkH4xaW4yHGQOxxFdkGZu3SclWs
 BI6ugqzpuTRqOU6AwL8Ixu5F6Fd52zUfm38pUczMfOYilMA82zcG3esZp3ruZAegEdbD
 pFUKC/FyYqrlWwcYZucBnED1e4+9j2YbovKerOJAnBblsRjNNhMmtij9uR7nWcN5/2UK
 5nfWDz7Q8IvPAbM0rFKJuQnKewjgtgPhKpSVtnv8p18ENvXz685vL81BcZ4YQXIPYbxp
 lqMw==
X-Gm-Message-State: AOAM531IfAMnNDO9zg/k0n72JbJm7K4L/l7hIoQD8O23/6WUyKhddcHb
 tyXcKXUw7iUOQDiUTwe8UfDxjpAsIYrRUmV+4VGZgxWS3IqttcIGxibTW0DAIsLpNxeOJnucQbO
 Kr+i3M98wAy6S0w8q8Wn9zvvgYp0K
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr4018543eds.166.1628755402610; 
 Thu, 12 Aug 2021 01:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD6UuDyZoZ1rvjVmkhNJ5Gl+s7crVbw7UO5Z/s5vQ9mh53xvUbERtY/QBcRvuJrzz1Xb/QlA==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr4018534eds.166.1628755402499; 
 Thu, 12 Aug 2021 01:03:22 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm759114edv.78.2021.08.12.01.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 12 Aug 2021 10:02:40 +0200
Message-Id: <20210812080242.16972-3-krzysztof.kozlowski@canonical.com>
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
Subject: [LTP] [PATCH v2 2/4] controllers/memcg: fix memcg_stat_test on two
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
 .../controllers/memcg/functional/memcg_stat_test.sh       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index e5eb7e5d0001..94eaa45ce0d8 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -43,12 +43,14 @@ test5()
 	tst_res TINFO "Test hierarchical_memory_limit with enabling hierarchical accounting"
 	echo 1 > memory.use_hierarchy
 
+	local limit=$(memcg_adjust_limit_for_kmem $PAGESIZES)
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
