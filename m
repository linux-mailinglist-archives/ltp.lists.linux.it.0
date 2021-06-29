Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6663B71CE
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77A093C8D86
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 342A63C8D7C
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:59 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E09DA60078E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:58 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyCZu-0006lk-BE
 for ltp@lists.linux.it; Tue, 29 Jun 2021 12:10:58 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 lu1-20020a170906fac1b02904aa7372ec41so5527886ejb.23
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDY+vNYcMIWyWGKlk63PcGfc4ciJyoIKWgoQ9zkvFRg=;
 b=blfy3HLBqS/Y6fxNrfjTg0xZv5ab/nhISHF0ybLiEAdld1o4qSyeRGHGLRhNu35ZyP
 79o5kTXfpJeBVOfH6S+TLGpDGhqcBBHUfmlUpT2qMngBFtboTLhfCI4P+0TJWDThO9Sm
 LvxNT4xvELQg8jsd9xpkH128qH5viqjefIIQIq0YVMBHKhh8c05R0Z+f8VEaANhaHqkM
 ybhvRIqTEl+9N78ymmnFJIpzTZibuy9oM9evRO+X9VBoGHYEOnN7sGoZyPaU8cElrfrT
 rcLAPvxbdM88A3JjoQ9+e2xYZv0nviel6XwcsRa058h+RsqOil6tvkB4akUExgGKhDo9
 bg0w==
X-Gm-Message-State: AOAM533KKqEczG5StWB07XpHnNVG/0BsQdinzrqweOiNJP/8xrcfyeEC
 VDDfHGv1nZm1K/ZFTmkToqbq8UhIBQ/KUATw5UWdi+XWxUgxJ0pbbH3ARx1/94RDIRS8KxlCuVp
 /MXVnqCiqPZxbPGNsUfh8mtRqkNQ4
X-Received: by 2002:a05:6402:2805:: with SMTP id
 h5mr39068672ede.255.1624968657833; 
 Tue, 29 Jun 2021 05:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIwReS1UAFV9s8nXjaD8p+j8hvmYZIY7TNumQLbu/j1yCz+2cyMsr+ZyLEleR18Q6K/tgYpQ==
X-Received: by 2002:a05:6402:2805:: with SMTP id
 h5mr39068661ede.255.1624968657740; 
 Tue, 29 Jun 2021 05:10:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n4sm8084256eja.121.2021.06.29.05.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:10:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 14:10:47 +0200
Message-Id: <20210629121047.100391-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/4] syscalls/msgstress: tune limit of processes
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
index c408172675a7..338235f13a6a 100644
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
@@ -97,7 +99,7 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
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
