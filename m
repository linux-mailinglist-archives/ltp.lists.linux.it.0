Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3C37F7B7
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 14:20:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 030B63C6429
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 14:20:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F35C63C4C04
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:19:59 +0200 (CEST)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0BA51001289
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:19:59 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id p12so33525345ljg.1
 for <ltp@lists.linux.it>; Thu, 13 May 2021 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLL1CsFuRKDnE1Ez1NpST3aYELZmo0MkO4tWJgWOp2g=;
 b=qEsD8L14nVrZiog7UsNbcxmSXS6bZpXTxnrWARpyyG2tl8D3jZoxKQlMKHY/CYqu/e
 HEmEZZujef8kgDFgdFOHwE/TmGUxAIWDdb4Y/ZbijihpVsIdfvTDd4kcScXHP2YOifxR
 Ff0hxrn3agK8cdc4SRAH+mvgkMJ1yKn2e75M9GpqtoEzxnFePWAC/hUys7R0EeQ73+q3
 c9ngvL+kVX2aVXvFDf7BJI+cyQ1rglgjOfKj0zDXpJSLgyehD6Bvdig7q4KA9WhB1hjL
 tcbKcsdXd+uET9Uc8Zu767icN8jU3gq0DwiLxqJZnh2xJYfJSdr79AG4UpqrA/6frUvj
 PzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLL1CsFuRKDnE1Ez1NpST3aYELZmo0MkO4tWJgWOp2g=;
 b=n0x02HBQ/aXddCZff8A1hKEK/zgKGyRNfvgIdCTdZQt2kihgVe++RrTmDe5EKxFlji
 GccEXvuYmtfTqPeeFwjwmxK5b6RUuT7igl7EGO4hGEIzm6gSppebMBbr6QypnXbSpRUZ
 it+mYeWnsrUh5qdFf8pkNAIwm7HFvougeB9OPpSTQZ0wwMrfWjzq367CFCK+kTTDhkX8
 tLfZ8cynHkVvMbeBzuBQ9GSEG2K7utNeHkh1Je7AkV/lPd0jYR5bAcxD4RPpmd8Xmdds
 y6jvLm6r4yq3MmShHLBAMkzJZoHFQQwzSQmST5xBgPXJeNHULpZdibzGgwcZO/rmZLtT
 s4tQ==
X-Gm-Message-State: AOAM5332njApYnpOaHLXWUuM+KY3z9Tg0WyiafbcM0w6TsQwD7dz14iK
 khrRdh15xMeBQtMpiidKPYp5GZfvZklN4w==
X-Google-Smtp-Source: ABdhPJx8lI6LWm6DH7BkIOHT/TDd2ivNyqeorjYDyzTif8RG4/3bBVJn9zk1EUi0YXGyzujy6/Ov3g==
X-Received: by 2002:a2e:b052:: with SMTP id d18mr33302802ljl.192.1620908398861; 
 Thu, 13 May 2021 05:19:58 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id n5sm275540lft.139.2021.05.13.05.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:19:58 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 15:22:30 +0300
Message-Id: <20210513122230.1371-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/sched_rr_get_interval: Fix typos
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 .../sched_rr_get_interval/sched_rr_get_interval03.c         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 67ad17793..0c9887f36 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -75,14 +75,14 @@ static void run(unsigned int i)
 	TEST(tv->sched_rr_get_interval(*tc->pid, ts));
 
 	if (TST_RET != -1) {
-		tst_res(TFAIL, "sched_rr_get_interval() passed unexcpectedly");
+		tst_res(TFAIL, "sched_rr_get_interval() passed unexpectedly");
 		return;
 	}
 
 	if (tc->exp_errno == TST_ERR)
-		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as excpected");
+		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as expected");
 	else
-		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexcpectedly: %s",
+		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexpectedly: %s",
 			tst_strerrno(tc->exp_errno));
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
