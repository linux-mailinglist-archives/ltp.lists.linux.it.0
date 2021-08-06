Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2763E2E93
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3F373CACEB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCBB73CA3E0
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:08 +0200 (CEST)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EC17F1A006FC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:07 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id g30so14849991lfv.4
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gujYJZ9JbNUBwHXH1Qaa1MBZu1mKigirgxCvjDFzjDc=;
 b=RIZj2dw6kDCzPUGDc9gtMGC6UmxtvjLn4XPBSbDLOcIPVVoKLJja5Y7j+IOcx7YBaI
 qp9qwlMxcUa0NLd8H+M556eae89wGKBMazBX/mRIXP8F+kjO6JG6xTgX/9XoHixU7Feq
 l5B2VYtg0bnJRy99ZK0DFEzlgQe64tyCSxYIxjVRoGwzOPPQrnBFqWi8Idl5snCxn/Tu
 r87ZcC3TsaU10mwjJiTRDooXpT8zPG4EQaU3fSV/VEEcMLXNJGA4QiMWj5TqRTpS0tEY
 o+d2UHUxR3XIBxGjPH72kDijzhi9Z2dFAtrRyVF1L71T9hcdcuTifLK2dRcmQ3AxaS+Y
 lw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gujYJZ9JbNUBwHXH1Qaa1MBZu1mKigirgxCvjDFzjDc=;
 b=DZ4RjfOnE9lmCV57mjTHn3UuCvSg+LFpcbffALNHGW8/ejVODCMdTTdtHPBo2j7aQT
 rg+DWovSYkHJmTNEx1Xvo6Pn48onzZ6GflPGy05vhMep5VKq8lSreJckxsXDcGoWe8rL
 +y6FdN5D2idDTroTF1U5lImjBe6Z+DZx6K0CqJy+GGlKQ6s5/1T+o++X6wG+SXetR3Qd
 At6YFK0TkH47tCKD/+4S+MQzrG2C8YQYVSgfz4I9PmUYBw1eS0KXylsf1PtFGUwMnnqY
 VUHK9G2qdNQSxwv4hdooyf4aTswSh9mubxc9QOwPEOd9M1J0uSiPBIb9CCyuZyMoQCT0
 h80Q==
X-Gm-Message-State: AOAM532U08n3dfCj6aAkA5/i+Z+omCLD1i+/jTs2zfMCjkJFV3Z4OSM/
 domtVD3gOzjLoqz8j73XuYGBv6cXwras
X-Google-Smtp-Source: ABdhPJyuMxjpN978r46GALiN7SjdqKDtnjYphoY9OZJiIpHFBUyxhP3KkacaSm1rZkxiB2expf60Fg==
X-Received: by 2002:a05:6512:911:: with SMTP id
 e17mr7229609lft.572.1628268487284; 
 Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:07 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:25 +0300
Message-Id: <20210806164730.51040-12-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 11/16] syscalls/sched_rr_get_interval03: use
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
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval03.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index a61541b8a..f5a88f084 100644
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
+	if ((sys_sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	unused_pid = tst_get_unused_pid();
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
