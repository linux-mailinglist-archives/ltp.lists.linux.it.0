Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4863E2E8D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B16ED3CA3C2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AFC2F3CA3E7
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:07 +0200 (CEST)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C18986002C7
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id b6so2791337lff.10
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JH3HP+1LDHaE/TSc8iw/Aro+5lkFRS1cGZHGk4qpuxs=;
 b=hAXok4ahNhRbKaIWmERA6JQZa/5FJVY7ZsR4xq90qWx70Y/Pvamj5IL5aBIRXuhEo+
 sSuquN5VeHtVX7ZUBNJWHa6up9FH1Hn1gDxvzkACQOq4EfTvt17rZ/+2rSbe7WT86tu3
 Xsw5qF5JfOImLrAqe5O8LLDRii7Vv1ApUf2k/HFO2oeBMDSqPRZtDaBbqQpqAa3kaZQ1
 mG//KZonzJOPrDnmwhpXlREv+3fAs0q0ZY+F0JVfqM+H2xs3rRNxWCrw81kOoPJ/R2Hf
 bOinThq/Koz01rbmLRr8wNmUrDBh9/NffOIxaTRcG0FJR/BR5uGAb7xVoCf9CDn0guwM
 Qu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JH3HP+1LDHaE/TSc8iw/Aro+5lkFRS1cGZHGk4qpuxs=;
 b=bKo+e8egTtqMc50YpN+P/Pr7G4Xv+XMzFjXdRP+R7n4Bwx+jVN+mUbfGJw7Of6m7rc
 UCGDQQBwx5yOkKERFfiBhEPOvoHxiNZMGHack0etEvG/pQfo1vvhSeWVi/IFJSXUWggt
 okH5bBOMzVjfh6wEYInzAYOrTbLz7DnLXPlyGnqV55MltMzaCvwvhJ+WD5xFxJahuEoz
 uYih4iI7hrBSwnnIv5j3raBj0KR9S2Yw7UdZe2HhozN4bfz4xlIX+xIjoQuEwz436oqq
 tEor8wPoJAnxny4wkHn9pYYFj8kaRXJ5WTqVuU6xL/N/fxh7ffZ/leORHGJboiQ0ZgYe
 +OnA==
X-Gm-Message-State: AOAM532TRgEFn0ss5txnioGaD7Ilxu07yaBWjxnqdnjTV6pSnyIZ0+r0
 5BYV+JZZH1o3JMpVm55LE9hC/RFHNWM4
X-Google-Smtp-Source: ABdhPJz4KBwJNTAN34dvMjm3kfeccY5AVELqtNf0MPgcTVboHdABq15gJ1m6ydTiigsBlv9eLRQFXg==
X-Received: by 2002:a05:6512:400c:: with SMTP id
 br12mr8566275lfb.268.1628268486111; 
 Fri, 06 Aug 2021 09:48:06 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:23 +0300
Message-Id: <20210806164730.51040-10-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 09/16] syscalls/sched_rr_get_interval01: use
 sys_sched_*()
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
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 5da5fe51d..447242159 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -11,9 +11,9 @@
  * timeslice tuning knob in milliseconds").
  */
 
-#include <sched.h>
 #include "time64_variants.h"
 #include "tst_timer.h"
+#include "tst_sched.h"
 
 #define PROC_SCHED_RR_TIMESLICE_MS	"/proc/sys/kernel/sched_rr_timeslice_ms"
 static int proc_flag;
@@ -41,7 +41,7 @@ static void setup(void)
 
 	tp.type = tv->ts_type;
 
-	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
+	if ((sys_sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	proc_flag = !access(PROC_SCHED_RR_TIMESLICE_MS, F_OK);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
