Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D195A8542E
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 08:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744353207; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=4gmM7NZQuzqt8l8SznEHTLBLg62dEdm9jEgwKzv5dZQ=;
 b=il4aKkG0hxg+38wY+PMzJHuI1s3RFCHovtjbnCxLjpuEmeqx1gFd5vuFJ6yBbOOReQTcZ
 VRHqKcvaRzp1HZ8clbMgE3oFhBNfzdZCAN8tqojO7htw7/RwQuD4ADsIZCo3VH9Jr9oBBdv
 1lw7z22Sc+RWu7N5EOgL+8mnfJdG5s0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0799E3CB548
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 08:33:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 952293CB53F
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 08:33:11 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=68.232.139.117;
 helo=esa4.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E39241A006E9
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 08:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1744353190; x=1775889190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5MELhBkxdHO32hGDqVYxGLZTgxkhe9fMr1LAmblzUDQ=;
 b=k1yRseiebZd6thMp/T64AV5xjL/o4EED7XAKlAJQIcgVG+o50qx3D8PB
 Hp009fT3ZZxuC3WKmLo6bccL/AT7sZlnTzQGhS7if/WZwh1dCbV01aMHA
 yuhp8ekpSilPViH3fG1j2Wv3/bK4JA98Wu5q7zNf8/izemXijmTgC1Mbs
 pM847PZyXU3FCBJVmYNlTPjuYr5CGRe2Ulr4q8UIHtR0vUoPqHEvZMykv
 eOEmNMIj8TKQ/jetupYt3YbZ7M07OAB9viTd/w2t2ANZ0g2YPadieGcBg
 vQ1MSHFFN+rxjUUb1FHZNSmvNE5dTnWcNrkfXy1iVMYDGcnbAD9+We+pc w==;
X-CSE-ConnectionGUID: WuIoOVrBTIWPx/KNpLngEg==
X-CSE-MsgGUID: wCqdQqrXTzenkiGb0kYp8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="196469793"
X-IronPort-AV: E=Sophos;i="6.15,203,1739804400"; d="scan'208";a="196469793"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 15:33:08 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D20F13F57
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 15:33:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36881F3194
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 15:33:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id BA4161A0078;
 Fri, 11 Apr 2025 14:33:05 +0800 (CST)
To: ltp@lists.linux.it
Date: Fri, 11 Apr 2025 14:33:20 +0800
Message-ID: <20250411063320.29803-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] utimes01: Fix the doc to fit RST format
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
 testcases/kernel/syscalls/utimes/utimes01.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/utimes/utimes01.c b/testcases/kernel/syscalls/utimes/utimes01.c
index b66f39b65..a9aa78904 100644
--- a/testcases/kernel/syscalls/utimes/utimes01.c
+++ b/testcases/kernel/syscalls/utimes/utimes01.c
@@ -9,14 +9,14 @@
 /*\
  * Verify that, utimes(2) returns -1 and sets errno to
  *
- * 1. EACCES if times is NULL, the caller's effective user ID does not match
- * the owner of the file, the caller does not have write access to the file,
- * and the caller is not privileged
- * 2. ENOENT if filename does not exist
- * 3. EFAULT if filename is NULL
- * 4. EPERM if times is not NULL, the caller's effective UID does not match
- * the owner of the file, and the caller is not privileged
- * 5. EROFS if path resides on a read-only file system
+ * - EACCES if times is NULL, the caller's effective user ID does not match
+ *   the owner of the file, the caller does not have write access to the file,
+ *   and the caller is not privileged
+ * - ENOENT if filename does not exist
+ * - EFAULT if filename is NULL
+ * - EPERM if times is not NULL, the caller's effective UID does not match
+ *   the owner of the file, and the caller is not privileged
+ * - EROFS if path resides on a read-only file system
  */
 
 #include <sys/types.h>
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
