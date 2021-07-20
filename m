Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1373CFAC0
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3CED3C981D
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBA083C81AA
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:16 +0200 (CEST)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5E4F6140020B
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:16 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id l11so15841428ljq.4
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ms1QEP9seOQvhjSVxrQ7wEnWeIvfsByg0QiXLlu2/4c=;
 b=PVwL0cgBY9KFddx39D+8HZi69h/WSq7oqEY7Et8PEswCxu+m9GbuZ1egBVL6LRTaxN
 Y5PoKYtWckChhK8xJoC35FIGy4RC2nB37kgobcI8dUad6eZMdXjvSzlpAJGmEGER5oPH
 hgPAzdiMnahun0dJP3qlmB/A2bchpQ4pOSB6scLtWvcMmIzSWLojjJuIIvFvO/UWHzeZ
 2DLNSNdyWfW+haxVQMcRATk1LbRMSX+qI4S9wIA4XfaFTFnrJ0+mVEzTpo9w7tAuPV06
 21FQdDAcn2A891BjGSkWtkL7/zywotjbrZyGKR95sMaQM7FWPjyXvbha6Ay2lKSV5h5u
 5Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ms1QEP9seOQvhjSVxrQ7wEnWeIvfsByg0QiXLlu2/4c=;
 b=D4mW/KUzmUyif9ifqUTKXK1EMhnbbs7xYGzCPULNk78YwPQmsxOVSAsMb62Zn2y05P
 Kx73PQsn9JgrfwhT4+nFSmMlmAs9KThe0wLq3lTuPsNiDoTuwfEwTxw6XKllDuYospkt
 HMPV2eKFoaJegvDEpLPvOzrYceFzo0MIMtEcyvZQiv640Q7ewab2qomaVoiHezQVThyI
 tHMLgq/OyYwR/Winr49LF37thCpPag0sGJcWyuRHX2Bk+eExnr7Rw5e6OyjA6n4L6nCQ
 00f3+g0jgRNQNwZEZ/jKkgrPfNUVXti1ZqECHMGBS6NFPsrvQyTmB1uJ29yxK54j3PD8
 FS5g==
X-Gm-Message-State: AOAM533XMU35MhgwPUxBBQykzKAxr+q34FSFTub8MFIzRo+h7pVUkrZK
 f/oPE/Hvn9pKKvL1prJXoxFdOHpoTNNv
X-Google-Smtp-Source: ABdhPJzoqYrT2ghV9ibcSEegRO0u9zLqjgvbtjOUFZyzZ0vD6Nq2TdgmW3b5Zdy2JwP4fuQaGORWCw==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr26480699ljr.311.1626788055692; 
 Tue, 20 Jul 2021 06:34:15 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:15 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:22 +0300
Message-Id: <20210720133324.21752-15-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 14/16] syscalls/sched_setscheduler03: use tst_sched_*()
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
 .../syscalls/sched_setscheduler/sched_setscheduler03.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
index 9045d0366..af4b29300 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
@@ -17,13 +17,13 @@
 #include <stdio.h>
 #include <errno.h>
 #include <pwd.h>
-#include <sched.h>
 #include <sys/time.h>
 #include <sys/resource.h>
 #include <sys/wait.h>
 #include <stdlib.h>
 
 #include "tst_test.h"
+#include "tst_sched.h"
 
 #define RLIMIT_NICE_NORMAL 20
 
@@ -96,8 +96,8 @@ static void verify_fn(unsigned int i)
 		"Verifying case[%d]: policy = %d, priority = %d",
 		i + 1, cases[i].policy, cases[i].sched_param->sched_priority);
 
-	TEST(sched_setscheduler(*cases[i].pid, cases[i].policy,
-					cases[i].sched_param));
+	TEST(tst_sched_setscheduler(*cases[i].pid, cases[i].policy,
+				    cases[i].sched_param));
 	if (TST_RET)
 		tst_res(TFAIL | TTERRNO, "case[%d] expected: %d, got: ",
 			i + 1, cases[i].error);
@@ -129,11 +129,11 @@ static void setup(void)
 	l_rlimit_setup(RLIMIT_NICE, &limit);
 
 	tst_res(TINFO, "Setting init sched policy to SCHED_OTHER");
-	if (sched_setscheduler(0, SCHED_OTHER, &param[0]) != 0)
+	if (tst_sched_setscheduler(0, SCHED_OTHER, &param[0]) != 0)
 		tst_res(TFAIL | TERRNO,
 			 "ERROR sched_setscheduler: (0, SCHED_OTHER, param)");
 
-	if (sched_getscheduler(0) != SCHED_OTHER)
+	if (tst_sched_getscheduler(0) != SCHED_OTHER)
 		tst_res(TFAIL | TERRNO, "ERROR sched_setscheduler");
 
 	tst_res(TINFO, "Setting euid to nobody to drop privilege");
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
