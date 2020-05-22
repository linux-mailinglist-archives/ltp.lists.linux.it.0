Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B911DE031
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CB3E3C4CAE
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:55:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E41933C4C1E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:31 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3818620129F
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:31 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id ci23so4573251pjb.5
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTxLtqQx3pVwgEs2W982fFofMwM4UeiPity57wjhuOM=;
 b=jg7iJT1rXN2nmP2xyYWEMo5dHlZtwEoG4dzSWAvgi6hKLW0+KfkwnooF5a5NunHQyG
 geqDArtXtnGu/CtG1oGOwtg657E/evM+dOwJkkedW7vVzTkIMZKadjOdu/yVEM8I/lZp
 FDlcC2bUEu8cC1q25FrW3hyPkJw5beSCvkJofv/HfFGBXDc92I04iX5uOG9X1q/pFTTg
 XcRpdQhQl7+YTHc2l/bpJiS+CMn2XZXReAw4U7SaUmAsGdO1w2OT8PhDg3OG8zDU1RFS
 JYbE+pmjfHsVi7MAHL2hrlW7QrBR3/3YqAGlYwq1rt/1cGzozXySq/35MxePd215ert5
 9LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTxLtqQx3pVwgEs2W982fFofMwM4UeiPity57wjhuOM=;
 b=GTLVCcfSNQzirfKfmyGk6qQ02rK3EUgCp1WUiArg4KHdPFF+KxwrV9DNVxVvyVWuX+
 wCJJcpl3Zthlzot7awv+A0EXT0ufDT4YKr7VDELSxYk3o+UpZjNesxSSSm547io2tsHA
 YPJAytG1dZTSN1LBOEcDYDgl7BVFIzP9IK8msiamb54joqy5m5CvnlitGReRG6JnzzXZ
 whRo3D7JwVy4sjtpdrUvuTMnQLoKp4XW60V2vWv5tRQhUIrOHr4CTlgiHB13+MHGv06g
 94FAfc0DghQzp7xB8gJakqIjaHAJCOThrECp64NAkScVuX7gXy+YgnYPApNhQORp8A1G
 THlQ==
X-Gm-Message-State: AOAM533HxAyNHkL/WXkG/XQ+sOtWJiiHHSNjLvXdfi50Km+TVMvVUmHF
 aIM79364rBAyoAtYDKdqHROAFe1t/+A=
X-Google-Smtp-Source: ABdhPJzT6efLokYaVa6evFaXmWaTxeybYtHqaqFU2gRBbaLnMCau1fcPOYX/88WnxGYAtkhertVQQQ==
X-Received: by 2002:a17:90b:4390:: with SMTP id
 in16mr2849264pjb.78.1590130469443; 
 Thu, 21 May 2020 23:54:29 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q3sm6022407pfg.22.2020.05.21.23.54.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:10 +0530
Message-Id: <40fd549b487a705afa1f50f833488c185011df1f.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 4/6] syscalls: settimeofday: Use gettimeofday()
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

Passing struct timeval to __NR_gettimeofday syscall is incompatible and
may cause issues as it must only be used with the libc gettimeofday()
syscall. Use gettimeofday() instead of calling it with tst_syscall() to
fix that.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/settimeofday/settimeofday01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday01.c b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
index 7ce3dc5a47b3..b7f84b00fdc8 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday01.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
@@ -21,7 +21,7 @@ static void verify_settimeofday(void)
 	suseconds_t delta;
 	struct timeval tv1, tv2;
 
-	if (tst_syscall(__NR_gettimeofday, &tv1, NULL) == -1)
+	if (gettimeofday(&tv1, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv1, NULL) failed");
 
 	tv1.tv_sec += VAL_SEC;
@@ -35,7 +35,7 @@ static void verify_settimeofday(void)
 		return;
 	}
 
-	if (tst_syscall(__NR_gettimeofday, &tv2, NULL) == -1)
+	if (gettimeofday(&tv2, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv2, NULL) failed");
 
 	if (tv2.tv_sec > tv1.tv_sec) {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
