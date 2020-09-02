Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36725AE32
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 17:01:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73D563C5A86
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 17:01:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 490D03C2D5C
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:01:11 +0200 (CEST)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AF1C2200B10
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:01:10 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id y6so2408194plk.10
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROXajNiS5JUhn3O0c4TrwON9JNd0LbKM3xcMmD6f/No=;
 b=nIXwNqAlQtlDwPWjnRyKpqyZh2g141QkO8QNluljO5otY6CgsC0ze7agCs6CyqHSH4
 8rxhfCE02sJI0Ie1BLvYShkIi8qtJu9QKj90YLl7iwtzkGSThaq0yZrEXsDi6iWvASwQ
 Jgrv5R+X0/Ni/PRQqO74fGRN1Gs4jvmtk2juPbYXNCH2AhzwzTBwYjxzWMYrHAAEeGcN
 liA+rDRcux8sue8Aru+My44qtudGcVnyzbxeRqi1DeOutvXQtaYPmP44Iyvm9IJOpLuf
 paZhTs9Nqa/eLRkgNRYPN0lMfmJgRKrFDUa/bJ2nwH00zN2eRVJgy6B70/RT7lzk4szS
 Rzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROXajNiS5JUhn3O0c4TrwON9JNd0LbKM3xcMmD6f/No=;
 b=OQSzLWtPq00imS05PjwQl8WC/lcu5PpRBnuHKdtzwsiuvWbjWnXt/24E0aJnjow/gr
 wYwAdXMJYIOV087TFqSzcnMcbhrv13AEB5pHqe74lWDFDBDANh5T6aN/k2qDIPh9bXao
 isri2ERLr4PvV0uPF2GkIqA/IghrP6l41HJaUmzmbMv9VT99s+3PkvMk5S2NBffN4LWo
 5evrF6f0bWj+Z/70aqVFnKApXJWNKHlkfTyZXpGPBv2xgQ0qRaLefWJ0BIOnRxJkKByR
 dnVxSPViI5GHg8TPhM7T9KCAPB7NTKHKwFY9Zb26I1rqEPls5k5HlsdjRqEuMlw5VABE
 Bs9g==
X-Gm-Message-State: AOAM531HJ4J8RluHbx4uEbFOUuk7PLWwD6svzxX8x4oQi0+qcCUl5u1r
 ZTsiWF1rTWOJ9nnKUWNHzHb8RZfpQB9GTQ==
X-Google-Smtp-Source: ABdhPJxasTSqC13sRcJfwLKnILrJLbfbjlUj3lFjt0iguz63LDxlrljBT2+DAP033Fq46BTqufxUtw==
X-Received: by 2002:a17:902:8646:: with SMTP id
 y6mr2311443plt.19.1599058867725; 
 Wed, 02 Sep 2020 08:01:07 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id 142sm5670046pgf.68.2020.09.02.08.01.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 08:01:07 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  2 Sep 2020 20:30:45 +0530
Message-Id: <1838266947675784d1792cfa5a540db926b52c36.1599058700.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <9ba8ffe0a93eb8d6c722ce22e9042f146f83bec9.1599058700.git.viresh.kumar@linaro.org>
References: <9ba8ffe0a93eb8d6c722ce22e9042f146f83bec9.1599058700.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V11 2/2] syscalls/semtimedop: Add failure test for
 invalid timeout pointer
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

This adds test for invalid timeout pointer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V11:
- Fixed rebase conflicts.

 testcases/kernel/syscalls/ipc/semop/semop02.c | 41 ++++++++++++-------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 8d59e12bde92..9d799e6437cd 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -12,6 +12,7 @@
  * EAGAIN  - semop = -1 for zero semaphore and IPC_NOWAIT passed in flags
  * EAGAIN  - semop = 0 and timeout happens
  * EAGAIN  - semop = -1 and timeout happens
+ * EFAULT  - invalid timeout pointer
  *
  * Copyright (c) International Business Machines  Corp., 2001
  *	03/2001 - Written by Wayne Boyer
@@ -33,6 +34,7 @@ static int bad_sem_id = -1;
 static short sem_op_max, sem_op_1 = 1, sem_op_negative = -1, sem_op_zero = 0;
 static struct sembuf *faulty_buf;
 static struct tst_ts timeout;
+static struct tst_ts *valid_to = &timeout, *invalid_to;
 
 #define NSOPS	1
 #define	BIGOPS	1024
@@ -47,20 +49,22 @@ static struct test_case_t {
 	short sem_flg;
 	unsigned t_ops;
 	int arr_val;
+	struct tst_ts **to;
 	int error;
 } tc[] = {
-	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
-	{0, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
-	{0, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
-	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
-	{0, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
-	{0, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
-	{0, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
-	{0, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
-	{0, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
-	{0, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},
-	{1, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, EAGAIN},
-	{1, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, &valid_to, E2BIG},
+	{0, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EACCES},
+	{0, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EFAULT},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, &valid_to, EINVAL},
+	{0, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EINVAL},
+	{0, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, &valid_to, ERANGE},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, &valid_to, EFBIG},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, &valid_to, EFBIG},
+	{0, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, &valid_to, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, &valid_to, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, &valid_to, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, &valid_to, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, &invalid_to, EFAULT},
 };
 
 static void setup(void)
@@ -70,6 +74,7 @@ static void setup(void)
 	key_t semkey;
 	union semun arr;
 	struct seminfo ipc_buf;
+	void *faulty_address;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	semop_supported_by_kernel(tv);
@@ -98,7 +103,9 @@ static void setup(void)
 		tst_brk(TBROK | TERRNO, "semctl() IPC_INFO failed");
 
 	sem_op_max = ipc_buf.semvmx;
-	faulty_buf = tst_get_bad_addr(NULL);
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_to = faulty_address;
+	faulty_buf = faulty_address;
 }
 
 static void run(unsigned int i)
@@ -111,6 +118,7 @@ static void run(unsigned int i)
 		.sem_num = tc[i].sem_num,
 	};
 	struct sembuf *ptr = &buf;
+	void *to;
 
 	if (tc[i].semtimedop_only && tv->semop) {
 		tst_res(TCONF, "Test not supported for variant");
@@ -125,7 +133,12 @@ static void run(unsigned int i)
 	if (tc[i].buf)
 		ptr = *tc[i].buf;
 
-	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, tst_ts_get(&timeout)));
+	if (*tc[i].to == invalid_to)
+		to = invalid_to;
+	else
+		to = tst_ts_get(*tc[i].to);
+
+	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, to));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
