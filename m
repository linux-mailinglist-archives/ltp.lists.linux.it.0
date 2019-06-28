Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD959886
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 12:39:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28D2D3C1C81
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 12:39:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A1D463C074A
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 12:39:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 10FCE1A01769
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 12:39:14 +0200 (CEST)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hgoHh-0002pG-P0
 for ltp@lists.linux.it; Fri, 28 Jun 2019 10:39:13 +0000
Received: by mail-pg1-f200.google.com with SMTP id d187so380474pga.7
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 03:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=dM6XGPVs5jhCu6ZiWk1AafkWBg1BPVXUQT/tSFRe8W8=;
 b=G8Zq92bh1+AMPMKwH99FhpKWxaMO2UQlbaZMK4tV1MtDM+quSUMfJRdqY+bOAM4gN5
 dzUnNfTW82WibX31+gVzI0IeYBhknF9bwiWkcOjeWlYvYTrF/KuMdEgn8tp2kzwGklHs
 xSZLtCsJ7gyFYA0IA35gAUoIE4haBel3XyhXUGY9LrZQGyfxCLCbWhc9RsaIqjT0yjwh
 eFkYX5F3NPOKvHKqaoUoG72WSqeSGm2f2ZKs6Dvf5CSLjQLS05PlhAWcMBvDjf1hXc8t
 IO2PiuB71PsyDwBNQ4QV5sMPQdLc3QSXrsuJhZglal0ouMAoOP0vUfcRQtn5Rm8scL9k
 W16A==
X-Gm-Message-State: APjAAAUJTqpeTeWU2kGs3I7FkIxmKLnCrMrxvD7//31xqF/siRZ/QUEg
 5Eugv2XeOnn0drMyujrDr4QFlWQeyRcI+bra8l6WURuJJlQmqF7wmegYt6XOPZtr3wXsubs8o/i
 wdtqwCPd818+AXfiDNG9j8R5MHus=
X-Received: by 2002:a17:902:44e:: with SMTP id
 72mr5779354ple.326.1561718352302; 
 Fri, 28 Jun 2019 03:39:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1JSifnY2IezCdn3HUm3u6NGN0KbObh74kL6ewDeNp990wF3MZ1+ouFKvkLTN+9F1/FixgBQ==
X-Received: by 2002:a17:902:44e:: with SMTP id
 72mr5779330ple.326.1561718351995; 
 Fri, 28 Jun 2019 03:39:11 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id d6sm1367199pgv.4.2019.06.28.03.39.10
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 03:39:11 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 28 Jun 2019 18:39:00 +0800
Message-Id: <20190628103900.10113-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] scenario_groups/default: run the kernel_misc test
 after the cve test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The block_dev test in kernel_misc will taint kernel with a warning flag,
this is an expected behaviour.

However, if you run the cve-2017-17053 after it, as the test is looking
for a warning / died flag for a tainted kernel, it will cause false
alarm with:
  tst_taint.c:88: BROK: Kernel is already tainted: 14849

The kernel_misc test was executed before the cve test in the default
test plan. Move the kernel_misc test to the end of the list to
workaround this issue.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 scenario_groups/default | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scenario_groups/default b/scenario_groups/default
index 1f3e5b27f..e5b34782c 100644
--- a/scenario_groups/default
+++ b/scenario_groups/default
@@ -22,7 +22,6 @@ power_management_tests
 hugetlb
 commands
 hyperthreading
-kernel_misc
 fs_ext4
 can
 cpuhotplug
@@ -30,3 +29,4 @@ net.ipv6_lib
 input
 cve
 crypto
+kernel_misc
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
