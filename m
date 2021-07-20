Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 427793CFAB5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDA5C3C9872
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C3D83C980D
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:14 +0200 (CEST)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2C4FE1A00606
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:14 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id h4so29825742ljo.6
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wghSgokIgsoenDqmhIYJGlPM4bTxzdhLTQIdDu95U4=;
 b=JM00Nzz/+6gEe5aTOcpeVIwCgM1Y/RspxW5Ei2L24Tu2aMCoYMw3d5/6rB8TjVYL37
 1qhLjH/0TtDiRHdvnZSJDEsplERkM5eILsoYmJKdh6X3aC9h2LgR1XrL1HZE4lmLeDRM
 GnZSgijvRhwnVrya3q4nxTRtGUEfpBROgKasdDLgpjUQxk0kqX9ZZfbQI9fAPbUeSnDS
 MdeZsxuNVEz90pNERa1gug0x4noM6NrxmUoGsNDdQGQFgEia7+Dd9Z/oDDqPLrTmcROc
 H5az4eIxSd8SNPA1Ft6UilioZghdgQd5yqAE2s7uFRjvPdXUpucj3SvtVtZ3RPRX47Z7
 xzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wghSgokIgsoenDqmhIYJGlPM4bTxzdhLTQIdDu95U4=;
 b=cqTA0sMFm8pyyn3yuHWW+2aVspxK5fuVSixWBvaCAaxqYIFO/Yr0q7WGwTp7GQTQw4
 dOqguAHCuChnxZQpqIghAgL15vHfBEP7U0MfmVps5TMIQZWN18swqyWjwLOiZTQXbgkw
 mdjrjtpHm1I/pxhrj3QnDAugnbiHEaAS7q67SsoUnaQMpyM1YvjEZUgzAmbcapyzayXF
 QAsZeMiAYbbCIpF0q1v6um/T8gdTJf47grlSVTIeh9IVDKnVxn/nP+gqkHT4hnWvwOWt
 L+XKiJz+XnPiPnB31rSmvCWLpukRR6h8iejhIdA/9CYoIBT/wlrpr8vS563ShtivYtWL
 8tsQ==
X-Gm-Message-State: AOAM530OK3YOJelUl041VAZJaPTA+53cZK8Nl5zpsXfTn4Vm04HAO1fh
 0mJXDF+OcNOIEgzeiubwz+pws77MeUf0
X-Google-Smtp-Source: ABdhPJxbevhWzqUOlbc5KZW6iRWMINJR5wz2ObXUVHOkvIiE1RJPHSLBFlvrm2HtvCZwoirPRCSEGA==
X-Received: by 2002:a05:651c:329:: with SMTP id
 b9mr27160317ljp.116.1626788053197; 
 Tue, 20 Jul 2021 06:34:13 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:19 +0300
Message-Id: <20210720133324.21752-12-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 11/16] syscalls/sched_rr_get_interval03: use
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
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval03.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index a61541b8a..0a486670b 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -12,9 +12,9 @@
  *     address specified as &tp is invalid
  */
 
-#include <sched.h>
 #include "time64_variants.h"
 #include "tst_timer.h"
+#include "tst_sched.h"
 
 static pid_t unused_pid;
 static pid_t inval_pid = -1;
@@ -55,7 +55,7 @@ static void setup(void)
 	bad_addr = tst_get_bad_addr(NULL);
 	tp.type = tv->ts_type;
 
-	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
+	if ((tst_sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	unused_pid = tst_get_unused_pid();
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
