Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810B1DE02C
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 411F23C4CAA
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C06C43C4CC5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:26 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 770251A00E53
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:25 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id x13so4783631pfn.11
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzrFSS/iafo/ShZCl48RhnQwi8Ty/+z3nPUN1BaKxs8=;
 b=Gk+7jxwmOSBAmZdhWv0aQJxGzZgQuQs+vjSF/IfX6+xkE/unWnLyZbuPQcNyaRsyul
 /8qVm0TqKA8QqM/mpC8CV7AMnOHOKwhdu6qUHSTEgnnmyzFmbASpnI6LMmvazvATxBl3
 8VbPESat1pSVgopT06caQw3EJ+k80sY6Tmy/5AhUZePfifgwV7qszGLX6nQImJRIXWdZ
 CQDQGpea5XE0ZlgpioBWWVnbG7XVbvHDsXAly1S7FoDeH1lWAAyNKYVMZVWM08UteyIB
 H4AVk7QNx+ojtgOjdjL7Yr8317zzqwiGl1A7HllR1I0/qSVfcu93l1zyxMvpv23jPxRF
 0WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzrFSS/iafo/ShZCl48RhnQwi8Ty/+z3nPUN1BaKxs8=;
 b=iBWsHYs7pcDK6OmSGpgy9WKtqCg8GWfGHmuvEeJYaTZoFqEM+kHIJ88yc3uA1ZxEgH
 9bZZSDwDdAdho2v0vdLSbBpuAlKo6hUoRPTmf4XnKqFU+zQMqhprt4OUwfJmnnkJsJi4
 9uTPdJWRDOg0Ur3RzSeTvQJeUkZyaRZVg+fK1WmcsfgArff8eXxz2AtDtNbWObdUL1DD
 1+2L0y03lAhCEdrU9kyBJsz9+0USXyKLSkW46JIaNzkZwXCRdonKSQfp+BUcfAZDEUyS
 155FofCegjxQxwVFkcdxjpD0otGJsGlO+KwGW1XSSZeQ4B4UTaZz4f29Yt7EZ1Thrfnx
 Fg/g==
X-Gm-Message-State: AOAM531fDfyh+JhmT2UXB2pwojaJ+/jAJiKCs/yXHNYPE1occqsvi+Qv
 xBcvHxuCKQBoLDMos6ovMPm2j90HTc8=
X-Google-Smtp-Source: ABdhPJzkUuraIvX+ZP/HNWn1OswurGPkfFf5SoH904mb5103bmKQ4M4lDCl1DOpWC1ZQD0d2nH6EGQ==
X-Received: by 2002:a62:dd03:: with SMTP id w3mr2504219pff.76.1590130463701;
 Thu, 21 May 2020 23:54:23 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id 84sm6011253pfv.157.2020.05.21.23.54.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:22 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:08 +0530
Message-Id: <76bfdd0c76e433c0ff6a75fd3e29666720d7542c.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/6] syscalls: settimeofday01: Set
 .restore_wallclock flag
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

Set the .restore_wallclock flag and get rid of some code.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/settimeofday/settimeofday01.c      | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday01.c b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
index 368fdebc0c8e..7ce3dc5a47b3 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday01.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday01.c
@@ -16,8 +16,6 @@
 #define ACCEPTABLE_DELTA 500
 #define USEC_PER_SEC    1000000L
 
-struct timeval tv_saved;
-
 static void verify_settimeofday(void)
 {
 	suseconds_t delta;
@@ -56,21 +54,8 @@ static void verify_settimeofday(void)
 		tst_res(TFAIL, "settimeofday() fail");
 }
 
-static void setup(void)
-{
-	if (tst_syscall(__NR_gettimeofday, &tv_saved, NULL) == -1)
-		tst_brk(TBROK | TERRNO, "gettimeofday(&tv_saved, NULL) failed");
-}
-
-static void cleanup(void)
-{
-	if ((settimeofday(&tv_saved, NULL)) == -1)
-		tst_brk(TBROK | TERRNO, "settimeofday(&tv_saved, NULL) failed");
-}
-
 static struct tst_test test = {
-	.setup = setup,
-	.cleanup = cleanup,
+	.restore_wallclock = 1,
 	.test_all = verify_settimeofday,
 	.needs_root = 1,
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
