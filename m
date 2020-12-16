Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B650E2DBB48
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:36:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FD133C2AE9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:36:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B8AF83C2A30
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:36:24 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4E056200066
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:36:24 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id j13so1021630pjz.3
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 22:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZSJyItLNurMV/4+EOhhB8cbW+pCL4mKduRb/nud9w0=;
 b=fnQf832UJtlupcBlPS5UGOlfXeN4NrczCjCVbNxiKFBkMbvjZGEkt1Xfmw5aHNPcJJ
 ibzwQU4EvIL/98LdpWiNqG09t1HSFWwiFBFI2G7p17cOQDdgdRk9KisT6O5MoY4VfMjA
 mlHwIG/Y/jP8ewK13ZZGVH+VuNXZlFxK4Byy4RIhw8QSA9gU8OskGB3GS97AS/+PhIeO
 PJNXCK2oY8ieCX5G9lnmrxoaGRAdSLk3zGlcnqlwpRuK55XOXeUyAhs9LuzimGhl6zJz
 JLRjJvQ8hAZ3S8kugDzTGUUVpb7SaiT/W12lzU3HnW0NiSA1PYaOPs5YhYM4HeoCvyWg
 x1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZSJyItLNurMV/4+EOhhB8cbW+pCL4mKduRb/nud9w0=;
 b=NkwQKWl0+oGYmTmXgpFENVqCvkup+cwC9HV7pKTPr5K2Pe+BLtEtxE+GNbwTo73p5t
 W26LhG+N2htbW4ogejW7JC6k0qauIRTcuFYy1HBiN0jCKWTzTbk8KVgcOyLFEGR3uz2L
 YcFCtluP+2LFU3yrhE1PNmIRdzhjvnA/VGIdMx1L/noFbY+mjsodrJaomNw5dw5LA9FY
 WRgpomHI8wWubipg8xbTDWkfOsvixNnfPUn2VS+i+uqKI+tXx+sYb/2MajV/l4MJ5aju
 MQagwu3/M7dMj9G2ul16yOB2K8/JzGEsLap/RVSH2mLuD7GuO/WtQtCepQhJK4C0PayC
 9FVQ==
X-Gm-Message-State: AOAM5306BHC9fC2eoyyosqWuf1cfKJYk3HdDf20wxcF2y4jJ1qZjRd6/
 LEqpZrJ5CF1Zkz8oO9rf1vCFz+X4CKnxlQ==
X-Google-Smtp-Source: ABdhPJyRwbFsNAyYkU3dC6OnHp1/FUlf4fKu0Sv+nybWXGno+H5gmy04/ARKY6lKyEEajPi3XfyNhA==
X-Received: by 2002:a17:90a:77c1:: with SMTP id
 e1mr1919755pjs.141.1608100582536; 
 Tue, 15 Dec 2020 22:36:22 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id p21sm907449pjz.14.2020.12.15.22.36.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 22:36:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 12:06:16 +0530
Message-Id: <9dcf930c32cfa30d683e56d368c094367695d733.1608100564.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] module.mk: Remove .mod files as well during make clean
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

The .mod files are left as is after a make clean, get rid of them as
well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/mk/module.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/mk/module.mk b/include/mk/module.mk
index 07d8fa89efa6..1b71a28b92a1 100644
--- a/include/mk/module.mk
+++ b/include/mk/module.mk
@@ -45,7 +45,7 @@ MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
 MAKE_TARGETS += $(wildcard *.ko)
 endif
 
-CLEAN_TARGETS += .dep_modules
+CLEAN_TARGETS += .dep_modules *.mod
 
 MODULE_SOURCES := $(patsubst %.ko,%.c,$(filter %.ko, $(MAKE_TARGETS)))
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
