Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564F5C509
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 23:33:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07A883C1DC0
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 23:33:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8624B3C1D74
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 23:33:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8AFCC6000E0
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 23:33:41 +0200 (CEST)
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A522A206E0;
 Mon,  1 Jul 2019 21:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562016818;
 bh=uiXgpImSdFc4JplcCbCc4hVi5y7R1FxWzErkA7u2BUM=;
 h=From:To:Cc:Subject:Date:From;
 b=Kb+xlsCaDLkkZBPy/E3Bb5INpXgnd48Ra8yjC1ChakO9U8DTnoXGGdW4ptwBADck7
 vII2pcUcI+zURc8sqvBeNa8B/Y6OsCQHZz6bV9+RHNVgbQHs2bW66pN8EQTV3/ADCQ
 M+9inAChA7CWR7OghdSZFJw6yR/EpdujA6AhT68k=
From: Eric Biggers <ebiggers@kernel.org>
To: ltp@lists.linux.it
Date: Mon,  1 Jul 2019 14:33:16 -0700
Message-Id: <20190701213316.120357-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] crypto/pcrypt_aead01: add back deleted file comment
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

From: Eric Biggers <ebiggers@google.com>

Add back some useful text that was accidentally deleted by commit
acc16bcbf12a ("c: Replace GPL verbose text by SPDX license identifier").

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 testcases/kernel/crypto/pcrypt_aead01.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/kernel/crypto/pcrypt_aead01.c b/testcases/kernel/crypto/pcrypt_aead01.c
index 5d9a123c7..d9c27f69d 100644
--- a/testcases/kernel/crypto/pcrypt_aead01.c
+++ b/testcases/kernel/crypto/pcrypt_aead01.c
@@ -6,6 +6,14 @@
  *
  * Originally found by syzkaller:
  * https://groups.google.com/forum/#!topic/syzkaller-bugs/NKn_ivoPOpk
+ *
+ * Test for CVE-2017-5754 - pcrypt mishandles freeing instances.
+ *
+ * The test works by adding and then removing pcrypt-AEAD instances.
+ * See commit d76c68109f37 crypto: pcrypt - fix freeing pcrypt instances.
+ *
+ * If the bug is present then this will probably crash the kernel, but also
+ * sometimes the test simply times out.
  */
 
 #include <errno.h>
-- 
2.22.0.410.gd8fdbe21b5-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
