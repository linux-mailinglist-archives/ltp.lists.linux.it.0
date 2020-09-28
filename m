Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F027A704
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 07:41:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 957CE3C2B0E
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 07:41:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 559303C061B
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 07:41:24 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 98BB810006B1
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 07:41:23 +0200 (CEST)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kMluc-0001kb-Dl
 for ltp@lists.linux.it; Mon, 28 Sep 2020 05:41:22 +0000
Received: by mail-pf1-f200.google.com with SMTP id c197so6984583pfb.23
 for <ltp@lists.linux.it>; Sun, 27 Sep 2020 22:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kcBfAyNN9HAJrugSFMc8u0N4UJN1IG6HUkJmVWkGfu4=;
 b=SH/neV7kpxkL+JvFZGJBQdFm19L4vp9Eqhy7EOmh8C1q6cNvpLApxZhMPwqByfiulc
 xl/g+H6cOgecpT1ciOacr27xWuXdN72MWeePIcIVmHwVNwNOYL2ZuDLisIolv1qSrN2P
 SO6t7dEJfaUfuw/5vWTZpg+ISXV0YeI/6jKxXytwzwEp2zhcO1VIL+k3yeGIZm+uH5vQ
 W5jiZwBD182uOmjcqLCMf2XGA8pLmV7Rm/caC8pwRrKqWXg80YVpZhCg33mYzsls9q82
 ijGQyzqNQBuVZqnwUkE/E5P5bE1x6ETJTSFmFDrrmxMBlqkhjD0i3JDs4+tR43AuFv4/
 YQkA==
X-Gm-Message-State: AOAM531eyLmhYiJzFNz+ebycmrRmxHKMs9d/AFJxfMIAYFWKNBSQr2Me
 JipxxGytM31Lt3nTzedsBSu1UShBldos1VW3NtRx2uHb16t5l967ZxaC8HDuCRV4V26IwBOFhUI
 6Hmhnj8pUQL+jwr4PojMU5/fWHeA=
X-Received: by 2002:a17:902:309:b029:d1:e5e7:ca3f with SMTP id
 9-20020a1709020309b02900d1e5e7ca3fmr69613pld.43.1601271680855; 
 Sun, 27 Sep 2020 22:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrLRf/cBYztlLP6IA23wP0xF7529/78wLV+T/2dZvQbARqyPY8m+2UThUEVRoTQewMoJN/Ow==
X-Received: by 2002:a17:902:309:b029:d1:e5e7:ca3f with SMTP id
 9-20020a1709020309b02900d1e5e7ca3fmr69584pld.43.1601271680395; 
 Sun, 27 Sep 2020 22:41:20 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id q18sm10125702pfg.158.2020.09.27.22.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 22:41:19 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 28 Sep 2020 13:40:43 +0800
Message-Id: <20200928054043.17058-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] cpuset_inherit_test: compatibility fix for DASH
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
Cc: po-hsu.lin@canonical.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The /bin/sh was symbolically link to dash in Ubuntu, in which the
"let" expression does not work, it will complain about:
    cpuset_inherit_testset.sh: let: not found

Fix it with double parentheses arithmetic expansion to improve the
compatibility.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 .../cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
index 86856c3fb..73eed2cb9 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
@@ -106,7 +106,7 @@ inherit_test()
 test_cpus()
 {
 	cfile_name="cpus"
-	let "num=$nr_cpus-1"
+	num=$((nr_cpus-1))
 	cpu_string="0-$num"
 	if [ $nr_cpus -eq 1 ]; then
 		cpu_string="0"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
