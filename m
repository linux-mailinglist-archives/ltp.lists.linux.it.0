Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0F609F2E
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 12:39:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9509D3C97B2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 12:38:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C6973C86C5
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 12:38:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 82EC6200754
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 12:38:46 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EC7151FD84;
 Mon, 24 Oct 2022 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666607925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xnPMvD82cvNT+bhU6PHWsfVZNHzq3s7ZhBhJ/WQcWA=;
 b=sZRF5Uibpv4HztJJ9rNwQR9tGXhafN1IDJa2Wr0Zkg/gcdmlCFaU0GVzWGKmOUgCM9foeH
 0DTw0wrOvkF3ALFYrXtmKnlYUTFSKzzUDH3UI+0dh87WE8aCVPNte0/ruyvl6jtAw35Q7c
 RP4W26dmR7WuTH1IPqC3mLeZ7AhJG4U=
Received: from g78.suse.de (unknown [10.163.28.198])
 by relay2.suse.de (Postfix) with ESMTP id A1C192C141;
 Mon, 24 Oct 2022 10:38:45 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 Oct 2022 11:38:36 +0100
Message-Id: <20221024103836.6394-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221024103836.6394-1-rpalethorpe@suse.com>
References: <20221024103836.6394-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] cpuid/ptrace07: Only compile on x86_64
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Both cpuid.h and ptrace07 contain inline ASM for x86(_64). There is no
need to compile any part of the test or cpuid.h

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Martin Doucha <martin.doucha@suse.com>
---
 include/lapi/cpuid.h                        |  4 ++++
 testcases/kernel/syscalls/ptrace/ptrace07.c | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/lapi/cpuid.h b/include/lapi/cpuid.h
index cd0567f92..7ec785ecf 100644
--- a/include/lapi/cpuid.h
+++ b/include/lapi/cpuid.h
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#if !(defined(__i386__) || defined(__x86_64__))
+#  error "cpuid.h should only be included on x86"
+#endif
+
 #ifdef HAVE_CPUID_H
 #  include <cpuid.h>
 #endif
diff --git a/testcases/kernel/syscalls/ptrace/ptrace07.c b/testcases/kernel/syscalls/ptrace/ptrace07.c
index d1e68cbc6..362cee543 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace07.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace07.c
@@ -24,6 +24,10 @@
  * know about the architecture-dependent FPU state.
  */
 
+#include "tst_test.h"
+
+#ifdef __x86_64__
+
 #include <errno.h>
 #include <inttypes.h>
 #include <sched.h>
@@ -34,7 +38,6 @@
 
 #include "config.h"
 #include "ptrace.h"
-#include "tst_test.h"
 #include "tst_safe_macros.h"
 #include "lapi/cpuid.h"
 
@@ -60,7 +63,6 @@ static void check_regs_loop(uint32_t initval)
 	uint32_t xmm0[4] = { initval, initval, initval, initval };
 	int status = 1;
 
-#ifdef __x86_64__
 	asm volatile("   movdqu %0, %%xmm0\n"
 		     "   mov %0, %%rbx\n"
 		     "1: dec %2\n"
@@ -74,7 +76,6 @@ static void check_regs_loop(uint32_t initval)
 		     "3:\n"
 		     : "+m" (xmm0), "+r" (status)
 		     : "r" (num_iters) : "rax", "rbx", "xmm0");
-#endif
 
 	if (status) {
 		tst_res(TFAIL,
@@ -212,3 +213,7 @@ static struct tst_test test = {
 	}
 
 };
+
+#else
+TST_TEST_TCONF("Tests an x86_64 feature");
+#endif	/* if x86 */
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
