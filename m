Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DC3B13E5
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 08:25:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CA633C2244
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 08:25:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A42EA3C2244
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:25:07 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D37301000F2D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624429505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7smC1Y1TuwgqmTb25HWwSdaZJyCBI1zx0cD2IWR+jq0=;
 b=FawjU+/3HK7I6+4OMkuXdHxj5kiLAWoSMOlkdCcrRjCPJhxRQSD4e5WNn/43753gz30gYP
 SVrXKYWrsqjqhkH26Yxkjz7XDQeBQWyj462yPy+7qVuLM0MMFycTMKrMOHKp1d/9XgWQ0g
 7WHHwizcGCotZkvuJ/uc/WDVqf2Fh04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Idu47tfQNC2a-NMNwXv9MA-1; Wed, 23 Jun 2021 02:25:02 -0400
X-MC-Unique: Idu47tfQNC2a-NMNwXv9MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC482100C660;
 Wed, 23 Jun 2021 06:25:00 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D71EF10016FE;
 Wed, 23 Jun 2021 06:24:59 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 14:24:55 +0800
Message-Id: <20210623062456.430406-2-liwang@redhat.com>
In-Reply-To: <20210623062456.430406-1-liwang@redhat.com>
References: <20210623062456.430406-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] oom: enable lite == 1 for memory.swap.max
 testing
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

oom03: adding print info and restore memory.swap.max after testing
oom05: enable lite == 1 for memory.swap.max testing

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/mem/oom/oom03.c | 6 ++++++
 testcases/kernel/mem/oom/oom05.c | 8 ++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/oom/oom03.c
index b3770cf8f..942b77ba1 100644
--- a/testcases/kernel/mem/oom/oom03.c
+++ b/testcases/kernel/mem/oom/oom03.c
@@ -46,6 +46,7 @@ static void verify_oom(void)
 	testoom(0, 0, ENOMEM, 1);
 
 	if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
+		tst_res(TINFO, "OOM on MEMCG with special memswap limitation:");
 		/*
 		 * Cgroup v2 tracks memory and swap in separate, which splits
 		 * memory and swap counter. So with swappiness enable (default
@@ -62,6 +63,11 @@ static void verify_oom(void)
 			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM + MB);
 
 		testoom(0, 1, ENOMEM, 1);
+
+		if (TST_CGROUP_VER(cg, "memory") == TST_CGROUP_V1)
+			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", ~0UL);
+		else
+			SAFE_CGROUP_PRINT(cg, "memory.swap.max", "max");
 	}
 
 	/* OOM for MEMCG with mempolicy */
diff --git a/testcases/kernel/mem/oom/oom05.c b/testcases/kernel/mem/oom/oom05.c
index 9c9bba7f6..079cab123 100644
--- a/testcases/kernel/mem/oom/oom05.c
+++ b/testcases/kernel/mem/oom/oom05.c
@@ -63,8 +63,12 @@ static void verify_oom(void)
 	if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"special memswap limitation:");
-		SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
-		testoom(0, 0, ENOMEM, 1);
+		if (TST_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
+			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", MB);
+		else
+			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM + MB);
+
+		testoom(0, 1, ENOMEM, 1);
 
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"disabled memswap limitation:");
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
