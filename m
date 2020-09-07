Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6F25F5DF
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57DDA3C21DD
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E41B03C541B
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:32 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 863E4600906
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:32 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 5so7742517pgl.4
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYZX4OHwi+/c0g09mTJwFrHd0cALFrfA31ylanoVpiQ=;
 b=PLTKEyFzFskKaN49lxE9IhifJ4JaUlout8Bfx59YUf9WBYoaGoJo/Sk+/UnraIe0bG
 p+QFESipP8+AXXO5rmMKDd+SXbvfv4HV53tfnFB9wzhl/YXMsQCPuLiSaX2o/UeDZQp1
 83CMP6EyTEC3HsM3t/jBKXNEOWcGfMqwpgiyjEBzPkRT4HDJYaYvtDDVkp3bj4IBNVgj
 Jp+nDd0Ws9ZFI66M85q7rpMQMpynWNTiXKG8SzWr2tHcBFAeFmu5AwxZDYb7/42i4jhm
 RFwfl6/Ku+aBh2zA+1dLq92Ry4W1oQY0TlXRMcRbWOfHWos3FeYlpiB7RKtvEM37XDh5
 MU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYZX4OHwi+/c0g09mTJwFrHd0cALFrfA31ylanoVpiQ=;
 b=TkQoj5y05+RHBqLlY1hyJ8DKGBXDMoBIUu6qgxQuj1AFP212mYaSnAiAVBAs1xQhKK
 a2cbTnt4dr2xseAut/534D9kM/YF51CvpjdS+AnOAv/GimhilTZ39rT9NNsQ5c0w4BUl
 hpI3GLKlUpBsNAqxqnJWJAew85CfDj/gV9/TY5W5MTKW5wELPpVfBwpEqYhaCzNjjAoL
 +YUwNcxuXyZQ/XIqlLILbgoJR2HwIZO2dT9hbdOQH86vtXAUrr0Zw6bvFj9RgMPRy5im
 dVfFnK/8OiaS7F1Vr2O/L7Xf/7cVaH1IrD4Q3kYU1bjRUEfCUeq4OJTMUAVt9KoYlpoG
 pDuQ==
X-Gm-Message-State: AOAM53034tjN1UkVHsHNQB+n2knbPoY53zxHTQQcfX168SEuxIFIdM5U
 Og5w6PwhX5cgv1u9Jl7h9hy/FAm5JX1uRQ==
X-Google-Smtp-Source: ABdhPJxPA3ELkzbFoM73tMTzM/Qo40slJLlA2HLlWyfR12ZaHtTedfUietXdVCyVknQYu9QrNd7FuA==
X-Received: by 2002:a63:413:: with SMTP id 19mr16261881pge.310.1599469230694; 
 Mon, 07 Sep 2020 02:00:30 -0700 (PDT)
Received: from localhost ([122.181.47.55])
 by smtp.gmail.com with ESMTPSA id ih11sm11734926pjb.51.2020.09.07.02.00.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 02:00:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 14:30:05 +0530
Message-Id: <ed1e298052bc8d5cdb75662483e170506b18309a.1599469171.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
References: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/3] syscalls: select: Rename select04.c to
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
