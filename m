Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DBF3C7145
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:35:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACF523C877E
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:34:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 302CA3C7583
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:34:54 +0200 (CEST)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 52CC81A00E1A
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:34:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id o5so41539169ejy.7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8323dr+y0e5ufju1sj69RCDc9bu7SuE4mTR7hzQ3LP4=;
 b=PdBVdBOQ7ohLVh93pLZ6mqTrf3xGj6jk+MDF41mticqFuXwebdOyx0glWWJQZ7/FSq
 OZ99PNq1/Zl8xcP6ciNQoX7zuQKRUhY5gPMiJc7l5uMmc1K95ro45pOsREInqfbQcbiF
 ai8ha/QkMYMwtvdn5RZzH7g7eRvmoEzbTCyRJpxbjK47MKq3ehk1Fn4ADs3+h9MhNurY
 NSZCOnEiqi0D2i+8DlPFrh/sAHz5J5HUdCKHXJGyGDFeO1A0Qzy7VoUb7O6sDYz3nQ9e
 bC3t5Baf2GGcY2BBQ85dCAtpuNAjls6M2Ms2bn7hVg3omI2WQQmFXdB6FD4HU7JW4zko
 wOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8323dr+y0e5ufju1sj69RCDc9bu7SuE4mTR7hzQ3LP4=;
 b=GBc/RyUs5HAcJ5XEEWqXmlWjMAA5zNomr7L2pqZs96sA85BgZ/TcJFxsPlGKOnBUlc
 6uL7+LaQ1CbJVA86kBNPg5Rp6pPIBlb+ex8CMIAqUojQhXVZBOquBNQrgAIiwcbgVDU1
 S/wVJsWtqFFdn/qZzK95RRAaOeTeUIQK3BPuy8ccVYRpYPttyu55Wovyb4PXM9qmouZC
 +KGkI9SwrhsQPwfpZy28vBrHRNSykB6Uw3tfeX3lOFWABNfMIpyVeZ9w/X5O6nWolClb
 rJYPvitWjsfdi4rY8dKkV4KoecmCYKln2gAo+UJplljzfj1kr4jMCofqrtxHCG5+7ugJ
 c8Wg==
X-Gm-Message-State: AOAM533o9o1ZgmyivsgmEtI5/Jcwmu438NoDSpj0CLg/TJzN5qPqGHh6
 CZ7++wgQRbdtlGUqzdu1aPl+QRbRLFqFZg==
X-Google-Smtp-Source: ABdhPJzO49A/AqziZOa9+55LkJihQnzgRF+3roa7SyeEiUnP1qPMmuFnWtiECLM/14vjwLHPPH7S5Q==
X-Received: by 2002:a17:906:d977:: with SMTP id
 rp23mr5678215ejb.512.1626183292545; 
 Tue, 13 Jul 2021 06:34:52 -0700 (PDT)
Received: from localhost.localdomain (us.sesame.canonical.com. [91.189.91.16])
 by smtp.gmail.com with ESMTPSA id
 p20sm2752978ejy.95.2021.07.13.06.34.51 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:34:51 -0700 (PDT)
From: Ian May <ian.s.may@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 13:34:49 +0000
Message-Id: <20210713133449.33278-1-ian.s.may@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
