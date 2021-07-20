Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135F3CFAB4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E76B3C81A9
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D07C3C981A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:13 +0200 (CEST)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4AF991A00CA3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:13 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id f30so35868092lfj.1
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbjHO/xb9tiWsBFGDvnaccEEaWL3lIJ5USEhY8+GywY=;
 b=PiIrsHdnQ25vDP3O89F7gVC6vTDd+S/Hz3zjMK+AeCxg0UHY2Ev2BzZk3ttTMdWITR
 PVYCVJr8RZ6mJwammKQq+OsHLAUkvLeOjrXaLLTE7Pl+sf+HFS33GRjZoMZjVGJ4BqSD
 zF60ApC0qyDZydBOzrqsbp07SAuuBLHdhN0k05eXCkEEslMf8F1h8UOQgXxw/EjgPsPg
 wnz3eQUlwJ7Mbfd1PNsEDmBPILVmBPBWBTuca6H47vpSJGSkDTi++dkZZX01JtI7JULN
 u+NPQWj3lx6YrA5O44j0HgVSLfLMFoRHqiIDmq4G4uyKuBDns4utXtn9+Px2c6OHuQAw
 8N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbjHO/xb9tiWsBFGDvnaccEEaWL3lIJ5USEhY8+GywY=;
 b=DnJntMqHZkxx7CO8SYpd3XaLstsCJYkiX1wcdZXrkkZGcvJU8h1oF1nmbv6ZmlE0EY
 gP+WSpFxxnxUqYlrUlNF8S9D7mX+qkmu2LmZUVnvI+zq3zdjO8KazHLIl6FXw5n33/Yu
 SVjBedqj8y+ssnbeN5oEvNRAscVadsg7H4nqjiEqGIALwreAcStXOSYd62lsJsGHpe7U
 PETwsc0gL1eiLmtQ4+2vFo3N8GodY7HTAJNeK4GTVeR0lQpFsrTnEQmzigoizqaRU4va
 2XwCVLWczynZLzwfxiLxN0epgDnLdvoS1ybuemGoMawnRnbJ7PGDsvPUrUbwrv2vdNj5
 4psw==
X-Gm-Message-State: AOAM533Gd4VLVi0chhe9YUpkjHCzpvYeZtZouV0Gktwo5kZg7tuumlAp
 ShMmRpf5tnYMcFOxGIivw26Gc4TCNDHg
X-Google-Smtp-Source: ABdhPJzFEdsTMqdhRQ7KNSmVU78Gbxf7QU82WzCeIV5Iq1Zf+c+/uDEnlmS4d000cq7OjZyWOD89uQ==
X-Received: by 2002:a05:6512:34d0:: with SMTP id
 w16mr21500313lfr.293.1626788052596; 
 Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:18 +0300
Message-Id: <20210720133324.21752-11-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 10/16] syscalls/sched_rr_get_interval02: use
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
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval02.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 9a0b8673d..f84a58216 100644
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
+	if ((tst_sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
