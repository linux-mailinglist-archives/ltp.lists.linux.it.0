Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A72173B2A27
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:15:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15C693C6F40
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:15:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DFE83C2B9A
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:15:30 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8536D6002AC
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:15:30 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id t17so8860825lfq.0
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pT6jYunljNJ7NKEvMuzWS+00KoMJX1jli8HevOfHcIc=;
 b=P1YdrrOzJxdnBjHWjlmyQCD6/9lm6oqLowCDPC5ECmIMVczUqg2DgcIuIc+rXRciS2
 tNKNiqQHv44tYzHcxteidgmQSA0s6x04aaQPreXiPoEACtzLT8vCDZk6WcxGsfrpAUuX
 WBj07BnUSYjSa7dPXv6nHjGt2seQ1fAsA7LLcnz8ybumtvisj4xqi93cSyVkfIWEu86r
 se62cTbUfeQDf4LU3WU7ZhAhsEQxnVATRJ8Mhj4cNK2HeXp6PHMloYHeND6SGa0WwMhP
 I7S/ID8M2cXYwzn28Jdw+U9lxPOeoOMRIaS2DorZM2FumKYURH264/0xTqdib01HR5eI
 JuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pT6jYunljNJ7NKEvMuzWS+00KoMJX1jli8HevOfHcIc=;
 b=CwMYd1TcaMfm6hgIiF3z4T6IeRMmyKjwbjQjj+Y0QR+7iYrupy1OXn/eGSsz9CWAC/
 ZFu/4tfS9wG4qkzzZ5u3m2wDKGCW+QAdepyq0P5SHFGesWaqL0E9mrWrqUiHMi7yZP7d
 9ZzTIqpZL1hF9VtAt+OMH5zJve2K7IeV3Mcf07YXIhZwdRpLVzJR0Z/MzhiPadHM+0fG
 QyDxmiV6qKgLWgdZr6DwaHgFbKpZfIf+z0dIUo69AbVWt9UfNMfvpoJ4TL59T8DuPDwH
 lxVhaIPlYfZAkG9K+1ULw9jtYBKoTyNj7pN61YQkmw5MbhYynKtjbPeIfx/zHElj5SE7
 xMlA==
X-Gm-Message-State: AOAM533wFhcOMoZvyjlCtFR5ybATFgcho/SzbgIQ4RkP6pf7tiH3tvEZ
 R0KLcV8tBPs5DUcmGWwFuqWgbPrf8xIw
X-Google-Smtp-Source: ABdhPJwUNfppkSqrWOOff7uy2SLwYKkb0kuM32euaNpCOtMJnZAJt2ld6mC1pWz0+P86LD8VIJ6tFg==
X-Received: by 2002:a05:6512:33b8:: with SMTP id
 i24mr1486982lfg.540.1624522529775; 
 Thu, 24 Jun 2021 01:15:29 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id r18sm215560ljp.76.2021.06.24.01.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:15:29 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Thu, 24 Jun 2021 11:14:59 +0300
Message-Id: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_test: setup TCID earlier in do_setup()
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

TCID can be NULL in tst_tmpdir() because it is set after do_setup():

    tst_run_tcases()
        do_setup()
            ...
            tid = get_tid();
            ...
            tst_tmpdir()  /* using TCID here */
        TCID = tid;

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 lib/tst_test.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 36a4809c7..55449c80b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -915,7 +915,7 @@ static void do_setup(int argc, char *argv[])
 
 	assert_test_fn();
 
-	tid = get_tid(argv);
+	TCID = tid = get_tid(argv);
 
 	if (tst_test->sample)
 		tst_test = tst_timer_test_setup(tst_test);
@@ -1412,8 +1412,6 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
 
 	do_setup(argc, argv);
 
-	TCID = tid;
-
 	SAFE_SIGNAL(SIGALRM, alarm_handler);
 	SAFE_SIGNAL(SIGUSR1, heartbeat_handler);
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
