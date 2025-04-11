Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D28A854E4
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 09:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744354955; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=nljM1rGZU6LKZj/m4dEoCsjX3JM6HeZZAVzkk3IVzPM=;
 b=X3G3IaoaxdfVPPyyiMCcdwBSEiw9BxjTq8uX+gLblv5dfenl5glD+6o+XXTw9ln0Vp9ey
 8+gVIT/iBUuyBuH9G5c3brOhVN9F5NUmY2GZaedw3jnucmjpR8m7iIliOKQt0H0VwHrE0cV
 IGjJWcj8l2OqlB+CbRIz4cc4iDniXdk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6BE03CB589
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Apr 2025 09:02:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41C943CB57B
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 09:02:33 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=207.54.90.48;
 helo=esa2.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com
 [207.54.90.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 03B121000C2B
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 09:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1744354953; x=1775890953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AbyYdjVjvLXjiTXvvFlvJtKSPU/tJ7oOCp6f8OTIrKo=;
 b=albd8Va96x5Xngwe3Lia5T824yXOLxlHwcODpbdLw9G0b8ng4RTNS2dE
 ebGwvT2Wae6LnQ5o0HFVuvjTPOcjJGe04vPSPF4eIIoTaC/vMIfSCX+zM
 IPKuamjyUN8Rv8JPQGbe6ndeZwqKfsfSwvMX6BSAk3xf5SDNsPDjLyTrz
 64A0J0cf/QvrCv7GN8YcrhQYX4sbayFkXN32b3euHob0s2r99xwdbauGW
 wVt8ciBF3P6tmkzzVsgD91kjg6wQyDV8IDcYgmoaZRc/kovFsBnb0kjS1
 +8EDNWNeZ3fQueM3SWSXQnsjuddvVpidLkce2wkjzs+QtwWnXJpglKGOa w==;
X-CSE-ConnectionGUID: QOl4i4RwQsmDbgdDwLa7iQ==
X-CSE-MsgGUID: LeN1SCDuSiesyeXdgGrkhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="196141464"
X-IronPort-AV: E=Sophos;i="6.15,203,1739804400"; d="scan'208";a="196141464"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 16:02:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 503CBD6EA5
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 16:02:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D497144DC
 for <ltp@lists.linux.it>; Fri, 11 Apr 2025 16:02:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D3C81A009A;
 Fri, 11 Apr 2025 15:02:26 +0800 (CST)
To: ltp@lists.linux.it
Date: Fri, 11 Apr 2025 15:02:17 +0800
Message-ID: <20250411070217.36799-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] memcontrol02: Fix the doc to fit RST format
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
 testcases/kernel/controllers/memcg/memcontrol02.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/memcontrol02.c b/testcases/kernel/controllers/memcg/memcontrol02.c
index 2d47e5042..101b4e1bf 100644
--- a/testcases/kernel/controllers/memcg/memcontrol02.c
+++ b/testcases/kernel/controllers/memcg/memcontrol02.c
@@ -4,6 +4,7 @@
  * Conversion of second kself test in cgroup/test_memcontrol.c.
  *
  * Original description:
+ *
  * "This test creates a memory cgroup, allocates some anonymous memory
  * and some pagecache and check memory.current and some memory.stat
  * values."
@@ -12,11 +13,11 @@
  * file in V2. Besides error reporting, this test differs from the
  * kselftest in the following ways:
  *
- * . It supports V1.
- * . It writes instead of reads to fill the page cache. Because no
+ * - It supports V1.
+ * - It writes instead of reads to fill the page cache. Because no
  *   pages were allocated on tmpfs.
- * . It runs on most filesystems available
- * . On EXFAT and extN we change the margin of error between all and file
+ * - It runs on most filesystems available
+ * - On EXFAT and extN we change the margin of error between all and file
  *   memory to 50%. Because these allocate non-page-cache memory during writes.
  */
 #define _GNU_SOURCE
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
