Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F23643B2A28
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:15:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 678763C2B9A
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 10:15:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 682E13C551E
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:15:31 +0200 (CEST)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 15AF0140111F
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 10:15:31 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id r5so8829490lfr.5
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfTGouSnMdC5rme7o8gpH2EAVUfVB3LzzVwvQyYpdSg=;
 b=vFbtpjYR44E8s3a4qLpDf+fK97u/xgnB9s1ZndTamGfvFm1Y/xfLzd8B5o8lVKlndI
 TCpXcI6bWJPBeitTBjMsj5BsD79FMnxtuRPMyZHbz2bEacZqbuflZcAadD6/j07R39ZX
 4vt7oET1J5p/6xzzanlp+8mQfAECwflujkNiB0eji9VHiyvGys0SNtViV06w3qyEiIwe
 IIOZM4IFodlTlIYybj60fKY51SBK1ouIJKUy/tDVJqksOevgNgKjFA5TZWaHxxmD8oYb
 UbPaxfUhU569izEc24vdQ4qUaoZOvAz/Cwgd6AaAFo4WIdiE3Klkb2AU34FavGScA3Rv
 WDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfTGouSnMdC5rme7o8gpH2EAVUfVB3LzzVwvQyYpdSg=;
 b=nhBhnb7CAUSuY+5EWAfX8HVhpP0F2Nkmf7rE+I0jBtgVZU+i/GYm6zp+a8I7XSf2zO
 v1imhqBrqJz/JgyG9+faROyj06+t7rYFk1iHkRPH2vaIHlVAJCUNiPvCDRc2vWRPP0D/
 pVZy1UttLItWLaA0A9doLF/GJoUBlGbPquFTchgI1SHjpKrOPrABvAfZK2CQ0lVzag0R
 yvwrfGfHg1olJFUMXiE6Z4pYQpjDg0DGDWBpu5/RashSMDUHxqxfN7Wirfq7k+92iWXO
 A8KweFNu6VgH8OSC1Ss1Rniu0fBbWHnVxo704eyPE+4kMyDxxpVkRbydcD+iI8Uzsb6C
 ZxIg==
X-Gm-Message-State: AOAM533hjBJjoXO79ijzmtQZs6sTO/3ZgLyYRflUqCaWgM83YICWfybg
 /By/fy/7bCJl6r4tvJM2nb1H2Jnfl5QM
X-Google-Smtp-Source: ABdhPJy7N1aGcRGfryUn5itUnD2Xe/30Dw9IXXW/BqI8s5DxlhcUOtAw8ZUsB0uEYEIC+riNY9576g==
X-Received: by 2002:a05:6512:6cc:: with SMTP id
 u12mr2944875lff.32.1624522530370; 
 Thu, 24 Jun 2021 01:15:30 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id r18sm215560ljp.76.2021.06.24.01.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:15:30 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Thu, 24 Jun 2021 11:15:00 +0300
Message-Id: <20210624081500.11715-2-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
References: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] fcntl38: check required kernel config option for
 dnotify
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
 testcases/kernel/syscalls/fcntl/fcntl38.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/fcntl/fcntl38.c b/testcases/kernel/syscalls/fcntl/fcntl38.c
index 6185d3209..fae2ab4f7 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl38.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl38.c
@@ -93,4 +93,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = verify_dnotify,
+	.needs_kconfigs = (const char *[]) { "CONFIG_DNOTIFY=y", NULL },
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
