Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE11DE4E3
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7C123C057F
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 719B53C4CA9
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:17 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A5FAE14016A2
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:16 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id s10so4849848pgm.0
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3hSmG9cFNH+goXqeZoTWiFE5aD5ilhVTpXpfke+DEIQ=;
 b=fXKAVqAbjX2EAXfWwEU7GBCWY0FcdRs5Ij9a/s7ZJPl+YygqddL/9quZVis1xB7c8a
 vE7MGZWsdfIfgdooXAkg4aCN/uHDn3/iZKaWS+0djV66LpafWUwgwof8TdbmHcwJfcCo
 kcRKD7g14sKfZZ825LPRzbRvVeaeYvDmdAUvyaAEHtm/WrBNXmq79A9Z31HcgBrtst+o
 xRte2YhFFLmrruDMnVfGb1CkNMbZVbgNQZ8m7cAW9SSyAyDQbxFJrpx+gjIi+BjTnCTp
 HgD78BMnNnMuvkEKTUetWQ6kYHTalBLGC8r8bfVd/AIxQvSTGL78N6ffJf8Vv10iUebs
 P7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hSmG9cFNH+goXqeZoTWiFE5aD5ilhVTpXpfke+DEIQ=;
 b=EDEB5saWeWJl2D/ZJt80FHM9M3S87mFX1iUSqDI84GO1K/sI3VZQms6Fv+FBWKiaxH
 T66tWm2jJ/6TbmPgeqYmDOw2WkhJfJzjvapIpXThTCJTAQ8YBa1FXDW7LPc8CM2Jhs+F
 hNliKV2j962UDhbqJKMEgvbLW8gmjHvThREVGVLFKVRPOcxrdRmm6Mb/4nRkh9QGJWnX
 oPN10ldF95QdVA9OcmssKXjABe6uD1gwOpZdR5mBBWwgTSpSg3X8ckYEGaR8KGKuTG0w
 patiuX/rGT3AYwVzMVokp/UjgjpqwCGKUUVRSOmTbGzyku85F0WRQZIIU/C4NkqohIbl
 l3Qg==
X-Gm-Message-State: AOAM531kK3ASur3GDfMBc6zhu79TRqYqxM6VKPEHI1/i+f1RSy+VBwJp
 3/vYzZ9Dc9F8HeYVBLVkxeWzJkgpkI0=
X-Google-Smtp-Source: ABdhPJwzhz4MpeIsoc18yqtDfbn4wWpg6VFpMGlbG3JPCiUMm+XD0A4V9h4PfvO1KiabIT3EJJeHeA==
X-Received: by 2002:a63:b219:: with SMTP id x25mr13214657pge.66.1590144734770; 
 Fri, 22 May 2020 03:52:14 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id e5sm6674902pfe.121.2020.05.22.03.52.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:14 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:31 +0530
Message-Id: <47c686ff6c1a8fd7b3500f89bbadb7712490d8d2.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V4 11/17] syscalls/recvmmsg: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing recvmmsg() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 40 ++++++++++----
 .../kernel/syscalls/sendmmsg/sendmmsg_var.h   | 55 ++++++++-----------
 2 files changed, 53 insertions(+), 42 deletions(-)

diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 37084102ee09..016bbc6813c4 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -14,7 +14,6 @@
 #include "tst_test.h"
 #include "lapi/socket.h"
 #include "tst_safe_macros.h"
-
 #include "sendmmsg_var.h"
 
 #define BUFSIZE 16
@@ -25,27 +24,48 @@ static int receive_sockfd;
 static struct mmsghdr *snd_msg, *rcv_msg;
 static struct iovec *snd1, *snd2, *rcv1, *rcv2;
 
+static struct test_variants {
+	int (*receive)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		       unsigned int flags, void *timeout);
+	int (*send)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		    unsigned int flags);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .receive = libc_recvmmsg, .send = libc_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
+	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .receive = sys_recvmmsg64, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
 static void run(void)
 {
-	struct timespec timeout;
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
 	int retval;
 
-	retval = do_sendmmsg(send_sockfd, snd_msg, VLEN, 0);
+	retval = tv->send(send_sockfd, snd_msg, VLEN, 0);
 	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
-		tst_res(TFAIL|TTERRNO, "sendmmsg failed");
+		tst_res(TFAIL|TTERRNO, "sendmmsg() failed");
 		return;
 	}
 
 	memset(rcv1->iov_base, 0, rcv1->iov_len);
 	memset(rcv2->iov_base, 0, rcv2->iov_len);
 
-	timeout.tv_sec = 1;
-	timeout.tv_nsec = 0;
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 0);
 
-	retval = do_recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, &timeout);
+	retval = tv->receive(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
 
 	if (retval == -1) {
-		tst_res(TFAIL | TTERRNO, "recvmmsg failed");
+		tst_res(TFAIL | TTERRNO, "recvmmsg() failed");
 		return;
 	}
 	if (retval != 2) {
@@ -96,7 +116,7 @@ static void setup(void)
 	rcv_msg[1].msg_hdr.msg_iov = rcv2;
 	rcv_msg[1].msg_hdr.msg_iovlen = 1;
 
-	test_info();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void cleanup(void)
@@ -111,7 +131,7 @@ static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
 	.cleanup = cleanup,
-	.test_variants = TEST_VARIANTS,
+	.test_variants = ARRAY_SIZE(variants),
 	.bufs = (struct tst_buffers []) {
 		{&snd1, .iov_sizes = (int[]){3, 3, -1}},
 		{&snd2, .iov_sizes = (int[]){6, -1}},
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg_var.h b/testcases/kernel/syscalls/sendmmsg/sendmmsg_var.h
index f00cf056a747..a142b17f9718 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg_var.h
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg_var.h
@@ -6,55 +6,46 @@
 #ifndef SENDMMSG_VAR__
 #define SENDMMSG_VAR__
 
+#include "tst_timer.h"
 #include "lapi/syscalls.h"
 
-static int do_sendmmsg(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		       int flags)
+static inline int libc_sendmmsg(int sockfd, struct mmsghdr *msgvec,
+				unsigned int vlen, unsigned int flags)
 {
-	switch (tst_variant) {
-	case 0:
-		return tst_syscall(__NR_sendmmsg, sockfd, msgvec, vlen, flags);
-	case 1:
 #ifdef HAVE_SENDMMSG
-		return sendmmsg(sockfd, msgvec, vlen, flags);
+	return sendmmsg(sockfd, msgvec, vlen, flags);
 #else
-		tst_brk(TCONF, "libc sendmmsg not present");
+	tst_brk(TCONF, "libc sendmmsg not present");
 #endif
-	}
+}
 
-	return -1;
+static inline int sys_sendmmsg(int sockfd, struct mmsghdr *msgvec,
+			       unsigned int vlen, unsigned int flags)
+{
+	return tst_syscall(__NR_sendmmsg, sockfd, msgvec, vlen, flags);
 }
 
-static int do_recvmmsg(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		       int flags, struct timespec *timeout)
+static inline int libc_recvmmsg(int sockfd, struct mmsghdr *msgvec,
+			unsigned int vlen, unsigned int flags, void *timeout)
 {
-	switch (tst_variant) {
-	case 0:
-		return tst_syscall(__NR_recvmmsg, sockfd, msgvec, vlen, flags,
-				   timeout);
-	case 1:
 #ifdef HAVE_RECVMMSG
-		return recvmmsg(sockfd, msgvec, vlen, flags, timeout);
+	return recvmmsg(sockfd, msgvec, vlen, flags, timeout);
 #else
-		tst_brk(TCONF, "libc recvmmsg not present");
+	tst_brk(TCONF, "libc recvmmsg not present");
 #endif
-	}
-
-	return -1;
 }
 
-static void test_info(void)
+static inline int sys_recvmmsg(int sockfd, struct mmsghdr *msgvec,
+			unsigned int vlen, unsigned int flags, void *timeout)
 {
-	switch (tst_variant) {
-	case 0:
-		tst_res(TINFO, "Testing direct sendmmsg and recvmmsg syscalls");
-		break;
-	case 1:
-		tst_res(TINFO, "Testing libc sendmmsg and recvmmsg syscalls");
-		break;
-	}
+	return tst_syscall(__NR_recvmmsg, sockfd, msgvec, vlen, flags, timeout);
 }
 
-#define TEST_VARIANTS 2
+static inline int sys_recvmmsg64(int sockfd, struct mmsghdr *msgvec,
+			unsigned int vlen, unsigned int flags, void *timeout)
+{
+	return tst_syscall(__NR_recvmmsg_time64, sockfd, msgvec, vlen, flags,
+			   timeout);
+}
 
 #endif /* SENDMMSG_VAR__ */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
