Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24643260EF2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 11:45:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCACE3C53D7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 11:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A26B93C53C5
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 11:44:51 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4ABAB2010A7
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 11:44:51 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id kk9so5381149pjb.2
 for <ltp@lists.linux.it>; Tue, 08 Sep 2020 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eAdSK1KJhE4D069hBfJ0PkbLSBgdUPaeQOudu8a0YQ=;
 b=XlFeRvOwsAmEALbTwl5zzOr2RI9mXQXWWgyVAB1itME+PHN6HBh9nGgll5yvVKCxnw
 mhGbUZGfR9HltNkB2PEzMcKzT1t68/rAldkjhtKEf3WsAcRJEmt/iEEUVKva+MtlAo6A
 wt7oWe7M1eBhzqAJevjiZATQrVfCFOq9X+23qsTQdPT1kylrCFgqyAUOxKTHO8uUbpFF
 n4XVx3qVMUQIm3upE7QYXxCRGNY/6IcAE4m3SjLWTD5ttS30a7gRtWR/t5hhtXad8rn5
 ig5NcdAwDrnX8/k5LiLBfo/7c+X56nOPPZ1QO44AW+/IHn+k8UjvH3tC1L3YjX5hySwn
 NEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eAdSK1KJhE4D069hBfJ0PkbLSBgdUPaeQOudu8a0YQ=;
 b=NayXUm+4Mek4A+sCBzsaxFh1Bi0Aw/FM0zRlOkrMEgYGDWJcjL9rXUkwiQRXCvXPAI
 kU5+K+Yy0YWsc60U4Ctg5YL/WKf6GaeuFUbIgD3jkecp+rgcOQAeL5ZfhQHgViU35UeY
 YmcP75pEzPNZXTBQEpeUIRlvedPSFmrkbWkKc6FwSR9QBzZA4xcossACqMY2MlhaO4I6
 nLAjVSVhMdN2KIYRyarSF5LBqI0eA9tE7D9H68EUAMlgVz3JxhUGJWzm8nHEdmUx4jCm
 4R4nIZ3/yHemdOPXuAtLzdBuchzUzq1vpCQAFTmkQtN3Z0ZKdWIvj3PCOqfoQLtYewAq
 oDUA==
X-Gm-Message-State: AOAM53008PdYsAzoop0IbRgt7xpTbay7XU+JF1F+y1IvSlJIAB4bvJWN
 rFnsG8YQWpiIFXFNFSB9JrwHZAIYQh1IBw==
X-Google-Smtp-Source: ABdhPJw8Va0kEDZHjbDnRK5u/EN2hjT1/7wyPfG+A0qkNJ/6+9H4pVZZ9EIGFMaPdIR3QBCipwFXjQ==
X-Received: by 2002:a17:90a:d703:: with SMTP id
 y3mr3234648pju.183.1599558289590; 
 Tue, 08 Sep 2020 02:44:49 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id f12sm3301716pjm.5.2020.09.08.02.44.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 02:44:49 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 15:14:27 +0530
Message-Id: <e9bcd007772ffadd6326dca29532bb4d3f8e7f0a.1599558175.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 3/3] syscalls: select: Rename select04.c to
 select02.c
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

Acked-by: Li Wang <liwang@redhat.com>
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
index cf8e989969e5..f299c030ecaa 100644
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
