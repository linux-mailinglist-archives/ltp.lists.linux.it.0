Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F13FDE0B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:52:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EA733C939D
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:52:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 367243C2A05
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:39 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BF18E1401151
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:38 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 54A5240180
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630507898;
 bh=OoiGKnvaYRIidA4GqfsK6cCIowVASjMh9nAMSbtjDaY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ArG1q7D0PlOVyS/tvEGraSdkq7HBOBQ2x45QB0E0hpkv8KSiKbet3EIg7oAMxo9zo
 x0C8JW3M6cEtJR97KLfg9Mv5fPv4LejImxMVbIGI6C1Af5ni9v9uhPchqmaF8xakmk
 Kff0OHF9kSRBMdWG5oeneS3124FDZS+eLQYW3M5sWeX7bVSikIc++wqfbMt7EoQkN7
 KYNWAcebqZg1y1htqvbfDYpQ71KS8kFX6n86M3OqCA8crvm3zwwzcuxeMIBE9p9Xsj
 UGlr5y/umwlPVAW8+v3A/gkpYP9PHpwWWoRgk574VAMKQjkOgMQHVk4zI25OXftTR9
 k289LjrYew44g==
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso1393639edq.20
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 07:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OoiGKnvaYRIidA4GqfsK6cCIowVASjMh9nAMSbtjDaY=;
 b=rq449wE00UzI7trsMwzVFzUQzi99T0iRRVDf58tUPEiybe9fpMVZ6/yX9gwxGeNmOr
 KpUFZDw2Lb/4+SZ6PGGrJUxOKzotznt3s9yy3cm5/VpG1GTA1FQ8MXUtbL31m8mT6ICY
 RMiImDnGn4mpsQ3Zi90Bf7e3A4el0KzHf3F2hUpcMK+/EzFldQMqxrwxyjQQ2jnd9qjW
 oGhZNrME2BaTHJ6jpVrX+p4R4bYjzPW5Vtg3q4HDRs0rz1jSoQDIjCzmOUrcMhQc1AiI
 KNxRgOuIO9fNPf6TEUvKkz4A/zeKe5r8IBR0NQ3OhsYr75cC/UXT5T+ZIHjtS7wAOfC/
 DEFg==
X-Gm-Message-State: AOAM530F/VoIycAQbaJTh4oWJj2t9sS4rrzpjZupUt9wUnagOxRZtDpx
 ZhMQnfjYAKv45R79mskVnYUnCUJ92wPFMJ2DmSBN2/IhQrYx6Fg0c7MDsIaGVWkC74/5D3iZZ9O
 ADZWfBD1vXGajZkSZL2L5lOtbJOcA
X-Received: by 2002:a05:6402:34c3:: with SMTP id
 w3mr28402785edc.335.1630507897733; 
 Wed, 01 Sep 2021 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhOqSW4Qft8+PpsR2yeUQ/OTpUX2v5Kp2w6c+4YR+eaCO2quxnRAoK9RJOrrI5/gI/V/0Jcw==
X-Received: by 2002:a05:6402:34c3:: with SMTP id
 w3mr28402777edc.335.1630507897526; 
 Wed, 01 Sep 2021 07:51:37 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.53])
 by smtp.gmail.com with ESMTPSA id v12sm57651ede.16.2021.09.01.07.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:51:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  1 Sep 2021 16:51:27 +0200
Message-Id: <20210901145127.92315-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
References: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/3] controllers/cpuacct: fix rmdir failures on
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
