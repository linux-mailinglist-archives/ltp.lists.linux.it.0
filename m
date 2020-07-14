Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2432621FE82
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 22:24:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAD673C4F6F
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 22:24:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D92203C28F5
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 22:24:40 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 96D7C1A006BB
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 22:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594758277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=FqAumZwDDi4Qbn7C013ddMkxQQ8r+zvjs/6eQoA5y8Q=;
 b=i1raPyE0HCA4ZByhpe7py6v3fm30jsBz6gYV5jCi8x/rNafTp+d3baPCxd0r4UwsxnsM4j
 dN1kOD0TamThqIeUK/vdvnA8/ISueIDgBDEkcJbu64BRLlCAq+eEe8BjgY+uqRgqw8WisB
 NPTmkbOQizlNdMgw4xigmH9aW8NhEyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-CMXWC4FENxWdTEMnjq6z9Q-1; Tue, 14 Jul 2020 16:24:35 -0400
X-MC-Unique: CMXWC4FENxWdTEMnjq6z9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A87D80BCA9;
 Tue, 14 Jul 2020 20:24:34 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58D1C6FDD1;
 Tue, 14 Jul 2020 20:24:32 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 14 Jul 2020 22:24:25 +0200
Message-Id: <bd80f928abee6dac85d051c022afe559f5da8d0a.1594758146.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_timer: pass kernel_timer_t type to syscalls
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
Cc: viresh.kumar@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

timer_[gs]etttime tests are failing on s390, which is big endian
system, because tests are passing timer_t type, which is glibc
type (void *). Kernel expects and sets only int portion, so the
tests fail for all but first (0) timer id.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/tst_timer.h                                       | 8 ++++----
 testcases/kernel/syscalls/timer_gettime/timer_gettime01.c | 6 +++---
 testcases/kernel/syscalls/timer_settime/timer_settime01.c | 6 +++---
 testcases/kernel/syscalls/timer_settime/timer_settime02.c | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index e42b54f0e92a..d2c3f3cb1328 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -316,23 +316,23 @@ static inline int sys_sched_rr_get_interval64(pid_t pid, void *ts)
 	return tst_syscall(__NR_sched_rr_get_interval_time64, pid, ts);
 }
 
-static inline int sys_timer_gettime(timer_t timerid, void *its)
+static inline int sys_timer_gettime(kernel_timer_t timerid, void *its)
 {
 	return tst_syscall(__NR_timer_gettime, timerid, its);
 }
 
-static inline int sys_timer_gettime64(timer_t timerid, void *its)
+static inline int sys_timer_gettime64(kernel_timer_t timerid, void *its)
 {
 	return tst_syscall(__NR_timer_gettime64, timerid, its);
 }
 
-static inline int sys_timer_settime(timer_t timerid, int flags, void *its,
+static inline int sys_timer_settime(kernel_timer_t timerid, int flags, void *its,
 				    void *old_its)
 {
 	return tst_syscall(__NR_timer_settime, timerid, flags, its, old_its);
 }
 
-static inline int sys_timer_settime64(timer_t timerid, int flags, void *its,
+static inline int sys_timer_settime64(kernel_timer_t timerid, int flags, void *its,
 				      void *old_its)
 {
 	return tst_syscall(__NR_timer_settime64, timerid, flags, its, old_its);
diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index f7083917317c..02d5b416d1a2 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -15,7 +15,7 @@
 #include "tst_timer.h"
 
 static struct test_variants {
-	int (*func)(timer_t timer, void *its);
+	int (*func)(kernel_timer_t timer, void *its);
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
@@ -28,7 +28,7 @@ static struct test_variants {
 #endif
 };
 
-static timer_t timer;
+static kernel_timer_t timer;
 
 static void setup(void)
 {
@@ -66,7 +66,7 @@ static void verify(void)
 		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
 	}
 
-	TEST(tv->func((timer_t)-1, tst_its_get(&spec)));
+	TEST(tv->func((kernel_timer_t)-1, tst_its_get(&spec)));
 	if (TST_RET == -1 && TST_ERR == EINVAL)
 		tst_res(TPASS, "timer_gettime(-1) Failed: EINVAL");
 	else
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 76f283b81fe3..48b37d8e7624 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -29,7 +29,7 @@
 
 static struct tst_ts timenow;
 static struct tst_its new_set, old_set;
-static timer_t timer;
+static kernel_timer_t timer;
 
 static struct testcase {
 	struct tst_its		*old_ptr;
@@ -46,8 +46,8 @@ static struct testcase {
 
 static struct test_variants {
 	int (*cgettime)(clockid_t clk_id, void *ts);
-	int (*tgettime)(timer_t timer, void *its);
-	int (*func)(timer_t timerid, int flags, void *its, void *old_its);
+	int (*tgettime)(kernel_timer_t timer, void *its);
+	int (*func)(kernel_timer_t timerid, int flags, void *its, void *old_its);
 	enum tst_ts_type type;
 	char *desc;
 } variants[] = {
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index 14c907bd19e1..f1225c1ccfad 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -30,8 +30,8 @@
 static struct tst_its new_set, old_set;
 static struct tst_its *pnew_set = &new_set, *pold_set = &old_set, *null_set = NULL;
 static void *faulty_set;
-static timer_t timer;
-static timer_t timer_inval = (timer_t)-1;
+static kernel_timer_t timer;
+static kernel_timer_t timer_inval = (kernel_timer_t)-1;
 
 /* separate description-array to (hopefully) improve readability */
 static const char * const descriptions[] = {
@@ -44,7 +44,7 @@ static const char * const descriptions[] = {
 };
 
 static struct testcase {
-	timer_t			*timer_id;
+	kernel_timer_t		*timer_id;
 	struct tst_its		**new_ptr;
 	struct tst_its		**old_ptr;
 	int			it_value_tv_nsec;
@@ -59,7 +59,7 @@ static struct testcase {
 };
 
 static struct test_variants {
-	int (*func)(timer_t timerid, int flags, void *its,
+	int (*func)(kernel_timer_t timerid, int flags, void *its,
 		    void *old_its);
 	enum tst_ts_type type;
 	char *desc;
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
