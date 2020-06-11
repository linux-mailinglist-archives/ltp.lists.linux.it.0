Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44A1F65BC
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74F8B3C2E0D
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 12:36:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 80A113C2E0F
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 31893200D5B
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 12:35:35 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,499,1583164800"; d="scan'208";a="94304149"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2020 18:35:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0494D4CE26CE
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 18:35:29 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Jun 2020 18:35:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 11 Jun 2020 18:35:13 +0800
Message-ID: <1591871716-21250-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0494D4CE26CE.AF197
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/4] lapi: Add fallback for LOOP_CONFIGURE ioctl
 and struct loop_config
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
 configure.ac        |  1 +
 include/lapi/loop.h | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/configure.ac b/configure.ac
index 1d3ea58d0..7d2be1df7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -150,6 +150,7 @@ AC_CHECK_TYPES([struct file_dedupe_range],,,[#include <linux/fs.h>])
 AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
 AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
 AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
+AC_CHECK_TYPES([struct loop_config],,,[#include <linux/loop.h>])
 
 AC_CHECK_TYPES([struct mmsghdr],,,[
 #define _GNU_SOURCE
diff --git a/include/lapi/loop.h b/include/lapi/loop.h
index c69328613..87a902317 100644
--- a/include/lapi/loop.h
+++ b/include/lapi/loop.h
@@ -6,6 +6,7 @@
 #ifndef LAPI_LOOP_H
 #define LAPI_LOOP_H
 
+#include "config.h"
 #include <linux/types.h>
 #include <linux/loop.h>
 
@@ -29,4 +30,26 @@
 # define LOOP_SET_BLOCK_SIZE 0x4C09
 #endif
 
+#ifndef LOOP_CONFIGURE
+# define LOOP_CONFIGURE 0x4C0A
+#endif
+
+#ifndef HAVE_STRUCT_LOOP_CONFIG
+/*
+ * struct loop_config - Complete configuration for a loop device.
+ * @fd: fd of the file to be used as a backing file for the loop device.
+ * @block_size: block size to use; ignored if 0.
+ * @info: struct loop_info64 to configure the loop device with.
+ *
+ * This structure is used with the LOOP_CONFIGURE ioctl, and can be used to
+ * atomically setup and configure all loop device parameters at once.
+ */
+struct loop_config {
+	__u32			fd;
+	__u32                   block_size;
+	struct loop_info64	info;
+	__u64			__reserved[8];
+};
+#endif
+
 #endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
