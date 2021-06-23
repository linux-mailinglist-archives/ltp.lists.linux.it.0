Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DA3B1BCD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:59:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDEB73C6FEF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:59:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E1C83C2DE1
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E4205200D39
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:16 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3PQ-0000jb-Bw
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:59:16 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a50ed8b0000b02903947b9ca1f3so1370792edr.7
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BClslnzLnEg8dAVMHksnVev1L7d4K9fIt7j4rb2433c=;
 b=HcfPlQk7rn7KZO2tblXaCUeKrzIOGIYUav4U6fjhVawAkAbkX+OugL+RiZ3snJ3Cfm
 SGMpe4HfYbeV/1c1RCrCnyM7ugYkOIUTPqc/o1Boix/9BXvOHneTPgRl6eyF1fAg8gwZ
 JjejnMIMYNM9tpVYeiTc0xktf57+mPukHksb0FGgoxf6Dn+boLSsv6fQReIg9rU5s+X2
 7VP0GTVj1Knb2GCy5s+uM6ay5bRYZEHc31U9pTUF+FUDnh8j2WtW/rA4sD+bjaoxV/b2
 WDy5y5JNKCvKt9KAEatO4Ezmk/cvbrakCXpP7usTZoQ1Hz/sjF1ME4tfMo+/dwZBYR/u
 26Rg==
X-Gm-Message-State: AOAM532/Fv2QQJimgXw1JgHyZ6mQWsEF3Yd1K++O7+dzcQuvE9Sm83ne
 nUK2MjErHJmhEog4z5RLQ3bH0qFMVIkJCbKj+3nE0rmCgZhaJy4kafLglFqE9DQHVviA9WHyZ7l
 iTz+Fyyz8cfGt4fQfYnbpp2GbOzgp
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr160024ejk.366.1624456755874; 
 Wed, 23 Jun 2021 06:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ewIbFfBL7SPpl/vvi7MtQesAlYOFJ0FevtF//8g1Nlg9NSEe0dAFhwoNhN1Puy3r1cmaVA==
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr160015ejk.366.1624456755764; 
 Wed, 23 Jun 2021 06:59:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id bz27sm7441030ejc.15.2021.06.23.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:59:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:59:09 +0200
Message-Id: <20210623135912.81156-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/4] include/tst_pid.h: fix language typo
 (subtraction)
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/tst_pid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/tst_pid.h b/include/tst_pid.h
index 9ba1abb27b7c..6c42f73a57e7 100644
--- a/include/tst_pid.h
+++ b/include/tst_pid.h
@@ -13,7 +13,7 @@
 pid_t tst_get_unused_pid_(void (*cleanup_fn)(void));
 
 /*
- * Returns number of free pids by substarction of the number of pids
+ * Returns number of free pids by subtraction of the number of pids
  * currently used ('ps -eT') from max_pids
  */
 int tst_get_free_pids_(void (*cleanup_fn)(void));
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
