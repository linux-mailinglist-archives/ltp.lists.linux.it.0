Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F953CFAA2
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 338FF3C6CBF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0B2A3C2B48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:08 +0200 (CEST)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0AC8A20034E
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:08 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id e14so12617499ljo.7
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBwax4a0fgGxf4yolXOhVP6m+1fe9diCHcr0mpEmJHg=;
 b=wzb4lUarQI5Psm9ZE3rDpNwwQl/tgExSAcY2B/oICaD0GqXIj2dLh58tNUT2rdAdwW
 AB2mVfuHjKwp9we7VwzGE98OhMxOv3SSn6Q9xR2IPhM9LKdO2wzFvWTJwJjGD8hkJqas
 ZencwOUaWvtGXvD+t0+Jg8uM857yJWZIw0kxJ81OWbltqvZFnhb8f56ZuzWvcdRbZ4u0
 jEEpj2z17fcdQIeQArCG9Nhpc9pd+1vxS5kkZtfsMVPw8LfDy18S+ZamlRnw7F+Sj94I
 r1sqcBZfYhRnKeZ/ln+qMnON7Y03htWMtbCdX8M6K5iHxDiXIAlfM+wpY66Ivsih1w1+
 zmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBwax4a0fgGxf4yolXOhVP6m+1fe9diCHcr0mpEmJHg=;
 b=bHQ8HBNR2Yz9dHlARFurpS6ws/x/ahN4GwEW2ub9l1HD9bwk3arQ+ac5VADuOGPjfO
 KoZ2MXq8t6mto1ujtChvgv0vEkiYRP5/JMdzjK2ZoV3I3fCZmXwCz65nnMI2Up9HLZNP
 ySHw+XDhwem3oinNgJOVTJaZKyuEWCNs5cTLezRSRWSd87X8nyyc+FBdZRpu4n8EvWE7
 KNBBjtrIVpadIhxjXIpHMIi92RIBYruxGVhVnJnz3oxyvf/exDtPQGlmTdYTIR6SBe1M
 vmyE7Ruem9k6U55sWzn7vIECpB8R2VnTI34f481LmglTMw2wqNVEa7z78rRHuobNLeVb
 +bHQ==
X-Gm-Message-State: AOAM533s4IyTzCb8c4tgYbd/VSzbwRqgBGy8lYsY2FB4iV8dvATI3wwQ
 dlUB+eL8jbr+UnrogIN5rTm6jZF5cC+W
X-Google-Smtp-Source: ABdhPJyEwsJT8nQ1moA7l8YoV/6Q/Q2D8EgGQhmeIUIguHbR8M60OM4Mu5FKUELa82XW2RBKiaUyeQ==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr3310592ljn.1.1626788047358;
 Tue, 20 Jul 2021 06:34:07 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:07 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:10 +0300
Message-Id: <20210720133324.21752-3-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 02/16] syscalls/sched_getparam01: use tst_sched_*()
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
 testcases/kernel/syscalls/sched_getparam/sched_getparam01.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
index efb697707..c24d1c917 100644
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
+++ b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
@@ -21,8 +21,8 @@
 #include <stdlib.h>
 #include <sys/types.h>
 #include <unistd.h>
-#include <sched.h>
 #include "tst_test.h"
+#include "tst_sched.h"
 
 static pid_t pids[2] = {0, 0};
 
@@ -35,8 +35,8 @@ static void verify_sched_getparam(unsigned int n)
 
 	child_pid = SAFE_FORK();
 	if (!child_pid) {
-		TST_EXP_PASS_SILENT(sched_getparam(pids[n], &param),
-				    "sched_getparam(%d)", pids[n]);
+		TST_EXP_PASS_SILENT(tst_sched_getparam(pids[n], &param),
+				   "sched_getparam(%d)", pids[n]);
 		if (!TST_PASS)
 			exit(0);
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
