Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B79473A2909
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 12:09:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9A2D3C5AEA
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 12:09:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04D163C313C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 12:09:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 207BD1A0065C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 12:09:36 +0200 (CEST)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrHd2-0006cR-75
 for ltp@lists.linux.it; Thu, 10 Jun 2021 10:09:36 +0000
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so656702wrq.10
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 03:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aAT/94SXT04U1pAzn4M6nFsYAZzjzyYNL3eyJUgyDg=;
 b=Yg0K3GlNgVWcu5aKePrFMbNdaH7Uh3eu97BiOs66vgGFkpLV+0sPadXoSHNv+VC/xg
 sA1Q5yyW5FdqH1/MCNtcwLh4QWDUG/GzeMSyhO/SYthkxjwYgIILuxGsJEx2FkiKBRxx
 52/9JY/H6gYyupa+2UYcJXnGfD6RNSvRIMpUXOZH/8d92fuysqTJubaZCXCdShWN9N7r
 2Ils8BaGh/klgJMzAJujuNH37/UilOCObDWRO+EOaqLoizF4hFL5qoi9fGQs0X/4DuMh
 zQIEkw3VRXXxwEBrgxKVbnYyLegpbA0BaAlEj20TserjpswcvZI+0HAW4dF6NChXFkeO
 MW0g==
X-Gm-Message-State: AOAM531OvKGtwxYpAQd4pSVVXhVLDy7CkSLdll5MdWk1Gk7WEbd0D0/J
 ueCt2PQ2P83cGsAqpNmsv+qMxWJQWQJdg2t//QNd0Q5FzW0kwF4quUacE5rQOy3cteXz4ZKw8Zz
 9rqkiq4Ayy1eDnBD3lPCi095gHxVt
X-Received: by 2002:a5d:4689:: with SMTP id u9mr4464296wrq.31.1623319775662;
 Thu, 10 Jun 2021 03:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0NcZK8OGeD4mrCOfg70MMGMkYUmDSz7BmxMIiiO5w/K74wp8nEZSJU57JN64ETKkmGJ2elg==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr4464285wrq.31.1623319775509;
 Thu, 10 Jun 2021 03:09:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id 6sm2527849wmg.17.2021.06.10.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 03:09:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 10 Jun 2021 12:09:27 +0200
Message-Id: <20210610100927.32015-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
References: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] controllers/cpuacct: fix rmdir failures on early
 test abort
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
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 2646018d295e..e1b31b2fa693 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -85,12 +85,13 @@ cleanup()
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
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
