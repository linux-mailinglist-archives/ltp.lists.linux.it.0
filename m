Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E7960156
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2024 08:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1724738991; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=dbruaPesPop9P2CUMWmQB9NN88//GHHsMnTZ9FvLvvw=;
 b=dRo04S1e3/2I0JLAZl1vRwoG9gm65T1y5K7AJZhhWoZa7gmmRstrE4fn2ky5b+Yefd0Sk
 Kv/iP0RWgo+9wamVdtr4nmteVFoDsghmun3j7p1JWFXlImgkAhrxye5k0kYNa6lcqbwfob8
 PqyIOM6GztA2/tDwdhIjI9fnEtIz8yM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70D1A3D2240
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2024 08:09:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D2CB13C8D92
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 08:09:40 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=139.138.36.223;
 helo=esa9.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com
 [139.138.36.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 04A7D140007E
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 08:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1724738979; x=1756274979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3lnFy9Ad9mhKeXhZWeqnJnB8aBgx0n7KNbanVe1UHeU=;
 b=ChGXQcU1t5ba3/7gj2MhZvAH3xzb7inykMJaUtCkr9Dp6zyBJrOU3Vxq
 JICCjScQeWO0vRyQ0Mh9wDOXIlj2d9f+zDKHx990h3si7wo/JD80Ovceq
 E8KjZcZudT47WXtNPI0U5euHuirwyazwQ19D23+hIa4FyZrfISavvevdP
 ILRqvSSjh8uMS9EiekraFA7HwJZyEPwSRexzyAvaw5xZqbYhoKRZzo0+5
 AKqJgboAqH78lOZTMfmA9dbqlVuODkItzqc+Zy4iotOQJBrdwGya3/Ltx
 H9VCW3ehHqF1GHpf/yYiRnTLgCHtHzKtMgNcF9K4Hc2j5bntOafK/CIZu g==;
X-CSE-ConnectionGUID: lTytL2EqTf+nrPQi2JxZYA==
X-CSE-MsgGUID: fvut06FkTKyYysPZ+X+JuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="160063388"
X-IronPort-AV: E=Sophos;i="6.10,179,1719846000"; d="scan'208";a="160063388"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 15:09:35 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 812FECC142
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 15:09:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B613EBF49D
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 15:09:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DD8B2007AA9E
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 15:09:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id BB57C1A000B;
 Tue, 27 Aug 2024 14:09:26 +0800 (CST)
To: ltp@lists.linux.it,
	pvorel@suse.cz
Date: Tue, 27 Aug 2024 14:11:06 +0800
Message-ID: <20240827061106.350609-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28622.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28622.005
X-TMASE-Result: 10--7.603100-10.000000
X-TMASE-MatchedRID: dZ+4kh95TAda6JkWul/UfE7nLUqYrlslFIuBIWrdOeOU8ftiyKjZrQZp
 CoZWwX7ZvB8I+9mEnCdvp+b/wK4TT1lDiuV7LjH+BDoR8w7C9OZIvK4LrXs1aXH5y9+1Ef460+m
 f+4Do0Di/UbCenVRXQTjKOXlMXgWMC7/aa0tdy5aeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8irEH
 faj14ZyeEGY1L4b6vvyvJZP/M75UfnrWrgkirg2Kt6oqomZBryZO403Ng/q3W6Vyxl96+iaw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] kcmp: Convert docs to docparse
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
From: Ma Xinjian via ltp <ltp@lists.linux.it>
Reply-To: Ma Xinjian <maxj.fnst@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

+ update copyright

Signed-off-by: Ma Xinjian <maxj.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/kcmp/kcmp01.c | 16 ++++++++++------
 testcases/kernel/syscalls/kcmp/kcmp02.c | 20 ++++++++++++--------
 testcases/kernel/syscalls/kcmp/kcmp03.c | 17 +++++++++--------
 3 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/kcmp/kcmp01.c b/testcases/kernel/syscalls/kcmp/kcmp01.c
index 0e7cc7a22..c91c34d44 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp01.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp01.c
@@ -1,14 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015 Cedric Hnyda <chnyda@suse.com>
+ * Copyright (c) Linux Test Project, 2015-2024
  */
 
- /* Description:
- *   Verify that:
- *		1) kcmp returns 0 with two process and two fd refering to the
- *			same open file
- *		2) kcmp doesn't return 0 with two process and two fd not
- *		   refering to the same open file
+/*\
+ * [Description]
+ *
+ * Verify that
+ *
+ * 1. kcmp() returns 0 with two process and two fd refering to the same
+ * open file
+ * 2. kcmp() doesn't return 0 with two process and two fd not refering
+ * to the same open file
  */
 
 #define _GNU_SOURCE
diff --git a/testcases/kernel/syscalls/kcmp/kcmp02.c b/testcases/kernel/syscalls/kcmp/kcmp02.c
index 076b4a723..0e4a0d22f 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp02.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp02.c
@@ -1,16 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015 Cedric Hnyda <chnyda@suse.com>
+ * Copyright (c) Linux Test Project, 2015-2024
  */
 
- /* Description:
- *   Verify that:
- *		1) kcmp fails with bad pid
- *		2) kcmp fails with invalid flag
- *		3) kcmp fails with invalid flag
- *		4) kcmp fails with invalid flag
- *		5) kcmp fails with invalid flag
- *		6) kcmp fails with invalid fd
+/*\
+ * [Description]
+ *
+ * Verify that, kcmp() returns -1 and sets errno to
+ *
+ * 1. ESRCH if pid does not exist
+ * 2. EINVAL if type is invalid (it's not in man page)
+ * 3. EINVAL if type is invalid (it's a negative number, -1)
+ * 4. EINVAL if type is invalid (it's a negative number, the smallest integer)
+ * 5. EINVAL if type is invalid (it's too high, the largest integer)
+ * 6. EBADF if fd is invalid
  */
 
 #define _GNU_SOURCE
diff --git a/testcases/kernel/syscalls/kcmp/kcmp03.c b/testcases/kernel/syscalls/kcmp/kcmp03.c
index 7af5cb150..4ae6e0295 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp03.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp03.c
@@ -1,17 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Xiao Yang <yangx.jy@cn.fujitsu.com>
+ * Copyright (c) Linux Test Project, 2016-2024
  */
 
- /*
- * Testname: kcmp03.c
+/*\
+ * [Description]
  *
- * Description:
- * 1) kcmp() returns 0 if the processes share the same file system information.
- * 2) kcmp() returns 0 if the processes share I/O context.
- * 3) kcmp() returns 0 if the processes share the same list of System V
- *    semaphore undo operations.
- * 4) kcmp() returns 0 if the processes share the same address space.
+ * Verify that, kcmp() returns 0 if the processes
+ *
+ * 1. share the same file system information
+ * 2. share I/O context
+ * 3. share the same list of System V semaphore undo operations
+ * 4. share the same address space
  */
 
 #define _GNU_SOURCE
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
