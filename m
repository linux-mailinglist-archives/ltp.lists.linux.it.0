Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3C1CA23D
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:27:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B71A3C25E3
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:27:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 53A193C6E60
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:45 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A35B200AD7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:44 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id k19so167320pll.9
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwq71tWgG/WrUMhraO8MmoGq1Vbh9a5BN4uN/QvtwEU=;
 b=VPSHQ3AuvkRAFpCqrREnr1dJmiyEkQjKV5wxwxzoUR0mrDFnibLQZOISDT2j3hG3vo
 KqnTLmvlngNAQ5cym66Y1mlNilW74c7n5NUviA35bbQnp1j3jdWo8F9wmR9xyhrcsMTR
 1iehAJsL+9IzP6IKODbES5g+NsaFA4axVnnovck250hbSos7qFAGJE9xxiPEkXoKhAWA
 FJeXFOIb+fzkg5MlSTPl0ZWgFtSe1gm11T/3whne14D3Y1I0ZxHK7nM36sIruHdf5/5o
 CNhN2ryln5C2NJ+0+GLinZxJw7SChU0OVRvUBnmka2vsoPYtoQvs4N/Y8xCveYUi+WK3
 UJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwq71tWgG/WrUMhraO8MmoGq1Vbh9a5BN4uN/QvtwEU=;
 b=YrmJkwwNIJAc5tjbuDhzxURn676psRe3bGhiPSnxb0OpxoO0NIaF2awQ8ecukFzK+S
 8dAptkfBfBYcdugci77zOXagkOL26g7US4kPevxjKswpswtkT4aqzT2K0P8R6tgtrrUi
 ztCUD5rAQ1P49lT1CD19Weokme6L7AF7bWlItNELH9nZjZwDLyKOoo1Hj4HytkVTBeao
 pluA27N1Uu/H9SVTFMILXzYsKm2+c+xeBM7NQhN2RwBgbnwl5wuF0GnRniIQ952B6GsI
 L3LxA5HBnEzIyPtgSpv1lYvZLUTHYS1ljf19No/sliv5eTSYKv+V8UwWIv0WSoSM8ybD
 92nQ==
X-Gm-Message-State: AGi0PuZO3DdTU3nKj6zyQ80C0tXLmUugkqTHxfYzwYaW83ZFNj/Nhz8Z
 rtyZAL0KcNoiQOAYRCbcLdxa0tAAb3Q=
X-Google-Smtp-Source: APiQypKj0dXEsK2+Y0hfvbEFSL424rZTNdEOEv0SRNreWfbp88RphJxXcEEHfii/vWaRax2RflZjWQ==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr533954plp.343.1588911882588; 
 Thu, 07 May 2020 21:24:42 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id nl10sm1286043pjb.41.2020.05.07.21.24.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:53:57 +0530
Message-Id: <306430f39022e1d60fb471fdbabbc3026c4b040d.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 12/17] syscalls/ppoll: Add support for time64 tests
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
 testcases/kernel/syscalls/ppoll/ppoll01.c | 76 ++++++++++++++++++-----
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/ppoll/ppoll01.c b/testcases/kernel/syscalls/ppoll/ppoll01.c
index 2fadd0653948..eb8a14534e2e 100644
--- a/testcases/kernel/syscalls/ppoll/ppoll01.c
+++ b/testcases/kernel/syscalls/ppoll/ppoll01.c
@@ -21,6 +21,8 @@
 #include "ltp_signal.h"
 #include "tst_sig_proc.h"
 #include "tst_test.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
 /* Older versions of glibc don't publish this constant's value. */
 #ifndef POLLRDHUP
@@ -38,7 +40,7 @@ struct test_case {
 	unsigned int nfds;	   /* nfds ppoll parameter */
 	sigset_t *sigmask;	   /* sigmask ppoll parameter */
 	sigset_t *sigmask_cur;	   /* sigmask set for current process */
-	struct timespec *ts;	   /* ts ppoll parameter */
+	struct tst_ts *ts;	   /* ts ppoll parameter */
 	struct pollfd *fds;	   /* fds ppoll parameter */
 	int sigint_count;	   /* if > 0, spawn process to send SIGINT */
 				   /* 'count' times to current process */
@@ -60,14 +62,7 @@ static int fd1 = -1;
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
@@ -160,14 +155,57 @@ static struct test_case tcase[] = {
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
+#if defined(TST_ABI32)
+	{ .ppoll = libc_ppoll, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .ppoll = sys_ppoll, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .ppoll = sys_ppoll, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .ppoll = sys_ppoll, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_ppoll_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .ppoll = sys_ppoll_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
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
@@ -177,18 +215,22 @@ static void setup(void)
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
@@ -199,10 +241,11 @@ static void cleanup(void)
 
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
@@ -223,8 +266,8 @@ static void do_test(unsigned int i)
 
 	/* test */
 	errno = 0;
-	sys_ret = tst_syscall(__NR_ppoll, tc->fds, tc->nfds, tsp,
-		tc->sigmask, SIGSETSIZE);
+	sys_ret = tv->ppoll(tc->fds, tc->nfds, tst_ts_get(tsp), tc->sigmask,
+			    SIGSETSIZE);
 	sys_errno = errno;
 
 	/* cleanup */
@@ -261,6 +304,7 @@ static void do_test(unsigned int i)
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
