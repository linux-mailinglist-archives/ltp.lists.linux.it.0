Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8733E2E90
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30AEF3CA3BF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D814C3CA3F4
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:07 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 50375200252
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:07 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id z2so2329446lft.1
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Ddx7h+5rjwHTqtKP0KcQ7hwH8P6boRtxLRhlc+a34s=;
 b=LPfpzjNfmcGvLhvfpd7jlAenlnWQQ2EJhzRrS41V6cRr2ZBqtIE0gKavw/8CQjnl8a
 sT837OFXDSM1gY6AvGZeRSTHLN3V8ZqkKOyXTootAek7COV9RaWio6HEzQYu9GjmkPcr
 SzxG5cEuTRxYu6tSUZUdQTJHPt4tfk/UyVW6IFU3ASL1gj0GiGsB+Iy36qP6TWqAjKvM
 UhnyDegiWsfPpo/MxlDiYHRHc3hzQHh4S9Fcyu12rCGEZq1CJE5ns/NODUZkFk/QckqA
 L89QSlqxFnPpZmgZmU+wx2PuOusHzMqpOBZzAgnVViGD0SolC4TWUjuj0NXYHGR5SFZw
 GurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Ddx7h+5rjwHTqtKP0KcQ7hwH8P6boRtxLRhlc+a34s=;
 b=DwCyJ3Tl8AaTP4toOEnVeS33M6n92I9Sjs0e0SpSAmf9wCUaGyEC/iL+cEC2IYcKjE
 5dpbPH0KUbM0wfJ9Lh2v3gRYz5zzR+SxP0Ns28pL+0s0rbxr+1Z4ap1RnoQwrl3JE4qV
 IAni9YKpnldcWBG/LKplKgI2CFXQ8DyBEU1GDeABM7C0J1UF+dVGIUtN3txzW+ffuhtu
 KKpWobUNA2bgA1R7UzLBf+Vk4v5szM0JLEWgcOMEhgBB3suLgoH6Zht4Hj4JTcaZy0Cs
 OhaLQzGeIiE1nw1D+VzLwEgXePwkrRgv3fkDibwFNPtzhPJU9VkZJdkA9UAlzBXGE2/x
 g3uA==
X-Gm-Message-State: AOAM531SaMNfeHpg+d8AuC6lFD6m7FECilkQIuJOAgpN4owSqq1ngYK8
 aeFLoLbjUPC403gSiLqsNzzLR9Trcv7h
X-Google-Smtp-Source: ABdhPJyx+SQ56Na+g2HSD+EYQk6jrTcq2oYQZ5/22hGzcnbiBHHgq+/KivJoEz+8u933f6jp9neJrA==
X-Received: by 2002:a05:6512:b0c:: with SMTP id
 w12mr8294322lfu.298.1628268486636; 
 Fri, 06 Aug 2021 09:48:06 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:06 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:24 +0300
Message-Id: <20210806164730.51040-11-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 10/16] syscalls/sched_rr_get_interval02: use
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
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval02.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 9a0b8673d..15e4a3053 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -8,9 +8,9 @@
  * for tv_sec & tv_nsec.
  */
 
-#include <sched.h>
 #include "time64_variants.h"
 #include "tst_timer.h"
+#include "tst_sched.h"
 
 static struct tst_ts tp;
 
@@ -35,7 +35,7 @@ static void setup(void)
 
 	tp.type = tv->ts_type;
 
-	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
+	if ((sys_sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
