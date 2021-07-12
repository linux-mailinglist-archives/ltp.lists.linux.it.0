Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5333C45F4
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:03:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 411AD3C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:03:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 336293C2FDD
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:03:54 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1DBCF1400975
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:03:54 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id a18so41602441lfs.10
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOUb0wp8c59LS4wCvD6B0DM4QBpXFxehoPotsuLsHpo=;
 b=r72rwuNvBESg6QFowAgWYhIkyyraEtsk5H2+Wkx40tAQpROJYx1ne5j7V9qCHnwA55
 bD3/ManyTiVW7GEqazGPXnevhb7IjgQR78G+xNCqYJy8jFDljgD1rNEDkNhjXqePr7wS
 Cg7Mw1LKTUdGOB/3++rmYOJpT61Xkz+wzHbLzsp5NqNS8AWlA8ZRsQ2kKRKsSr5wfGeD
 +T+meS8zpIzlAIv5Hve73jxsKZO4o0oUshb/EXoTCGQi7PsSoS8buF4XmE5X0yfgydHm
 oJnvYMFq7GLyTqVRBCbEp2kSwUofyvrZ4widcdCESmqtJYJ8TxhtQwRb+nYf2mN8O2Tf
 Xu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOUb0wp8c59LS4wCvD6B0DM4QBpXFxehoPotsuLsHpo=;
 b=BLXatAV6TwXVPiYhJMI6H9Kb7MzjdOO4ePquxW5jVA0gRZqyzfBkX1B4mGcpznGCNz
 PCvn2T/Adlnr34fjb5g7JXkXhZPyQnsASV97blOhcozn8hkOK+LApOC7OSsu9bBYIe31
 WtrnxzVfCI3ZsW0hxLQZcLlDchyHGVttqljZkV44R1lSK0bWEMCGQkw2PxnxgYOgyc+c
 rumAN1sfIJtQTAmHiUkpgSPaDIAiOe+qeiCYIqtA2/GH8ext8c2Q+bAq8OmYTwzvzwOa
 cVWRS4dG/qS3kOuxWMmjmPFcQPOPPpHI8NSDKtBqktEIxxWeWJi+HETiNah6Y03IUPiL
 DXWg==
X-Gm-Message-State: AOAM530RyiNlRawJXvEVCRc5rzXK1AD4mB7BDT+TIZiNr5kTCG6s/Kwo
 FJWo+tp43C+ayCL7rZcKAIWIZeB5OTX4
X-Google-Smtp-Source: ABdhPJykpKS8LINp6QRS3HhsIBbDw8wwVJz6ac86ZuA1rJ8dh7GQolE4JKf2RDS/H6m8ciqbYM1hmg==
X-Received: by 2002:a19:ee1a:: with SMTP id g26mr38551693lfb.141.1626077033429; 
 Mon, 12 Jul 2021 01:03:53 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id bn30sm1467104ljb.87.2021.07.12.01.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 01:03:53 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Mon, 12 Jul 2021 11:03:22 +0300
Message-Id: <20210712080322.11512-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] mmap18: fix when PTHREAD_STACK_MIN < PAGE_SIZE
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

PTHREAD_STACK_MIN can be less than the page size, to be more
precise 2048 on musl. This value is used in the test as an
offset for a new stack address with mmap() + MAP_FIXED flag.
Though it might not be aligned to the page size.

This breaks the test with musl:

  tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
  mmap18.c:98: TBROK: mmap(0x7fe67e2ee800,2048,3,306,-1,0) failed: EINVAL (22)
  mmap18.c:169: TFAIL: Child: exited with 2
  [...]

The fix is to align mapped_size arg to the page size.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/kernel/syscalls/mmap/mmap18.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
index dc2926454..b37b29890 100644
--- a/testcases/kernel/syscalls/mmap/mmap18.c
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -200,11 +200,12 @@ static void grow_stack_fail(size_t stack_size, size_t mapped_size)
 
 static void run_test(void)
 {
-	size_t stack_size = 8 * PTHREAD_STACK_MIN;
+	size_t pthread_stack = LTP_ALIGN(PTHREAD_STACK_MIN, getpagesize());
+	size_t stack_size = 8 * pthread_stack;
 
-	grow_stack_success(stack_size, PTHREAD_STACK_MIN);
+	grow_stack_success(stack_size, pthread_stack);
 	grow_stack_success(stack_size, stack_size/2);
-	grow_stack_fail(stack_size, PTHREAD_STACK_MIN);
+	grow_stack_fail(stack_size, pthread_stack);
 	grow_stack_fail(stack_size, stack_size/2);
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
