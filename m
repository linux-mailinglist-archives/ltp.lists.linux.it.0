Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081924827C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4CFE3C5884
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D35D43C2FED
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:42 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7140F140165F
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:42 +0200 (CEST)
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7yTx-0000Ag-Lw
 for ltp@lists.linux.it; Tue, 18 Aug 2020 10:04:41 +0000
Received: by mail-pg1-f198.google.com with SMTP id j37so11916477pgi.16
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 03:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8U5CTpqZpc39/an8pLEoB/M/egd8rAYbExtf/laLzg=;
 b=Uu305oLO2tUeg3sSDOXeiFO/+e4v6hElFkazvdglyxIKqlzQWQEODQkbKN5PCcWWlX
 8H42qqqEJ2VQ7WJHAGhWcgdSJvvH2uiwrxXRz+cAH2ZRTuT8IQHi9kMCmlDjVIL/BY7P
 3/7U8CqgjLdvYt1q9UpJ+1brTVj3wFmjpErIfswrmlrUdYWMpTvYvFrAU0eUerJX09xH
 N1EKWsMjWWxnM1Pj2AR0+wcqcNHAzJJ0guLJGA+sfGAXVl8u6nNQBvojQttqlsl1RijS
 1EyMnX4/uFAl2ovQ0U/fSU/b1x967jL1EzY2SjBG+mQuDTEW9G5hqBrQrhIApeRRqx96
 XsRQ==
X-Gm-Message-State: AOAM53303ubfXxoLRp7k/+9aEqjfK63vzLfzGoV+L/8IYb5avcYCi4mz
 cYr4VsTT7al50rJMHWz5Wxnm6x4mS1YvxRlwdCL6qpj8ic7tGvxQy4qCeE69cZnESt+Wqc95odO
 yennud6rN6M2Bwq5jzWORTCEe1MI=
X-Received: by 2002:a17:902:b111:: with SMTP id
 q17mr14174500plr.202.1597745079923; 
 Tue, 18 Aug 2020 03:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8g9/tQkwLsSU5x8tB6DoVigs5I/lwv464G5bIQpiuo6oL5ZPbDaJdsJ99+CHROdrCxuAaHQ==
X-Received: by 2002:a17:902:b111:: with SMTP id
 q17mr14174476plr.202.1597745079567; 
 Tue, 18 Aug 2020 03:04:39 -0700 (PDT)
Received: from localhost.localdomain (223-137-244-244.emome-ip.hinet.net.
 [223.137.244.244])
 by smtp.gmail.com with ESMTPSA id q10sm23433222pfs.75.2020.08.18.03.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 03:04:38 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Tue, 18 Aug 2020 18:04:22 +0800
Message-Id: <20200818100422.27775-3-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200818100422.27775-1-po-hsu.lin@canonical.com>
References: <20200818100422.27775-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCHv2 2/2] syscalls/utimensat01: add exception for Ubuntu
 4.4 kernel
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
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ubuntu 4.4 kernel got this patch (b3b4283) since 4.4.0-48.69,
therefore it will return EPERM instead of EACCES.

Without this fix, the test will fail on Ubuntu 4.4 kernel with:
  FAIL: 18: utimensat() failed with incorrect error, expected EACCES: EPERM (1)
  FAIL: 19: utimensat() failed with incorrect error, expected EACCES: EPERM (1)

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/utimensat/utimensat01.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 7dabfed6d..de4f0601b 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -158,6 +158,11 @@ static void tst_multi_set_time(enum tst_ts_type type, struct mytime *mytime)
 
 static void update_error(struct test_case *tc)
 {
+	// Special case for Ubuntu kernel, which has patch b3b4283 since 4.4.0-48.69
+	static struct tst_kern_exv kvers[] = {
+		{ "UBUNTU", "4.4.0-48.69" },
+	};
+
 	if (tc->exp_err != -1)
 		return;
 
@@ -167,7 +172,7 @@ static void update_error(struct test_case *tc)
 	 * This patch has also been merged to stable 4.4 with
 	 * b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
 	 */
-	if (tst_kvercmp(4, 4, 27) < 0)
+	if (tst_kvercmp2(4, 4, 27, kvers) < 0)
 		tc->exp_err = EACCES;
 	else
 		tc->exp_err = EPERM;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
