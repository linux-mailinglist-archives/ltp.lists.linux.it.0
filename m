Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F476C367
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Aug 2023 05:14:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B85F43CDB85
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Aug 2023 05:14:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7183E3CE4CE
 for <ltp@lists.linux.it>; Wed,  2 Aug 2023 05:14:15 +0200 (CEST)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 637961400C5A
 for <ltp@lists.linux.it>; Wed,  2 Aug 2023 05:14:13 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="126777366"
X-IronPort-AV: E=Sophos;i="6.01,248,1684767600"; d="scan'208";a="126777366"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 12:14:12 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com
 [192.168.87.58])
 by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFC17C53CE
 for <ltp@lists.linux.it>; Wed,  2 Aug 2023 12:14:09 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com
 [192.51.207.11])
 by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D670E4ACF
 for <ltp@lists.linux.it>; Wed,  2 Aug 2023 12:14:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.215.131])
 by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CAA592FC047C;
 Wed,  2 Aug 2023 12:14:07 +0900 (JST)
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: ltp@lists.linux.it
Date: Wed,  2 Aug 2023 11:13:55 +0800
Message-Id: <1690946036-27866-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690946036-27866-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1690946036-27866-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27788.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27788.004
X-TMASE-Result: 10--1.932900-10.000000
X-TMASE-MatchedRID: QlNdUeMfyo6kemoEvXwmRU7nLUqYrlslFIuBIWrdOeOU8ftiyKjZra1W
 5jVjArJq5JycdpKDCe9/6kMd15bGDJLaPACgg26O194/5X9VfCz6ZraQS6FEWpsoi2XrUn/J8m+
 hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBTgt2IKSWDlO/0jLqIoVLTIgzs42/jhfFDS+d
 tsYzRftTJHlKavxAloGqexGoUw4AkbTxi7ucn2u8y34x7+A7cGbS8w08NETAzsfZ9V6Q6rCZgvU
 oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] access03: Convert docs to docparse
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
 testcases/kernel/syscalls/access/access03.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/access/access03.c b/testcases/kernel/syscalls/access/access03.c
index ae3f676..7cae1ec 100644
--- a/testcases/kernel/syscalls/access/access03.c
+++ b/testcases/kernel/syscalls/access/access03.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) Linux Test Project, 2003-2023
  */
 
-/*
+/*\
+ * [Description]
+ *
  * access(2) test for errno(s) EFAULT as root and nobody respectively.
  */
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
