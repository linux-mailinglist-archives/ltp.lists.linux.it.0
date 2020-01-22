Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F7144B0B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 06:13:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16A2C3C2266
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 06:13:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9A8A63C0E94
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 06:13:16 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ECFCB200769
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 06:13:15 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id z16so2757427pfk.0
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 21:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=haLO2uudrahAruDdsExFIKhQUnOSisUVFuUMPA2b6jo=;
 b=UJx0xBJ2ysyWmB4xOG6D+EbK0LOFN5RaOmSZ/R6MCXHvGmjOJic15jrkVnA2PENj88
 +GnxA0X+xx4AcTH2MeuRiAThikBXAIozKHki5ldeDNAcbP2TCWEWTqh4cwsVf4L6WSru
 QtK2nAQndOadm/Q9ZhmpVStosxg/yx4Q1+G+dLNk0i7PCjlvvMZtClyLgEPtwRQWipqc
 W8GGkj2U3Q/xPe+G0c0Eyu5wlMaj/zoNOEdzE2OUDIqFhh0jNeogr0uC63b6YI5tlO1e
 PLQBXtR7Kxo5++9QpIyyvDxcwU4aXZvlJCuqXM/YKN1Dj3lUbuk9HI+VU7XgPuHqizNW
 679Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=haLO2uudrahAruDdsExFIKhQUnOSisUVFuUMPA2b6jo=;
 b=k3M6Zx8YFTATdMRxxmAr7FgeGGAAqAlpaecn+FOQPCxbephm8UKlsB+0fM7vuUoWx2
 LmO8qW+W4TvTPzcZBcQxEQe5AxNgYzh2TFhnp/8q8rRGhDSyuFOpnhXe7wRLPxfJi/RK
 wn/gmMsPgK8rjrR3pZ9wpknz3x5hhtY7XlaFATGC2e0ijG3GZ5vU71V9mlv7p1yqXxXY
 0ofbXm8iaiQAso105vYBtMaTXBVxLoiKvE0fjJuqQ43O+0skSvYy8uKVTho+u2cK8b8e
 N5vntl6iMNC2tIRlRu0ye8X2QQxvNOR853YJE9DSvaYYlfh4VTim1iAkgLMdRiI0HdPQ
 1VZA==
X-Gm-Message-State: APjAAAWg+z8CEAWWmHv/QxlUjMspdrkz1XfgR86ehPBZKUfxtihF/kJy
 hbJox8NePLq17LDKMAt2hkjGAnU3edg=
X-Google-Smtp-Source: APXvYqxyJ2JTUpQHiGVaTZ1ftELjCh1N810Ykr0Xxq9kajmgchv+rIsjnXut/HR8jv7HXXx1BCVbAg==
X-Received: by 2002:a63:fc01:: with SMTP id j1mr9743839pgi.220.1579669994206; 
 Tue, 21 Jan 2020 21:13:14 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id b12sm44634009pfi.157.2020.01.21.21.13.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jan 2020 21:13:13 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Jan 2020 10:42:47 +0530
Message-Id: <b4026c746a164c83636ff14d77bd0638b1cd5407.1579669956.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] gitignore: Ignore all files starting with dot (.)
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The purpose behind this modification was to start ignoring the .*.swp
files, but then I looked at how the Linux kernel handles this and so
this patch ignores anything that starts with a dot (.).

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 903d616b11c4..0a14ebcbeefc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 CVS
+.*
 *~
 *.o
 *.o.d
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
