Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34D659460
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Dec 2022 04:21:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8F6D3CB7EF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Dec 2022 04:21:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDA433CB79F
 for <ltp@lists.linux.it>; Fri, 30 Dec 2022 04:21:13 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D33DB600850
 for <ltp@lists.linux.it>; Fri, 30 Dec 2022 04:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672370471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AW5vKm5Kr4V0PeY5D1rKwRGrVy+jsVcVqjzMHxoVV+o=;
 b=bckfFbyho+H03AW8sCXoBVUE8R1zYiURk/arw3mB9r0pZUiS8e3GGlX7K0kP83t2lPL2CQ
 AMQVgxhGLw3syl/rBSovVsOM3MzsORgvI/FbaxzFLOY5BqSMMLlF2yHKDBIagHklKHouLB
 WA9ErBRyHTviROlidax9tesQYOmjw/8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-cbaV0tR6MTmQT5kcSKBOEg-1; Thu, 29 Dec 2022 22:21:07 -0500
X-MC-Unique: cbaV0tR6MTmQT5kcSKBOEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D95BD3806627;
 Fri, 30 Dec 2022 03:21:06 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C47B2166B26;
 Fri, 30 Dec 2022 03:21:04 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 30 Dec 2022 11:21:02 +0800
Message-Id: <20221230032102.2748123-1-liwang@redhat.com>
In-Reply-To: <CAEemH2ceBni8N00EhZfqwZk_4mZch7ONMcL1oMKuVH-QtNmU_Q@mail.gmail.com>
References: <CAEemH2ceBni8N00EhZfqwZk_4mZch7ONMcL1oMKuVH-QtNmU_Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] set_mempolicy01: adjust the maximum runtime base
 on nodes
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

In most cases, set_mempolicy01 finish quickly, but when the platform
has multiple NUMA nodes, the test matrix combination grows exponentially
and brings about test time to increase extremely fast. Here propose to
set the maximum runtime dynamically according to the system nodes.

  ========= test log on 16 nodes system =========
  ...
  set_mempolicy01.c:80: TPASS: child: Node 15 allocated 16
  tst_numa.c:25: TINFO: Node 0 allocated 0 pages
  tst_numa.c:25: TINFO: Node 1 allocated 0 pages
  tst_numa.c:25: TINFO: Node 2 allocated 0 pages
  tst_numa.c:25: TINFO: Node 3 allocated 0 pages
  tst_numa.c:25: TINFO: Node 4 allocated 0 pages
  tst_numa.c:25: TINFO: Node 5 allocated 0 pages
  tst_numa.c:25: TINFO: Node 6 allocated 0 pages
  tst_numa.c:25: TINFO: Node 7 allocated 0 pages
  tst_numa.c:25: TINFO: Node 8 allocated 0 pages
  tst_numa.c:25: TINFO: Node 9 allocated 0 pages
  tst_numa.c:25: TINFO: Node 10 allocated 0 pages
  tst_numa.c:25: TINFO: Node 11 allocated 0 pages
  tst_numa.c:25: TINFO: Node 12 allocated 0 pages
  tst_numa.c:25: TINFO: Node 13 allocated 0 pages
  tst_numa.c:25: TINFO: Node 14 allocated 0 pages
  tst_numa.c:25: TINFO: Node 15 allocated 16 pages
  set_mempolicy01.c:80: TPASS: parent: Node 15 allocated 16

  Summary:
  passed   393210
  failed   0
  broken   0
  skipped  0
  warnings 0

  real	6m15.147s
  user	0m33.641s
  sys	0m44.553s

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../kernel/syscalls/set_mempolicy/set_mempolicy01.c    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
index 07f5d789b..e9712b7be 100644
--- a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
+++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy01.c
@@ -35,6 +35,15 @@ static void setup(void)
 	nodes = tst_get_nodemap(TST_NUMA_MEM, 2 * PAGES_ALLOCATED * page_size / 1024);
 	if (nodes->cnt <= 1)
 		tst_brk(TCONF, "Test requires at least two NUMA memory nodes");
+
+	/*
+	 * In most cases, set_mempolicy01 finish quickly, but when the platform
+	 * has multiple NUMA nodes, the test matrix combination grows exponentially
+	 * and bring about test time to increase extremely fast.
+	 *
+	 * Here reset the maximum runtime according to the NUMA nodes.
+	 */
+	tst_set_max_runtime(test.max_runtime * (1 << nodes->cnt/16));
 }
 
 static void cleanup(void)
@@ -110,6 +119,7 @@ static struct tst_test test = {
 	.tcnt = 2,
 	.forks_child = 1,
 	.needs_checkpoints = 1,
+	.max_runtime = 600,
 };
 
 #else
-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
