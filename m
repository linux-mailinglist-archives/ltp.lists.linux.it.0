Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E30294769
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 06:32:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCA6E3C266D
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 06:32:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 50AE23C23EC
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 06:32:12 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A2E3D1400997
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 06:32:11 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id 10so725940pfp.5
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 21:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2K2SmT5615014jj52sVtNdofYU2QdoUaUXi8ivKnz3s=;
 b=PrIzkU5JVqpjsA+Li8C3fNz6/NegbJFk67QwFkDBuAjvO1BS28IOI6yD630IBngrzQ
 2x/ciF/fesahVjBG4W28vl0bb3S5Pz1of6ntEh7mlcuEY3EOQ1GOm87MEtlbg03lADob
 vXcTSp53jNzt0OFd8VOEg2Aaa87GzOB5tbedsBBZfsuZ7QCxuK1DfyeY0VXOFtJ0Ma0p
 mQB6i7MVKLqtC2ixeBs6F3KjCAR3JVn8Thw0Paf3s7te5oCagelR2WtzEg7I/QP0ExxG
 OinpppByCxh6ZkpbNVwplVGR5Pf7WEgjKubpxdPT0zlR/3353/N6d5kNSNqBHLFlNTca
 FROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2K2SmT5615014jj52sVtNdofYU2QdoUaUXi8ivKnz3s=;
 b=mOiJ+4MgZCvKgRHB7HNb6b8JLG6YngHMufKlety+5NLEf9aFIISWxn3k2NE9siNwz7
 J2yNmOcs+mSfxlGLgcpwPKI9bohud9s14v+DmTWQXBi5xFiOxroByv53+gwctLWVMyv+
 5RCkKH9FTF+c6f+PujGh5t1/iP1eslsNmsSZy3SQzNZbwfLrVcNSTD23sfH2ldvuiPnR
 MWXmVVDP1suAUZ/owCVohubjuiGQIhZhCYiiFAZhVYiB5VlvZlvpZre/P+ZJzzo8FyCT
 Ro8InEoV8vySSZw5CEUEWYI5y0n9m6dwjgu2ar+IZaH0S1ZzP7uG198We65tw5Q6JF7W
 vDGw==
X-Gm-Message-State: AOAM533OHXtoNFfNyzgT1k+Mm+dbSrIarIDox8RH2Qd3j3mRE6iEGbzv
 4XnURromcEdwCdSun3fM4v1bbLAj+EmN7w==
X-Google-Smtp-Source: ABdhPJxpdrvcxIPlOY/P0IxsiIXnuErdElRTFPvinUkQOBfYnNPkwLi+uKc1SeOAZr7+21g3qU9j9w==
X-Received: by 2002:a62:878c:0:b029:155:c0e4:fb39 with SMTP id
 i134-20020a62878c0000b0290155c0e4fb39mr1470103pfe.62.1603254729764; 
 Tue, 20 Oct 2020 21:32:09 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t5sm682903pgs.74.2020.10.20.21.32.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 21:32:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 21 Oct 2020 10:02:03 +0530
Message-Id: <63646c1ba9e1a3061b44be4f1f9a29d9d6d03f2e.1603254560.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
References: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V4 2/3] syscalls: select: Verify that data is
 available to read
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

select() returns a positive value on success if timeout hasn't happened,
else returns 0. Check that and send some data to the write file
descriptor for the same.

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V4:
- test individual bits in the fd_sets to verify properly.

 testcases/kernel/syscalls/select/select01.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index 74538026adbe..68f813bb24b5 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -25,27 +25,42 @@ static struct tcases {
 	int *nfds;
 	fd_set *readfds;
 	fd_set *writefds;
+	int *readfd;
+	int *writefd;
 	char *desc;
 } tests[] = {
-	{&fd_reg, &readfds_reg, NULL, "with regular file"},
-	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, "with system pipe"},
-	{&fd_npipe, &readfds_npipe, &writefds_npipe, "with named pipe (FIFO)"},
+	{&fd_reg, &readfds_reg, NULL, &fd_reg, NULL, "with regular file"},
+	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, &fds_pipe[0], &fds_pipe[1], "with system pipe"},
+	{&fd_npipe, &readfds_npipe, &writefds_npipe, &fd_npipe, &fd_npipe, "with named pipe (FIFO)"},
 };
 
 static void run(unsigned int n)
 {
 	struct tcases *tc = &tests[n];
 	struct timeval timeout;
+	char buf;
+	int exp_ret = 1;
 
 	timeout.tv_sec = 0;
 	timeout.tv_usec = 100000;
 
+	if (tc->writefd) {
+		SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
+		exp_ret++;
+	}
+
 	TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
 
 	if (TST_RET == -1)
 		tst_res(TFAIL | TTERRNO, "select() failed %s", tc->desc);
-	else
+	else if (!TST_RET)
+		tst_res(TFAIL, "select() timed out %s", tc->desc);
+	else if (TST_RET != exp_ret)
+		tst_res(TFAIL, "select() returned incorrect value %s, expected: %d, got: %lu", tc->desc, exp_ret, TST_RET);
+	else if (FD_ISSET(*tc->readfd, tc->readfds) && (!tc->writefd || FD_ISSET(*tc->writefd, tc->writefds)))
 		tst_res(TPASS, "select() passed %s", tc->desc);
+	else
+		tst_res(TFAIL, "select() returned expected value %s, but all file descriptors aren't ready", tc->desc);
 }
 
 static void setup(void)
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
