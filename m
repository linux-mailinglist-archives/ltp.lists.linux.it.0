Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851AA3B4F3
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2025 09:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1739955017; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=UdL9ETZ87ovw1Ww6A2Y/jkDkXaDWSvxbiF1h0CkgrL0=;
 b=DLU7Gkzeka4XT5Q3DsjCMQUuTniiWteEQ3eFEJPYQYu7hJuqv81XVktbsupIMA8YSAVou
 /u9oj7i5fgmEPsD6/Mak60UwuLdkZEyHrCLHwl3SlVVby/tR9D443NyUz2nSW7UIwuKt87R
 e+ctk9ZvVNtdSEt+rD2S/ZkXY2O+Kfk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBD503C2BBF
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2025 09:50:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 98D523C25CE
 for <ltp@lists.linux.it>; Wed, 19 Feb 2025 09:50:03 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=68.232.139.139;
 helo=esa6.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com
 [68.232.139.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 98B5562537F
 for <ltp@lists.linux.it>; Wed, 19 Feb 2025 09:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1739955003; x=1771491003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sJH1eXjg5CI5y+2R/1I9Cfgg+c8lWxLI8lgpq3DZEV0=;
 b=hWA15FkDDpOO6qjDmJQOrmZ+7YXXav80bq862jJ43es3rt65khA451OC
 nQdqaLtDQ4grTSFjUXMmoWs7R91tipO8cbAGoLQwyac40Hlkxjj0bhjOZ
 rQpc4XkLa5+0oZIm2IZfBE5eNqDgGd0r5idxkIVLeNep4Lyq+8UmysZgG
 sxw+L1uUu2kpzzw1RXadezpLW8cRGrAoAjo+2smZu11O7b1pifZIwB1Pt
 begNl2T3YHbepsfcHt7zwzRScRwlY1gdO1jv+dRK9cp2UlIjVv3CJlcWr
 6KQJhedemfcpl+7/WaSWQ8zc/6pdWftmyff5qvqKjGKs042BWj+JNRmJ0 g==;
X-CSE-ConnectionGUID: br8iSLsSRiaeEZUMJj3MUw==
X-CSE-MsgGUID: L3IgqUeOQF6pZ/Owtp2n3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="193104274"
X-IronPort-AV: E=Sophos;i="6.13,298,1732546800"; d="scan'208";a="193104274"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 17:50:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8A05D4F62
 for <ltp@lists.linux.it>; Wed, 19 Feb 2025 17:49:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 880C0E6475
 for <ltp@lists.linux.it>; Wed, 19 Feb 2025 17:49:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id EF7171A0003;
 Wed, 19 Feb 2025 16:49:56 +0800 (CST)
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2025 16:50:00 +0800
Message-ID: <20250219085000.1038179-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] capset02: Fix comment indentation to fit RST format
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
 testcases/kernel/syscalls/capset/capset02.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/capset/capset02.c b/testcases/kernel/syscalls/capset/capset02.c
index 36d799663..b3cece90d 100644
--- a/testcases/kernel/syscalls/capset/capset02.c
+++ b/testcases/kernel/syscalls/capset/capset02.c
@@ -9,17 +9,17 @@
  * Tests basic error handling of the capset syscall.
  *
  * 1. capset() fails with errno set to EFAULT if an invalid address
- * is given for header.
+ *    is given for header.
  * 2. capset() fails with errno set to EFAULT if an invalid address
- * is given for data.
+ *    is given for data.
  * 3. capset() fails with errno set to EINVAL if an invalid value
- * is given for header->version.
+ *    is given for header->version.
  * 4. capset() fails with errno set to EPERM if the new_Effective is
- * not a subset of the new_Permitted.
+ *    not a subset of the new_Permitted.
  * 5. capset() fails with errno set to EPERM if the new_Permitted is
- * not a subset of the old_Permitted.
+ *    not a subset of the old_Permitted.
  * 6. capset() fails with errno set ot EPERM if the new_Inheritable is
- * not a subset of  the old_Inheritable and bounding set.
+ *    not a subset of  the old_Inheritable and bounding set.
  */
 
 #include <stdlib.h>
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
