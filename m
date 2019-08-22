Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07799628
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 16:17:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4949E3C1D1D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 16:17:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id EFC7F3C17A2
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 16:17:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E54E11001270
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 16:17:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A81DAEB8
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 14:17:25 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu, 22 Aug 2019 16:17:13 +0200
Message-Id: <20190822141713.26825-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822141713.26825-1-rpalethorpe@suse.com>
References: <20190808153825.18363-2-rpalethorpe@suse.com>
 <20190822141713.26825-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] capability: library tests
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/capability.h           |  8 +++++
 lib/newlib_tests/tst_capability01.c | 50 +++++++++++++++++++++++++++++
 lib/newlib_tests/tst_capability02.c | 35 ++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 lib/newlib_tests/tst_capability01.c
 create mode 100644 lib/newlib_tests/tst_capability02.c

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 02d7a9fda..dac233d84 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -12,10 +12,18 @@
 # include <sys/capability.h>
 #endif
 
+#ifndef CAP_NET_RAW
+# define CAP_NET_RAW          13
+#endif
+
 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif
 
+#ifndef CAP_AUDIT_READ
+# define CAP_AUDIT_READ       37
+#endif
+
 #ifndef CAP_TO_INDEX
 # define CAP_TO_INDEX(x)     ((x) >> 5)
 #endif
diff --git a/lib/newlib_tests/tst_capability01.c b/lib/newlib_tests/tst_capability01.c
new file mode 100644
index 000000000..1a9cb0568
--- /dev/null
+++ b/lib/newlib_tests/tst_capability01.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ *
+ * The user or file requires CAP_NET_RAW for this test to work.
+ * e.g use "$ setcap cap_net_raw=pei tst_capability"
+ */
+
+#include <unistd.h>
+#include <sys/types.h>
+
+#include "tst_test.h"
+#include "tst_capability.h"
+#include "tst_safe_net.h"
+
+#include "lapi/socket.h"
+
+static void run(void)
+{
+	TEST(socket(AF_INET, SOCK_RAW, 1));
+	if (TST_RET > -1) {
+		tst_res(TFAIL, "Created raw socket");
+	} else if (TST_ERR != EPERM) {
+		tst_res(TBROK | TTERRNO,
+			"Failed to create socket for wrong reason");
+	} else {
+		tst_res(TPASS | TTERRNO, "Didn't create raw socket");
+	}
+}
+
+static void setup(void)
+{
+	if (geteuid() == 0)
+		tst_res(TWARN, "CAP_NET_RAW may be ignored when euid == 0");
+
+	TEST(socket(AF_INET, SOCK_RAW, 1));
+	if (TST_RET < 0)
+		tst_brk(TFAIL | TTERRNO, "Can't create raw socket in setup");
+
+	SAFE_CLOSE(TST_RET);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_NET_RAW),
+		{}
+	},
+};
diff --git a/lib/newlib_tests/tst_capability02.c b/lib/newlib_tests/tst_capability02.c
new file mode 100644
index 000000000..45e3f2d22
--- /dev/null
+++ b/lib/newlib_tests/tst_capability02.c
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+
+#include <unistd.h>
+#include <sys/types.h>
+
+#include "tst_test.h"
+#include "tst_capability.h"
+#include "tst_safe_net.h"
+
+#include "lapi/socket.h"
+
+static void run(void)
+{
+	TEST(socket(AF_INET, SOCK_RAW, 1));
+	if (TST_RET > -1) {
+		tst_res(TPASS, "Created raw socket");
+		SAFE_CLOSE(TST_RET);
+	} else {
+		tst_res(TFAIL | TTERRNO, "Didn't create raw socket");
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
+		TST_CAP(TST_CAP_DROP, CAP_AUDIT_READ), /* 64bit capability */
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		{}
+	},
+};
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
