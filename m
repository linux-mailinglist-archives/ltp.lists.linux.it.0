Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5B3FDE69
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:17:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E28C3C80A5
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:17:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B61A3C99B2
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:17:17 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D8E1420038B
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:17:16 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3F62A40179
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630509436;
 bh=OoiGKnvaYRIidA4GqfsK6cCIowVASjMh9nAMSbtjDaY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=IePHL/IJ0QHDkUrJUBIq2WmjMqL/N8gx1XnXq5STbre3546Fg/TEjvROW2ooeKylH
 vX6l+7C9g6jioXsE6MwKKxIQ9IAWXtmqacMgOa1e1slEgMByTy7MmPqzNnsdisC7jw
 6DVXhHVNiZvGyG+8YSf5ZrQ6zrt0mpMBdZbYhb1h327aKWTz09rcWyLstd747Pe9/q
 MOeClEJMYPu81ZQQgN2DRXNr3vBH8O3gMuIO4eEE8WNaod3QOoi893f7coh55/Po+2
 IctKbStUXsU79Jio+HzdBbg9acsYrXdKgCTKJT8lZMXfaVb/MrVYRzGGhIzBU0bPwd
 s1T5rxYsgJbGA==
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so20368wrt.4
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 08:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OoiGKnvaYRIidA4GqfsK6cCIowVASjMh9nAMSbtjDaY=;
 b=Ei2kR4Ib1YyUVXK/V/czai6WaRz7RAiz50mTz9zUAiKtHlkieOSmWQm/4oTmvFdNrm
 d2MqGEbwbVxsWemkGoFBLqD+IfxnkL3LNw/HDBfL/TvRZz8rXuUbJq7LalXkoVJuTlaU
 TyE1nxpVUfL97MRYK3zGfhzTcOy2qVudcmrU5Tu+F8aXV5f/+b2x+DOIG7qg08oh8/4l
 wZHgXJ3FDdCV40Ffc0FIzg1JGVSFrz7lgYr4V+y4Mi6kQx3Cg2lsmAmtyyxdgHeXUMcJ
 +hhU9jMSrumaXV0wI5ztckjKYjP/LDDsk6f05suBq7pMNBymF1jBePIC8kOs8YkwD0XD
 z6sg==
X-Gm-Message-State: AOAM530Y2SocCRr+qsvs1p78/sXNyzfbGTWLtXlm6FtZGs1GMs+wdWaF
 K+7dzs/vEg8yQNeGhp1dzMY5pxksQ2J+R9mSkCcxmbbPdaELd+yvuGq2Yn8Rwk2ityRWSH9YGcc
 op89LIex6bBMZz7J3P1GlTcaGLpWU
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr38152070wro.102.1630509435603; 
 Wed, 01 Sep 2021 08:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJw+y5sOVlW77l4qA6dWaopdfh66F27MonVjEjML9cspNshcSEW4Whk3D9yCLbNF0u4JdTfA==
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr38152052wro.102.1630509435480; 
 Wed, 01 Sep 2021 08:17:15 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.80])
 by smtp.gmail.com with ESMTPSA id a5sm5536177wmm.44.2021.09.01.08.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  1 Sep 2021 17:16:55 +0200
Message-Id: <20210901151655.95760-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/3] controllers/cpuacct: fix rmdir failures on
 early test abort
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

The "testpath" variable is assigned at the end of setup(), so if test
exits early, the "rmdir $testpath" is wrong:

    cpuacct 1 TCONF: not enough of memory on this system (less than 3840 MB)
    cpuacct 1 TINFO: removing created directories
    rmdir: missing operand
    Try 'rmdir --help' for more information.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None.
---
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 39f880a53996..e95d4b53f936 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -120,12 +120,13 @@ cleanup()
 {
 	tst_res TINFO "removing created directories"
 
-	if [ -d "$testpath/subgroup_1" ]; then
-		rmdir $testpath/subgroup_*
+	if [ "$testpath" ]; then
+		if [ -d "$testpath/subgroup_1" ]; then
+			rmdir $testpath/subgroup_*
+		fi
+		rmdir $testpath
 	fi
 
-	rmdir $testpath
-
 	if [ "$mounted" -ne 1 ]; then
 		tst_res TINFO "Umounting cpuacct"
 		umount $mount_point
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
