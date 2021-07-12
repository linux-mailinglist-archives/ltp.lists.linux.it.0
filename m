Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 568EB3C45E9
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:53:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F30683C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:53:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 15C263C1B32
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:53:47 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 867B41400546
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:53:47 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id x25so28815966lfu.13
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBwU8A27TbwsV0HTW5T3GdbL98OPP7MPst71Wjf3bfc=;
 b=Es6pmoH8xKfb2eYiTwj8zVG53TUZ8OpcHUt8XMnKecrvhFk2/6i8CuS/pZ7wtgPHa+
 quemzRP+xLDxrXKAW+p6enp1YFVWF8JXX+t0TBPRnOM5kxuIaYu/sQZ5SuSghhjBmhLh
 hrrNmrRy8CbDOthblHLO8kTC6Um7O0PUE+Ct0g5VbCLGDiSORtCI2QUZopzGanRRC39V
 Za5mvPr/7y0yTR7Ark4wBSWkRjlTuqUDPOz4CFMKerVIqCCAtJjyIhCpPFqfXWz+ciKA
 TtsTj0BvIrCOwxlOF3IQnrI5ur4VfQsX4mVmvtRUCIM6lz3KmeuNy1qjlUgUhqw0NI8E
 +4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBwU8A27TbwsV0HTW5T3GdbL98OPP7MPst71Wjf3bfc=;
 b=ukYnkCJ7mIkTG3WnpIdxj9zkcPgeiFQxjL4sSGGrg/SvcF+EPqaYygotZrxIUkKITo
 5+qH2SaVMZnzrSrzzRlmgFICYKgYtryfVtD/GhwxxHbF50LpnJrhgyr0zGFTYcJO0Zf4
 DfY6HDulei+kfGvlLxVxtevaxrQ22MvbrY7bg+jmyDn9n7ubk6qFuwFH/xGAecCr2mVy
 Ogec/4pvNu/4dtiQe6GishYc8DMLXrv3MU+bY84TAhkEvwIxeN/JQrGhcc3ZpnEUbgpS
 +g8IHAfljZRaOQnB9Yp+rm89ipj/FJLgbIUtLnHHZHIfKi3E9uXsv9SyFowpLj6TwO5G
 bsgA==
X-Gm-Message-State: AOAM530zRspyMUtM20AilszMQYkM6qEhPD65/YGqQRol+q7q3hpK1HD0
 afovXYN1/ZMVwqwafNQ6R/+eTa7kH5fT
X-Google-Smtp-Source: ABdhPJxBP4gu9lwNXvrmLhZ+C07sJB7Wq2e9rT+Pq7Ci0HwxNuk6yGYTDNRqiQtkI3YhSToq8TF2HA==
X-Received: by 2002:a05:6512:260a:: with SMTP id
 bt10mr11720084lfb.636.1626076426824; 
 Mon, 12 Jul 2021 00:53:46 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id f19sm1138194lfj.156.2021.07.12.00.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 00:53:46 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Mon, 12 Jul 2021 10:52:22 +0300
Message-Id: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] shmget03: don't depend on existed shared
 resources
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

It's unlikely, but still possible that some of them could be
created/released during the test as well, so the patch only
checks errno.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
v2: * Move the loop to the test run function and try to get
      ENOSPC errno there.
    * Rename queues* to segments*

 .../kernel/syscalls/ipc/shmget/shmget03.c     | 42 ++++++++++---------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index efbc465e1..5dc5d55fd 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -21,47 +21,49 @@
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
 
-static int *queues;
-static int maxshms, queue_cnt;
+static int *segments;
+static int maxshms, segments_cnt;
 static key_t shmkey;
 
 static void verify_shmget(void)
 {
-	TST_EXP_FAIL2(shmget(shmkey + maxshms, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW), ENOSPC,
-		"shmget(%i, %i, %i)", shmkey + maxshms, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
+	int res = 0, num;
+
+	errno = 0;
+	for (num = 0; num <= maxshms; ++num) {
+		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
+		if (res == -1)
+			break;
+		segments[segments_cnt++] = res;
+	}
+
+	if (res != -1 || errno != ENOSPC)
+		tst_brk(TFAIL | TERRNO, "Failed to trigger ENOSPC error");
+
+	tst_res(TPASS, "Maximum number of segments reached (%d), used by test %d",
+		maxshms, segments_cnt);
 }
 
 static void setup(void)
 {
-	int res, num;
-
 	shmkey = GETIPCKEY();
 
 	SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i", &maxshms);
 
-	queues = SAFE_MALLOC(maxshms * sizeof(int));
-	for (num = 0; num < maxshms; num++) {
-		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
-		if (res == -1)
-			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
-
-		queues[queue_cnt++] = res;
-	}
-	tst_res(TINFO, "The maximum number of memory segments (%d) has been reached",
-		maxshms);
+	segments = SAFE_MALLOC((maxshms + 1) * sizeof(int));
 }
 
 static void cleanup(void)
 {
 	int num;
 
-	if (!queues)
+	if (!segments)
 		return;
 
-	for (num = 0; num < queue_cnt; num++)
-		SAFE_SHMCTL(queues[num], IPC_RMID, NULL);
+	for (num = 0; num < segments_cnt; num++)
+		SAFE_SHMCTL(segments[num], IPC_RMID, NULL);
 
-	free(queues);
+	free(segments);
 }
 
 static struct tst_test test = {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
