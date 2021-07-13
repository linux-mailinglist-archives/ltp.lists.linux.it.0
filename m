Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C883D71F8
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 11:27:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBC663C910B
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 11:27:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73DF03C4DF6
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 05:39:28 +0200 (CEST)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD98E1400C41
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 05:39:27 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id k27so7514374edk.9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 20:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8323dr+y0e5ufju1sj69RCDc9bu7SuE4mTR7hzQ3LP4=;
 b=P5zT4dvPenkN3bUB3tCDEua401h0Y4JSG/YRwCkZPfMdkZyBhavsEL2pETbIhfiHFS
 7nXU4I+8YwihCOdT4AEb0F15lN6+KCeGBFehXIEwWkqk+HxXq/wtHCrjNQkEMXAdYEGb
 pi2dhJB9C7PSQpr1SYPn3cr0ksgXSdjhzOSC8B+RMuv0yXb/QxofxdKeNpW4PlsbJcTT
 Ox+SIc5CKNin87ZxU00LG27SGvb+6bm7/sfjK0vp+F9zxrfATcmR6nTZJ2abbmqDxwpX
 iARPRED5L5yXoYdV8C+DgMaZinpu0sCeiWaHqH/fLl4fb9YXqkpOxmzLGk9reGGAiFQt
 Mifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8323dr+y0e5ufju1sj69RCDc9bu7SuE4mTR7hzQ3LP4=;
 b=FhmGsugeV+F67YjmNMjiFT1Vn26H47KBFiLbzUeDDeDNMfecW14+ngzQ5ZD1rMAU95
 qGOfv6WQ5+UKOSU9/diUAxTOsnANRq5G04E6FnZmGyZoxgq+Hx7XW4Men86FdBFaJOGw
 pX0/FnpqAegtyfxth0gjDNysTN4KaSsHwGL/juRMDT/03jjR8wtLRWRHC1PzqI/ifVse
 wG9rTUypRUoplnjYYRTqjVR5RjaioyLfHA8XaZ56IWvYXN6b8mihDhxzxB8VYnteGKlX
 4dX/zemu6R59F8MZslACZVx9uDhmsvBV4CQ0spXg8lE2OHUAf73fpiU8rebQLf/wsDXC
 Wo9A==
X-Gm-Message-State: AOAM5319n80jcSbVhN7U7luGpljQN6L7n+6tqqy/YLAPBa1wFbq0MYao
 gALd75K125ohyMgZMp7QIjmwWVKuIlsTEA==
X-Google-Smtp-Source: ABdhPJwNLhsEAphLz2MEVIfZDYZSCshZxNm3/eTVUUl+m1gSmbhDFXDItJ2v7OJsyRhb0HJ4i7w8UQ==
X-Received: by 2002:aa7:c799:: with SMTP id n25mr2620618eds.16.1626147567309; 
 Mon, 12 Jul 2021 20:39:27 -0700 (PDT)
Received: from localhost.localdomain (us.sesame.canonical.com. [91.189.91.16])
 by smtp.gmail.com with ESMTPSA id
 n2sm8869081edi.32.2021.07.12.20.39.26 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 20:39:26 -0700 (PDT)
From: Ian May <ian.s.may@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 03:39:24 +0000
Message-Id: <20210713033924.30500-1-ian.s.may@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 27 Jul 2021 11:27:38 +0200
Subject: [LTP] [PATCH] syscalls/shmctl05.c: Fix leak of shared memory segment
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

The cleanup function is using the key 0xF00F instead of the id in the shmctl call.
This causes the shared mem segment to not be removed properly.

This can be reproduced with the following:

$ ./shmctl05
tst_test.c:1342: TINFO: Timeout per run is
../../../../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
../../../../../include/tst_fuzzy_sync.h:345: TINFO: loop = 1024, delay_bias = 0
../../../../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   ns, avg_dev =     ns, dev_ratio = }
../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =   ns, avg_dev =     ns, dev_ratio = }
../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =   ns, avg_dev =     ns, dev_ratio = }
../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   ns, avg_dev =     ns, dev_ratio = }
../../../../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =     , avg_dev =       , dev_ratio = }
../../../../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
shmctl05.c:89: TPASS: didn't crash

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0

$ ipcs -m

------ Shared Memory Segments --------
key        shmid      owner      perms      bytes      nattch     status
0x0000f00f 629964859  user       700        4096       0

Fix
In the cleanup, add a SAFE_SHMGET to fetch the id and pass into shmctl call.
Confirmed this resolves the leaked segment.

Signed-off-by: Ian May <ian.s.may@gmail.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl05.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
index f8b76bda7..ea7eef6f1 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
@@ -91,8 +91,10 @@ static void do_test(void)
 
 static void cleanup(void)
 {
+	int id;
 	tst_fzsync_pair_cleanup(&fzsync_pair);
-	shmctl(0xF00F, IPC_RMID, NULL);
+	id = SAFE_SHMGET(0xF00F, 4096, 0);
+	SAFE_SHMCTL(id, IPC_RMID, NULL);
 }
 
 static struct tst_test test = {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
