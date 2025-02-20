Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C45A3D345
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 09:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1740040378; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=j1iTGHmDn/mDC4oB/vGlsgtBAaYBwUD5xRSaaQr63sQ=;
 b=VjVwWSU0x6tBQrAg1vrXXnlUdsKgmpgbv1pViHqAtQEOfh+zPMj2x1/Qfa0VxAJYvLg5q
 o/F64z7TqAVMfmK48ilx7aAuPh8HEcOSThWdUDDhvDCjpxub1AM++Bw89Kgccdc0vRsg4G5
 tJ4FoLY33oO3lV3tNvPx3zvSWveW57w=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721633C55A3
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 09:32:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03EA93C2F29
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 09:32:55 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=139.138.61.252;
 helo=esa7.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com
 [139.138.61.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2ED14142D4F2
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 09:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1740040375; x=1771576375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JggJnK2k7MTVWjJuvpuWZ7JAZ7iMjNNpBdauAcgORis=;
 b=WzNQAMM52bLVdOoJOeqe7IKUgpCUNPpuicwt4xD/v30EAkknzJePishw
 VRq4S1OKxLTIN1GPevPfLNTbn0VOlriOkVmJE8Rko32WP/IzdbD2OSshs
 Ewx6lBLadepgbZyufAHAd12E7Dj2y22u5dGKlDSGgDf378MjqtRxl23VF
 talMkhfUzS+YWtXxCHIBxtvsNhXOnIIMx6Qz8pQdtZGzaOI0sE3s3HQUv
 BkMJiOGGyt2HTHdRuqmxOdemXuMbNqdWt/WZ8zWB0T4l9hgP8qekqQnkE
 Wof4806BdmNll+5Py2xIiGNGrhh4RTa4tq5bHlComn9vGymJ86SX6ArlW A==;
X-CSE-ConnectionGUID: /yON46RHT8yrbyBdwXCzUg==
X-CSE-MsgGUID: 20V88qqYS6W5bu9tUAmfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="169537973"
X-IronPort-AV: E=Sophos;i="6.13,301,1732546800"; d="scan'208";a="169537973"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 17:32:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F16BAD480D
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:32:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B273DBDB89
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:32:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 050AF1A0003;
 Thu, 20 Feb 2025 16:32:49 +0800 (CST)
To: ltp@lists.linux.it,
	andrea.cervesato@suse.com
Date: Thu, 20 Feb 2025 16:32:45 +0800
Message-ID: <20250220083245.1126543-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250219094544.1048098-1-maxj.fnst@fujitsu.com>
References: <20250219094544.1048098-1-maxj.fnst@fujitsu.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] getrlimit02: Fix the doc to fit RST format
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
 testcases/kernel/syscalls/getrlimit/getrlimit02.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit02.c b/testcases/kernel/syscalls/getrlimit/getrlimit02.c
index 20c247a0e..0d7c2bb32 100644
--- a/testcases/kernel/syscalls/getrlimit/getrlimit02.c
+++ b/testcases/kernel/syscalls/getrlimit/getrlimit02.c
@@ -5,13 +5,11 @@
  */
 
 /*\
- * Test for checking error conditions for getrlimit(2):
+ * Verify that, getrlimit(2) returns -1 and sets errno to 
  *
- * 1. getrlimit(2) returns -1 and sets errno to EFAULT if an invalid
- *	  address is given for address parameter.
- * 2. getrlimit(2) returns -1 and sets errno to EINVAL if an invalid
- *	  resource type (RLIM_NLIMITS is a out of range resource type) is
- *	  passed.
+ * - EFAULT if an invalid address is given for address parameter.
+ * - EINVAL if an invalid resource type (RLIM_NLIMITS is a out of
+ *   range resource type) is passed.
  */
 
 #include <sys/resource.h>
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
