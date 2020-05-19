Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B61D9285
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5123A3C4E9E
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1775E3C4E8A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:24 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6BF47140134D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:23 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id ci23so1046457pjb.5
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1cRs2HtrW5mn+LrQn5UBxmYcyheRU5uHG/KDLK8ow0=;
 b=IYwBrnn1aMJH9SBShBh6H7xnjn7YmJIPpH00BcsSZnFOe9bfKftfYp2TuPa9KcpJpE
 jU5algqYp5B2YXIOFmNYlG8EgUJ7T5j6FOrv6ZNf8BqeORsRidoo4NGz74k9Uj9kcP/N
 ClnI7J1hF6MLR/Mp8jzRi0JGdtHAPuXL5zTgzVN/SRNaTq8Mlt5hq4iX6jzjt02VFPuA
 z2fAEkxorB0lViyfIJNxyNSE17EESNGU8fQY5sjcyuch9bR+aHgFxrbRkrZ0aZEhdN9k
 AzLT8yQq8CZMatPXrdzNkn8EGz1ccALWcWAEucvE4kXQvcnFjJKGfqctlUnQaq4sKI2h
 76yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1cRs2HtrW5mn+LrQn5UBxmYcyheRU5uHG/KDLK8ow0=;
 b=rVRqJG2P3ZdFVtACw0zYELtEk3eUrC91J3C2sapR6ywetUw6HWZuTdOqAhwlNW+ojA
 ad6S+x+lKG0kqdMa8SwZ0MDWQh67xS/G4UThN8fDHFF1lgun7NoQO/opAX7cwLyQrdb0
 9nRiQntxw9euF5r+VIJgaYmwTyBHNDqvx2fWniWD18rNf9A5HIFDjkaXdzDmaEVHlogv
 cZ/tb9EYWsYnekpBGTffl9884+X9ND1Ty0jhTAaOBZIYaon6eKZM8LAv00LK11rRdT0i
 wnJpLAKihvScSKSYPDeMVHf13MMHfjqZIELlGqWPWvVDjYm8canvNUB0DnYALAY5GTmN
 OgbA==
X-Gm-Message-State: AOAM531S8HiDElu317q00WPJyDoYSiRzrse7gA4oyMZumA3lA0Y1HPLS
 1DdPN/KoUBXwBzKakDHA+9jed+xUvwo=
X-Google-Smtp-Source: ABdhPJwrfnz8ieDUn0IUpzh8CImBCQH17J4vEYNFDZB7KR5XrWGsdcJyDjckF9HEiKD9ApN/2EeItw==
X-Received: by 2002:a17:90b:3c7:: with SMTP id
 go7mr4080146pjb.67.1589878281568; 
 Tue, 19 May 2020 01:51:21 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id z6sm10781351pfb.87.2020.05.19.01.51.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:21 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:09 +0530
Message-Id: <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589877853.git.viresh.kumar@linaro.org>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] syscalls: settimeofday: Use gettimeofday()
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

Use gettimeofday() instead of calling it with tst_syscall().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/settimeofday/settimeofday01.c | 6 +++---
 testcases/kernel/syscalls/settimeofday/settimeofday02.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday01.c b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
index 368fdebc0c8e..c599a820fc97 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday01.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
@@ -23,7 +23,7 @@ static void verify_settimeofday(void)
 	suseconds_t delta;
 	struct timeval tv1, tv2;
 
-	if (tst_syscall(__NR_gettimeofday, &tv1, NULL) == -1)
+	if (gettimeofday(&tv1, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv1, NULL) failed");
 
 	tv1.tv_sec += VAL_SEC;
@@ -37,7 +37,7 @@ static void verify_settimeofday(void)
 		return;
 	}
 
-	if (tst_syscall(__NR_gettimeofday, &tv2, NULL) == -1)
+	if (gettimeofday(&tv2, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv2, NULL) failed");
 
 	if (tv2.tv_sec > tv1.tv_sec) {
@@ -58,7 +58,7 @@ static void verify_settimeofday(void)
 
 static void setup(void)
 {
-	if (tst_syscall(__NR_gettimeofday, &tv_saved, NULL) == -1)
+	if (gettimeofday(&tv_saved, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv_saved, NULL) failed");
 }
 
diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday02.c b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
index 485a26b1d9c5..0d6862eb33b1 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday02.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
@@ -46,7 +46,7 @@ static void verify_settimeofday(unsigned int n)
 
 static void setup(void)
 {
-	if (tst_syscall(__NR_gettimeofday, &tv_saved, NULL) == -1)
+	if (gettimeofday(&tv_saved, NULL) == -1)
 		tst_brk(TBROK | TERRNO, "gettimeofday(&tv_saved, NULL) failed");
 }
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
