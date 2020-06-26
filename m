Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4620AC4A
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:24:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E95C3C2B60
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:24:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5432D3C5847
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:15 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 59F17600B9E
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:19 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id j4so3903833plk.3
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3LmMCyrOJvEaTuQXQmCs5s8dg/UO7OTfdi7lndvVZlw=;
 b=ibInWsR6rb3Y7sokXcLZeNz86M/GlIqYkGZjKYDfooyHi/JuUZRnh2apI5szoBMvSG
 2rh4Nz5QYZ5Z92TPaP32PVK5UQdv8BC8WMfRbBUsofvc1X9syh7q+evBBJ7W2NToKC6U
 VZUiFzf1TYZ43DKotLGErGO6CsQ49zDYUJJE5RtsIMemMnaDOztJaQwkw3NyGkTUx2UY
 Ijz1DLSM2hS5al/Zb2dYs5v9UUqfYBOxpcXpHb7EysURPQc7AtOaEp/H37sdyIbA7NXD
 lpjdfJg9Kkq+Q7na5KZOQv16ADjuyrI2kgiSjdT7XlwA0EyxDEU6MOSFSbJWzFRetKpy
 oDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LmMCyrOJvEaTuQXQmCs5s8dg/UO7OTfdi7lndvVZlw=;
 b=cWBtERXKSz83LUAJdpYwdeomKeh3XRIEnNEGscqgIyOhZN2//YHm8Pe5xMxSDWCSM4
 rrbr7eI1pzEt2qWUnm5Xv3szoRhS/2eqdsaebbY4v4PMeRSERK/ih6Dko0wHqm6LkZbj
 gqlCWrqle0dBXErtPL2tdqVPboH0KfKOdkooPBIh5ef4ISkJK2nryjZwzYTKgfsrRA3B
 /ey+Nlm2uohgNJ0qWYeHsdvEKV4O+UaM+eamDwvOt9yg/kSNgS9LsLFQekSuvWsyNTwq
 nKf3w/YoojTEGpNnTx9sPr3HRSdTOQRYQUcKYUAOA4u7bshKsLlsqgoleMeCxaH6Qo5v
 Y1uA==
X-Gm-Message-State: AOAM532p165mimSM/oLpHqaqUnmP3zYMd4JVEEcPTKaCmR1pPdfinflX
 6XakAVCqr+assZD/qNVKYiYzReq+RIY=
X-Google-Smtp-Source: ABdhPJw2+K80JfXxcnQydN4qOpyykXKB4QUN1mXy+GxEn9pGQXifNwj3piePD9ODe3Rtccm6PtUPiQ==
X-Received: by 2002:a17:90a:648b:: with SMTP id
 h11mr1714213pjj.59.1593152592703; 
 Thu, 25 Jun 2020 23:23:12 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id o1sm10464619pja.49.2020.06.25.23.23.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:23:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:26 +0530
Message-Id: <a014d7718d2a1c08cdf0dd07849f550d42a2db22.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V7 13/19] syscalls/ppoll: Add support for time64 tests
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

This adds support for time64 tests to the existing ppoll() syscall
tests.

Note that the O_EXCL flag is removed from SAFE_OPEN() calls as it made
the tests failed when run for the second variant as the file existed.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/ppoll/ppoll01.c | 71 ++++++++++++++++++-----
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/ppoll/ppoll01.c b/testcases/kernel/syscalls/ppoll/ppoll01.c
index 2fadd0653948..a217254022d4 100644
--- a/testcases/kernel/syscalls/ppoll/ppoll01.c
+++ b/testcases/kernel/syscalls/ppoll/ppoll01.c
@@ -21,6 +21,7 @@
 #include "ltp_signal.h"
 #include "tst_sig_proc.h"
 #include "tst_test.h"
+#include "tst_timer.h"
 
 /* Older versions of glibc don't publish this constant's value. */
 #ifndef POLLRDHUP
@@ -38,7 +39,7 @@ struct test_case {
 	unsigned int nfds;	   /* nfds ppoll parameter */
 	sigset_t *sigmask;	   /* sigmask ppoll parameter */
 	sigset_t *sigmask_cur;	   /* sigmask set for current process */
-	struct timespec *ts;	   /* ts ppoll parameter */
+	struct tst_ts *ts;	   /* ts ppoll parameter */
 	struct pollfd *fds;	   /* fds ppoll parameter */
 	int sigint_count;	   /* if > 0, spawn process to send SIGINT */
 				   /* 'count' times to current process */
@@ -60,14 +61,7 @@ static int fd1 = -1;
 static sigset_t sigmask_empty, sigmask_sigint;
 static struct pollfd fds_good[1], fds_already_closed[1];
 
-static struct timespec ts_short = {
-	.tv_sec = 0,
-	.tv_nsec = 200000000,
-};
-static struct timespec ts_long = {
-	.tv_sec = 2,
-	.tv_nsec = 0,
-};
+static struct tst_ts ts_short, ts_long;
 
 /* Test cases
  *
@@ -160,14 +154,53 @@ static struct test_case tcase[] = {
 	},
 };
 
+static inline int libc_ppoll(struct pollfd *fds, nfds_t nfds, void *tmo_p,
+			     const sigset_t *sigmask, size_t sigsetsize)
+{
+	return ppoll(fds, nfds, tmo_p, sigmask);
+}
+
+static inline int sys_ppoll(struct pollfd *fds, nfds_t nfds, void *tmo_p,
+			    const sigset_t *sigmask, size_t sigsetsize)
+{
+	return tst_syscall(__NR_ppoll, fds, nfds, tmo_p, sigmask, sigsetsize);
+}
+
+static inline int sys_ppoll_time64(struct pollfd *fds, nfds_t nfds, void *tmo_p,
+				   const sigset_t *sigmask, size_t sigsetsize)
+{
+	return tst_syscall(__NR_ppoll_time64, fds, nfds, tmo_p, sigmask,
+			   sigsetsize);
+}
+
+static struct test_variants {
+	int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,
+		     const sigset_t *sigmask, size_t sigsetsize);
+
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .ppoll = libc_ppoll, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_ppoll != __LTP__NR_INVALID_SYSCALL)
+	{ .ppoll = sys_ppoll, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_ppoll_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .ppoll = sys_ppoll_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
 static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 {
 }
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	int fd2;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	SAFE_SIGNAL(SIGINT, sighandler);
 
 	if (sigemptyset(&sigmask_empty) == -1)
@@ -177,18 +210,22 @@ static void setup(void)
 	if (sigaddset(&sigmask_sigint, SIGINT) == -1)
 		tst_brk(TBROK | TERRNO, "sigaddset");
 
-	fd1 = SAFE_OPEN("testfile1", O_CREAT | O_EXCL | O_RDWR,
-		S_IRUSR | S_IWUSR);
+	fd1 = SAFE_OPEN("testfile1", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
 	fds_good[0].fd = fd1;
 	fds_good[0].events = POLLIN | POLLPRI | POLLOUT | POLLRDHUP;
 	fds_good[0].revents = 0;
 
-	fd2 = SAFE_OPEN("testfile2", O_CREAT | O_EXCL | O_RDWR,
-		S_IRUSR | S_IWUSR);
+	fd2 = SAFE_OPEN("testfile2", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
 	fds_already_closed[0].fd = fd2;
 	fds_already_closed[0].events = POLLIN | POLLPRI | POLLOUT | POLLRDHUP;
 	fds_already_closed[0].revents = 0;
 	SAFE_CLOSE(fd2);
+
+	ts_short.type = ts_long.type = tv->type;
+	tst_ts_set_sec(&ts_short, 0);
+	tst_ts_set_nsec(&ts_short, 200000000);
+	tst_ts_set_sec(&ts_long, 2);
+	tst_ts_set_nsec(&ts_long, 0);
 }
 
 static void cleanup(void)
@@ -199,10 +236,11 @@ static void cleanup(void)
 
 static void do_test(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	pid_t pid = 0;
 	int sys_ret, sys_errno = 0, dummy;
 	struct test_case *tc = &tcase[i];
-	struct timespec ts, *tsp = NULL;
+	struct tst_ts ts, *tsp = NULL;
 
 	if (tc->ts) {
 		memcpy(&ts, tc->ts, sizeof(ts));
@@ -223,8 +261,8 @@ static void do_test(unsigned int i)
 
 	/* test */
 	errno = 0;
-	sys_ret = tst_syscall(__NR_ppoll, tc->fds, tc->nfds, tsp,
-		tc->sigmask, SIGSETSIZE);
+	sys_ret = tv->ppoll(tc->fds, tc->nfds, tst_ts_get(tsp), tc->sigmask,
+			    SIGSETSIZE);
 	sys_errno = errno;
 
 	/* cleanup */
@@ -261,6 +299,7 @@ static void do_test(unsigned int i)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcase),
 	.test = do_test,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.forks_child = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
