Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 862431C519F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F86B3C267A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F27BA3C2693
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:31 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3761D1000A81
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:31 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id t16so559699plo.7
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZ7nhdh01PwwTLceqEUuXBelaPR7YrtjtVeXzJ+w5D4=;
 b=M6YYeplW1/PoFoawKlItJB2R8WiD//GmCzOeYAAxy+3Ig8WEmKt487ET6SdULOYCnT
 Qr8FfC+SsHUcWxw6vg4Pxc5+RiDmbg8MX6k7CLVWrrD+vaifGApxMSNF+kd30syYmUck
 FKUJ/NAjix5pQWJMbP6UNBaXxCtmChWPzI1pkjnWY5cqqofbyeHs7/zdZ5ecqoElFVe2
 FJfe42Nyu/AA1Ag0knTFbOZfX7ek541PlGqwfBbpEhDdQqq1cSsRc2XYpOGjNJBCWcwd
 H2YOlX4RRpfn2zkm6rzouQX8NI1NpA6gZ6s1ao9uHqyoxnNJlrgrJc0puA+1URWFO2pE
 3Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZ7nhdh01PwwTLceqEUuXBelaPR7YrtjtVeXzJ+w5D4=;
 b=ti4KW55SbnwrGLVlYFnCELrWVm1sJmjQck/AGaW8PRA9GGIhl/evQC32g2sys2cEy/
 eDemnyMwlEw03DcqJdzr77GW+dNfF+rmFs3JhPY9Q/UE//g7uLW8yIZcv79dOdna+qYb
 qSF/9AAGZx+HhpIe4Yc4GQpg3rRlKlV1f/GUNF4iZh5kGsmr/hBw7FBNCWSv7MHG4dFi
 pf/Q01ZKJycFCqfhBWjMu3orlRl9V/ITCg6lKCpf0vk0eYvUuOaFT6yPQ02V2/eWXAjh
 5LATjjV8j4FK8MsInwvx3HHK2JJaOTT1Hq/rRPcTkuamXtnQbiEqZHKOaLy+RJ/RwYgY
 Ae0Q==
X-Gm-Message-State: AGi0PuZrjXK7hcqNXMV5jnuiELryPKszNsr4HNiHHF8FhiDa3gQWL0To
 dKeYKK+DCGS+3IWfoY4BpFSb3/UQG44=
X-Google-Smtp-Source: APiQypJTvhe6AlBNkDUc+UifeddZzzt89j89sQB6QghNhkNq7sFWZMSO1nyWU1gWAUXzNCt9FTBWzw==
X-Received: by 2002:a17:902:aa94:: with SMTP id
 d20mr2125164plr.15.1588669949401; 
 Tue, 05 May 2020 02:12:29 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id a7sm1497748pfg.157.2020.05.05.02.12.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:12:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:42:07 +0530
Message-Id: <5a1c2899e7001bb14c0b2987f72d28329522d63b.1588669892.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 7/8] syscalls/recvmmsg: Add support for time64 tests
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
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 45 +++++++++++----
 .../kernel/syscalls/sendmmsg/sendmmsg_var.h   | 55 ++++++++-----------
 2 files changed, 58 insertions(+), 42 deletions(-)

diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 37084102ee09..5d1fd1b6b9fa 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -14,8 +14,8 @@
 #include "tst_test.h"
 #include "lapi/socket.h"
 #include "tst_safe_macros.h"
-
 #include "sendmmsg_var.h"
+#include "lapi/abisize.h"
 
 #define BUFSIZE 16
 #define VLEN 2
@@ -25,27 +25,52 @@ static int receive_sockfd;
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
+#if defined(TST_ABI32)
+	{ .receive = libc_recvmmsg, .send = libc_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .receive = sys_recvmmsg64, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
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
@@ -96,7 +121,7 @@ static void setup(void)
 	rcv_msg[1].msg_hdr.msg_iov = rcv2;
 	rcv_msg[1].msg_hdr.msg_iovlen = 1;
 
-	test_info();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void cleanup(void)
@@ -111,7 +136,7 @@ static struct tst_test test = {
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
