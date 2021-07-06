Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA7F3BCB34
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 12:59:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4020E3C68D7
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 12:59:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF43D3C6886
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 12:59:13 +0200 (CEST)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6065A600A0A
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 12:59:13 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id n14so37600865lfu.8
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kSiO6yPfooB+5uk576+PXmWayOjoZOlYkmcU+54jZt8=;
 b=K1vmUXEtzthRorqyH11X7zUuwCPTpS0qtsnK+s2Q/t1O5gJUvMfrzjaWN6MQrU3Y3A
 TqvFeBQn21sjgnd7LeD2VzeGAKLG0Zs7XdE+7znskK06thFS/P31HrB+WtwL15A7MGU1
 Ju8kCdJEoJRdlppnziLJ6YrsqGSAHC1yHuBeBgBeijoWeWwNMnaFDYQt134KAJuI4I6L
 1aLSpT22n5Pg5e8BX1q4J0hSe09zdLnJRwXP8+Imis4vMDdxk/DOORXBjb0Y7/GoJ71I
 VZN+Crh7TuyWni9ZfmPAUkPfCaoMvQcAslendaEDyo3r15tPjw201mCLyLfgqsS+Y0AD
 lEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kSiO6yPfooB+5uk576+PXmWayOjoZOlYkmcU+54jZt8=;
 b=eB4ZeAPn5pPp1a1zHIb3aJsldc/wh2XPc55XO5b+Xpnw8UtMW8qDTTf2diCNRPUi2u
 T3e/cT3TtzTLKKHRt9A7mgVUMatrPOYrppxlnWh6FREKrk0mcT1Z9S9mydAXxNg7bdQq
 IZ7ZH638zMZibdSDhgDn6GnuoExTjpn5sNfWcYi1tkWyWaqbZpYsb2PG30xUoQ52UkZo
 HV+FnRJvDaVyw60ieQ/E0fn2zyEG6myWduexKAkL7Nf3CxIgtfLsX3FVMCVyPS8DeBO1
 w3LRWaRxyJPLzzAhdrmJcswBF0dvWzTezm8TQw4hrPl+ZJKEkd5fawJXvGjZM6eGXca4
 5vsg==
X-Gm-Message-State: AOAM531C+UExNPQn03ehrLxUPfLNuN/V12IDNrnoHoIApkYK7TVkNZ17
 VDr8NGNpOYQRib9Ds3TYHcwXz2icdLar
X-Google-Smtp-Source: ABdhPJz4cB9g7StssVSPF4AqG4J0iIVAieKKDWysHU9nPivvGpkwEGDc0OogKh0HZKxv5yAf066PDQ==
X-Received: by 2002:a05:6512:33d0:: with SMTP id
 d16mr6027004lfg.311.1625569152648; 
 Tue, 06 Jul 2021 03:59:12 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id k34sm147690lfv.277.2021.07.06.03.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:59:12 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue,  6 Jul 2021 13:57:58 +0300
Message-Id: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
created during the test as well, so the patch only checks
errno.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/kernel/syscalls/ipc/shmget/shmget03.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index efbc465e1..6796efc91 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -42,13 +42,17 @@ static void setup(void)
 	queues = SAFE_MALLOC(maxshms * sizeof(int));
 	for (num = 0; num < maxshms; num++) {
 		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
-		if (res == -1)
-			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
+		if (res == -1) {
+			if (errno == ENOSPC)
+				break;
+			tst_brk(TBROK | TERRNO,
+				"shmget failed unexpectedly, num %d", num);
+		}
 
 		queues[queue_cnt++] = res;
 	}
-	tst_res(TINFO, "The maximum number of memory segments (%d) has been reached",
-		maxshms);
+	tst_res(TINFO, "The max number of memory segments (%d) has been reached, used by test %d",
+		maxshms, queue_cnt);
 }
 
 static void cleanup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
