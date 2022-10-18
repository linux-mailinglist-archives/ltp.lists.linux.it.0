Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9054602F9E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Oct 2022 17:25:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66CBB3CB0F0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Oct 2022 17:25:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C4B853CB077
 for <ltp@lists.linux.it>; Tue, 18 Oct 2022 17:25:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 79C50100064B
 for <ltp@lists.linux.it>; Tue, 18 Oct 2022 17:25:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D9F8F1F890;
 Tue, 18 Oct 2022 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666106734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0KMHBNk+Ovx2Ri9hSjXTf4CyMUWf0aTKpa+Rc0PD2I=;
 b=durQwOmqd/DgnbZNAZnxIeeX6LM++Ygd/3MLIfUxjFM1sJxNOA/w5vvyPRsYbmzIfcr87e
 zCMofRuQJFcvaYdUaZMRjFeMRdRQmwHc4F3dLkvj0Du9gDWXnlvwR+f23JIdNaDYSQkY7O
 UflCqDM2T3371wu861w1A4Hjn+iPNFE=
Received: from g78.suse.cz (unknown [10.100.228.202])
 by relay2.suse.de (Postfix) with ESMTP id DC0FD2C141;
 Tue, 18 Oct 2022 15:25:33 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 18 Oct 2022 16:25:27 +0100
Message-Id: <20221018152527.4636-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221018152527.4636-1-rpalethorpe@suse.com>
References: <20221018152527.4636-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] ptrace07: Fix compilation by avoiding
 aligned_alloc
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use memalign instead because we live in the past.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Pengfei Xu <pengfei.xu@intel.com>
---
 testcases/kernel/syscalls/ptrace/ptrace07.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace07.c b/testcases/kernel/syscalls/ptrace/ptrace07.c
index 6bd2b1062..a60c2a49e 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace07.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace07.c
@@ -35,6 +35,7 @@
 #include "config.h"
 #include "ptrace.h"
 #include "tst_test.h"
+#include "tst_safe_macros.h"
 #include "lapi/cpuid.h"
 
 #ifndef PTRACE_GETREGSET
@@ -95,7 +96,7 @@ static void do_test(void)
 	 * of the XSAVE/XRSTOR save area) required by enabled features in XCR0.
 	 */
 	__cpuid_count(CPUID_LEAF_XSTATE, ecx, eax, ebx, ecx, edx);
-	xstate = aligned_alloc(64, ebx);
+	xstate = SAFE_MEMALIGN(64, ebx);
 	struct iovec iov = { .iov_base = xstate, .iov_len = ebx };
 	int status;
 	bool okay;
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
