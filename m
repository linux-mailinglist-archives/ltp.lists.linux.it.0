Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F583B71CA
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC3863C8D90
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E34C3C0F90
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:57 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4567D600B7C
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:56 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyCZr-0006l3-Pd
 for ltp@lists.linux.it; Tue, 29 Jun 2021 12:10:55 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 m4-20020a0564024304b0290394d27742e4so11340011edc.10
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BClslnzLnEg8dAVMHksnVev1L7d4K9fIt7j4rb2433c=;
 b=iO/MxhHlUOheMc6TgGqqcub2TLVMCyrWcu10GGILfyeRFG5A0tsTdhbpicWOiuBUal
 y3PA2TocuEi+awu2YKut7wgOynz0MbIfyfYxbOo6Zw/DMS5mOy/TmPTSxthZAHYgYojV
 /409ijQ8sjh2AAHm2mJaQb8E2GL/P2LGMJIPuOT0vfbTkbVRMNn8meRBJsbu1rwUhBnj
 YHQIrB+oZ/gkfFFEQ0UfWghj1AWU4V2Omx2nl8Arh6pse+nzuVlZxf7khhnvy0C9EtTI
 kfP72xYxTRM4Msj4R70T/CpWZ/9iQwlNiXrlyBMlJnnQekJhjTxASG0u9cJU1keiSbUK
 Q+QA==
X-Gm-Message-State: AOAM530CHPEzdohbxG6zS88EJ7rAIKbqDAelkwpBDgr2DaK9QOLxu0Ce
 LCAMS8ld2OmXKXbMHnbre/fDi1J678UwbqCfDUrKyBYb99sFexP0saycszGqAE16/qpKMaBf6Pn
 ukLMnQJu7yNLmC36uT4BqyB8uVk3B
X-Received: by 2002:aa7:cb9a:: with SMTP id r26mr40815493edt.78.1624968655270; 
 Tue, 29 Jun 2021 05:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO2IbI24MEangFFIWvYu28PEZeEn4i90k+gKZqTCRf7HHzJAlLQFQon9mxv1mHa6ELquOJCA==
X-Received: by 2002:aa7:cb9a:: with SMTP id r26mr40815478edt.78.1624968655181; 
 Tue, 29 Jun 2021 05:10:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n4sm8084256eja.121.2021.06.29.05.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:10:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 14:10:44 +0200
Message-Id: <20210629121047.100391-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/4] include/tst_pid.h: fix language typo
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
