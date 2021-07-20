Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4CF3CFAAB
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21463C986D
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C9653C81AF
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:13 +0200 (CEST)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B61CD1400DB3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id d17so10983414ljq.12
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5NthYpTcRT+hLGYLqBwN7n6Wn1VZFcSbaOqQ22RkvvQ=;
 b=XU7REYzDk37WI6AObv8Tpnqj/lAl8WrxqLRYo33FA5trnHe/CQduxN26YpKCubK/mg
 4ENmbOBP9P4IJad0+8+7Bm8k954Y8HzgfJkgM4UMeI+RM9mXlAri+pSEKlctwob3pI/w
 hxyAYijyBMgvxlwzbFupqFwjEwy2wOehRM0yPMjQSjLPhocUQjdVqBGuq7yads6UDWGD
 aNJ2Wm5xAkzf/3MOEPs4+pi2VdSbbKc2A321vuUR+Ir7Rq1dDvCTEF74WfSUXBEA9307
 UqIAsYlAznDLjPtXVVhwtEiG8u0U96KLpqMryjmubUgH0t57eu5Udlm+SvfnLUwue8PY
 b5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5NthYpTcRT+hLGYLqBwN7n6Wn1VZFcSbaOqQ22RkvvQ=;
 b=t/CFeYBJIXeZAEX2ACDV0mobYsMYy8GNUUq5RVcvY6I7fSzBEttZqtRjbV+fnWt+a2
 WQRD/tEhGl3q+CcqW83Yij9XjD0LqPpfStK5St4YzkJNQb9Y/1+452YPmCWZUv+mvvak
 jT3yIDSoNzBVSLu5kXndCaIVClW8w5AhmhexG80eAZJSNoF8V4E9Np7LcT9JPK3OQbin
 UbtzLpyhRq/ninFLvZIfV4rJSneWoQg1j4Ki9kdLRk239P6N5xfLDf7Z1MC92r5lwdQt
 JjKm2ThRKh18T+bHhHejuKSqTK1gufgIzg0Men1FGQ+QBnE1IVzx3TA38rQfxGDlNKQF
 iaYg==
X-Gm-Message-State: AOAM530GHOGlThsaMlOjc+mPMr6gpHORNMmT1VTT0GUNOcFhqDPPa7a6
 raLlnj4522qgf6azD2/RysMWz4Y1DHJB
X-Google-Smtp-Source: ABdhPJwy/oo09VO26XGVCxzP5dmPoeEBga7EHyyYHTxKvTHb/Hvr0+AGLKzBv4u2X8jZhUOsJeZ5bw==
X-Received: by 2002:a05:651c:1127:: with SMTP id
 e7mr23917414ljo.384.1626788052056; 
 Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:11 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:17 +0300
Message-Id: <20210720133324.21752-10-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 09/16] syscalls/sched_rr_get_interval01: use
 tst_sched_*()
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
index 5da5fe51d..cd6525414 100644
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
+	if ((tst_sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	proc_flag = !access(PROC_SCHED_RR_TIMESLICE_MS, F_OK);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
