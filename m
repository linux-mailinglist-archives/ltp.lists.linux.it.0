Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB203CFAA4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8E313C6CBF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 353DC3C2B48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:09 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF32420034E
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:08 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id b26so35840193lfo.4
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCYi6Xu1yTNhkqv3qx6yaFuUxy+i8v/TAK5y4ZQTgKI=;
 b=eyNXrplQEwwYmIZka4t4TrCFGGn70PRcytT01W5CFqSmXWN3VdisXeMp7a82FLFSgh
 /8z8ccPina+fSQw1znjUmCubndbDtSJjsrfj3oovrLAvXFoaUXX2HVkWSgLUXOOTXDTk
 5UKIuB/Y7CyUMtTDZvzeG+Cx6A74M8nAa2i3u9iHnDCUeZUoCnSrbDqDS2sysN3Ryf9k
 74Inyo0BeD4f2DJ+GQJo8o8av1Ox+wwfPWQUNZKjWqWp7H9/yDRXHQtny0mHk6OsA2Ra
 w37TzzboyzCUuNOW+aTUEIcxuiBii/6EacBd/t/UaxjAZyxqKf50FDpfGU5ixJPxkXuz
 mcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCYi6Xu1yTNhkqv3qx6yaFuUxy+i8v/TAK5y4ZQTgKI=;
 b=T0/wPk+0W3ZhMtr9VE4U8NUVJF685xBMxLjAVX6gXw5ICz6p5GQw/HcHvzdqxWNY/7
 aFPOFLQL2IZbSKPL9dmEDvmO938tIfdzfF/zNDt9DzB/P6c3LPcW4tlQVkTGmVMSEyBR
 B67C3wz9vO8C4TT3xiefW+bJx3EvUPDplTgbAId0ZYNPqEf80SCzEBXPo1r3w6IgLMZg
 pp+vNt4Ul1CZcCL7WysTnMv2mOtVPdZHPWg4P8710aygSa9SkdCBmRu3bG3LfrrgSwOZ
 KHenmKHgh5IdsiznVTbdDwE6meT5ddVPNM4kuolb9v2iH0jFxtWtpWATEkzM2fZoTvpg
 h8nQ==
X-Gm-Message-State: AOAM531M2rawwTw4fKo6SAMZkVM0319OhYlp4qrDg4wqMk0L/O1Djvlx
 gh4M8jYFUFGzsYis4gqOc49RZxZOf5C+
X-Google-Smtp-Source: ABdhPJxucvCVS+c5jSBaWKgcmf5jZsXuaUj+nEQECr9YsVbLRE8KIO+dpkoSJYKirhLHt1X7iLyQPA==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr3107171lfr.431.1626788048059; 
 Tue, 20 Jul 2021 06:34:08 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:07 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:11 +0300
Message-Id: <20210720133324.21752-4-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 03/16] syscalls/sched_getparam03: use tst_sched_*()
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

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/kernel/syscalls/sched_getparam/sched_getparam03.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
index 19ecaf147..451bfdc50 100644
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
+++ b/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
@@ -17,8 +17,8 @@
  */
 
 #include <errno.h>
-#include <sched.h>
 #include "tst_test.h"
+#include "tst_sched.h"
 
 static struct sched_param param;
 static pid_t unused_pid;
@@ -43,7 +43,7 @@ static void verify_sched_getparam(unsigned int n)
 {
 	struct test_case_t *tc = &test_cases[n];
 
-	TST_EXP_FAIL(sched_getparam(*(tc->pid), tc->p), tc->exp_errno, "%s", tc->desc);
+	TST_EXP_FAIL(tst_sched_getparam(*(tc->pid), tc->p), tc->exp_errno, "%s", tc->desc);
 }
 
 static void setup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
