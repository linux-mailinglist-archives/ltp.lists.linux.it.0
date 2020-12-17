Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF62DCBAE
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 05:26:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECBAF3C7083
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 05:26:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 60D1F3C07D4
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 05:26:30 +0100 (CET)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D05DF600B52
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 05:26:29 +0100 (CET)
Received: by mail-pg1-x534.google.com with SMTP id t37so19453347pga.7
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 20:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBW3tqkjKHugVp0R9xfvN5H8o1q480a0p45GQokii2E=;
 b=K6VtyAqGhIPbEKY9mwF94j6toM4CbOXNTjDGMqmSUQxIlwiF74OD4WVKVfTmtUUVpX
 wXIJbEbihRar3a3vCKj4uPPFKxRPagonILWPgr0JR7j1ou34dAFYkF8S68bTGSVmojyK
 cG8Vx//1d49hwODIv4xY/th5NqKB2eaLXIHwrMkkEz1B2FgZgY7nw0lkSAahzrnqciP+
 /COP4ycV1wacCCFqacgnEeDp0C0ARDVQ/eHZ/0bzeEeCBhfVV+e71sjeh82SSXP5IRIg
 RhNhJcmzTsf2lNARNTfznwQLo+OnCrW3XZNjabXWF4Yl65kXd7+p6rq8XBVVWfmy0uf4
 E1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBW3tqkjKHugVp0R9xfvN5H8o1q480a0p45GQokii2E=;
 b=Kb6kRMzfaGKcjcPratmSGZ/HERJdBqj23xVi2Ei55wdXxNi+tsGSCYupj1zkrmpYbT
 EU1XdvAWkWaPSmxVv3MiRjWxF6ehrsE3cR3TXtAAntF26XtjjkNXupKUJeIsrwdDye1z
 YEuxOnH/XfEhJ9hDCOVxIFoYhOxQI2KQEw6BsOt4Y4wk9yX8Dxdpqn5DJ5bfqBZ0LpzT
 tTjbAmsi7SGq6atuUULqWtgGS22HAcgCoHY5QzMHn8XvJkWa2MKzqGFQWBuaa9AJZD4R
 ZbXP6py+ZikE+Slt/KiIrRRqmyZcfgrbER9/nWYo/6W2z96kEsAvd357uvFoZIQw4Ps8
 /AVA==
X-Gm-Message-State: AOAM530lXowtB546AMBRa4Jz8ZyVkZJJ/rHVLD5Dv+JQch/NFcW1FWaS
 16jUtq/MdjxFi3PgsKeUY/woccuqU66yrA==
X-Google-Smtp-Source: ABdhPJxWP8nwZOZak4A5PUm67WdB1HmFX/ftOnNczXUvdLDp3stQoLyvQp6pb+fbIXCniNnJeLZcbg==
X-Received: by 2002:aa7:970f:0:b029:19e:758b:dab1 with SMTP id
 a15-20020aa7970f0000b029019e758bdab1mr34541448pfg.24.1608179187808; 
 Wed, 16 Dec 2020 20:26:27 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id d203sm3986023pfd.148.2020.12.16.20.26.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 20:26:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 09:56:20 +0530
Message-Id: <a7007a68b6a11f84f6551d253563da2f37319e55.1608179175.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] module.mk: Remove build-in.a files as well during
 make clean
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

Remove build-in.a files as well during make clean and also add it to
.gitignore.

Reported-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore           | 1 +
 include/mk/module.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 769d4be8873e..199445292c52 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,6 +12,7 @@ lib*.a
 .cache.mk
 *.dwo
 *.mod
+build-in.a
 
 /aclocal.m4
 autom4te.cache
diff --git a/include/mk/module.mk b/include/mk/module.mk
index 1b71a28b92a1..dad293276fb8 100644
--- a/include/mk/module.mk
+++ b/include/mk/module.mk
@@ -45,7 +45,7 @@ MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
 MAKE_TARGETS += $(wildcard *.ko)
 endif
 
-CLEAN_TARGETS += .dep_modules *.mod
+CLEAN_TARGETS += .dep_modules *.mod build-in.a
 
 MODULE_SOURCES := $(patsubst %.ko,%.c,$(filter %.ko, $(MAKE_TARGETS)))
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
