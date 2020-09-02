Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCE25A928
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:10:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C8D83C2D73
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:10:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4E7EF3C5A74
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:10:33 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1739C6006DD
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:10:33 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id y6so2058547plk.10
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTeoZZA5isYwYRuoPNCDuyFxplf4cKWstooB+H95K+k=;
 b=mvPd5msgYd/BBlj0GeCJ3RKaAMr6AiRJsjqOfaooKewucunkBPYi453BeqdLBllu2d
 XFjapE+KfB3ycqM+Pr3wCulLiWy1uROnH3fmn0LGC/uq5uOm0cbzabImkY0YGu224P9p
 6hnsyYuKW0Ka2NErojKfG8de7CBIpGUm91TtkaiUQvBy6YoVEFd4USpLPPo8CYBKZ0mL
 Z/Sq570X6WwVmj1kh5nhtI2H50jn5S/F1O3gwnbxH9b2m5rr3ayFZZb15+l71KVvgboP
 mLGSioJ8EjT80Sn/6YNjCb5PRVCLX64igsj6Dm54d9T2K58EpV5u8G3f/C2iXNnewgD+
 qsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTeoZZA5isYwYRuoPNCDuyFxplf4cKWstooB+H95K+k=;
 b=qx4uhMYhVgYeBn5ugfMoTghbTuOkKgrA0uh4kcBoPys5XRCDv93FLInfI8vRhsdOT5
 WQChsAe8bgmY/Fdi8/mK9NaqoLiEcvYojQ7zM/MbHTsj14aqV+AzdBj0drzCoAdod4sn
 deIqbbD47Q4tuWKSmxgy/E/i/W4ReyjHhWg/9BxOw+gnsgbyIIpjC46C6XB8RzNwRe/n
 cStjqvf3SL5CMQNQKLzydCIBccxDe6A94I2V8mtjt6ktxillymjuf7B1pQssSWZzC7Qb
 yVvoqN/RU3fyIlLWmc4cgeZxKN7QULbvThErHeIsAPAaxzzG03lU8iJsIE7j1xetfkbt
 /Zpw==
X-Gm-Message-State: AOAM530ZegRdM3cWNLBnxLCzuxQk2pQrz++w5FMGN2IyB/aih6Vpppbf
 gS0WJjA9GVwE4mGTiFU4/GfaZ1ahVUtAmQ==
X-Google-Smtp-Source: ABdhPJwWOA0kJR2FQfK43jHhG3mPQTLZ8mp3xZ/kd4WsSDmgKPMipmuPELe0CrESffOj9EbmvC/F8g==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr1556234pjb.182.1599041431279; 
 Wed, 02 Sep 2020 03:10:31 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id c1sm4979486pfi.136.2020.09.02.03.10.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 03:10:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  2 Sep 2020 15:40:05 +0530
Message-Id: <5ed75cb65e0ac8c7c5ae7df7f851cb65fc970bf5.1599041148.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <551441b4bce2d9dfd1567ffcd536f50f14a049d0.1599041148.git.viresh.kumar@linaro.org>
References: <551441b4bce2d9dfd1567ffcd536f50f14a049d0.1599041148.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V10 2/2] syscalls/semtimedop: Add failure test for
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
V10:
- Fixed the crash after Li Wang pointed out the issue.
- Don't call tst_ts_get() on invalid timeout pointer.

 testcases/kernel/syscalls/ipc/semop/semop02.c | 41 ++++++++++++-------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 22fdb5cbef4c..18eea8cc0180 100644
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
-	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
-	{1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
-	{1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
-	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
-	{1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
-	{1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
-	{1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
-	{1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
-	{1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
-	{1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},
-	{0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, EAGAIN},
-	{0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, &valid_to, E2BIG},
+	{1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EACCES},
+	{1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EFAULT},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, &valid_to, EINVAL},
+	{1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, &valid_to, EINVAL},
+	{1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, &valid_to, ERANGE},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, &valid_to, EFBIG},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, &valid_to, EFBIG},
+	{1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, &valid_to, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, &valid_to, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, &valid_to, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, &valid_to, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, &invalid_to, EFAULT},
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
 
 	if (!tc[i].all_variants && tv->semop == semop) {
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
