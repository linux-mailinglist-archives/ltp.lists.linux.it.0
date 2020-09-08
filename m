Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD6260ACE
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5E433C53D8
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 857FE3C53D4
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:06 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 107161400E1C
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:06 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id d9so3808346pfd.3
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSyaGbT/bFdVeCg55/LWsrUz1w5VbWOEmdcog2kZIz0=;
 b=ZiL6IbrVqAkki1nBrJfs++yh9opeUYZH5ix6YgKTT6XgsrUVB5J/sGr1BPJePoTjWO
 JDWudixvE+DKixljzNQEeY6pInsIFIzQo0zWVO2ZMqfotAjNWSRxW9QMk0h0vNsyrmq8
 QKr5728P6WVi05wwKs2HEgP9VsJNawPKoRrKr7poWFaYZAUmWzxyvhHdx3sJKko+BU5n
 o8aq2dIASYnZGwcUXT7bijfxel9dj1UEXaqTAA/PBc0rAI8dlrQHY1RrwSV1j17Z7dyl
 yCvxw0ztqQyHVrmN0qvFnq+c6V/Z8OytFr9z7mPq3YVmY9M0MRVet5cyZELFfSXHBiHM
 SfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSyaGbT/bFdVeCg55/LWsrUz1w5VbWOEmdcog2kZIz0=;
 b=bqckbNwHObS8H8YSQdGZYaq5HVPRabbcDNnsZnysPhMR6lF5p+b75mdkHHew/pjPe6
 BctKeMeA/e5zNvfq6/vZrWGLn2hFWYZX/6nXNGrUJ75JinMTrTM/d+vHg/RYulN2qyJC
 nj4hiFQBWwO5566AVJ3NthtL3t4eToZvtPDcSrOaA84n+Mw/TtLhM5Xm2kHw0Gr9sHvQ
 Lt6LFqB5iHf/zk4Zw3OisLn4HeEWnBVsNCCpEfKiWuUkst+H86vRzu7yD+VUdpzTNjkj
 MQZH93gMZK2aBFLbS+Bf/gtL5Eg1lxRBr0Qc6O5d7VFc5QQExOMAukrdSaWw5855cN+Z
 QpKA==
X-Gm-Message-State: AOAM5307lSvra6QJOAJQEstSDVfqryj6O4ejx62cJOzHhapeFgQToSrb
 gaahLK4XfE97Qas60qvUAx3v8lftzgNkZA==
X-Google-Smtp-Source: ABdhPJzUr0XVK3PxVlFg2faZg84KY1QD9aqL7FJr601OHOeLJ+j7vg45n9N5Dd+h9bBaXTdDx0leqw==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
 v10mr22267977plo.249.1599546004163; 
 Mon, 07 Sep 2020 23:20:04 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 25sm8988275pfj.35.2020.09.07.23.20.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:03 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:20 +0530
Message-Id: <ed55accdb4ceaa11362875959558430ae1f99a6b.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 07/16] syscalls: mq_timed: Reuse struct time64_variants
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../mq_timedreceive/mq_timedreceive01.c        | 14 +++++++-------
 .../syscalls/mq_timedsend/mq_timedsend01.c     | 16 ++++++++--------
 testcases/kernel/syscalls/utils/mq_timed.h     | 18 +++++-------------
 3 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
index de0505106d04..be437e19a47f 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -135,10 +135,10 @@ static struct test_case tcase[] = {
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
-	ts.type = tv->type;
+	ts.type = tv->ts_type;
 
 	bad_addr = tst_get_bad_addr(NULL);
 
@@ -147,7 +147,7 @@ static void setup(void)
 
 static void do_test(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	const struct test_case *tc = &tcase[i];
 	unsigned int j;
 	unsigned int prio;
@@ -160,13 +160,13 @@ static void do_test(unsigned int i)
 	tst_ts_set_nsec(&ts, tc->tv_nsec);
 
 	if (tc->signal)
-		pid = set_sig(tc->rq, tv->gettime);
+		pid = set_sig(tc->rq, tv->clock_gettime);
 
 	if (tc->timeout)
-		set_timeout(tc->rq, tv->gettime);
+		set_timeout(tc->rq, tv->clock_gettime);
 
 	if (tc->send) {
-		if (tv->send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
+		if (tv->mqt_send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
 			tst_res(TFAIL | TTERRNO, "mq_timedsend() failed");
 			return;
 		}
@@ -180,7 +180,7 @@ static void do_test(unsigned int i)
 	else
 		abs_timeout = tst_ts_get(tc->rq);
 
-	TEST(tv->receive(*tc->fd, rmsg, len, &prio, abs_timeout));
+	TEST(tv->mqt_receive(*tc->fd, rmsg, len, &prio, abs_timeout));
 
 	if (pid > 0)
 		kill_pid(pid);
diff --git a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
index d72f5d41ad61..334131402c9d 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -148,10 +148,10 @@ static struct test_case tcase[] = {
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
-	ts.type = tv->type;
+	ts.type = tv->ts_type;
 
 	bad_addr = tst_get_bad_addr(cleanup_common);
 
@@ -160,7 +160,7 @@ static void setup(void)
 
 static void do_test(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	const struct test_case *tc = &tcase[i];
 	unsigned int j;
 	unsigned int prio;
@@ -173,14 +173,14 @@ static void do_test(unsigned int i)
 	tst_ts_set_nsec(&ts, tc->tv_nsec);
 
 	if (tc->signal)
-		pid = set_sig(tc->rq, tv->gettime);
+		pid = set_sig(tc->rq, tv->clock_gettime);
 
 	if (tc->timeout)
-		set_timeout(tc->rq, tv->gettime);
+		set_timeout(tc->rq, tv->clock_gettime);
 
 	if (tc->send) {
 		for (j = 0; j < MSG_LENGTH; j++)
-			if (tv->send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
+			if (tv->mqt_send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
 				tst_res(TFAIL | TTERRNO, "mq_timedsend() failed");
 				return;
 			}
@@ -196,7 +196,7 @@ static void do_test(unsigned int i)
 	else
 		abs_timeout = tst_ts_get(tc->rq);
 
-	TEST(tv->send(*tc->fd, msg_ptr, tc->len, tc->prio, abs_timeout));
+	TEST(tv->mqt_send(*tc->fd, msg_ptr, tc->len, tc->prio, abs_timeout));
 
 	if (pid > 0)
 		kill_pid(pid);
@@ -215,7 +215,7 @@ static void do_test(unsigned int i)
 		return;
 	}
 
-	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
+	TEST(tv->mqt_receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
 
 	if (*tc->fd == fd)
 		cleanup_queue(fd);
diff --git a/testcases/kernel/syscalls/utils/mq_timed.h b/testcases/kernel/syscalls/utils/mq_timed.h
index a217e864e1e4..adf46034bdc6 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -7,26 +7,18 @@
 #define MQ_TIMED_H
 
 #include "mq.h"
+#include "time64_variants.h"
 #include "tst_timer.h"
 
-static struct test_variants {
-	int (*send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
-		    unsigned int msg_prio, void *abs_timeout);
-	ssize_t (*receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
-			   unsigned int *msg_prio, void *abs_timeout);
-
-	int (*gettime)(clockid_t clk_id, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .gettime = libc_clock_gettime, .send = libc_mq_timedsend, .receive = libc_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .clock_gettime = libc_clock_gettime, .mqt_send = libc_mq_timedsend, .mqt_receive = libc_mq_timedreceive, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_mq_timedsend != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .mqt_send = sys_mq_timedsend, .mqt_receive = sys_mq_timedreceive, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_mq_timedsend_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .send = sys_mq_timedsend64, .receive = sys_mq_timedreceive64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .mqt_send = sys_mq_timedsend64, .mqt_receive = sys_mq_timedreceive64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
