Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683537F7BA
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 14:21:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC8B03C6423
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 14:21:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C950E3C5533
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:21:13 +0200 (CEST)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 75D38140124C
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:21:13 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id z9so38219739lfu.8
 for <ltp@lists.linux.it>; Thu, 13 May 2021 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lg5dX9xkkhubs/V1F6xYX5LdcsbYJs/7fzcnPTE1PFQ=;
 b=ICVvjLUgTRpEp2wxo5ys/aGX3Ddrpa8asi3N+buOBphtgwBKd+eNK1wd/TRzcTiJcp
 hVqotjjtXCITyFvjwB9MG1rHc9cveWHZ9r5grJdby5/JLVpUJPP5rh/USQatCxTGs2v6
 5yYq5hrC8GBCBuBnZHsPFalzaa2+dHB2kwUR+M2gl/teAWhSqi/5hp1C4q4jgfOx4bEF
 Flek25r4u16B7A+ipISsFoc+0h54Z0iJnUk7iI4867hRftcnKP8IOELWqETl8i+BEXuG
 uD8kHMGlgGOEekx+Gdn8JloixB/tGRT19GeEVgvarIvz3ReZJ8WQ17iqN5C0pScYLDzv
 kJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lg5dX9xkkhubs/V1F6xYX5LdcsbYJs/7fzcnPTE1PFQ=;
 b=lTZjQ8AI/TdN4nCPnlozL+0a4gTzOmvWhbG8vcePs2FISdPZkHW3/yQxyHGpaVkwm8
 YZrdv6t9fktjsPhGiAMqqWJg3IH0Q1e2ddZh9OgFp+5c2vHVttQgpRPx/zBeq1QMCabL
 vjgeN9y2D5S6myTLuwQ1EKGv1UmW6XEXARS0uRrMAadBY4c9ni8G4UTwDDdamBfhGmBe
 mDbdZWg4bL3SsWITGjjkj6EmJuQsxw65PE9qT4Y1J8A0PFKlzWkblapX69BEkM7AHncM
 znFjPfcJYoeb5xsitrcVOM8hp7QX5we2PmtdiWc2ylZiVjCJl8k4Ojzj3ycbkKehmoH1
 NGHw==
X-Gm-Message-State: AOAM532y91qWAUzffSu1OB7hXxrftLxhCAJSF89appw/ZbmWoc4A1cJ7
 q8FJeBgbwJtpSxhzL80ckSw/amU6tvfDEg==
X-Google-Smtp-Source: ABdhPJzKG5t68E5+YsWL+K325k9hJYPazj/83F653MIbP1GAGQzHLDm+T6ndl2vUJow7DMPTDQFM6g==
X-Received: by 2002:a19:354:: with SMTP id 81mr28370350lfd.174.1620908472709; 
 Thu, 13 May 2021 05:21:12 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id s11sm415757ljc.66.2021.05.13.05.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:21:12 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 15:23:44 +0300
Message-Id: <20210513122344.1432-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clock_gettime: Fix typo
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
 testcases/kernel/syscalls/clock_gettime/clock_gettime02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
index b0a9e9067..1159dbd13 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
@@ -120,7 +120,7 @@ static void verify_clock_gettime(unsigned int i)
 	TEST(tv->clock_gettime(tc[i].clktype, ts));
 
 	if (TST_RET != -1) {
-		tst_res(TFAIL, "clock_gettime(2): clock %s passed unexcpectedly",
+		tst_res(TFAIL, "clock_gettime(2): clock %s passed unexpectedly",
 			tst_clock_name(tc[i].clktype));
 		return;
 	}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
