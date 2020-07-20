Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9535225711
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 07:35:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 062503C2816
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 07:35:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6D7E53C0EC0
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 07:35:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D9ACD200D0E
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 07:35:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; d="scan'208";a="96600690"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 13:35:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8EE054CE505C;
 Mon, 20 Jul 2020 13:35:07 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 13:35:10 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 20 Jul 2020 13:35:09 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 20 Jul 2020 13:27:55 +0800
Message-ID: <20200720052755.21105-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8EE054CE505C.AAB68
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

pidfd_open(2) will set close-on-exec flag on the file descriptor as
it manpage states, so check close-on-exec flag by fcntl(2).

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---

1) We don't care if the test uses the TEST() macro so just keep it.
2) Use bare fcntl() instead of SAFE_FCNTL() so that file descriptor
   can be closed when fcntl(F_GETFD) fails.

 .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
index 93bb86687..f40e9b624 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -3,21 +3,35 @@
  * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
  *
  * Description:
- * Basic pidfd_open() test, fetches the PID of the current process and tries to
- * get its file descriptor.
+ * Basic pidfd_open() test:
+ * 1) Fetch the PID of the current process and try to get its file descriptor.
+ * 2) Check that the close-on-exec flag is set on the file descriptor.
  */
+
+#include <unistd.h>
+#include <fcntl.h>
 #include "tst_test.h"
 #include "lapi/pidfd_open.h"
 
 static void run(void)
 {
+	int flag;
+
 	TEST(pidfd_open(getpid(), 0));
 
 	if (TST_RET == -1)
 		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
 
+	flag = fcntl(TST_RET, F_GETFD);
+
 	SAFE_CLOSE(TST_RET);
 
+	if (flag == -1)
+		tst_brk(TFAIL | TERRNO, "fcntl(F_GETFD) failed");
+
+	if (!(flag & FD_CLOEXEC))
+		tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");
+
 	tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
 }
 
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
