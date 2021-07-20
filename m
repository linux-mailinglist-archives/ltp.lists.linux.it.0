Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9623CF777
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:13:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1206F3C65C3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 12:13:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F24E63C6271
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:13:13 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 52638600293
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 12:13:13 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id u13so34950376lfs.11
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUACb9PvC0J4BQmfNmxgGv9vOhnPq58x+TgHmazeZ6w=;
 b=M0TwhfYhAig/QD/MkXWN76vYEvUKGglwBjmO/HNXEocIhgFA0GaLvFIg8eT2X+g0ZT
 qxfV07eKJaAJRPmvOtClnhwHyf3R9EvF3w42fDVNkSWQmVV8QO/jiNlhXW+kGtRbN32X
 d9OwDHx+SrRHQ8uFUOl/DBmKNOtO3jt7lInZrEiH+yzWZZs+C4QkKS2aAK/PkGne2vnU
 wHX213bZ+JJJu0QBHdu3OfPOrqTWw45M4NnDhm9bWCEjNuNJXXaXnYJCivRDFguPvnlk
 e9Kae47h6ujP0MexgBApIpzln70kEAf3ddwKF+zXBCgLLdQ6iVTGLPROOSlci6xEp0su
 3Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUACb9PvC0J4BQmfNmxgGv9vOhnPq58x+TgHmazeZ6w=;
 b=TZu+08qTdNzW4BAlrj6sJg06AOb9rY5o3Bnf/v9WkO8qw8JbDtjigUzOIzyfCrxGBw
 Pz7WeVdFghVKqh26LoTGCSnYIGK/D++Ob5JoEpI+ustmGJQ581JzoSy1xK1RAW+UarAL
 mVTBWHwq63Y+Nod7wafzC4UDJeuKg03XcSCmsYA9kq2kOgfxV9lvPHkVgSfezRPNeiNp
 9+ZoNkVXoCA5HvZPc0BUqLd0WTY+aNVcI1LejL2z5MDFCvyXlfbzF+nVfAUH7WNcw716
 pj8mqY+OGnvpl7G7944/CU5HinKUmBhx1CYYYCChKT4bkBkWDfXwIAb/AZfeefp3h//7
 wCIw==
X-Gm-Message-State: AOAM530Dwsuev/By5vtsOY/RTG3S+GIkpR7K7HpdLESqDakkZvUrPelW
 mm9/3BYReDsIQyFRfOWfKrI2WxIJcGGe
X-Google-Smtp-Source: ABdhPJyZimMZV+xcov015NrauDXlP8LKh15pHmUy6PV0S5YZ8p1D4rA/BMWctH3tggkY5jacIw28kQ==
X-Received: by 2002:a05:6512:128e:: with SMTP id
 u14mr21139998lfs.483.1626775992560; 
 Tue, 20 Jul 2021 03:13:12 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id t72sm1491196lff.172.2021.07.20.03.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 03:13:12 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 13:12:49 +0300
Message-Id: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] crypto/af_alg02: thread termination fixes
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

On musl, pthread_kill() doesn't return ESRCH if thread id is not found
(POSIX only recommends to return ESRCH). Use tst_atomic_store/load()
instead, when waiting for the thread.

Also, the thread's resources wasn't properly freed after the run(),
so adding pthread_join() should fix that.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
v2: convert pthread_tryjoin_np() into atomic_load/store() + pthread_join()

 testcases/kernel/crypto/af_alg02.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/af_alg02.c
index 31d30777c..5863fd26b 100644
--- a/testcases/kernel/crypto/af_alg02.c
+++ b/testcases/kernel/crypto/af_alg02.c
@@ -18,11 +18,13 @@
 #include "tst_test.h"
 #include "tst_af_alg.h"
 #include "tst_safe_pthread.h"
+#include "tst_atomic.h"
 #include <pthread.h>
 #include <errno.h>
 
 #define SALSA20_IV_SIZE       8
 #define SALSA20_MIN_KEY_SIZE  16
+static int completed;
 
 static void *verify_encrypt(void *arg)
 {
@@ -48,19 +50,21 @@ static void *verify_encrypt(void *arg)
 		tst_res(TPASS, "Successfully \"encrypted\" an empty message");
 	else
 		tst_res(TFAIL, "read() didn't return 0");
+
+	tst_atomic_store(1, &completed);
 	return arg;
 }
 
 static void run(void)
 {
 	pthread_t thr;
-
+	tst_atomic_store(0, &completed);
 	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
 	SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);
 
 	TST_CHECKPOINT_WAIT(0);
 
-	while (pthread_kill(thr, 0) != ESRCH) {
+	while (!tst_atomic_load(&completed)) {
 		if (tst_timeout_remaining() <= 10) {
 			pthread_cancel(thr);
 			tst_brk(TBROK,
@@ -68,6 +72,7 @@ static void run(void)
 		}
 		usleep(1000);
 	}
+	pthread_join(thr, NULL);
 }
 
 static struct tst_test test = {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
