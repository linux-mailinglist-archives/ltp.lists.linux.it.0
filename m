Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A84624C537
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA5003C582C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 826DC3C2FB8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:20 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7062F60025C
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:20 +0200 (CEST)
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58FE4207DE;
 Thu, 20 Aug 2020 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597947678;
 bh=UoGnlqDwJu4BiJVgFEDrzpJXmkl4E75bbnDjQUHNH/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EArwUhlI0qdfBNsbxnRHoDVsrOFxrOzF063nGYwhjOxgWYow28UvObMivpMHMv8uG
 rqMnTF3a8UMgvqcIAoX6fV+QYUNiJXV+b+N44bQOGo7/Ek/E5TkwiTBr/EHV6OfyxC
 HGodADQtM6+Kw9ikBgO8LLPPby58je96DeYCkMZs=
From: Eric Biggers <ebiggers@kernel.org>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 11:19:18 -0700
Message-Id: <20200820181918.404758-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820181918.404758-1-ebiggers@kernel.org>
References: <20200820181918.404758-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [LTP PATCH 2/2] crypto/af_alg02: send message with control
 data before reading
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
Cc: linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Eric Biggers <ebiggers@google.com>

It isn't clearly defined what happens if you read from an AF_ALG request
socket without previously sending the control data to begin an
encryption or decryption operation.  On some kernels the read will
return 0, while on others it will block.

Testing this corner case isn't the purpose of af_alg02; it just wants to
try to encrypt a zero-length message.  So, change it to explicitly send
a zero-length message with control data.

This fixes the test failure reported at
https://lkml.kernel.org/r/CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com

Fixing the test in this way was also previously suggested at
https://lkml.kernel.org/r/20200702033221.GA19367@gondor.apana.org.au

Note, this patch doesn't change the fact that the read() still blocks on
pre-4.14 kernels (which is a kernel bug), and thus the timeout logic in
the test is still needed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 testcases/kernel/crypto/af_alg02.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/af_alg02.c
index fab0010c9..31d30777c 100644
--- a/testcases/kernel/crypto/af_alg02.c
+++ b/testcases/kernel/crypto/af_alg02.c
@@ -21,14 +21,29 @@
 #include <pthread.h>
 #include <errno.h>
 
+#define SALSA20_IV_SIZE       8
+#define SALSA20_MIN_KEY_SIZE  16
+
 static void *verify_encrypt(void *arg)
 {
+	const uint8_t iv[SALSA20_IV_SIZE] = { 0 };
+	const struct tst_alg_sendmsg_params params = {
+		.encrypt = true,
+		.iv = iv,
+		.ivlen = SALSA20_IV_SIZE,
+	};
 	char buf[16];
-	int reqfd = tst_alg_setup_reqfd("skcipher", "salsa20", NULL, 16);
+	int reqfd = tst_alg_setup_reqfd("skcipher", "salsa20", NULL,
+					SALSA20_MIN_KEY_SIZE);
 
-	TST_CHECKPOINT_WAKE(0);
+	/* Send a zero-length message to encrypt */
+	tst_alg_sendmsg(reqfd, NULL, 0, &params);
 
-	/* With the bug the kernel crashed here */
+	/*
+	 * Read the zero-length encrypted data.
+	 * With the bug, the kernel crashed here.
+	 */
+	TST_CHECKPOINT_WAKE(0);
 	if (read(reqfd, buf, 16) == 0)
 		tst_res(TPASS, "Successfully \"encrypted\" an empty message");
 	else
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
