Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE802C4CD4
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 02:49:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05CAE3C5E48
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 02:49:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DDB213C2E47
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 02:49:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A8CBE200975
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 02:48:59 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,370,1599494400"; 
 d="scan'208,223";a="101758786"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Nov 2020 09:48:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 8FF084CE5CD8
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 09:48:52 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Nov 2020 09:48:52 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 26 Nov 2020 09:48:50 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 26 Nov 2020 09:28:38 +0800
Message-ID: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8FF084CE5CD8.AAA3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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

From travis-ci, compiling name_to_handle_at/open_by_handle_at tests
failed on centos6 due to undefined AT_EMPTY_PATH and MAX_HANDLE_SZ.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 include/lapi/fcntl.h             | 4 ++++
 include/lapi/name_to_handle_at.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
index 576a18daf..d6665915f 100644
--- a/include/lapi/fcntl.h
+++ b/include/lapi/fcntl.h
@@ -136,4 +136,8 @@
 # define SPLICE_F_NONBLOCK 2
 #endif
 
+#ifndef MAX_HANDLE_SZ
+# define MAX_HANDLE_SZ	128
+#endif
+
 #endif /* __LAPI_FCNTL_H__ */
diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
index c0759c463..3484133d1 100644
--- a/include/lapi/name_to_handle_at.h
+++ b/include/lapi/name_to_handle_at.h
@@ -10,6 +10,7 @@
 #include <sys/syscall.h>
 #include "config.h"
 #include "lapi/syscalls.h"
+#include "lapi/fcntl.h"
 #include "tst_buffers.h"
 #include "tst_test.h"
 
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
