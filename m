Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E96967E5A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 06:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725249681; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=UupKooSb0c6aRwSZ0x5QCpoRfOTn35FBbp3n90C8bJ4=;
 b=Hq6avO+/uDMg1I2FgbZINNMyrk+meuqXhY/xg5lnWPEOKGiYlmr6H8sEnf9ds/6cEnBjp
 Lj0mZg9Ittf+fOmdcVKumymY7Mo08Bm2OEGFmSBBU/f+mWP08uDoVn2X4y/1I893uouk+Fl
 Do6T8gJ7S/OBwCvY4E3KxSMaMoytGrw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3B493C305B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 06:01:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F0353C00D5
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 06:01:18 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=207.54.90.47;
 helo=esa1.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com
 [207.54.90.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D1F5110004A0
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 06:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1725249678; x=1756785678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YvoQ7zAF5f0KwJJ4RiPCubHJ6CboIpda2LGqWTv2z4I=;
 b=Rugc4N1mD0VP6JkBnIio8n1jQ4PDZKSrWMvKrToevo8qpO56XuZGTocM
 JU+L011UAJoI9H/2ZP8JPGQeSsBZoIywMNTE/AReIcYXDxvN3iB2EEXJ/
 WLpBYjKV8xSRp5mVE6eGTCR0ysYATCmF5ywKVOEI8rseSd9vd0FfmEspl
 qko0El1zD7u2lXtBVx5QwEMx0/N7Y3VMoRNH/13kS4gE4OqxsrG9gv6U2
 O1+2za0AP42usfHsQcb3NOr23l7KDqyw7U1Ei7hO6fVZN8Y0z58E2OS4O
 dig9axGQtP48OKLgSs3oiIG6WmXRBuUeJPfLH5mZ1a+5UM4jODuh37KaU Q==;
X-CSE-ConnectionGUID: piGSCMm3S4qXZ1eKmPyVxg==
X-CSE-MsgGUID: m60KgBsQQA+Ra0AJVitLCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="172289427"
X-IronPort-AV: E=Sophos;i="6.10,195,1719846000"; d="scan'208";a="172289427"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 13:01:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EFE2DB3CA
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 13:01:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A233D50E6
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 13:01:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5B6D6BCE5
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 13:01:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 2964D1A0002;
 Mon,  2 Sep 2024 12:01:11 +0800 (CST)
To: ltp@lists.linux.it
Date: Mon,  2 Sep 2024 12:03:10 +0800
Message-ID: <20240902040310.630308-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28636.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28636.004
X-TMASE-Result: 10--4.041800-10.000000
X-TMASE-MatchedRID: BrApPpprBkQB90FcL1q4MKzGfgakLdjaNmVjpriVEtlcGuTueJkNIvBU
 q5JsuvxSQgObqqSHVoxQ8Xx8xomnliq+GZ9ZHxIhngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
 uXd3MZDVr47e0TKFoZWXyDHvXvxQkcDq6znjZR4vUkLHE2Mqxmhc3Pd/BL8KP5PgF96G5TVrh0D
 2TbMhdkgs63Xs/XcAzAp8aqLqEgcZYOUxqOZP8HxXFEH92Kf64nTtPxlIuIBW9Hzj86YHXBCnif
 x5AGfCL
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] sched_setaffinity01: Convert docs to docparse
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

Signed-off-by: Ma Xinjian <maxj.fnst@fujitsu.com>
---
 .../sched_setaffinity/sched_setaffinity01.c        | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c b/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
index a56ae1f50..acd9b77be 100644
--- a/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
+++ b/testcases/kernel/syscalls/sched_setaffinity/sched_setaffinity01.c
@@ -6,13 +6,15 @@
  * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
  */
 
-/*
- * Description:
+/*\
+ * [Description]
+ *
  * Check various errnos for sched_setaffinity():
- * 1) EFAULT, if the supplied memory address is invalid.
- * 2) EINVAL, if the mask doesn't contain at least one permitted cpu.
- * 3) ESRCH, if the process whose id is pid could not be found.
- * 4) EPERM, if the calling process doesn't have appropriate privileges.
+ *
+ * 1. EFAULT, if the supplied memory address is invalid.
+ * 2. EINVAL, if the mask doesn't contain at least one permitted cpu.
+ * 3. ESRCH, if the process whose id is pid could not be found.
+ * 4. EPERM, if the calling process doesn't have appropriate privileges.
  */
 
 #define _GNU_SOURCE
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
