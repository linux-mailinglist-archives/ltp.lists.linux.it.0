Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FE22B0B0
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DFB33C4D50
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 926293C1D48
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:26 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C93DE60097E
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:25 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id gc15so4340731pjb.0
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=lNs8E6298tAZsK2LUYyGFtqx3YigO/qO0vaMCdCLCfI=;
 b=GDpfxysVDYWCGdH7o1rtAv4cqWuglSpOCMayoQfIvlqpC2cJZVcsaUemmQ5O1dp6MG
 uNHM7MEHXOMNTLpLrlWQJR4zNxk2wghMVSrwbNi0HZow0cBeJhvFI+arQTAhZPQrpq53
 fUok7MaMqo4pVZmzrLHHAvb4Ir6I4yCZJ1i7q/XdR5lLUp9C3jMfyJZaJudT540G5y/0
 gvNTINlapqYfGAxIMDa1sGT8h+Zfwf756aVhtxyNwIO1WYyyb+DZev6/qdLtXGIjJX+c
 D9rNiB2dk6ZjP4W+WHNEAg1E1qhkKJKX4xXblU2ZI2M7chmhagv5xvh2wDXLJrdgFy5g
 j3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lNs8E6298tAZsK2LUYyGFtqx3YigO/qO0vaMCdCLCfI=;
 b=HPRnbgbKkcG7gtVx6cH4V6exEjPUaZvWbCsg1CxQqJOaP1r5+j7iYtUZrfHaQR2+Vm
 2yYT0Amrk/NM+T11ibvEZ5Wp2VIikq26qBKP6BHLuKIuTdF8CaYAeNaBJ8yxxUqiM+6Y
 suIdhF1BjEaAl3zbz7Cma79Oz6PSyjFPLTdFNNCCKMnBEgUYr98sbBZdU2o6iFHdM730
 84dNUQh3aWQC6H2iqfKqjtCouPEyvS8yelAqZqdip3S4zQBdDb08zznpbYHppldvQauD
 8Z4Ka0FAXwl+HISql76WutMKrHCcMoPm8Hh24STNrt2qRrQi+qr76nv/qIzy23LTPG1j
 fy7Q==
X-Gm-Message-State: AOAM5310pTXcwpiGED0yUhUUUL0hDECIjWWif3iXL50Uxw01CBRRH5wa
 6NBpAi4XzZVeP8QXgbsp2c15IqdQvjQ=
X-Google-Smtp-Source: ABdhPJzvb64itun37Q8u2NybNyOPYCGdss4lwVGAnXo2jCLkiTGKHitmzQLihBb1p61LfNejH5Ax1A==
X-Received: by 2002:a17:902:aa42:: with SMTP id
 c2mr3943540plr.218.1595511742693; 
 Thu, 23 Jul 2020 06:42:22 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id z13sm3144174pfq.220.2020.07.23.06.42.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 06:42:21 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jul 2020 19:12:05 +0530
Message-Id: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] libs: sigwait: Use SAFE_FORK()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use SAFE_FORK(), which also gets rid of a compilation warning for us.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 libs/libltpsigwait/sigwait.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index 5fbcdebf1295..bb8d2dd05a30 100644
--- a/libs/libltpsigwait/sigwait.c
+++ b/libs/libltpsigwait/sigwait.c
@@ -356,10 +356,8 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 	pid_t pid;
 	int status;
 
-	switch (pid = fork()) {
-	case -1:
-		tst_brk(TBROK | TERRNO, "fork() failed");
-	case 0:
+	pid = SAFE_FORK();
+	if (pid == 0) {
 		signal(SIGSEGV, SIG_DFL);
 
 		/*
@@ -374,9 +372,6 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		tst_res(TINFO | TTERRNO, "swi_func returned: %ld",
 			TST_RET);
 		_exit(1);
-		break;
-	default:
-		break;
 	}
 
 	SAFE_WAITPID(pid, &status, 0);
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
