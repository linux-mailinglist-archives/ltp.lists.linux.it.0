Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE119C57C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 17:07:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD4313C300A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 17:07:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 48EB03C3030
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 17:07:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 484CF601B08
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 17:06:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,335,1580745600"; d="scan'208";a="88404610"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 23:06:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id B2BCA406AB15
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 22:56:27 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 23:06:46 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 23:06:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 2 Apr 2020 23:06:21 +0800
Message-ID: <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B2BCA406AB15.AFF27
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 01/10] lapi: Add a configure check and fallback for
 loop ioctl and flag
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
 include/lapi/loop.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/lapi/loop.h

diff --git a/configure.ac b/configure.ac
index e1069b57e..e088cb564 100644
--- a/configure.ac
+++ b/configure.ac
@@ -50,6 +50,7 @@ AC_CHECK_HEADERS([ \
     linux/if_ether.h \
     linux/if_packet.h \
     linux/keyctl.h \
+    linux/loop.h \
     linux/mempolicy.h \
     linux/module.h \
     linux/netlink.h \
diff --git a/include/lapi/loop.h b/include/lapi/loop.h
new file mode 100644
index 000000000..bc6d9950d
--- /dev/null
+++ b/include/lapi/loop.h
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+#ifndef LAPI_LOOP_H
+#define LAPI_LOOP_H
+
+#include <linux/types.h>
+#ifdef HAVE_LINUX_LOOP_H
+# include <linux/loop.h>
+#endif
+
+#ifndef LO_FLAGS_PARTSCAN
+# define LO_FLAGS_PARTSCAN 8
+#endif
+
+#ifndef LO_FLAGS_DIRECT_IO
+# define LO_FLAGS_DIRECT_IO 16
+#endif
+
+#ifndef LOOP_SET_CAPACITY
+# define LOOP_SET_CAPACITY 0x4C07
+#endif
+
+#ifndef LOOP_SET_DIRECT_IO
+# define LOOP_SET_DIRECT_IO 0x4C08
+#endif
+
+#ifndef LOOP_SET_BLOCK_SIZE
+# define LOOP_SET_BLOCK_SIZE 0x4C09
+#endif
+
+#endif
+
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
