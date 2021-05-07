Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E03761C0
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:17:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 352F93C567C
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 10:17:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE6323C55ED
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:17:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1AD41601F19
 for <ltp@lists.linux.it>; Fri,  7 May 2021 10:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620375461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pPjHhHaODW2cG5e8URgnFfGp9aNJ7IofR4/m0VshsNM=;
 b=Fb+YRT/IQLu0Z3APLYkaA4yWU10duX4CldQ1nS4njww3s6AZUkbqZ70ABwmCj53w3XFy5h
 pbV916P/jH4OyE7bsNWI8OyRriJG+blJ0dkegVIXibCoMTyG+TWsNPqKHXI0u+3rwCnC83
 UTjLsu5QUlyl9qHbwS8oh9j5O1uQSoc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5649CAFE2;
 Fri,  7 May 2021 08:17:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  7 May 2021 09:17:37 +0100
Message-Id: <20210507081737.26674-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] bpf_prog05: Use 64bit wide integer constant on m32
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

On 32bit 1UL is only 32bits wide. We need it to be 64bits.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/bpf/bpf_prog05.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_prog05.c b/testcases/kernel/syscalls/bpf/bpf_prog05.c
index f2e0e4698..2dce72ee8 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog05.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog05.c
@@ -142,11 +142,11 @@ static void run(void)
 	*key = 0;
 
 	tst_res(TINFO, "Check w7(-1) /= w6(0) [r7 = -1, r6 = 1 << 32]");
-	expect_reg_val("src(r6)", 1UL << 32);
+	expect_reg_val("src(r6)", 1ULL << 32);
 	expect_reg_val("dst(r7)", 0);
 
 	tst_res(TINFO, "Check w7(-1) %%= w6(0) [r7 = -1, r6 = 1 << 32]");
-	expect_reg_val("src(r6)", 1UL << 32);
+	expect_reg_val("src(r6)", 1ULL << 32);
 	expect_reg_val("dst(r7)", (uint32_t)-1);
 
 	SAFE_CLOSE(map_fd);
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
