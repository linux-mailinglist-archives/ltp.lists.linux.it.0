Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F8A3D375
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 09:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1740040929; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=768TQylrq6+sYaoruX69ZFE4gMRsVWUzCZrI9fS6umY=;
 b=gU7X8kOpglPYWdmC9dENTwTVU134HydKhLXxSzvQAVUhLZBbtljzSpeMmlDlALmx15E1k
 4qFw9EXFh4vBWuAc58jytRmtdRRcTSE60kxIOYMBf9UAb1dgkzUSR+1Npqr+SFaU/Tb52ev
 8pwGRdCjCAXi30u/Bw3YVpHcocOlZDA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E9D23C5556
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2025 09:42:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 228DC3C0549
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 09:42:07 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=207.54.90.137;
 helo=esa11.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com
 [207.54.90.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8F58210279AE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 09:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1740040926; x=1771576926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=daNhgKxuktDHG4b5wLJwh/um2Zym0ZYYeiUexAnPuso=;
 b=JDCQg04qLG6oBDAa5Idj4ko0hNcLt8/XsRWqoAO8l8WS2MbWvJmYL+OU
 csvuoeI4ggyC43rrqMp01a3LmaVQwp4V/PNuejArI68XEwcfzsRs9BoTh
 oV2YDiQjNddx2BXkbUWY0JdnKZ8tUOXDBrHuwrpIC+RGXvRDpPUKr1vPx
 AxxqGYNWl+tdDvhMMPs1EMu5llr2UG353jVBAvByl9s4NExzmpZ2M5uhK
 2xYO5lwCLf+Zt37mJi74b21rldm5MYkaJy3622FLtzT8Qr8pxZhcpu/7p
 sZ2fnCvrOydliBa6jt4iSv6aHNhWDUKUNXrAc9IFprCV9VvmTq1lIVfam A==;
X-CSE-ConnectionGUID: H9M3p774Sh2hgJoh0erWYA==
X-CSE-MsgGUID: eG7c+WMGQ+Oz30JYJ0lLTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="170126315"
X-IronPort-AV: E=Sophos;i="6.13,301,1732546800"; d="scan'208";a="170126315"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 17:42:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7573D13F5A
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:42:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BF09D0DB9
 for <ltp@lists.linux.it>; Thu, 20 Feb 2025 17:42:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id AB8431A0003;
 Thu, 20 Feb 2025 16:42:00 +0800 (CST)
To: ltp@lists.linux.it,
	andrea.cervesato@suse.com
Date: Thu, 20 Feb 2025 16:42:04 +0800
Message-ID: <20250220084204.1127247-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250219090505.1039462-1-maxj.fnst@fujitsu.com>
References: <20250219090505.1039462-1-maxj.fnst@fujitsu.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] chmod06: Fix the doc to fit RST format
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

Fix the indent and change to bullet point lists.

Signed-off-by: Ma Xinjian <maxj.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/chmod/chmod06.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/chmod/chmod06.c b/testcases/kernel/syscalls/chmod/chmod06.c
index 7055f0da0..40255184d 100644
--- a/testcases/kernel/syscalls/chmod/chmod06.c
+++ b/testcases/kernel/syscalls/chmod/chmod06.c
@@ -8,13 +8,13 @@
 /*\
  * Verify that, chmod(2) returns -1 and sets errno to
  *
- * 1. EPERM if the effective user id of process does not match the owner of the
- * file and the process is not super user
- * 2. EACCES if search permission is denied on a component of the path prefix
- * 3. EFAULT if pathname points outside user's accessible address space
- * 4. ENAMETOOLONG if the pathname component is too long
- * 5. ENOTDIR if the directory component in pathname is not a directory
- * 6. ENOENT if the specified file does not exists
+ * - EPERM if the effective user id of process does not match the owner of the
+ *   file and the process is not super user
+ * - EACCES if search permission is denied on a component of the path prefix
+ * - EFAULT if pathname points outside user's accessible address space
+ * - ENAMETOOLONG if the pathname component is too long
+ * - ENOTDIR if the directory component in pathname is not a directory
+ * - ENOENT if the specified file does not exists
  */
 
 #include <pwd.h>
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
