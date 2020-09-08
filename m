Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85C260EF0
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 11:44:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6154F3C53EB
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 11:44:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 28DB03C53E3
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 11:44:42 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8E74A1000CCA
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 11:44:42 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id 34so234850pgo.13
 for <ltp@lists.linux.it>; Tue, 08 Sep 2020 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WPbyJvYM53oF0Foz6WIkHYvlPDrTl3dmyR0zZ8ciRRY=;
 b=uIEDSqg2jASUxK4gTmLylV8tK3LfzzJWrJy/SeE8rLnnHaZ0uBahWm4ZYb0Q2ez01Z
 kSTDYRmOlOF2hyBFd8sp/BBAydJLIwRiyGJlNh88u3GD7OrsbWll3fN1A8q/ApBw+3fq
 xrAswJzmmu5jjdsfW7eEBjvoeelmowKw1EBHHWHA04F9KMO5DYQPI0semlxr518pWc/p
 T2dYmt/IRgNvY9qOHBRkJ5JXXLsI/7oVL3MqvWxSJzswhKdBKRMbcCVVqsvjHmZd4eYz
 UOseOWtoZ+4sJkEnIxpEbArZxLuAVsGQAt+G8+qWaz+O7bxLnVlxKMAa8s039OHLsDWc
 VELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WPbyJvYM53oF0Foz6WIkHYvlPDrTl3dmyR0zZ8ciRRY=;
 b=a9wyLgLSKpL9O+pI5qvnEbMlQJh6Pb+Qewzo2C2AUIUbddrwGnmNVF+mw2KKWyq6rD
 kBFeTlapgELpf+hmr7X7Z1saEcsoIxEADZiHFFdbDkvO7xCZiLApu4eokkLbOJMA4z3U
 N5VFGRXqE0fGRF/9NSCZvvtwQ++aXDhm1Z893tdAfpg1KEvr1OKP9FKYK0E3iODcU3K0
 6yNFawtj2NXBNBlhm0DgmInx/s5aVqh0ATENaLo7kP95R3xTd7ol7J2O4fzGYd71bnW9
 BOXDSRHnx3frcz0EyskI3Soxh+V5Tx+pB3MP6QToh18odVYsXDMNwaHV0deSM7CVRfSt
 0lbw==
X-Gm-Message-State: AOAM531THEF+OQsTYadSsZ0ynnfMBLFN6j2OufAAYPUO/racQZgkE/Ge
 HFMvDgBmHp9/Gy2xRgBuLR+28mAsgm+/xQ==
X-Google-Smtp-Source: ABdhPJwUjJKCxge7toX7315CgqXN5NEl3OaScQ0ii/L50XiqedRxVWZ+Os1NRrsk0s90VufEc/N/IA==
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr8115756pfc.7.1599558280681; 
 Tue, 08 Sep 2020 02:44:40 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 138sm478293pfu.180.2020.09.08.02.44.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 02:44:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 15:14:26 +0530
Message-Id: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V3 2/3] syscalls: select: Verify that data is
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
 testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index 1213aa931251..c6b30aa67dd7 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -25,25 +25,32 @@ static struct select_info {
 	int *nfds;
 	fd_set *readfds;
 	fd_set *writefds;
+	int *writefd;
 	char *desc;
 } tests[] = {
-	{&fd_reg, &readfds_reg, NULL, "with regular file"},
-	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, "with system pipe"},
-	{&fd_npipe, &readfds_npipe, &writefds_npipe, "with named pipe (FIFO)"},
+	{&fd_reg, &readfds_reg, NULL, NULL, "with regular file"},
+	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, &fds_pipe[1], "with system pipe"},
+	{&fd_npipe, &readfds_npipe, &writefds_npipe, &fd_npipe, "with named pipe (FIFO)"},
 };
 
 static void run(unsigned int n)
 {
 	struct select_info *tc = &tests[n];
 	struct timeval timeout;
+	char buf;
 
 	timeout.tv_sec = 0;
 	timeout.tv_usec = 100000;
 
+	if (tc->writefd)
+		SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
+
 	TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
 
 	if (TST_RET == -1)
 		tst_res(TFAIL | TTERRNO, "select() failed %s", tc->desc);
+	else if (!TST_RET)
+		tst_res(TFAIL, "select() timed out %s", tc->desc);
 	else
 		tst_res(TPASS, "select() passed %s", tc->desc);
 }
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
