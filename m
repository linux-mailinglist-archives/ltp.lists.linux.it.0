Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F6231AAC
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FA63C5D1D
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:56:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2651B3C262F
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:56:24 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 757A4601256
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:55:00 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id l2so6197721pff.0
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=RitYU0ehHkqriGtt4zAr4TgW2fwdbw7+LsITx25shOw=;
 b=a5Wq4z2qzAh1jC/hH1y+8ug6dmv7Hha94uyVeecsmfJZUzekIP2LptIlDANhvYpCNP
 VvIWuDs0C0o4nzg+KRSFYZT38LXcLHAq0P/S+K4hv4Na55kd+0i9tgvQzg/DM0MEAnWc
 bW3mOMnIuHSBeYn/oeBLc2ukaoagOKzyXVl86UIPbdDPKiCsXYbe0iPzvQx7uLJ8nXzC
 mvlJqRHrrPALjmK5YhLMxxsLEXr/38tU3cNw8MtCmN9WSrtQkfx75zTID9EwZj16sQBp
 9kSR8Vn60X2OQIHEb0AzQshUs6SxCogTR95ipHtkMN5Po65aRC/i38kIYApMZuRD8vJF
 Ch5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=RitYU0ehHkqriGtt4zAr4TgW2fwdbw7+LsITx25shOw=;
 b=Ks78Prf2OeC+j3ZSjcQk9orFmkngevuxsjMe9k6m7Ymxu+NP31c8sQhPtGTN3Fwo/u
 5/i7jAeLR7zZMpUKZZc7D9TpsdpZebR3eF5He6KNgwNmldJVygE6Dsa6MyICGccqyTHZ
 7+kniOKW2GYf1aqqBrL+QU6almja3KlTS2QqwySIIVLxks6ioK3c+899BV3BkUIFOhlj
 NLZmsfLUR849iWEXjdl6T21PiAXt1U3yF0wvW+KlSLX+GV7B9LdX3sG+oWyNTqcvdt4k
 WamDmcRt0z/QZDCtQe59XExehOJx8f4JHAcfPC1vp+FRa6GieCou4i3ItkvA1gFlz6wf
 2FYQ==
X-Gm-Message-State: AOAM530CIPvt+ItMLdwlTVahetV3DIqpU3nGA8UF2QaTT7b2uv3oe9BD
 vg+vSxxZXKZKdq4XRgdBdpEmUZjU3vI=
X-Google-Smtp-Source: ABdhPJz5/BsymkmRcKpKMejMkoOGdG6PsSKPcNvrR4XzOZjaRUPtsoef383NEGWECeYWxhZMLIQ2yg==
X-Received: by 2002:aa7:9d0e:: with SMTP id k14mr4384806pfp.162.1596009380500; 
 Wed, 29 Jul 2020 00:56:20 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id y6sm1359453pfr.61.2020.07.29.00.56.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 00:56:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 13:25:52 +0530
Message-Id: <aecc872dc379eb572e3d5ae9b6795c639abf33f0.1596008484.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
References: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
In-Reply-To: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
References: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V8 4/5] syscalls: semop: Rename semop05.c
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rename it to semop03.c.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                                             | 2 +-
 runtest/syscalls-ipc                                         | 2 +-
 testcases/kernel/syscalls/ipc/semop/.gitignore               | 2 +-
 testcases/kernel/syscalls/ipc/semop/{semop05.c => semop03.c} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename testcases/kernel/syscalls/ipc/semop/{semop05.c => semop03.c} (100%)

diff --git a/runtest/syscalls b/runtest/syscalls
index 99831f6aa36e..7bbf3a76611f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1169,7 +1169,7 @@ semget06 semget06
 
 semop01 semop01
 semop02 semop02
-semop05 semop05
+semop03 semop03
 
 send01 send01
 
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 1a63071b22cf..690ccb214b15 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -44,7 +44,7 @@ semget06 semget06
 
 semop01 semop01
 semop02 semop02
-semop05 semop05
+semop03 semop03
 
 shmat01 shmat01
 shmat02 shmat02
diff --git a/testcases/kernel/syscalls/ipc/semop/.gitignore b/testcases/kernel/syscalls/ipc/semop/.gitignore
index 35b7af66c465..bb57f08afda8 100644
--- a/testcases/kernel/syscalls/ipc/semop/.gitignore
+++ b/testcases/kernel/syscalls/ipc/semop/.gitignore
@@ -1,3 +1,3 @@
 /semop01
 /semop02
-/semop05
+/semop03
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
similarity index 100%
rename from testcases/kernel/syscalls/ipc/semop/semop05.c
rename to testcases/kernel/syscalls/ipc/semop/semop03.c
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
