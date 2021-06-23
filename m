Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480E3B1BD6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:00:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B0843C7027
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 16:00:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFD133C6FE9
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:19 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7EA821001136
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:19 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3PT-0000kJ-02
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:59:19 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 p5-20020a17090653c5b02903db1cfa514dso1011478ejo.13
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhS5PM18BCM/eWEJHfWofC3EtP90b59teScK3XyveJE=;
 b=pnb0Jv+awvA7eT0ONov7B5XtNX5x7+NEeTTx98VWugqSeI9yL4Ph+seErkh0+mMLHv
 GmOAqAb/s7ZMYgva5WIg4cqJ2Kbaxs9MO14g28py3Vt5XW7hOFWepGGCjhpxmuFidDfW
 lmzBT8oUmkML7VPuuEr4hrG9H/0DNvIvzIrc+LFd1qnlFZ57vUMwc47FakYswxKpneDY
 kQjFfNamX9Lla0/bh5+FUrqE1VgDlKOtmB3YVpLDWCimKbywBYgdje2nFd9E5wpu9Smt
 VncWi8Gge+BHb+9HdTpwaXxgWe7+gBCzkJTd1DlFouG1dUqxJl47BJ6rs90bg5xTIC4d
 M3/w==
X-Gm-Message-State: AOAM531pj4tWIoLvYXrkkZL2ydAj+K8DHvS/qlj/yEZCCbs3yR5UdM1f
 9554GI/wT6Czx9rZqiLZ7MvMbVtLz82CO7G5tf/L/lIdXWqsYwMKFkKlWrC2JLrIm4KAw3ifpHW
 9WKz8JcHdsDSwnlrLtURTXrZ5Lf7X
X-Received: by 2002:a05:6402:ca2:: with SMTP id
 cn2mr10382110edb.62.1624456758415; 
 Wed, 23 Jun 2021 06:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvMfqYgXrHLucG6n+H4swKFqcu3qT7y8l0Xs2qvs4e0TT4xlrimxMbrt4ZYMybGC/ydMK6GA==
X-Received: by 2002:a05:6402:ca2:: with SMTP id
 cn2mr10382095edb.62.1624456758239; 
 Wed, 23 Jun 2021 06:59:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id bz27sm7441030ejc.15.2021.06.23.06.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:59:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:59:12 +0200
Message-Id: <20210623135912.81156-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/4] syscalls/msgstress: tune limit of processes
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
