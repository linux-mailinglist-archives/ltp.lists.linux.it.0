Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F851CA2EE
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 07:47:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A93E3C56F1
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 07:47:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EB9BF3C56E7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 07:47:13 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C21BC201284
 for <ltp@lists.linux.it>; Fri,  8 May 2020 07:47:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,366,1583164800"; d="scan'208";a="91677183"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 May 2020 13:46:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 63F0946B5FAE
 for <ltp@lists.linux.it>; Fri,  8 May 2020 13:46:51 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 May 2020 13:46:51 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 8 May 2020 13:47:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 8 May 2020 13:47:08 +0800
Message-ID: <1588916828-4228-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 63F0946B5FAE.AD899
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_loop01: Add linux git tag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index faef22e47..2d9733f95 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -12,6 +12,9 @@
  * For LO_FLAGS_PARTSCAN flag, it is the same as LO_FLAGS_AUTOCLEAR flag.
  * But we also check whether we can scan partition table correctly ie check
  * whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
+ *
+ * It is also a regression test for kernel
+ * commit 10c70d95c0f2 ("block: remove the bd_openers checks in blk_drop_partitions").
  */
 
 #include <stdio.h>
@@ -137,5 +140,9 @@ static struct tst_test test = {
 		"loop",
 		NULL
 	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "10c70d95c0f2"},
+		{}
+	},
 	.needs_tmpdir = 1,
 };
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
