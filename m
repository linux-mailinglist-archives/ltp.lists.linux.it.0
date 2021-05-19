Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A90388EEC
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 15:21:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D92F3C30BE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 15:21:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70F863C0BB1
 for <ltp@lists.linux.it>; Wed, 19 May 2021 15:21:49 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C28431A00E2B
 for <ltp@lists.linux.it>; Wed, 19 May 2021 15:21:48 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1ljM8w-0003BJ-R1; Wed, 19 May 2021 13:21:47 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 19 May 2021 10:19:16 -0300
Message-Id: <20210519131916.314184-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] mtest06/mmap1: Further limit distant mmap size
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

Though on recent kernels (starting with 5.2, commit
8c7829b04c523cdc732cb77f59f03320e09f3386 ("mm: fix false-positive
OVERCOMMIT_GUESS failures"), overcommit accounting allows for allocating up
to MemTotal memory, older kernels have a much more complicated overcommit
guess accounting.

That leads to mmap failing on small enough systems:

mmap1.c:205: TBROK: mmap((nil),2088370176,3,34,-1,0) failed: ENOMEM (12)

Allocating only half of the total memory would generally work on test
systems.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 testcases/kernel/mem/mtest06/mmap1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/mem/mtest06/mmap1.c b/testcases/kernel/mem/mtest06/mmap1.c
index 56588e1ebaff..10c47c35cb02 100644
--- a/testcases/kernel/mem/mtest06/mmap1.c
+++ b/testcases/kernel/mem/mtest06/mmap1.c
@@ -186,7 +186,7 @@ static void setup(void)
 {
 	struct sigaction sigptr;
 	size_t distant_mmap_size;
-	long mem_total;
+	size_t mem_total;
 
 	page_sz = getpagesize();
 	mem_total = SAFE_READ_MEMINFO("MemTotal:");
@@ -195,7 +195,7 @@ static void setup(void)
 #ifdef TST_ABI32
 	distant_mmap_size = 256*1024*1024;
 #else
-	distant_mmap_size = (mem_total > 2 * GIGABYTE) ? 2 * GIGABYTE : mem_total;
+	distant_mmap_size = (mem_total > 4 * GIGABYTE) ? 2 * GIGABYTE : mem_total / 2;
 #endif
 	/*
 	 * Used as hint for mmap thread, so it doesn't interfere
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
