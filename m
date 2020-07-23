Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0722B0B2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C6633C1D48
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 15:42:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2FB703C6274
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:33 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 74167601A60
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 15:42:32 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id u185so3050666pfu.1
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=DXonTN/pwabsmOIghDjny1mojV7weIuI26n4nT8R/Kc=;
 b=RQWz0lh5rBL0lIfRrKpVUMFZxd9qdh0Nw+KnXh+p5cDTl+xitkzyFdxhoQZNA2mPCN
 CJNLPEkUEqTqLWveQA3MCjJMFl+0GvENEV6IKWUM+3dXM3ZrCz5MxzZXVMZNfJdqaQbj
 zcRIP0m8UB8CEFkWg9WaJ37R/5gekfvnMjTdNVUm/uvAVBrb58wA5E9CCI6Xs18kOhaI
 6/zbhrqzMtmfkpjm6lyt7xJMMxgKXJxl7UIv6dtolXXFCSDQ9ZLuR5aUUKvudGr8ft2z
 +sDb0z2qqLO83xeopHs8A/XQkqJ2VIVXi3Aq8ay+dswqUUH/dHr6JV56kIDYP1EKxnXW
 LjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=DXonTN/pwabsmOIghDjny1mojV7weIuI26n4nT8R/Kc=;
 b=QQqySydNBu/yIjn7EmnZBE3TnytPefYm3YGZ3fG693ImPItt/N0DMBQxGuMe9Law3t
 MMsXGuaw/QDJuOrG5WZ7OJ+ww2LCChEwu9mXo2zCujZ5pUMIYlWlB2bIeKe+7JaX2fBb
 nJLuhfRpVdRljK2diST9G4VzF7DbHm+pG0Yy/eBvDFWp8pNg7JdUFT4gP9NloLes6yCc
 aj8Jw+AJXeBdnJ1ITEXO9sPrlv3uCWgCETV/+MEBdf2J1mlFuzztid8Kdn7pJpTVo/u7
 LJTmtjVit1RcdVIpZEe1B7KUCgMH7D8y6N16djG0AIrSaPVMOLSPy/RreG8Nc5djE94d
 skMA==
X-Gm-Message-State: AOAM532XYr1PvAGqRDtbnzQy0x5gQI/0wZuarLvOXZ15NtKVW58ys8CK
 fNueq/cnuaOCJlEIBJG5/4BDiBt6Tik=
X-Google-Smtp-Source: ABdhPJxTLv2Vxv+iQZRhhfrZ+GunRmPvGlxu9J5vJ0mUsvvx69tv4JIzId1Id/7F6iFyKl2PNB8gsg==
X-Received: by 2002:aa7:930b:: with SMTP id 11mr4389714pfj.320.1595511749640; 
 Thu, 23 Jul 2020 06:42:29 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id v15sm3329312pgo.15.2020.07.23.06.42.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jul 2020 06:42:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jul 2020 19:12:07 +0530
Message-Id: <d9c84f9453350ff1b844c0951624d508ef62e4dd.1595511710.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
In-Reply-To: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] libs: sigwait: Remove alarm() from setup() and
 cleanup()
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

These aren't required anymore as the new library maintains timeouts
properly. While at it, remove sigwait_cleanup() as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/libsigwait.h                                          | 1 -
 libs/libltpsigwait/sigwait.c                                  | 7 -------
 testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c | 1 -
 testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c       | 1 -
 testcases/kernel/syscalls/sigwait/sigwait01.c                 | 1 -
 testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c         | 1 -
 6 files changed, 12 deletions(-)

diff --git a/include/libsigwait.h b/include/libsigwait.h
index 7202fc78fde8..2fca578b19ac 100644
--- a/include/libsigwait.h
+++ b/include/libsigwait.h
@@ -41,5 +41,4 @@ void test_bad_address2(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 void test_bad_address3(swi_func sigwaitinfo, int signo LTP_ATTRIBUTE_UNUSED,
 		       enum tst_ts_type type LTP_ATTRIBUTE_UNUSED);
 void sigwait_setup(void);
-void sigwait_cleanup(void);
 #endif /* SIGWAIT_H__ */
diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index 0a658625a984..dbd33a61f2b1 100644
--- a/libs/libltpsigwait/sigwait.c
+++ b/libs/libltpsigwait/sigwait.c
@@ -358,11 +358,4 @@ void sigwait_setup(void)
 	signal(SIGUSR1, empty_handler);
 	signal(SIGALRM, empty_handler);
 	signal(SIGUSR2, SIG_IGN);
-
-	alarm(10);	/* arrange a 10 second timeout */
-}
-
-void sigwait_cleanup(void)
-{
-	alarm(0);
 }
diff --git a/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c b/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
index 8b6153744938..db4901a40ea1 100644
--- a/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
+++ b/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
@@ -73,6 +73,5 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tests),
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
-	.cleanup = sigwait_cleanup,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c b/testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c
index 946d8e7239a0..fa36c455fb6d 100644
--- a/testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c
+++ b/testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c
@@ -32,6 +32,5 @@ static struct tst_test test = {
 	.test= run,
 	.tcnt = ARRAY_SIZE(tests),
 	.setup = sigwait_setup,
-	.cleanup = sigwait_cleanup,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/sigwait/sigwait01.c b/testcases/kernel/syscalls/sigwait/sigwait01.c
index 563d15635fd9..92544c141e85 100644
--- a/testcases/kernel/syscalls/sigwait/sigwait01.c
+++ b/testcases/kernel/syscalls/sigwait/sigwait01.c
@@ -32,6 +32,5 @@ static struct tst_test test = {
 	.test= run,
 	.tcnt = ARRAY_SIZE(tests),
 	.setup = sigwait_setup,
-	.cleanup = sigwait_cleanup,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 6563d14f0ec7..f7d90047f8a2 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -30,6 +30,5 @@ static struct tst_test test = {
 	.test= run,
 	.tcnt = ARRAY_SIZE(tests),
 	.setup = sigwait_setup,
-	.cleanup = sigwait_cleanup,
 	.forks_child = 1,
 };
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
