Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC32947E2
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 07:33:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 374093C56AE
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 07:33:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8722F3C25E9
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 07:33:03 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DD7CA1000A2F
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 07:33:02 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id 1so636423ple.2
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QCoz0bV9fDzQs6HxoHH3XoJZrrP1Da6FtyzSTg30bRU=;
 b=KkBmxd9jk7VmjeEnuzl2m/4Y23XD/z0/PX9n0SZtpDxoQnuaVqTthVRcdoXQUhNtMJ
 aM7ksfICrrdUz3p7eWCWg/msCuhODY47xb2uuDbofJavbQpYJAhYHq/vaIS37TPRHsrW
 ndakrQpuxp2ERoEJbbVsbaqwO1+Y2nektMmaYQRv3fy4P+6Arn8GE0mMlemsjFER3HMg
 8mJX8WZEU8yK1FunzLX8VHqpmK6OcuSQKZZ1HMk6rg8X3nzBVRSjqxGfOAizPlxjH1X3
 wJtjG65bPy9IE8VBQ/llgevAQ1DOPLitXWnhWzdz5e2fxzQQZfYk+7+EcbFnSj+UxCdd
 j+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QCoz0bV9fDzQs6HxoHH3XoJZrrP1Da6FtyzSTg30bRU=;
 b=Nwad0NNlYzQANWwM52llEkg2FjBsziErhuVSL0C1NeIGzC6j3X6RU+5mmqUUu2tBOP
 dKKwf3P+pQDNKA9lDAsmIIuvUBNM6dV0AeXQ2FOY6U6XmKd8W5+5nULZvXqcYiSKt9oD
 u/7UiIViKWa19FHglFBgIMzuUQREV3bZGozf6AFYGEJTnOByC11mJ64Lks8s0VkWk/Zd
 /w6IrnuA1jzi4jMn9r/fOre4QEc+1OY9yLJfR40MZGBu46tB0SPDK4SSX9rlOgXFD/8a
 +BWzwnsltAFvvhWqU6rNYvcWWn1VUykuyaaUYkVsB+pzc5mO/PCcfWUD4mwfZ65cPjor
 mjVg==
X-Gm-Message-State: AOAM533/heM4BxwywZ+6N9GUXj98eFn7bQbAye3zyyILRvUJ6ID/pXNl
 XJoHseZpIrXOjEZgxvJFxrfrdrwKFdazkw==
X-Google-Smtp-Source: ABdhPJymYWgf3hn0IIoQ/I+czHc4VuaXczVcb6QmGqCGKdir60215pL+At5eNEFgN5m2Zo7wu/woQA==
X-Received: by 2002:a17:902:9f96:b029:d4:c459:a181 with SMTP id
 g22-20020a1709029f96b02900d4c459a181mr1842512plq.28.1603258380829; 
 Tue, 20 Oct 2020 22:33:00 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id g15sm950903pgi.89.2020.10.20.22.32.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 22:33:00 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 21 Oct 2020 11:02:54 +0530
Message-Id: <41c6693c6714fe6ca471831d71540cf8ad67881e.1603258262.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <e9bcd007772ffadd6326dca29532bb4d3f8e7f0a.1599558175.git.viresh.kumar@linaro.org>
References: <e9bcd007772ffadd6326dca29532bb4d3f8e7f0a.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 4/4] syscalls: select: Add failure tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds a variety of failure tests to select() syscalls. Another
helper is added in select_var.h to make sure we don't access a bad
address while reading/writing the timeout value.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
I am resending the patch formally here and marking it as V2 as I fixed
an issue with it.

 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/select/.gitignore   |  1 +
 testcases/kernel/syscalls/select/select03.c   | 96 +++++++++++++++++++
 testcases/kernel/syscalls/select/select_var.h | 55 ++++++++---
 4 files changed, 138 insertions(+), 15 deletions(-)
 create mode 100644 testcases/kernel/syscalls/select/select03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 12ae10464d9f..0443f9f3d51b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1157,6 +1157,7 @@ sched_getattr02 sched_getattr02
 
 select01 select01
 select02 select02
+select03 select03
 
 semctl01 semctl01
 semctl02 semctl02
diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
index f5a43c23326a..b6bff2d4f961 100644
--- a/testcases/kernel/syscalls/select/.gitignore
+++ b/testcases/kernel/syscalls/select/.gitignore
@@ -1,2 +1,3 @@
 /select01
 /select02
+/select03
diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
new file mode 100644
index 000000000000..9a665b862dce
--- /dev/null
+++ b/testcases/kernel/syscalls/select/select03.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Ltd.
+ *
+ * Failure tests.
+ */
+
+#include <unistd.h>
+#include <errno.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include "select_var.h"
+
+static fd_set readfds_reg, writefds_reg, fds_closed;
+static fd_set *preadfds_reg = &readfds_reg, *pwritefds_reg = &writefds_reg;
+static fd_set *pfds_closed = &fds_closed, *nullfds = NULL, *faulty_fds;
+static int fd_closed, fd[2];
+static struct timeval timeout;
+static struct timeval *valid_to = &timeout, *invalid_to;
+
+static struct tcases {
+	char *name;
+	int nfds;
+	fd_set **readfds;
+	fd_set **writefds;
+	fd_set **exceptfds;
+	struct timeval **timeout;
+	int exp_errno;
+} tests[] = {
+	{ "Negative nfds", -1, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
+	{ "Invalid readfds", 6, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
+	{ "Invalid writefds", 6, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
+	{ "Invalid exceptfds", 6, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
+	{ "Faulty readfds", 6, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
+	{ "Faulty writefds", 6, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
+	{ "Faulty exceptfds", 6, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
+	{ "Faulty timeout", 6, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
+};
+
+static void run(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+
+	TEST(do_select_faulty_to(tc->nfds, *tc->readfds, *tc->writefds,
+				 *tc->exceptfds, *tc->timeout,
+				 tc->timeout == &invalid_to));
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "%s: select() passed unexpectedly", tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: select()() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS, "%s: select() failed as expected", tc->name);
+}
+
+static void setup(void)
+{
+	void *faulty_address;
+
+	select_info();
+
+	timeout.tv_sec = 0;
+	timeout.tv_usec = 100000;
+
+	/* Regular file */
+	fd_closed = SAFE_OPEN("tmpfile1", O_CREAT | O_RDWR, 0777);
+	FD_ZERO(&fds_closed);
+	FD_SET(fd_closed, &fds_closed);
+
+	SAFE_PIPE(fd);
+	FD_ZERO(&readfds_reg);
+	FD_ZERO(&writefds_reg);
+	FD_SET(fd[0], &readfds_reg);
+	FD_SET(fd[1], &writefds_reg);
+
+	SAFE_CLOSE(fd_closed);
+
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_to = faulty_address;
+	faulty_fds = faulty_address;
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = TEST_VARIANTS,
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index 86f80eeb0dc1..c8a8eb64e06a 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -16,7 +16,8 @@ struct compat_sel_arg_struct {
 	long _tvp;
 };
 
-static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
+static int do_select_faulty_to(int nfds, fd_set *readfds, fd_set *writefds,
+		fd_set *exceptfds, struct timeval *timeout, int faulty_to)
 {
 	switch (tst_variant) {
 	case 0:
@@ -39,25 +40,43 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	}
 	case 2: {
 		int ret;
-		struct __kernel_old_timespec ts = {
-			.tv_sec = timeout->tv_sec,
-			.tv_nsec = timeout->tv_usec * 1000,
-		};
-		ret = tst_syscall(__NR_pselect6, nfds, readfds, writefds, exceptfds, &ts, NULL);
-		timeout->tv_sec = ts.tv_sec;
-		timeout->tv_usec = ts.tv_nsec / 1000;
+		struct __kernel_old_timespec _ts;
+		void *ts;
+
+		if (faulty_to) {
+			ts = timeout;
+		} else {
+			ts = &_ts;
+			_ts.tv_sec = timeout->tv_sec;
+			_ts.tv_nsec = timeout->tv_usec * 1000;
+		}
+
+		ret = tst_syscall(__NR_pselect6, nfds, readfds, writefds, exceptfds, ts, NULL);
+		if (!faulty_to) {
+			timeout->tv_sec = _ts.tv_sec;
+			timeout->tv_usec = _ts.tv_nsec / 1000;
+		}
 		return ret;
 	}
 	case 3: {
 		int ret = 0;
 #if (__NR_pselect6_time64 != __LTP__NR_INVALID_SYSCALL)
-		struct __kernel_timespec ts = {
-			.tv_sec = timeout->tv_sec,
-			.tv_nsec = timeout->tv_usec * 1000,
-		};
-		ret = tst_syscall(__NR_pselect6_time64, nfds, readfds, writefds, exceptfds, &ts, NULL);
-		timeout->tv_sec = ts.tv_sec;
-		timeout->tv_usec = ts.tv_nsec / 1000;
+		struct __kernel_timespec _ts;
+		void *ts;
+
+		if (faulty_to) {
+			ts = timeout;
+		} else {
+			ts = &_ts;
+			_ts.tv_sec = timeout->tv_sec;
+			_ts.tv_nsec = timeout->tv_usec * 1000;
+		}
+
+		ret = tst_syscall(__NR_pselect6_time64, nfds, readfds, writefds, exceptfds, ts, NULL);
+		if (!faulty_to) {
+			timeout->tv_sec = _ts.tv_sec;
+			timeout->tv_usec = _ts.tv_nsec / 1000;
+		}
 #else
 		tst_brk(TCONF, "__NR_pselect6 time64 variant not supported");
 #endif
@@ -75,6 +94,12 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	return -1;
 }
 
+static inline int do_select(int nfds, fd_set *readfds, fd_set *writefds,
+			    fd_set *exceptfds, struct timeval *timeout)
+{
+	return do_select_faulty_to(nfds, readfds, writefds, exceptfds, timeout, 0);
+}
+
 static void select_info(void)
 {
 	switch (tst_variant) {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
