Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B710C7C67D3
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 10:41:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51BC13CD437
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Oct 2023 10:41:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00D153C888E
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 10:41:16 +0200 (CEST)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com
 [139.138.37.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8883920EB2E
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 10:41:14 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="115281209"
X-IronPort-AV: E=Sophos;i="6.03,218,1694703600"; d="scan'208";a="115281209"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
 by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 17:41:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A6E9CA1E6
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 17:41:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C272D94B9
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 17:41:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F343C20050184
 for <ltp@lists.linux.it>; Thu, 12 Oct 2023 17:41:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.215.131])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id A57631A0075;
 Thu, 12 Oct 2023 16:41:09 +0800 (CST)
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu, 12 Oct 2023 16:40:58 +0800
Message-Id: <1697100058-2859-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1697100058-2859-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1697100058-2859-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27930.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27930.006
X-TMASE-Result: 10--7.064200-10.000000
X-TMASE-MatchedRID: s7S5NEjjqbIxAROjHaAf207nLUqYrlslFIuBIWrdOeOU8ftiyKjZreCG
 89wh97wnj/bvtfhhXEtvp+b/wK4TT5x9fpSDXIUw9k0tWBWiOf/4uJ1REX4MHV80IvgThXk8E0o
 8W+GU3zA4/aMZkiU+aoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHuZr83rM8yfij9YJ
 ZJY2BFZaH41wU1OuvKRz80cUtJfJywFMlIPaIBbQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] umount03: Simplify test using TST_ macros
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/umount/umount03.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/umount/umount03.c b/testcases/kernel/syscalls/umount/umount03.c
index 1cef06fa1..e6bb523b4 100644
--- a/testcases/kernel/syscalls/umount/umount03.c
+++ b/testcases/kernel/syscalls/umount/umount03.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
+ * Copyright (c) Linux Test Project, 2003-2023
  * Author: Nirmala Devi Dhanasekar <nirmala.devi@wipro.com>
  *
  * Verify that umount(2) returns -1 and sets errno to  EPERM if the user
@@ -20,19 +21,12 @@ static int mount_flag;
 
 static void verify_umount(void)
 {
-	TEST(umount(MNTPOINT));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "umount() succeeds unexpectedly");
-		return;
-	}
+	TST_EXP_FAIL(umount(MNTPOINT), EPERM, "umount(%s) Failed", MNTPOINT);
 
 	if (TST_ERR != EPERM) {
 		tst_res(TFAIL | TTERRNO, "umount() should fail with EPERM");
 		return;
 	}
-
-	tst_res(TPASS | TTERRNO, "umount() fails as expected");
 }
 
 static void setup(void)
-- 
2.39.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
