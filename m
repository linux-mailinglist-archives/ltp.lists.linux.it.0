Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8153C45EA
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:54:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBEED3C879C
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:54:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64D093C1B32
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:53:48 +0200 (CEST)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 07BF07CEC83
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:53:48 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id e20so22684882ljn.8
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzBx4XR/N05+xQJ3F7QsdMKmoCxMc2gePB+FZXVjimQ=;
 b=zNV61SnPTwau+PONk1kPqMwWyb61IDa4Dr8bz/khIbVw9h+vxqat9Yy7ZHsUqMKLe7
 5uI8kE7RmfMIGGgy+rbPcd22N5n+4/VyuqOWEy5VL0ms5qzmMtTz28brvRrsO0jNJCys
 dZ1B/UF7O+CaR7CH3rSn8vjeU2eTsBCbq54rJrEwt+3Ua85oIfiUJfbRhoslX+WOc61h
 o2USTQqPdpv5fd3AFC7WEGY9OHKnquhSN+u5soLAXvUof7sSmoLh146OJ1DP+DQZJC1U
 LYwGO3Xrb62kDej78utJKjxpQPUw90fUd2ojqDYBfi2zhpvaccci26gZ9O5a2RnSPn8c
 t8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzBx4XR/N05+xQJ3F7QsdMKmoCxMc2gePB+FZXVjimQ=;
 b=DT2ab/GiorbxUBudPVdp8WVGzKhrnj827b/P8teEeOu40oMIOs6Xo3aSqrOL6xHqKd
 FvngruNELSR9W4gLTQM4aywN/nb/SmoAki7ifwylWsQecvNFFebiR1rUjGHpTIULNVdn
 Eh8G2+I2ZNhS33Kl9gaRDaAdoN374txZlG7RUO9/6IMbJK1NvOuCrxyY9HUttuuAk8Rl
 nnwtdCn+0bkomaB+rLYzBM/vgK/cLKHx5gZqSnbYcG6kwYJ8uA8ewKimELv+vFNJUqYT
 RPvJxeNKkJqYXbRwW7eeIBZsI5Kn/YqbZfgE6WkRb/VUZUMfVs0lPlWfY5Lw+u+sv1KW
 hOLw==
X-Gm-Message-State: AOAM532jbpHjvznwCyK+yUPO9+cRjhY6604CxmbT2YUn3uR5OXvZVmCB
 xk7jX8ZOWNDc3LT5aKGOxjW2nji4wFEE
X-Google-Smtp-Source: ABdhPJz5DorVXhDqZeHUw1Gjr60iPHC3QywHOPsSuSKAdcdFpMqEfDkPuch+yXhW8Fj0yOHULgl1MQ==
X-Received: by 2002:a2e:557:: with SMTP id 84mr41281739ljf.211.1626076427376; 
 Mon, 12 Jul 2021 00:53:47 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id f19sm1138194lfj.156.2021.07.12.00.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 00:53:47 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Mon, 12 Jul 2021 10:52:23 +0300
Message-Id: <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
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

 .../kernel/syscalls/ipc/msgget/msgget03.c     | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 76cf82cd3..1ade8f942 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -26,29 +26,30 @@ static key_t msgkey;
 
 static void verify_msgget(void)
 {
-	TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
-		"msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
+	int res = 0, num;
+
+	errno = 0;
+	for (num = 0; num <= maxmsgs; ++num) {
+		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
+		if (res == -1)
+			break;
+		queues[queue_cnt++] = res;
+	}
+
+	if (res != -1 || errno != ENOSPC)
+		tst_brk(TFAIL | TERRNO, "Failed to trigger ENOSPC error");
+
+	tst_res(TPASS, "Maximum number of queues reached (%d), used by test %d",
+		maxmsgs, queue_cnt);
 }
 
 static void setup(void)
 {
-	int res, num;
-
 	msgkey = GETIPCKEY();
 
 	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%i", &maxmsgs);
 
-	queues = SAFE_MALLOC(maxmsgs * sizeof(int));
-
-	for (num = 0; num < maxmsgs; num++) {
-		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
-		if (res == -1)
-			tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
-		queues[queue_cnt++] = res;
-	}
-
-	tst_res(TINFO, "The maximum number of message queues (%d) reached",
-		maxmsgs);
+	queues = SAFE_MALLOC((maxmsgs + 1) * sizeof(int));
 }
 
 static void cleanup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
