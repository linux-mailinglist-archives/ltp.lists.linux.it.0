Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90D52CEAA
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 10:51:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6D1B3CAAF3
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 10:51:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2695A3CA932
 for <ltp@lists.linux.it>; Thu, 19 May 2022 10:51:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6772814010FF
 for <ltp@lists.linux.it>; Thu, 19 May 2022 10:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652950273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2iOTUtFSizWv926WTEE6ge9GlBRl7StDrEXVsLWBpZY=;
 b=LWC4htFU4xu8nZxL0hkiJyYEAXNfsT6srRDuydZHbVWFJkS9HjysPbL6uWNjxuaS4pvwwz
 EHSkvAHwJzOYo2UQ/GwG7WdAvuH0mPwfAzCDf/jUwtxWIfdWWO+QRE4n6Gx6dvNalwSnsk
 lFFsI9p1kvrfCiJA4EN4+r2kNkWgdbE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-O_SXDwBZMtydmE0xcUl2vw-1; Thu, 19 May 2022 04:51:11 -0400
X-MC-Unique: O_SXDwBZMtydmE0xcUl2vw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67FDC3810793
 for <ltp@lists.linux.it>; Thu, 19 May 2022 08:51:11 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E71F492C3B
 for <ltp@lists.linux.it>; Thu, 19 May 2022 08:51:10 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 19 May 2022 10:51:08 +0200
Message-Id: <47bc8106e2c6f59e297e7cdabea3eef16e65cf44.1652950191.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/set_mempolicy04: fix node available memory
 check
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

Formula for amount of needed memory on each node is wrong. Test is
currently using '20 * FILES' pages, which is 200 pages. But on 2 node
system it allocates up to 570 pages from single node.

Correct the formula to account for linear increase of allocated
pages with each outer loop iteration.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/set_mempolicy/set_mempolicy04.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy04.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy04.c
index 4399503c3054..2a1d2e1b9ad0 100644
--- a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy04.c
+++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy04.c
@@ -40,9 +40,11 @@ static struct tst_nodemap *nodes;
 
 static void setup(void)
 {
+	int node_min_pages = FILES * (FILES + 1) / 2 * 10 + FILES * 10;
+
 	page_size = getpagesize();
 
-	nodes = tst_get_nodemap(TST_NUMA_MEM, 20 * FILES * page_size / 1024);
+	nodes = tst_get_nodemap(TST_NUMA_MEM, node_min_pages * page_size / 1024);
 	if (nodes->cnt <= 1)
 		tst_brk(TCONF, "Test requires at least two NUMA memory nodes");
 }
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
