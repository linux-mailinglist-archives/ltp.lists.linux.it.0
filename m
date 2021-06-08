Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 552D039F7CF
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:27:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D706A3C7B00
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 15:27:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 112343C1D75
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:27:34 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 69A021A00E26
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 15:27:34 +0200 (CEST)
Received: from [191.13.218.203] (helo=mussarela..)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1lqblU-0003Sa-DR; Tue, 08 Jun 2021 13:27:32 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: ltp@lists.linux.it
Date: Tue,  8 Jun 2021 10:27:23 -0300
Message-Id: <20210608132723.255996-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on 32-bit
 platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When multiplying 30 with NSEC_PER_SEC, the result would overflow on 32-bit
platforms, unless cast to long long, which is what tst_ts_from_ns expects.

Though we could change NSEC_PER_SEC to be a long long constant, it was
considered a risk for regressions, as it would affect every use of it.

After this change, futex_wake04 passes on i386.

Reported-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 testcases/kernel/syscalls/futex/futex_wake04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c b/testcases/kernel/syscalls/futex/futex_wake04.c
index 2260a3936d6e..479001e2e59a 100644
--- a/testcases/kernel/syscalls/futex/futex_wake04.c
+++ b/testcases/kernel/syscalls/futex/futex_wake04.c
@@ -56,7 +56,7 @@ static void setup(void)
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	futex_supported_by_kernel(tv->fntype);
 
-	to = tst_ts_from_ns(tv->tstype, 30 * NSEC_PER_SEC);
+	to = tst_ts_from_ns(tv->tstype, (long long) 30 * NSEC_PER_SEC);
 }
 
 static void *wait_thread1(void *arg LTP_ATTRIBUTE_UNUSED)
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
