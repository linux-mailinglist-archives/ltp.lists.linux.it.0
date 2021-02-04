Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D530F2F3
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:13:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29F273C7341
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:13:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5CD7C3C7360
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:41 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5B40A60080A
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="104197340"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Feb 2021 20:12:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B7E334CE6D8A;
 Thu,  4 Feb 2021 20:12:27 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Feb 2021 20:12:27 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <liwang@redhat.com>
Date: Thu, 4 Feb 2021 20:12:38 +0800
Message-ID: <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B7E334CE6D8A.AD231
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] tst_mallinfo.c: Add a common print helper for
 mallinfo
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This function can be used for mallopt and subsequent mallinfo/mallinfo2 test.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac           |  1 +
 include/tst_mallinfo.h | 17 +++++++++++++++++
 lib/tst_mallinfo.c     | 28 ++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 include/tst_mallinfo.h
 create mode 100644 lib/tst_mallinfo.c

diff --git a/configure.ac b/configure.ac
index 8bdb96300..223900ca1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -94,6 +94,7 @@ AC_CHECK_FUNCS_ONCE([ \
     io_uring_register \
     io_uring_enter \
     kcmp \
+    mallinfo \
     mallopt \
     mkdirat \
     mknodat \
diff --git a/include/tst_mallinfo.h b/include/tst_mallinfo.h
new file mode 100644
index 000000000..bd69d032c
--- /dev/null
+++ b/include/tst_mallinfo.h
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+#ifndef TST_MALLINFO_H__
+#define TST_MALLINFO_H__
+
+#include <malloc.h>
+#include "config.h"
+
+#ifdef HAVE_MALLINFO
+void tst_print_mallinfo(const char *msg, struct mallinfo *m);
+#endif
+
+#endif
diff --git a/lib/tst_mallinfo.c b/lib/tst_mallinfo.c
new file mode 100644
index 000000000..229e5aa2e
--- /dev/null
+++ b/lib/tst_mallinfo.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_mallinfo.h"
+
+// To DO for mallinfo2
+#ifdef HAVE_MALLINFO
+void tst_print_mallinfo(const char *msg, struct mallinfo *m)
+{
+	tst_res(TINFO, "%s...", msg);
+#define P(f) tst_res(TINFO, "%s: %d", #f, m->f)
+	P(arena);
+	P(ordblks);
+	P(smblks);
+	P(hblks);
+	P(hblkhd);
+	P(usmblks);
+	P(fsmblks);
+	P(uordblks);
+	P(fordblks);
+	P(keepcost);
+}
+#endif
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
