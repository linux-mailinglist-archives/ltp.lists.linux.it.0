Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8025BB26
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48AD63C54F1
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 227553C2DE2
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:30 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C453B1A00E59
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:29 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id v196so1490949pfc.1
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 23:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bPUHzHQ2FSyZu3SGXl50NpOoYCCVM4+gdkiADQXMOyQ=;
 b=co85V1mxgxL+td9eqRr14DlbSS/t6lHSM2lGMB7y2Nlq1+dY6GA8TN4Qhg5WWQumZi
 279u4axa5zZHp21LiwNTL/oQA/Mm3qN1bqg2x/gr6mnQBzGkT1zOScigCxFS9H28Jgi8
 MNE4AxaRJpxKuIT4qL0Yu/DssD1NpIzYmXg8Mzf8qnR2W31sFB2lSR5L+7wiOdNn+Am2
 PI+ftN02NBYRZ/8iMhDAkfnB8zzncFTC8M4Q8n2lkVQNsp0Th1AwXlH7TUs2oFxI85FH
 C++EVo6Kr58RVgAmbGs9bQLHGlvP9kXBAz7I1Qb12CU/vGPBw5JXsHwiZFxsBHkhf8kJ
 6Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPUHzHQ2FSyZu3SGXl50NpOoYCCVM4+gdkiADQXMOyQ=;
 b=M+KJAcmFaiqWx0vqikokkb/HVGSUxbTEiw4RiCMAMnzs4rxe+n0mHLLT5GKcifSQdY
 Q/Q/i1vX6v1OVIUKN4MwmFtyccNU3nu+f1uQDrY2qRSceMniWnkp8mrrYvjMKqaeeSL2
 37efw1fJ7xTqrqjK89gW/vqWl8BG1t7XksfAUF/v9/7OJ7XNER49ws3QXGj+ZHEo1CCw
 Rqq2h6sCBh1bnb6IcGDCF4bEdTye4MYc8HwiqnbjjaGWAl0taMIQT0/0Yo89GEZks6/o
 zQ/sC3oFxphTP3qt5DGXk6Ok8FC+Y3BQpTDLnamSVsUNtFE5AWnLB9t5oJZttb7GVBmu
 q1ag==
X-Gm-Message-State: AOAM532Yw8RWDU9q/JeQtE0V25iS4Rn+HFep/4HfSW4p6G0/koELZQaS
 6C0SnNZGRVpRXRyk4BHJRN+vY2xqIE2Gwg==
X-Google-Smtp-Source: ABdhPJxG+JfFZxRE5Tb3vJvUqnHPEKdJeiqdDTNyYaSvT/woxtVjOThoQBKNtqh5LeigCCBLxePtYA==
X-Received: by 2002:a17:902:a70d:: with SMTP id
 w13mr2317714plq.94.1599115227596; 
 Wed, 02 Sep 2020 23:40:27 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id g129sm1745098pfb.33.2020.09.02.23.40.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 23:40:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu,  3 Sep 2020 12:10:12 +0530
Message-Id: <f7855857470b26fdbebcfe4adf1cd4779852f7ff.1599115178.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls: select: Rename select04.c to select02.c
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Do the rename.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/quickhit                                            | 2 +-
 runtest/syscalls                                            | 2 +-
 testcases/kernel/syscalls/select/.gitignore                 | 2 +-
 testcases/kernel/syscalls/select/{select04.c => select02.c} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename testcases/kernel/syscalls/select/{select04.c => select02.c} (100%)

diff --git a/runtest/quickhit b/runtest/quickhit
index c01dc4f30b9f..9ada4c4c47c2 100644
--- a/runtest/quickhit
+++ b/runtest/quickhit
@@ -180,7 +180,7 @@ sbrk01 sbrk01
 # Basic test for sbrk(2)
 select01 select01
 # Basic select tests
-select04 select04
+select02 select02
 setgid01 setgid01
 # Basic test for setgid(2)
 setpgid01 setpgid01
diff --git a/runtest/syscalls b/runtest/syscalls
index 105ca29dd29b..0c6bf0e4d0a7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1150,7 +1150,7 @@ sched_getattr01 sched_getattr01
 sched_getattr02 sched_getattr02
 
 select01 select01
-select04 select04
+select02 select02
 
 semctl01 semctl01
 semctl02 semctl02
diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
index 243a092ac6ca..f5a43c23326a 100644
--- a/testcases/kernel/syscalls/select/.gitignore
+++ b/testcases/kernel/syscalls/select/.gitignore
@@ -1,2 +1,2 @@
 /select01
-/select04
+/select02
diff --git a/testcases/kernel/syscalls/select/select04.c b/testcases/kernel/syscalls/select/select02.c
similarity index 100%
rename from testcases/kernel/syscalls/select/select04.c
rename to testcases/kernel/syscalls/select/select02.c
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
