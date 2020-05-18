Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053D1D72B8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:17:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 945D83C4F14
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:17:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 411783C2696
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:53 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1E522600079
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:51 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id j21so4463621pgb.7
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3hSmG9cFNH+goXqeZoTWiFE5aD5ilhVTpXpfke+DEIQ=;
 b=lCg3J08bTlqJ22TnKK5VK8vCuPU3T/O5w6W//YzS4PA0EiAR/j9gBi0/qBCE47sO7x
 3uRzJPW1icrO/FsOKKxoYHhLjDPHJjwUDMnoIGyVBKQ2cMoxGABdxndqTkEB8yZHZEv5
 DonomBc2x76pmpIHbOqbXKgtBS9CoZc8w6Vd8jLY2m+jw+L8ASM6KN7Wl40Mp5DzbKI7
 UDJWV9cGSGwIXYSwwB3Zdx270vUar3gBx7QyGmBE6hW+qifhgiMznu1ig0TD+M6ZWFOk
 LgoKgVUoKyapwkiYH0aFTlFHc4u0IxDwZvjHNdinzse0Y9JdajNUpjkfqqdhyk6rwXBS
 aP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hSmG9cFNH+goXqeZoTWiFE5aD5ilhVTpXpfke+DEIQ=;
 b=Kaz2lfwmVNWjEs0Z4PAkT7NGw+P6qKB2stqx/SQCWKzjNU/wNJq6yNOfeHeDKGnuGf
 nZPL8DJ9w+KLg77CbErwT4ufrfcBq54h3wwBmAowjGG8jswke6YbaPF/JF3gaaThxB7e
 B/cyyeKBroohWGbQ5xccYzieBWtBpodIHe4AZrC0lLqdyP3tzI2xPBMsBM6gpaN2QMlP
 0a4VoqjtSlTBxOYuoL6ISwgCTCXhRpggWE46OEE1Nl2WyczTb7qaJG29lk0yX2ogGDDr
 2+BjxTMQY4bJMLaF1eEs54atM9msVjrvCXIwktX+//8QsLMQr6V70OTuzDX8/g1niT1i
 ZUow==
X-Gm-Message-State: AOAM531L/9NtUqzgfEl7VrVpO+6IXuwBD7no01sFODo6c0lMiRNjnlen
 /DG3VtjG1sez8zSVT1QcUL2cGTzTSS0=
X-Google-Smtp-Source: ABdhPJwC5UwU3HW9EhzeNTQXi0qzUVgvh6TghHyzqYsh3OkJwNfJxjVY2onCKVx9M4t0qUjQtvzhTg==
X-Received: by 2002:a63:30c2:: with SMTP id
 w185mr13459011pgw.353.1589789749331; 
 Mon, 18 May 2020 01:15:49 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id k18sm3040418pfg.217.2020.05.18.01.15.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:48 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:45:03 +0530
Message-Id: <c27d27416ef5a3e0ceaf61fec08d5a46ca8dab15.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V3 11/17] syscalls/recvmmsg: Add support for time64
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
