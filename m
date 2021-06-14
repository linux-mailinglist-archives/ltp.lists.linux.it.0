Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E93A6B6F
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 18:15:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46AB43C8B07
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 18:15:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 572023C2E34
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 18:14:54 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D545B6008D7
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 18:14:53 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lspEj-00035H-B7
 for ltp@lists.linux.it; Mon, 14 Jun 2021 16:14:53 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so3291529ejc.0
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 09:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3siHrDflwt1WlFGc3oFMOS3uEXqceZhznKy7DtTCaOQ=;
 b=tK/djCwmc0iKUDSyB4iMA97TAFWQ6LCoRYUBcssLRaoiFtPLQAJhSeuu74ymfSVteM
 HC6qnCH8a9pyANThtFubWtKUGfn8Q9fOP2PXHbEfP9mXlrMPLw8SzYcCJUNGlZxRqG2N
 m0S29TsHhduOq2HUpb9yc99wL5oy4BW0cPw5f53gfENCWETrJUusOkBiGG5yPhOa2Au9
 P/gkkCnBsRIBIGYg1ndtNtPE3SqBxTMNinNouxYlFaOBCkG0QN7XFSyuC+cgCrP7k+cJ
 LIjvrJzTtfQ6Z4gKshghbhd4Fk3AYFY3TufwsSupoUV4BWguQ8TovQqdT4cRH5Q+0i2U
 25Og==
X-Gm-Message-State: AOAM530v6u9VOg/g3N7xNho24h/mcuT5c8GNkTnLvFPTW10PiTxp5ujT
 vOaEDj1ISH53pB++iSIbvKVoSzyHKsMi+7bO067BVJanJFFkJKNLSmw57xs4gOju1YQvb6b/Z6H
 v76p6/y+dnWTYFY/1HIU41caebTRp
X-Received: by 2002:aa7:d413:: with SMTP id z19mr18163976edq.37.1623687292940; 
 Mon, 14 Jun 2021 09:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5xnQWfIsNJHaxDgDp5QfPhPcCGk1c8nujyTk41ILAjvBTqqydAQuVlmwT3oqp89sYJ9eAmg==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr18163959edq.37.1623687292799; 
 Mon, 14 Jun 2021 09:14:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o21sm7445546ejh.57.2021.06.14.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:14:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 14 Jun 2021 18:14:13 +0200
Message-Id: <20210614161413.82389-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
References: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] controllers/cpuacct: fix rmdir failures on
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
index 66a48dde679b..2e9ff5a5286c 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -127,12 +127,13 @@ cleanup()
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
