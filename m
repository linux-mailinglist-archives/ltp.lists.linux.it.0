Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CBA7869D
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Apr 2025 04:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743562203; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=8ojOtkG6DTEOa8hbdE51Z3ZonWWkQcAWRpI2ysumqTI=;
 b=rnfRzvZ8pCEDG6AzXIbOqNehLFRSrWq49+3ocjNUF1DVddPiLEP56uZ9g/qQw+JnWMa/9
 wQgR1ZNufBuZDUs21rsl59qXaml2L8fjUhiKNdAhsyrSpk3xacTFuvgk2E9erY2/Mr12CPl
 9mY7p5QBajwRizmX56n+EOlGv0EU2FU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CBCD3CB098
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Apr 2025 04:50:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AAFFF3CA03B
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 04:49:50 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=139.138.36.225;
 helo=esa10.hc1455-7.c3s2.iphmx.com; envelope-from=maxj.fnst@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com
 [139.138.36.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BCE382009E0
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 04:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1743562189; x=1775098189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=usm7vyWd3/bJc9mE90m7m6OFGUzUWm+W4OT9Snb2rc0=;
 b=FEyHxAeNbIbt2EX3m038FK+dXJ0eJtES4JyVmKKxeR1FFfl/1eqbGEMf
 0uxg54tU0OVJKgN5MeTpyYoAKHspQ4yIIFKU5JH7e5ZP2c5Hq2ORsFLEU
 4s/kH3cc+NQQx8G0JQb3M3a5HMdSp8xqduEIy/XDrMN8V8uTi20zO8S36
 MbpO136GYY1ihyGAOqcAcPQKCKfyEn+mFiMLhmsMhj3sddjHdNJy2e8+K
 Fb2jQDpvIIC854te/NdmVGNBpD6jn3rd6av/RjDXYQ6S8HYeGBEat8dzo
 svpLueUddlYG5HG1t7O0zRX7GE8ySZHJRjkyjNJ2SzpgNi90zxUNujGTM A==;
X-CSE-ConnectionGUID: 3R6joxZORLig3mg9PsmnZA==
X-CSE-MsgGUID: IOf4OO6TT/60Y+Rsb1oD1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="182522824"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; d="scan'208";a="182522824"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:49:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6760D4F67
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 11:49:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7421FD9719
 for <ltp@lists.linux.it>; Wed,  2 Apr 2025 11:49:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.135.101])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id A5BDB1A0071;
 Wed,  2 Apr 2025 10:49:42 +0800 (CST)
To: andrea.cervesato@suse.com,
	ltp@lists.linux.it
Date: Wed,  2 Apr 2025 10:49:29 +0800
Message-ID: <20250402024929.177892-1-maxj.fnst@fujitsu.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <54c380d2-7221-4302-8fa1-ba280610cc4e@suse.com>
References: <54c380d2-7221-4302-8fa1-ba280610cc4e@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] move_pages04: Fix the doc to fit RST format
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
 .../kernel/syscalls/move_pages/move_pages04.c | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/move_pages/move_pages04.c b/testcases/kernel/syscalls/move_pages/move_pages04.c
index e1ee733f0..e2a1fc4fb 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages04.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages04.c
@@ -10,21 +10,21 @@
  *
  * [Algorithm]
  *
- *      1. Pass the address of a valid memory area where no page is
- *         mapped yet (not read/written), the address of a valid memory area
- *         where the shared zero page is mapped (read, but not written to)
- *         and the address of an invalid memory area as page addresses to
- *         move_pages().
- *      2. Check if the corresponding status for "no page mapped" is set to
- *         -ENOENT. Note that kernels >= 4.3 [1] and < 6.12 [2] wrongly returned
- *         -EFAULT by accident.
- *      3. Check if the corresponding status for "shared zero page" is set to:
- *         -EFAULT. Note that kernels < 4.3 [1] wrongly returned -ENOENT.
- *      4. Check if the corresponding status for "invalid memory area" is set
- *         to -EFAULT.
+ * #. Pass the address of a valid memory area where no page is
+ *    mapped yet (not read/written), the address of a valid memory area
+ *    where the shared zero page is mapped (read, but not written to)
+ *    and the address of an invalid memory area as page addresses to
+ *    move_pages().
+ * #. Check if the corresponding status for "no page mapped" is set to
+ *    -ENOENT. Note that kernels >= 4.3 [1] and < 6.12 [2] wrongly returned
+ *    -EFAULT by accident.
+ * #. Check if the corresponding status for "shared zero page" is set to:
+ *    -EFAULT. Note that kernels < 4.3 [1] wrongly returned -ENOENT.
+ * #. Check if the corresponding status for "invalid memory area" is set
+ *    to -EFAULT.
  *
- *   [1] d899844e9c98 "mm: fix status code which move_pages() returns for zero page"
- *   [2] 7dff875c9436 "mm/migrate: convert add_page_for_migration() from follow_page() to folio_walk"
+ * - [1] d899844e9c98 "mm: fix status code which move_pages() returns for zero page"
+ * - [2] 7dff875c9436 "mm/migrate: convert add_page_for_migration() from follow_page() to folio_walk"
  */
 
 #include <sys/mman.h>
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
