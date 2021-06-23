Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B053B1BBD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DF173C92EA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:56:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 721303C7027
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D8991200D45
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:36 +0200 (CEST)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3Ls-0000Km-C8
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:55:36 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 w186-20020a1cdfc30000b02901ced88b501dso1644267wmg.2
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhS5PM18BCM/eWEJHfWofC3EtP90b59teScK3XyveJE=;
 b=H1PheLqZPjBnPcQyrSZerv96TGiY7ViMr9qFzqGwvU6AnNaERS6wjWqStaT6VoTcxi
 Fl+eWppw+OIwTEMubF/5BB1XGvipm2o7cJkcMhiRE6sHDtACed0DafBWMzMRrVfSSMdE
 c1L7h1V0jCZgFOBhOI0IcIedQeI1cqSiX95BbVCqO7WyAJ72geEsBxKCG4GJ90rGIw8q
 uYWxO+KPDPjKrVaLo9RNjXK+ifOihNAHfNiQsaiTko2WCLyuiB4XFWvaayiQfiJi4Fxt
 YUo7Jz9u5DJJ9lPLKuZEdjfZMkLHnrM9qAAJtjpL2FT3U1D/IRrV0sjwNYsJXIAPI11o
 yN+w==
X-Gm-Message-State: AOAM531lON+fLoaoP6Dhu4Z+FVwxHwKGQydopS9MMWp7S/66bNfavzTy
 ISXZxdAnyazT/3A14VVh0NhcyCEo9aM/FLTp/Ii8RDdptWAt6nXwxWXDw0sNe0RCI0wmOrcfSuT
 RyEN8ejTDW7AIyW3Iv+KZ93wW4R7n
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr143574wrq.1.1624456535749;
 Wed, 23 Jun 2021 06:55:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZmVl/gTwnn80EA7wsrL9TkwXdiOKNXFGoc+59VDtWjp7K/Wtz14mScffLvUzyKlHl3hbIcg==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr143566wrq.1.1624456535629;
 Wed, 23 Jun 2021 06:55:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v5sm5746567wml.26.2021.06.23.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:55:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:55:24 +0200
Message-Id: <20210623135524.80663-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
References: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] syscalls/msgstress: tune limit of processes
 for small machines
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Forking the exactly amount of processes as the limit (either from
max_pids or from cgroups) is risky - OS might be doing some work and
interfere with the test.  Instead leave some reserve (hard-coded to
500) for the OS so the test won't fail on fork failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 lib/tst_pid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index c1ea3fe90e83..1b2e85959430 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -32,6 +32,8 @@
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
 #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
+/* Leave some available processes for the OS */
+#define PIDS_RESERVE 500
 
 pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 {
@@ -106,7 +108,7 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
 	if (max_pids < 0)
 		return -1;
 
-	return max_pids;
+	return max_pids > PIDS_RESERVE ? max_pids - PIDS_RESERVE : 0;
 }
 
 int tst_get_free_pids_(void (*cleanup_fn) (void))
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
