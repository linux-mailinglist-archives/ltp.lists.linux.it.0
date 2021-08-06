Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79C3E2E84
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18C5B3CA3C5
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08EC73C5361
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:02 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9DB471A006FC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:02 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id u3so19102093lff.9
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=deCTSyZG64ccy6DuLXif69bc6wKZ7STqXQvN3TNAdLA=;
 b=Hf1JkpeTYUZiD87ykDU/cFMa/Q8jDnZLzNOW4xBEuX57AvYqvOElGD9xMOnifgTMtl
 7PLeNasR2IJVtdkCQVlozWfa/iU9jqtrVARGK3lA1UxbrkBWa0SP/tU66Bq1IyHfgndZ
 uTcV8/2N+aZpRF7ngn2EeHAcZUBc7f1DpPCM7m6lZy7wlwb0jT17bI/Iz1FnfmR3yN0x
 pMPKupDJabII5EuEbeL1P/ZLNUMNxo5siGyncE3TY7LKniPjZl5jOf8Yzflasm0gj73m
 0OQADV66DJomsqP/NcmZykW8Eco8FYYf5yvr0dLEBnRGimDRzXdLIqU309QXg58Rj9LL
 ZYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=deCTSyZG64ccy6DuLXif69bc6wKZ7STqXQvN3TNAdLA=;
 b=W7oGnIbYrMWsTy8te45BsAUG+Q2HM4jFRZC1/lry+pN58RTCFv/EIQFjnuQf2f7Epv
 Tfo7z/hLxM2Hyrm/e2lFIZo+IYcu01w9cT1J//d2NGK6GhMoXV1UQ9axTOouiwy/m1Ly
 wStVNs7xXEGDDP9Q1fvX+cvdMtml2FUhKN19zRLkWyybgSSvDWoRhPeS1JVXOzLiHS1p
 neK+hpUkDxxgsEMl7OyRxFpToH4ylN5eSzbl379Y5Ot+1ogKUiyHPG+FUHfgIc779yMo
 THQy3BlbFEqw+UdK1pwyKRSBEnZljJDDRqaaQAlp8UTalTdvnQiFzEWQSA/v0AmJiiPI
 /OUw==
X-Gm-Message-State: AOAM530J+PyLCzFSfoCRaYZA4u352jCwd7ipHC3JJHrUr27iQH2TdNrb
 8EmwXavx+I/zk8k2Z8/WWrlCEJPelYFV
X-Google-Smtp-Source: ABdhPJz2gyFbjV6RNnNe1dCK5ecT9MNd8cxycK449iQUbKZqsVSOjMQmarzRWNphkm6cKFFOATr1Sw==
X-Received: by 2002:ac2:4c96:: with SMTP id d22mr1506359lfl.362.1628268481946; 
 Fri, 06 Aug 2021 09:48:01 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:01 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:16 +0300
Message-Id: <20210806164730.51040-3-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/16] syscalls/sched_getparam01: use
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
 .../syscalls/sched_getparam/sched_getparam01.c  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
index efb697707..46cf946a5 100644
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
+++ b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
@@ -21,22 +21,28 @@
 #include <stdlib.h>
 #include <sys/types.h>
 #include <unistd.h>
-#include <sched.h>
 #include "tst_test.h"
+#include "tst_sched.h"
+
+static struct sched_variants variants[] = {
+	{ .sched_getparam = libc_sched_getparam, .desc = "libc" },
+	{ .sched_getparam = sys_sched_getparam, .desc = "syscall" },
+};
 
 static pid_t pids[2] = {0, 0};
 
 static void verify_sched_getparam(unsigned int n)
 {
 	pid_t child_pid;
+	struct sched_variants *tv = &variants[tst_variant];
 	struct sched_param param = {
 		.sched_priority = 100,
 	};
 
 	child_pid = SAFE_FORK();
 	if (!child_pid) {
-		TST_EXP_PASS_SILENT(sched_getparam(pids[n], &param),
-				    "sched_getparam(%d)", pids[n]);
+		TST_EXP_PASS_SILENT(tv->sched_getparam(pids[n], &param),
+				   "sched_getparam(%d)", pids[n]);
 		if (!TST_PASS)
 			exit(0);
 
@@ -59,12 +65,17 @@ static void verify_sched_getparam(unsigned int n)
 
 static void setup(void)
 {
+	struct sched_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing %s variant", tv->desc);
+
 	pids[1] = getpid();
 }
 
 static struct tst_test test = {
 	.forks_child = 1,
 	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
 	.tcnt = ARRAY_SIZE(pids),
 	.test = verify_sched_getparam,
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
