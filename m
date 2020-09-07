Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFD25F5E6
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB09C3C2C8F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2DDEF3C21DD
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:47 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6DD4E200B17
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:47 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id s2so6178438pjr.4
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXnVFNv0p5fBnpdI46PwlkJOSrlmCY6tWN1qEpWhtFI=;
 b=nY7jZfVlyyR10kBIVBjog/Km2GAtV6Mhc/QC8NrCwUL60hYt4KeAF1QYbz+IV5ZOkZ
 3al58QyTdeUd2NBbQW8hUkngTpexeHFnFYJJ74bGma0Q6jGT2uEsfJzfkYE8eyIMk/20
 GsK5j6oWbmJfEEjY3TD/80+V0/+V23rQ3kL5qtXc0G+ybuvEs4e3/ekQFNKcb2+AyPZ9
 435i11l0AUFQNfgJ8Hj++b172qNo+QEUy9VSKi+Lo6Ym4pjCWnDk+v4+FK11OiptoCR4
 gfqwk4vraGOntpc2oJQ+xlrrELEqFIR1zAxRxalT1HepTwUnlEdY7w2/oLriZQD0ETO4
 K4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXnVFNv0p5fBnpdI46PwlkJOSrlmCY6tWN1qEpWhtFI=;
 b=JOwdk+nqjTjCAYgCvuBnXvLGAAfmFGn/wT79/B5reocaFCCnoGNJyCNwjFmGBW2yBw
 XJtyA0Pa6Z9ll8N/Fz3tEIB/Kv55cdk5wi89wSCnE9RDIAGoRUaY6wUP51jUQ7yHujfb
 rHG+HtSIEXrMgGpK3zrhRuuw8nzN96eMK0nfrlEsUjsXQ4XgA6y52SWgUrzs7TU3Xss8
 zCpeRYIPZ0A/gkPtK3CEmpUsiaLK4Z5u06tdqKmF1eG/JOAe6692jvocv1dogrst4F76
 a/JGDxWqiYEN5+3rMmcwgNsGIh1m+BoQ9LleBwK5DxoJp+h9SEnGOAkvKFzB/w/ShstB
 epcg==
X-Gm-Message-State: AOAM53334R7E4pwFPvKPENaPaaJiPLE+rJuwkwp32kN6EDgw5Cg3TmlF
 NQjobNJ88Jn7MDgtFv340Sp41ijllcS+LA==
X-Google-Smtp-Source: ABdhPJykkiXxg2+KFlwS7fgD2gLmYzGk2rmlqV+xKSsntptSAGpqu/IZqxLu49iolMCNXSLveB45Jg==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr11815357pjb.27.1599469245669; 
 Mon, 07 Sep 2020 02:00:45 -0700 (PDT)
Received: from localhost ([122.181.47.55])
 by smtp.gmail.com with ESMTPSA id c1sm3123889pfc.93.2020.09.07.02.00.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 02:00:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 14:30:06 +0530
Message-Id: <3966837943d2ad3e74a69d6c34f18cc152c09536.1599469171.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
References: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 3/3] syscalls: select: Verify that data is
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

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index 4f8afb4e6bd6..4cf139b09598 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -25,24 +25,31 @@ static struct select_info {
 	int *nfds;
 	fd_set *readfds;
 	fd_set *writefds;
+	int *writefd;
 } tests[] = {
-	{&fd_reg, &readfds_reg, NULL},
-	{&fds_pipe[1], &readfds_pipe, &writefds_pipe},
-	{&fd_npipe, &readfds_npipe, &writefds_npipe},
+	{&fd_reg, &readfds_reg, NULL, NULL},
+	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, &fds_pipe[1]},
+	{&fd_npipe, &readfds_npipe, &writefds_npipe, &fd_npipe},
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
 		tst_res(TFAIL | TTERRNO, "select() failed");
+	else if (!TST_RET)
+		tst_res(TFAIL, "select() timed out");
 	else
 		tst_res(TPASS, "select() passed");
 }
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
