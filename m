Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4113BC13
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 10:10:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7498E3C24C6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 10:10:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3D2FE3C1CE5
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 10:09:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 02B52201506
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 10:09:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81887471"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:09:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id ACB734CE20EF
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 17:00:41 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:09:46 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:09:50 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 15 Jan 2020 17:09:54 +0800
Message-ID: <1579079394-18233-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579079394-18233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1579079394-18233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: ACB734CE20EF.A032E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/fcntl37: add error test for fcntl with
 F_SETPIPE_SZ
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
 runtest/syscalls                           |   2 +
 testcases/kernel/syscalls/fcntl/.gitignore |   2 +
 testcases/kernel/syscalls/fcntl/fcntl37.c  | 100 +++++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fcntl/fcntl37.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 92a9ae636..3f33b8661 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -299,6 +299,8 @@ fcntl35 fcntl35
 fcntl35_64 fcntl35_64
 fcntl36 fcntl36
 fcntl36_64 fcntl36_64
+fcntl37 fcntl37
+fcntl37_64 fcntl37_64
 
 fdatasync01 fdatasync01
 fdatasync02 fdatasync02
diff --git a/testcases/kernel/syscalls/fcntl/.gitignore b/testcases/kernel/syscalls/fcntl/.gitignore
index 8d5738f97..be8d9739e 100644
--- a/testcases/kernel/syscalls/fcntl/.gitignore
+++ b/testcases/kernel/syscalls/fcntl/.gitignore
@@ -70,3 +70,5 @@
 /fcntl35_64
 /fcntl36
 /fcntl36_64
+/fcntl37
+/fcntl37_64
diff --git a/testcases/kernel/syscalls/fcntl/fcntl37.c b/testcases/kernel/syscalls/fcntl/fcntl37.c
new file mode 100644
index 000000000..c9f5f15a7
--- /dev/null
+++ b/testcases/kernel/syscalls/fcntl/fcntl37.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ *
+ * Test basic error handling for fcntl(2) using F_SETPIPE_SZ, F_GETPIPE_SZ
+ * argument.
+ * 1)fcntl fails with EINVAL when cmd is F_SETPIPE_SZ and the arg is
+ * beyond UINT_MAX
+ * 2)fcntl fails with EBUSY when cmd is F_SETPIPE_SZ and the arg is smaller
+ * than the amount of the current used buffer space.
+ * 3)fcntl fails with EPERM when cmd is F_SETPIPE_SZ and the arg is over
+ * /proc/sys/fs/pipe-max-size limit under unprivileged users.
+ */
+
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <limits.h>
+#include <stdlib.h>
+#include "tst_test.h"
+#include "lapi/fcntl.h"
+#include "lapi/capability.h"
+
+static int fds[2];
+static unsigned int orig_value, invalid_value, half_value, sys_value;
+static char *wrbuf;
+
+static struct tcase {
+	unsigned int *setvalue;
+	int exp_err;
+	char *message;
+} tcases[] = {
+	{&invalid_value, EINVAL,
+	"cmd is F_SETPIPE_SZ and the arg is beyond UINT_MAX"},
+
+	{&half_value, EBUSY,
+	"cmd is F_SETPIPE_SZ and the arg is smaller than the amount of the current used buffer space"},
+	{&sys_value, EPERM,
+	"cmd is F_SETPIPE_SZ and the arg is over /proc/sys/fs/pipe-max-size limit under unprivileged users"},
+};
+
+static void verify_fcntl(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	tst_res(TINFO, "%s", tc->message);
+
+	TEST(fcntl(fds[1], F_SETPIPE_SZ, *(tc->setvalue)));
+	if (TST_RET != -1)
+		tst_res(TFAIL, "F_SETPIPE_SZ succeed");
+	if (TST_ERR == tc->exp_err)
+		tst_res(TPASS | TTERRNO, "F_SETPIPE_SZ failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "F_SETPIPE_SZ failed expected %s bu got",
+				tst_strerrno(tc->exp_err));
+}
+
+static void setup(void)
+{
+	SAFE_PIPE(fds);
+
+	TEST(fcntl(fds[1], F_GETPIPE_SZ));
+	if (TST_ERR == EINVAL)
+		tst_brk(TCONF, "kernel doesn't support F_GET/SETPIPE_SZ");
+
+	orig_value = TST_RET;
+
+	wrbuf = SAFE_MALLOC(orig_value);
+	memset(wrbuf, 'x', orig_value);
+	SAFE_WRITE(1, fds[1], wrbuf, orig_value);
+
+	SAFE_FILE_SCANF("/proc/sys/fs/pipe-max-size", "%d", &sys_value);
+	sys_value++;
+
+	half_value = orig_value / 2;
+	invalid_value = (1U << 31) + 1;
+}
+
+static void cleanup(void)
+{
+	SAFE_FCNTL(fds[1], F_SETPIPE_SZ, orig_value);
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
+	if (wrbuf)
+		free(wrbuf);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_fcntl,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_RESOURCE),
+		{}
+	},
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
