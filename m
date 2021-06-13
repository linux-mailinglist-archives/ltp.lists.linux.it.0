Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F583A59DF
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:35:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EE153C4D3F
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:35:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8779B3C2F2C
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:35:39 +0200 (CEST)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 079DB60007C
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:35:39 +0200 (CEST)
Received: by mail-il1-x130.google.com with SMTP id b9so10228031ilr.2
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VJp6tNdloSMMqbWvkO8R5TfZcs+khzJ6XXJhMkCDebE=;
 b=WRM7JCz77ynV1UK4huN4ElLYaK87A6m4othtv8t37lWg2Yi+L8TjjaVRBA7/d3tQJJ
 FxsV8mG6plLG6+m0tgtDwKiHcwvkLOTiuL3TuiZggqaJNEPWcAqcaNqvTyMpIP9MB6Vt
 8mLeYhg3goHoHy2AVT6vATUZFloae7SzFOkUGaMfkTmHUD/arJdF9n/gvni27mX7Rd4O
 3FRf7JA30Y9Y4DEEjK7l5ESxT9yETMpx0ofVmjDr75VosFDk0g75zupMYbQ7oit6DAD4
 gEM1GyJH3l80h4isBsnUy9mlergmjZ9uetqHf6vxDDCWkOzVe11oKEqyKKb0/wjCr3jp
 Oj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VJp6tNdloSMMqbWvkO8R5TfZcs+khzJ6XXJhMkCDebE=;
 b=WCwQuVlG0IdDP6jhVYQMPJtpgqHIuONDq5+UgQewRKKQUh/ObGYk5dp1lLC/uYNBFP
 Dd4T5+BSHJWkpiC98Mu1AvigypLH3FBc94w9EaVcod7Gvp8ivYgoF7GRv94znaSy7sTx
 qOHBtaMxX89dt8m7XGM4p9FXfce29oTbcG36/WPC9jpLDAZp5pf1hTc7D6I/GCIZmRv/
 xMS0JRq0R8ZNYS4JJxtmIuGBdHIjb8E0N0VLrpotB9VkdbDfvQOsYpoW2Zu9HkHgbiG/
 mypu5oGraMwBidWggA2ZcwSeJ3plrNiCPY+CxuxsUcPibtsXCnl9r8nq1XVhM7VXT4WY
 MzQg==
X-Gm-Message-State: AOAM531RNxBGW9vXGLch3GsyrYv1nSG0acqxRw+leoQH9flC62564uK1
 ISlCODbipSlzaDWMlHuj4qc=
X-Google-Smtp-Source: ABdhPJxpB55nOZUScg1TK846faLfqasXDsTWszlza+YxZ94D3BkgRNhHrlpy82NvM3AsVZ1h6Rp2GA==
X-Received: by 2002:a05:6e02:c6b:: with SMTP id
 f11mr11025609ilj.140.1623605737756; 
 Sun, 13 Jun 2021 10:35:37 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id i7sm6568723ilb.67.2021.06.13.10.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 10:35:37 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 23:05:27 +0530
Message-Id: <20210613173527.9037-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNsdfm7VW2dW9Hw@yuki>
References: <YMNsdfm7VW2dW9Hw@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] setitimer02: Skipped EFAULT tests for libc variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_setitimer" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 testcases/kernel/syscalls/setitimer/setitimer02.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 59da87e8d..2ff051e41 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -16,14 +16,22 @@
 #include <sys/time.h>
 #include <stdlib.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 
 struct itimerval *value;
 
+static int sys_setitimer(int which, void *new_value, void *old_value)
+{
+	return tst_syscall(__NR_setitimer, which, new_value, old_value);
+}
+
 static void verify_setitimer(void)
 {
   /* call with a bad address */
-	TST_EXP_FAIL(setitimer(ITIMER_REAL, value, (struct itimerval *)-1),
+	TST_EXP_FAIL(sys_setitimer(ITIMER_REAL, value, (struct itimerval *)-1),
 		EFAULT, "expected failure - errno = %d - %s", TST_ERR, strerror(TST_ERR));
+
+	tst_res(TCONF, "EFAULT is skipped for libc variant");
 }
 
 static void setup(void)
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
