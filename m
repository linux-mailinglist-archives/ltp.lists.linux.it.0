Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6B1C519A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:12:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D2253C57FB
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:12:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B80513C57FF
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:21 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AC8956009E8
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:08 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id s10so570614plr.1
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53MIWNOl3rWxmNN/ZYA8LeZSTRKvJ93ltqDKbqzVRd0=;
 b=vu/0hDlIfwXTYrzZu8zD2gb7EmF3+xTv1K1mTCKCzfLhco6pW5d1XUcOqpcAANztZ+
 1eajC0MVZ7JGdwji3Qobm6rhoXdsiyTdPMJ4PNsQVQhb9gGBIJCw7lRiphxh7ZHwstpk
 4lUcmxZwLiT1a6DlpLWsQKLbhKNJo/vAj4zv6yfmyliWGyiRVgXCCCGDzqi35wo09+9R
 xHtTXC1fSMyssskqOhVi1aKZMjMsxc7lv9apFCvq24pRtatvWVBsRcJEDg2euCIWow4X
 eWkMNUGIiiyRqE3sRvSggEiRy+yM3pbjQySIlftT5R/2KYF6ToJUgg+biHPoB472KiIN
 MxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53MIWNOl3rWxmNN/ZYA8LeZSTRKvJ93ltqDKbqzVRd0=;
 b=eR9s2JuqeTpMsvMMeonVGFWgYJJk6Q5ZEq1pAFwtMznSHl6O2mY6irKC+eQ8fqPSEU
 b8fZ0S4ZTtxt2TrYbhRyLoEWz/PvyNWubflLOyzzr1wSnm6ZvWNSl8bA/9rJBAYzB9jY
 6azW8de3tLUKumml9CutGZYICIRm6AwoQqh0hCKzvRhimA6qPCogw9nCRR2B8Nq5HYHs
 8J098tcBeNInvMUryi5FJ1PYQfc2JP6FEo1Gi9a7WGC+cQ3IBkCQaK8O8Ry3zAdmkEtG
 6Bk9T5Ldx0YwfgrtbIIMo560TZFulkotYDLQ9sHiEWqlDK8QijRe8N/awcq7jakSskaq
 Yi2w==
X-Gm-Message-State: AGi0Pubq/BhD3JdGOQjxaNaSBGNQRK5QJJ4No8ONYBwR6iu5fHJhcyqb
 Kg+uZndUSFGtBpm4cskxj7jkUvv0/H0=
X-Google-Smtp-Source: APiQypLUfoiQ8jx+JSH8BzE/+FkFX0rnonBoVxOwPb13DcyIwkK8D8nN7SnztyJZcRmDDkF3MMGLXA==
X-Received: by 2002:a17:902:a981:: with SMTP id
 bh1mr2225535plb.43.1588669938718; 
 Tue, 05 May 2020 02:12:18 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id v133sm1502986pfc.113.2020.05.05.02.12.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:12:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:42:03 +0530
Message-Id: <c73455a056aa5ae658a74194d34fa1c1dd7593d9.1588669892.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] syscalls/io_pgetevents: Add support for time64
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

This adds support for time64 tests to the existing io_pgetevents()
syscall tests.

While at it, also pass mode to SAFE_OPEN() to avoid any errors when the
tests are run for multiple variants together.

Also get rid of an extra copy of local fd variable, which is incorrect.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/io_pgetevents.h                  | 15 +++--
 .../syscalls/io_pgetevents/io_pgetevents01.c  | 41 ++++++++++++-
 .../syscalls/io_pgetevents/io_pgetevents02.c  | 59 +++++++++++++++----
 3 files changed, 97 insertions(+), 18 deletions(-)

diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
index 3c9d5b2d7618..5bb9a60c352a 100644
--- a/include/lapi/io_pgetevents.h
+++ b/include/lapi/io_pgetevents.h
@@ -16,15 +16,20 @@
 #ifdef HAVE_LIBAIO
 #include <libaio.h>
 
-#ifndef HAVE_IO_PGETEVENTS
-int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
-		 struct io_event *events, struct timespec *timeout,
-		 sigset_t *sigmask)
+static inline int sys_io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask)
 {
 	return tst_syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events,
 			   timeout, sigmask);
 }
-#endif /* HAVE_IO_PGETEVENTS */
+
+static inline int sys_io_pgetevents_time64(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask)
+{
+	return tst_syscall(__NR_io_pgetevents_time64, ctx, min_nr, max_nr,
+			   events, timeout, sigmask);
+}
+
 #endif /* HAVE_LIBAIO */
 
 #endif /* IO_PGETEVENTS_H */
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
index 50d2c5f9a3ab..f99879c07ea6 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -6,11 +6,38 @@
  * Basic io_pgetevents() test to receive 1 event successfully.
  */
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
+#include "lapi/abisize.h"
 
 #ifdef HAVE_LIBAIO
 static int fd;
 
+static struct test_variants {
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
 static void cleanup(void)
 {
 	if (fd > 0)
@@ -19,17 +46,23 @@ static void cleanup(void)
 
 static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct io_event events[1];
 	struct iocb cb, *cbs[1];
 	io_context_t ctx = 0;
+	struct tst_ts to;
 	sigset_t sigmask;
 	char data[4096];
-	int ret, fd;
+	int ret;
+
+	to.type = tv->type;
+	tst_ts_set_sec(&to, 0);
+	tst_ts_set_nsec(&to, 10000);
 
 	cbs[0] = &cb;
 	sigemptyset(&sigmask);
 
-	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT, 0644);
 	io_prep_pwrite(&cb, fd, data, 4096, 0);
 
 	ret = io_setup(1, &ctx);
@@ -41,7 +74,7 @@ static void run(void)
 		tst_brk(TBROK | TERRNO, "io_submit() failed");
 
 	/* get the reply */
-	ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
+	ret = tv->io_pgetevents(ctx, 1, 1, events, tst_ts_get(&to), &sigmask);
 
 	if (ret == 1)
 		tst_res(TPASS, "io_pgetevents() works as expected");
@@ -55,8 +88,10 @@ static void run(void)
 static struct tst_test test = {
 	.min_kver = "4.18",
 	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_tmpdir = 1,
 	.cleanup = cleanup,
+	.setup = setup,
 };
 
 #else
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index 7cca7fc08567..7c0c6806d005 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -6,7 +6,9 @@
  * Basic io_pgetevents() test to check various failures.
  */
 #include "tst_test.h"
+#include "tst_timer.h"
 #include "lapi/io_pgetevents.h"
+#include "lapi/abisize.h"
 
 #ifdef HAVE_LIBAIO
 static sigset_t sigmask;
@@ -14,35 +16,65 @@ static struct io_event events[1];
 static io_context_t ctx, invalid_ctx = 0;
 static int fd, ctx_initialized;
 
+static struct tst_ts to;
+static void *bad_addr;
+
 static struct tcase {
 	char *name;
 	io_context_t *ctx;
 	long min_nr;
 	long max_nr;
 	struct io_event *events;
-	struct timespec *timeout;
+	struct tst_ts *timeout;
 	sigset_t *sigmask;
 	int exp_errno;
 } tcases[] = {
-	{"invalid ctx", &invalid_ctx, 1, 1, events, NULL, &sigmask, EINVAL},
-	{"invalid min_nr", &ctx, -1, 1, events, NULL, &sigmask, EINVAL},
-	{"invalid max_nr", &ctx, 1, -1, events, NULL, &sigmask, EINVAL},
-	{"invalid events", &ctx, 1, 1, NULL, NULL, &sigmask, EFAULT},
-	{"invalid timeout", &ctx, 1, 1, events, (void *)(0xDEAD), &sigmask, EFAULT},
-	{"invalid sigmask", &ctx, 1, 1, events, NULL, (void *)(0xDEAD), EFAULT},
+	{"invalid ctx", &invalid_ctx, 1, 1, events, &to, &sigmask, EINVAL},
+	{"invalid min_nr", &ctx, -1, 1, events, &to, &sigmask, EINVAL},
+	{"invalid max_nr", &ctx, 1, -1, events, &to, &sigmask, EINVAL},
+	{"invalid events", &ctx, 1, 1, NULL, &to, &sigmask, EFAULT},
+	{"invalid timeout", &ctx, 1, 1, events, NULL, &sigmask, EFAULT},
+	{"invalid sigmask", &ctx, 1, 1, events, &to, NULL, EFAULT},
+};
+
+static struct test_variants {
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+		struct io_event *events, void *timeout, sigset_t *sigmask);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .io_pgetevents = sys_io_pgetevents, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_io_pgetevents_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .io_pgetevents = sys_io_pgetevents_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
 };
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct iocb cb, *cbs[1];
 	char data[4096];
 	int ret;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	bad_addr = tst_get_bad_addr(NULL);
+	to.type = tv->type;
+	tst_ts_set_sec(&to, 0);
+	tst_ts_set_nsec(&to, 10000);
+
 	cbs[0] = &cb;
 
 	sigemptyset(&sigmask);
 
-	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
+	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT, 0644);
 	io_prep_pwrite(&cb, fd, data, 4096, 0);
 
 	ret = io_setup(1, &ctx);
@@ -69,10 +101,16 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
+	struct timespec *to;
+	sigset_t *sigmask;
+
+	sigmask = tc->sigmask ? tc->sigmask : bad_addr;
+	to = tc->timeout ? tc->timeout : bad_addr;
 
-	TEST(io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events,
-			   tc->timeout, tc->sigmask));
+	TEST(tv->io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events, to,
+			       sigmask));
 
 	if (TST_RET == 1) {
 		tst_res(TFAIL, "%s: io_pgetevents() passed unexpectedly",
@@ -95,6 +133,7 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
