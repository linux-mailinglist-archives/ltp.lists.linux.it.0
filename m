Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F331D9287
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B4013C4E8B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DB2BF3C4E67
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:26 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 19B6F6017EF
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:26 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id u22so5318604plq.12
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkM4Ua6hJU+QtkS3X3cH6J+ZGamGU7UuX9dxYLcuApI=;
 b=AE2K4SWCXW9jkPrA72ntiMx+nfld8UyU5/f37rnbLQ197PZTiVCFRKD/tLM2tqbiF3
 5JegYrxfOsZA5R9dyG1Ehxli+sLn70UhE81hNaSmj3dpBeOeS3IQBOImqbxDRZJ/uUzG
 V3MGgXNnKlh8VcVnsnAV8VyJjrMcOW39qNqYGti1VyztUa43PP8obt0fJz87p16PYBQP
 7iVv4B4nxLEmcxZsp5dyLejOyHWmoZWbj+qOPjWAX3dA2oNOMf0u+NhBAPLpQWF7KYHW
 92ZoiJklun/3xXoZCxD2pJI4iEsMp+C3hAObrRl6TLRyBHL19VhdOZ5jPHLg6f8QEfzK
 XDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkM4Ua6hJU+QtkS3X3cH6J+ZGamGU7UuX9dxYLcuApI=;
 b=bZMea72C6pEzDdT09qg4tBN/pUaN3++uirKXyjVk0Lj+U5+OMWWJIoneOlxY2lUa91
 bV6u75oAlJOYpWD/hGt8ix5tRjd9a90OGJrrOQvry3KAN5Rv3LBSEmqfgqqM95sOXHfi
 VJR9gbk/dCxkCOq4PA0mBYBaKacS9HFMpx1ZHa5LcjSIwqRG//LwEtWqpG9N8dYhs31Y
 C1BJut7Z0Pvjdlevk+Yir7dtBhRqLXpzrDN13UynZEktWNZ2/1gxeo51WECA5YVqqYr7
 eZUuIT80TH6kf52eInJa01hmw6780dyGP7tRJTUqL7CHRhCLxiENskNedbmf5V8niW2Y
 X4Pw==
X-Gm-Message-State: AOAM533/drkGSdZQIXSpf3Sbt4nSwMN3LeiMS3WswXwLDUNliOesb9wZ
 UpmC9dHMP7kIsXbC1UiYKaElMErae44=
X-Google-Smtp-Source: ABdhPJwSIqYmTSf4UX/OkwOnjypq6rYGF/r5n2qIskvNzdlHEbT7tuN0QYA1deaBqwBX0FrQ1h6k7w==
X-Received: by 2002:a17:902:bc4c:: with SMTP id
 t12mr20441993plz.282.1589878284227; 
 Tue, 19 May 2020 01:51:24 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id x23sm9469993pgf.32.2020.05.19.01.51.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:10 +0530
Message-Id: <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589877853.git.viresh.kumar@linaro.org>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall() unnecessarily
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

These syscall are old enough and must have support in libc for everyone.
Don't use tst_syscall() for them unnecessarily.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 lib/parse_opts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/parse_opts.c b/lib/parse_opts.c
index a9d50589a3f9..b3ab69c0a539 100644
--- a/lib/parse_opts.c
+++ b/lib/parse_opts.c
@@ -45,7 +45,6 @@
 #include "test.h"
 #include "ltp_priv.h"
 #include "usctest.h"
-#include "tst_clocks.h"
 
 #ifndef UNIT_TEST
 #define UNIT_TEST	0
@@ -472,7 +471,7 @@ static uint64_t get_current_time(void)
 {
 	struct timespec ts;
 
-	tst_clock_gettime(CLOCK_MONOTONIC, &ts);
+	clock_gettime(CLOCK_MONOTONIC, &ts);
 
 	return (((uint64_t) ts.tv_sec) * USECS_PER_SEC) + ts.tv_nsec / 1000;
 }
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
