Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F6401803
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:27:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC0FE3C94E2
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:27:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 013153C2600
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:27:06 +0200 (CEST)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6BB7A1A00982
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:27:06 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id 17so6059925pgp.4
 for <ltp@lists.linux.it>; Mon, 06 Sep 2021 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VawpMV67LxPcVjea7MOoAYV96wYg44GAF17hbAPM2dQ=;
 b=Y1WjjNJ/09+xXZMnniGrOFtThga8foUXH/chvbKLI+T8RuUEJ97KWNDr3Dql6TYc4A
 xOr5ZlCW1F3dZ3T/5a9slL31TtdMRPaJMC6zxmnc5a2BH3G9z/TYBWjDUwcbKHq5aqsC
 JMEYlxxfVigLEh3msAHs9uGy5vrvQ9v3RPe5LhhcPlaFgmqrEsNia4bDVBAtWyC1PU6S
 B4RkmIa299pO7QdnnJdaFqxFs2p/qersMAd4bdnVDElwLaFRnXUbvXEowoAs00KYrchZ
 2IpYTg0SPknS4Gq4sGQIRN7oruXhqFgwsvHjlp0zDyLMYmVbU8AxwqFmKrJU6QLacRSO
 svvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VawpMV67LxPcVjea7MOoAYV96wYg44GAF17hbAPM2dQ=;
 b=FIR4QTUL8eNwhDDsUQ0EEyMSRhu9fOKY1bvhH1hmvkmB1dvoJ87HV32hbmrYHtRraD
 bnzrxpozgyELGrtepduFtYdoRLNSny7gZo1ITpxEQjmW7vHUKTZTG+LO0Wicycb3jbMc
 yhkoSdKOuHS9OrDEYQ1bpCdUzqWzV2sxrubhUYWN/W8U9eXAC1Wv/n+1jC8sbCCiDv1L
 9kJ4tyy6x1P+bPqLAYLJuhSidY3EHa74J9xz3iz1EoMUdtC9j7M324gV27ZskgAxgq6S
 Xla185VG8bu6JbVtydTLxcw3nE2xzheivDWYFjqvdLd1+EiVHF/qZs35yZZ7dyp2Yt76
 gpfw==
X-Gm-Message-State: AOAM531fclYvswAjm5iny8q9AEpLpiKOTmrjK8yR0Dw8W2ZgEKcFzK4K
 W5Lme02GHdxkQJIq2vZKInygnAOFZn1AtA==
X-Google-Smtp-Source: ABdhPJxMhEVRIpklJa/on76J2yhaJG3xTiLilU+TZrnltA3irmk35bsDcQhNh/l9qx8OUVFa65tvXA==
X-Received: by 2002:a63:5902:: with SMTP id n2mr11237982pgb.305.1630916823997; 
 Mon, 06 Sep 2021 01:27:03 -0700 (PDT)
Received: from localhost.localdomain ([124.123.174.194])
 by smtp.gmail.com with ESMTPSA id b7sm6710404pfl.195.2021.09.06.01.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 01:27:03 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  6 Sep 2021 13:56:53 +0530
Message-Id: <20210906082654.81452-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] runtest/smoketest: Remove intermittent failed
 test case route4-change-dst
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

The test case route4-change-dst fails intermittently creating
the problem for smoketest results verdict. route4-change-dst
is a stress test should not be a part of smoketest. because of
these issues removing route4-change-dst from the smoketest.

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 runtest/smoketest | 1 -
 1 file changed, 1 deletion(-)

diff --git a/runtest/smoketest b/runtest/smoketest
index 7f395936e..dd689bd6f 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -12,5 +12,4 @@ stat04 symlink01 -T stat04
 utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -s 20
-route4-change-dst route-change-dst.sh
 shell_test01 echo "SUCCESS" | shell_pipe01.sh
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
