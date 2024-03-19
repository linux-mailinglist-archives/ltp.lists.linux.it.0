Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99287F7EC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Mar 2024 08:01:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 246AB3CE72F
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Mar 2024 08:01:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A25AE3CE67B
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 08:00:50 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B22A52009EE
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 08:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710831648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHmOnP+MmCa4iYUovlvkUDZgLt+KftcrGKlyDxTfFRg=;
 b=G6p7hiRa5ZEmH/ENu9ziG7rqyjKZ7ujBz11krOeYvHcNRc710T0rjvCjBp4d9HLYadNjrM
 IH4k3fesxjpje+0TuLATisitLlAIqk+AzL6in5OSEh7g2CLAxi1O2hpTKoxhqXR9Yn4y4w
 NL1bUTBu9fbWuE7N9OsQlNKsUzfB9A0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-dR71ROA2NEuOE0KVO11frQ-1; Tue, 19 Mar 2024 03:00:46 -0400
X-MC-Unique: dR71ROA2NEuOE0KVO11frQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08E8C84B0C3
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 07:00:46 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D3D492BDB
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 07:00:44 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 19 Mar 2024 15:00:39 +0800
Message-Id: <20240319070040.3239539-2-liwang@redhat.com>
In-Reply-To: <20240319070040.3239539-1-liwang@redhat.com>
References: <20240319070040.3239539-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/3] swapon/off: replace make_swapfile by new macro
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/swapoff/swapoff01.c | 2 +-
 testcases/kernel/syscalls/swapoff/swapoff02.c | 2 +-
 testcases/kernel/syscalls/swapon/swapon01.c   | 2 +-
 testcases/kernel/syscalls/swapon/swapon02.c   | 4 ++--
 testcases/kernel/syscalls/swapon/swapon03.c   | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
index 2a0b683c1..d0d7c3c1f 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
@@ -44,7 +44,7 @@ static void setup(void)
 {
 	is_swap_supported(TEST_FILE);
 
-	if (make_swapfile(SWAP_FILE, 65536, 1))
+	if (MAKE_SWAPFILE_BLKS(SWAP_FILE, 65536, 1))
 		tst_brk(TBROK, "Failed to create file for swap");
 }
 
diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
index 52906848f..b57290386 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff02.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
@@ -88,7 +88,7 @@ static void setup(void)
 
 	is_swap_supported(TEST_FILE);
 
-	if (make_swapfile(SWAP_FILE, 10, 1))
+	if (MAKE_SWAPFILE_BLKS(SWAP_FILE, 10, 1))
 		tst_brk(TBROK, "Failed to create file for swap");
 }
 
diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
index d406e4bd9..2e399db61 100644
--- a/testcases/kernel/syscalls/swapon/swapon01.c
+++ b/testcases/kernel/syscalls/swapon/swapon01.c
@@ -38,7 +38,7 @@ static void verify_swapon(void)
 static void setup(void)
 {
 	is_swap_supported(SWAP_FILE);
-	make_swapfile(SWAP_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(SWAP_FILE, 10, 0);
 
 	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
 	SAFE_CG_PRINTF(tst_cg, "memory.max", "%lu", TESTMEM);
diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
index 7e876d26a..f76bb28cf 100644
--- a/testcases/kernel/syscalls/swapon/swapon02.c
+++ b/testcases/kernel/syscalls/swapon/swapon02.c
@@ -50,8 +50,8 @@ static void setup(void)
 	is_swap_supported(TEST_FILE);
 
 	SAFE_TOUCH(NOTSWAP_FILE, 0777, NULL);
-	make_swapfile(SWAP_FILE, 10, 0);
-	make_swapfile(USED_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(SWAP_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(USED_FILE, 10, 0);
 
 	if (tst_syscall(__NR_swapon, USED_FILE, 0))
 		tst_res(TWARN | TERRNO, "swapon(alreadyused) failed");
diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
index 6f47fc01f..aaaedfa11 100644
--- a/testcases/kernel/syscalls/swapon/swapon03.c
+++ b/testcases/kernel/syscalls/swapon/swapon03.c
@@ -49,7 +49,7 @@ static int setup_swap(void)
 
 			/* Create the swapfile */
 			snprintf(filename, sizeof(filename), "%s%02d", TEST_FILE, j + 2);
-			make_swapfile(filename, 10, 0);
+			MAKE_SWAPFILE_BLKS(filename, 10, 0);
 
 			/* turn on the swap file */
 			TST_EXP_PASS_SILENT(swapon(filename, 0));
@@ -62,7 +62,7 @@ static int setup_swap(void)
 		tst_brk(TFAIL, "Failed to setup swap files");
 
 	tst_res(TINFO, "Successfully created %d swap files", swapfiles);
-	make_swapfile(TEST_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(TEST_FILE, 10, 0);
 
 	return 0;
 }
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
