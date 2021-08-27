Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C2A3F96C1
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:20:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DC273C9C62
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:20:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D03153C29EF
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:20:19 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BCB02200DF3
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:20:18 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 37E103F043
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630056015;
 bh=8//P4nwknrJSbwhgjxzOQH3BO/eQqxQ80tUkgpEU1ZE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WSs4ynhVFSrFQcGZNKkLVhphcH53GxMnLFNRuNv6gUufc2Crv8fNBhJ8bkuZYYJqT
 sFTVXOxDUtXtHKY/wLQBugTIFbJw8dzbS38z2s54b6CEmLTpKkEt0H6mfzgUNKw82m
 sGw9Kx9o8iiHaOstUc+VGNRQkMAG+hKutvcL1SbruWkq2AEitwt6yDzjZyOfdMLEMF
 FFKrZX4ruRZD+4eqBY167jSllWuv2itIo6TLEKSGV/KlTrlH8nBXVrwE81aSDf5yL5
 D/OYWzT6wype+2RWm4gl+Pc1d42YHMjlKSlOPeggJu8WjO8o1l7wHBlRCDDqkVBLh9
 1CBvWvWSF9KoQ==
Received: by mail-wm1-f70.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so1866978wml.1
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 02:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8//P4nwknrJSbwhgjxzOQH3BO/eQqxQ80tUkgpEU1ZE=;
 b=kX3ufq5YjZLJNvz7ZiZhcw/YgyLEGOSQezCz7tL6wKsQE5KNTOXmv7oDhfc//b7ps+
 0oRzVRw40BPHGFx8okA8N0/pBVqf0fk8xn4pTEdy6kV4X5132ND/T2nw4WR4YOAFIcKB
 c8rK/Y0OA1VpvW281KybykVaP8YnORZAcRatwwOLaGJC3bZhKhDYtzGdp4qa9ByrF/eV
 HePAToZGbXwUHnlgqrIJDvWQPMQr/0DSRt7KbVYlvZ9dAeDoIUC2F4JF98al0GLPagAn
 gTJQMgpAvXQFuycMRCciOI6FaMN6M+IlA1M3VAxJzbJa9I1456UDsMPzvihcMpkiMbyS
 Jt9A==
X-Gm-Message-State: AOAM532uS76Xh7Wl+U53n285AsvMmnQ2rjPDgUjVsmdDcua3nSK9SCHF
 w3ETsx1Cx7Y76kVx2XJeuM+sNMN1BwEy3ZA3Ov+qr/XVVsKMtLn1t7pYzbylk6OThHFfhgqgym3
 HxWThO1JwBMiiZ91sJHI0Wz/w91QF
X-Received: by 2002:adf:ce85:: with SMTP id r5mr8905544wrn.323.1630056014431; 
 Fri, 27 Aug 2021 02:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlqZIgUwP6VNBUvfJ8qCfR1SYwba178JgSlboua2h3IXPX870mkGoUaPGVMridsp2Qk8uH+Q==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr8905527wrn.323.1630056014260; 
 Fri, 27 Aug 2021 02:20:14 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.249])
 by smtp.gmail.com with ESMTPSA id c9sm2811525wrf.77.2021.08.27.02.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:20:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 11:20:07 +0200
Message-Id: <20210827092007.20889-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
References: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] controllers/cpuacct: fix rmdir failures on
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

Changes since v2:
1. None.

Changes since v1:
1. None.
---
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index cde2ea948cee..d2250fdd339d 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -131,12 +131,13 @@ cleanup()
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
