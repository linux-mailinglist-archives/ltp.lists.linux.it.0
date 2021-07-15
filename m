Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9733C9C9E
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:28:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8FF33C740D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:28:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB3963C65C5
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:28:54 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 93621200E0C
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:28:53 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id v6so8990988lfp.6
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=shYRFljjVxDWJHsgSE85YAjASf5s+xgeYw6mRfjtnA4=;
 b=ie0iDD73bCuwu4hFJhIrRu2HzTJWbo9QAZfvqFwFW/4GgxotRdssnkJUAHV88Xkp1M
 fHOl0EAdcXVVRxmak6/PhLOYPwzhMqxETsq5Kl+kesDgEa4hYang/kEswI1bmE02Vlvc
 bYBmvOmCztLx3n0Kjriymx5bV7F2xzrYkBUZ4RcSOJZ3eiXlLG4DVYLXEvYEpzd0PJhm
 tAOXn8pap6rnlvmosNog3XBBSWLqctnsGoKZQt6qAJN0sNwcRXyKV05ceauEK9trKFPR
 e3gh5m6/q9PfnqbTwnv6xjo89dPw8Svcf4yqjdv/b8uOzwzi0iL4nmiRLnAwx/IsUl+C
 Ff+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=shYRFljjVxDWJHsgSE85YAjASf5s+xgeYw6mRfjtnA4=;
 b=QH44hE6WsKqO0KBjxLbtnr16TvOZSwCttXaVmVhI7Y9GJJoRxJ71g+7oCTDy+qPsLS
 RRwhkf59V0mTHYTPucG0R6s2BdNou1XGtes/3KV1Dj6pTvN7pa2ookmW2Hc8+hXVdTXq
 5HZ+3nmcR50hor5k7xDnBvPlfvbTSe0WokawOIazPYTvII/2PTFb5e3OoM3awDB1kE/s
 Jpr56FgvORqhW/5D5pKp4XJyenYAqfCZOHn5HmuGXRudQuZwx/lbt+LA6gWcbwnLhRbO
 ZALg0OUXLL2QQ/Jdn0h63/ofqT3EU2Gxl5nTjGqvsxrsVa7RhNCSXMOGTg3EUyTT/5Bv
 ockA==
X-Gm-Message-State: AOAM5303wXemN1G5rF8wN3+1KPu9vQ3xouGQyOMYmFUK4/Wms4oQXoG1
 Raiej55yVeKUVbdRZ7NhLI2plNfztONz
X-Google-Smtp-Source: ABdhPJyfYsVuDp2/JrCZTzjWkUnk2Qtm0jMGWfrnKz+hx3YtTraALHPJoxWXA2yDwNf01JfZl6jNAQ==
X-Received: by 2002:ac2:4c90:: with SMTP id d16mr2767138lfl.412.1626344932871; 
 Thu, 15 Jul 2021 03:28:52 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id w29sm408257lfu.160.2021.07.15.03.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 03:28:52 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Thu, 15 Jul 2021 13:28:13 +0300
Message-Id: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead of
 pthread_kill()
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

musl doesn't return ESRCH for pthread_kill() if thread id is not found.

POSIX only recommends to return ESRCH, and also says that pthread_kill()
produces undefined behavior if tid lifetime has ended [1].

[1]: https://man7.org/linux/man-pages/man3/pthread_kill.3.html

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/kernel/crypto/af_alg02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/af_alg02.c
index 31d30777c..0f5793c16 100644
--- a/testcases/kernel/crypto/af_alg02.c
+++ b/testcases/kernel/crypto/af_alg02.c
@@ -60,7 +60,7 @@ static void run(void)
 
 	TST_CHECKPOINT_WAIT(0);
 
-	while (pthread_kill(thr, 0) != ESRCH) {
+	while (pthread_tryjoin_np(thr, NULL) == EBUSY) {
 		if (tst_timeout_remaining() <= 10) {
 			pthread_cancel(thr);
 			tst_brk(TBROK,
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
