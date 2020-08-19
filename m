Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AEC249DCE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:28:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FA9D3C5846
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:28:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 54AC03C583D
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:27:57 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A99F52009FB
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:27:56 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id j21so11317994pgi.9
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRwHXp8t1Aw+NZmY5bB0RVGMJ/wTpr1dh+XZZad2W0E=;
 b=b548TudWUXctbZ/AG+ReI3hdtRzeTutu8IMNYeU0KRSCJfJrgCpNdCMpX0R75z7Su4
 Lm4HEyGN8hSsjEvE4RGcZVczaQwuiV8i5qg5mH9U2KGazWsGVhYvOPtZ40jQM6JWusI+
 0z0w4vmGKv3AJ72BRcwqjD0P6sb1HFFkt8yQhp9lTuZGRYBxc31MCRou5GVdhn+r44bM
 L6bwp7z0S4/3yznHQAq0EQn/N8EqUwHCpyTE5rfHfcAySAb8DjmM30jfzMwzM+I1zug1
 lh9GYkuWiADPWESDO9oEip4QmeeZwDnWOaPtun34r1UDHNPxPxQbPrZxAO4r/d9SjtQP
 iygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRwHXp8t1Aw+NZmY5bB0RVGMJ/wTpr1dh+XZZad2W0E=;
 b=dQp/GOZ7V3s9ALUGmCghU6vWFSTexE5bSq6cjpmpYboFjyZlOF9eExmmGQt2uThI39
 HHTx8mSZ4krBTkUkqAx63BM0oaZNcxpWQdmdxyYI7V2Pl+8QfdcJcCq+19gSOG896DNb
 vh/rKK+RnBnLwa7zoUDzADhQVroJ6UuOZQd7dZnVvORCwHQ7J4mzXoGj8kO8TCMdngns
 pSPqhnAXw7P0rQg/JJ1JPbxqcTiig0pncgKyMPUy3323KX394jvd7V+uxyvA6qmxeSVc
 ZX/5QII8TZTJq/J+H/52CwM7SUnjhmC3QwC4aqQD5on5gJnUQl0N+CDIvoSltcHPHA43
 hgWg==
X-Gm-Message-State: AOAM532RLxnb4ptV+E/2/Y08tw8L2K5m3DfXGnOLyRLsVycEGlkr+K5/
 SBW9lCbIVQpDis57EX7J1vWmcT3TGV98AQ==
X-Google-Smtp-Source: ABdhPJxc1/RElbxocyC9FuEHknBthJ4ZYGkStjGMwHD44o1lCuLtP1LyQXUMJekaCbThzGew4NnVYA==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr16240785pgc.441.1597840073745; 
 Wed, 19 Aug 2020 05:27:53 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id e125sm28044772pfh.69.2020.08.19.05.27.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 05:27:53 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Aug 2020 17:57:46 +0530
Message-Id: <a9e6d98c722a92d1981fcc2b7ddeba547195c40e.1597839878.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
References: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V9 2/2] syscalls/semtimedop: Add failure test for
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds test for invalid timeout pointer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
Cyril: This doesn't work as expected and results in the crash of the
executable. I am not sure what's going on here though.
---
 testcases/kernel/syscalls/ipc/semop/semop02.c | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index d0fed5321502..bf362d1edcc9 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -31,6 +31,7 @@ static int bad_sem_id = -1;
 static short sem_op_max, sem_op_1 = 1, sem_op_negative = -1, sem_op_zero = 0;
 static struct sembuf *faulty_buf;
 static struct tst_ts timeout;
+static struct tst_ts *valid_to = &timeout, *invalid_to;
 
 #define NSOPS	1
 #define	BIGOPS	1024
@@ -45,20 +46,22 @@ static struct test_case_t {
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
@@ -68,6 +71,7 @@ static void setup(void)
 	key_t semkey;
 	union semun arr;
 	struct seminfo ipc_buf;
+	void *faulty_address;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	semop_supported_by_kernel(tv);
@@ -96,7 +100,9 @@ static void setup(void)
 		tst_brk(TBROK | TERRNO, "semctl() IPC_INFO failed");
 
 	sem_op_max = ipc_buf.semvmx;
-	faulty_buf = tst_get_bad_addr(NULL);
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_to = faulty_address;
+	faulty_buf = faulty_address;
 }
 
 static void run(unsigned int i)
@@ -123,7 +129,7 @@ static void run(unsigned int i)
 	if (tc[i].buf)
 		ptr = *tc[i].buf;
 
-	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, &timeout));
+	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, *tc[i].to));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
