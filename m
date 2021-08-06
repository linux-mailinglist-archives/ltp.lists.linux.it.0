Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD23E2E85
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9982B3CAAE5
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC54E3CA3C5
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:03 +0200 (CEST)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 348E5600FE8
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:03 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id y34so19092612lfa.8
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qX5W/Zi/Zz5CerMPqc7J9gy5VX9ObGHzMBijyC2X7sw=;
 b=IdLMOgldikr/uKaEuUcHvLVxmWRdylLxAwMGKAh5/lawep7xfjq06wq4b9tZVc+pfN
 gJW/RVnRw2eJPZ0+/wEA5fw9rhFlc0vUt10toAMdWpO9jy+Web8To2MIJQBUjmCXHE5F
 XdLa7MQ765YF3j3zK3sOvh+wC+CFG0i0ac+2s9PSI2IXapdQTrnZ8iFA5mVpJZvBOeyr
 JgCfwD/wIsxEWlgdfncBVdNt69k3xN6Lsp/U8+YDf1y3TyuSw6AL7q9ArklMFMqFq6rh
 Sk6AehZQzXTQONfQLEPrV9s1r42HUqOTtVHwMP3q3q+X1WUdvwpS7t91teZtO/I/MESU
 bvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qX5W/Zi/Zz5CerMPqc7J9gy5VX9ObGHzMBijyC2X7sw=;
 b=YFSQl7QHDmhcpf1BkBL8Beb+5kn9mqbBx+AGys5SzNHaVSLMqG4jWzWH6Nl+dYC6na
 BktvwFBpBE800LAysFJuXfO0s8lDZ5Dg0KLJblpdu0Sc3IiS2aamUDCllSuJNIwmr9rr
 +HjdiUpGh66djUGtXxowFtzGVhSYhIFq9WuxAMnNce1G/osHIC204VZrznabhbaQZMKx
 WxtukKeyaYoFEIQAAV8p+TPJCsiRcDE/H7GYP1Q2gngbDXnzfrrPulkKmMifKukmDooP
 K2acOOH8M0mVaFd8Yf1YGtC/uVCajO/5fOLVTNzyaXucoPtwM7AKietvb+ntIFuQMVeR
 0B4A==
X-Gm-Message-State: AOAM533r/9sVwTLHgSZtpMdbEvPPN2moN2inCN+6OszW7QG8jl0uMPkY
 WRKuaEsAVBBxf8qE2+gCY2eeQcY11U+9
X-Google-Smtp-Source: ABdhPJzMr5u2QcORGggNsMzmHV5r0xZPUC21hzDJPMog5kf8iJTJ9PVg0+Ckr2v3Rt69X5RsLwhHsw==
X-Received: by 2002:a05:6512:3298:: with SMTP id
 p24mr7982951lfe.625.1628268482510; 
 Fri, 06 Aug 2021 09:48:02 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:02 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:17 +0300
Message-Id: <20210806164730.51040-4-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 03/16] syscalls/sched_getparam03: use
 libc/sys_sched_*()
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
 .../syscalls/sched_getparam/sched_getparam03.c      | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
index 19ecaf147..3cbfae149 100644
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
+++ b/testcases/kernel/syscalls/sched_getparam/sched_getparam03.c
@@ -17,14 +17,19 @@
  */
 
 #include <errno.h>
-#include <sched.h>
 #include "tst_test.h"
+#include "tst_sched.h"
 
 static struct sched_param param;
 static pid_t unused_pid;
 static pid_t zero_pid;
 static pid_t inval_pid = -1;
 
+static struct sched_variants variants[] = {
+	{ .sched_getparam = libc_sched_getparam, .desc = "libc"},
+	{ .sched_getparam = sys_sched_getparam, .desc = "syscall"},
+};
+
 static struct test_case_t {
 	char *desc;
 	pid_t *pid;
@@ -42,17 +47,21 @@ static struct test_case_t {
 static void verify_sched_getparam(unsigned int n)
 {
 	struct test_case_t *tc = &test_cases[n];
+	struct sched_variants *tv = &variants[tst_variant];
 
-	TST_EXP_FAIL(sched_getparam(*(tc->pid), tc->p), tc->exp_errno, "%s", tc->desc);
+	TST_EXP_FAIL(tv->sched_getparam(*(tc->pid), tc->p), tc->exp_errno,
+		     "%s", tc->desc);
 }
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 	unused_pid = tst_get_unused_pid();
 }
 
 static struct tst_test test = {
 	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
 	.tcnt = ARRAY_SIZE(test_cases),
 	.test = verify_sched_getparam,
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
