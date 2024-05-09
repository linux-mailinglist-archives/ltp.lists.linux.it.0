Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C4E8C0AED
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2024 07:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1715232397; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=+IaNW5CZtTGvuqvBRuFxggtmCHFL0CarxZdFUwlyD0s=;
 b=bzNH0V8jkVYKvryJo+EIGsotwAYQ7NDtGaP5wEufx9Yor2dvEhIQA+xy6aRVDjj7xO9mE
 tkUpO9rpEJZhjxMLPSP0AZMFU40v0RTf3T/yDPpTU8ZdMhFF9IFjyKBqAGUXOzFxZV64WHN
 as+ugGJoD5w8g5wsjWv7w0an4egVXVE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB3593CDE83
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2024 07:26:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8052F3CBFA5
 for <ltp@lists.linux.it>; Thu,  9 May 2024 07:26:24 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=andestech.com (client-ip=60.248.80.70; helo=atcsqr.andestech.com;
 envelope-from=minachou@andestech.com; receiver=lists.linux.it)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4D66F1401229
 for <ltp@lists.linux.it>; Thu,  9 May 2024 07:26:19 +0200 (CEST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 4495Q6tg042978;
 Thu, 9 May 2024 13:26:06 +0800 (+08)
 (envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 9 May 2024 13:26:01 +0800
To: <ltp@lists.linux.it>
Date: Thu, 9 May 2024 13:25:41 +0800
Message-ID: <20240509052541.18707-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 4495Q6tg042978
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] hugemmap15: Support RISC-V to do __cache_flush. (#79)
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
From: Hui Min Mina Chou via ltp <ltp@lists.linux.it>
Reply-To: Hui Min Mina Chou <minachou@andestech.com>
Cc: Hui Min Mina Chou <minachou@andestech.com>, tim609@andestech.com,
 cynthia@andestech.com, az70021@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

AndesCore CPU test fails due to an illegal instruction at the first
jumpfunc(), caused by executing incorrect instructions after
self-modifying code.

On RISC-V CPUs, a FENCE.i synchronizes instruction and data streams,
ensuring that subsequent instruction fetch on a RISC-V hart will see
any previous data stores already visible to the same RISC-V hart.

Thus, cacheflush() in the test should also use __clear_cache for RISC-V.
In SMP systems, it invokes the kernel syscall riscv_flush_icache to inform
each hart to flush their local i-caches.

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
index 4d198407044a..a84ba6476f1e 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
@@ -47,7 +47,7 @@ static void cacheflush(void *p)
 {
 #if defined(__powerpc__)
 	asm volatile("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r"(p));
-#elif defined(__arm__) || defined(__aarch64__)
+#elif defined(__arm__) || defined(__aarch64__) || defined(__riscv)
 	__clear_cache(p, p + COPY_SIZE);
 #else
 	(void)p;
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
