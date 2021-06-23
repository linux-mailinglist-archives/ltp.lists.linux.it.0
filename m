Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBE03B1BAC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:55:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D81EE3C6FE5
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:55:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23E873C2307
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:30 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 730A9600E57
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:30 +0200 (CEST)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3Ll-0000JI-VY
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:55:30 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so633538wmq.7
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BClslnzLnEg8dAVMHksnVev1L7d4K9fIt7j4rb2433c=;
 b=a75vWt8LYZ602PLpGb20rxt1PPnXODy3CZFOaQ48ivpG8hgsZQTSBmYecb+EeZEL6D
 JoL+q52AqUxI+fQlHqL7iPKStGKFgNA2J0DgVTLUopCRfVr+M3Y7Kml5OBBhLC5gWyFd
 FElAVnjuHmPRlykZe5Lr2YOGIgST+1b8sMCcmrC1RDGr9BAvd9cODlwnJJwmB9rIR02f
 cDJgggz0CwQdIyt7R0j2V8swYsAqUECUO9ps3165/S7ESbXmpdLSdo8Zgonp+UDveb1M
 LNruXzBsMy/qE/jycOmULtt8Zj3j04PVXhvuralyT2b0xHx3gN6Oo+CxXk4bc/m92Yo4
 0Muw==
X-Gm-Message-State: AOAM531cGE59494XOKgeHH2InGvwFa4RpMeGYnBC+PEiQJzucZlG3ymn
 jLVBiSObhvzd39jLqqIDXFHgdOta64o6sjjrB7pPX9Wy8tDtDxOcDOQ3GGRbHDAjypOX7KFyhgz
 eKVlJckAWJ0tmCH6WizHeub/0GEge
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr10906571wmj.174.1624456529499; 
 Wed, 23 Jun 2021 06:55:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/pw78T76imDOwNiiqRC4XsmbbyFkhT9lkl81cavoDvNiKfhjGrDHHJREX22gc7R/8UMDzVg==
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr10906562wmj.174.1624456529392; 
 Wed, 23 Jun 2021 06:55:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v5sm5746567wml.26.2021.06.23.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:55:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:55:18 +0200
Message-Id: <20210623135524.80663-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
References: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] include/tst_pid.h: fix language typo
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
