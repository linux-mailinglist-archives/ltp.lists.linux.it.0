Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2C401811
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:35:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E72F3C977B
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:35:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55D1E3C267F
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:34:59 +0200 (CEST)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5E8181400BCA
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:34:58 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id k24so6064661pgh.8
 for <ltp@lists.linux.it>; Mon, 06 Sep 2021 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ayItHc1twcC6jjTfSnDA1kM/89ii3w3BrnsWq+c1iDA=;
 b=l0MFUchltVOZRh4/thmkmXursfuhhwJ1aY7/4SSZ7bBkh8Fy7JUaQeHnBMJet0vG2l
 g2GbI9xgUeReGx9vZifdcvQRpStSN5xmWmdmobf8xGnrn7R6EZ3iy7VFKvKMsNcR3m0c
 3RuXABrh3dm4TbCbNM5WXaEcb+ffMYPdX4Yw9w//LOA1VbRT2D5RHr/iGIIrWIn6o78I
 Ti9xK3oYdEcE5T0X7MudCmg/XdtW8v+HTiz4nz4jjh5TxKKupLdUE/prZsrFlviY7ly1
 P0PKXBIs4/YEYK+G+lx+y6jcdvAcU9Z1JiJ/knbCDQgQzR/NXQ2kg6mwNcXSudosi+36
 4eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayItHc1twcC6jjTfSnDA1kM/89ii3w3BrnsWq+c1iDA=;
 b=Hvmno8GH71L0FDwkdkbu27sX2E25PNg5J1dDK4J0XFHqBfEOOi7rSzfN6Wu1vSrN8I
 0Dna/tOXacxB9M2abd/FWMQ10LgNYcIQXzeveEGQ6v2Nox3YsVF64Ev1PQSwA2le+bwh
 8PqfPc5a4+i2UQMmNDG3QQYTHm2ICQT0FEFE+ZsaDq0s5ezZNmNEZdvOzT4HJEypwVsq
 jh89PIUTfXrSOqIpiWxvdrIm49hpzGK1OM/whqrGXG5kWnsKvJNklrMrGZ3U1j+BhKWQ
 p2ZrORs0B35GVPt2k5IHvozoDC1L2IkqjPHpLoDZW24XeCTqYU+W3wrX1KN3bc4dt5Da
 cMPg==
X-Gm-Message-State: AOAM5322qf61IyYx2KGB8HoEOmRdXzsKDREam+nnTbS2SyfUE1dQ+sLg
 UOxnhmnlBvdLeIj2KxRzf2UBOhFYB9pk3g==
X-Google-Smtp-Source: ABdhPJyZ/hFxOpKdHTeY4dgrFa1hglx9vaOfEI67L4bsVp9bAU0n4rjVEhOpn2qyr2Sc1Hr5jjd7yQ==
X-Received: by 2002:a62:3301:0:b0:3eb:2fee:87cc with SMTP id
 z1-20020a623301000000b003eb2fee87ccmr10943161pfz.62.1630917296259; 
 Mon, 06 Sep 2021 01:34:56 -0700 (PDT)
Received: from localhost.localdomain ([124.123.174.194])
 by smtp.gmail.com with ESMTPSA id u15sm6979090pfl.14.2021.09.06.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 01:34:55 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  6 Sep 2021 14:04:44 +0530
Message-Id: <20210906083444.82394-2-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906083444.82394-1-naresh.kamboju@linaro.org>
References: <20210906083444.82394-1-naresh.kamboju@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] runtest/smoketest: Adding ping01 and ping02 test
 cases
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

Adding two ping test case to smoketest
ping01 ping01.sh
ping02 ping02.sh

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 runtest/smoketest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runtest/smoketest b/runtest/smoketest
index dd689bd6f..361f1db29 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -13,3 +13,5 @@ utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -s 20
 shell_test01 echo "SUCCESS" | shell_pipe01.sh
+ping01 ping01.sh
+ping02 ping02.sh
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
