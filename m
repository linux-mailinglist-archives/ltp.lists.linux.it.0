Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9923BAF8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 15:18:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B06FE3C32CC
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 15:18:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E867E3C13D9
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 15:18:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55265601563
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 15:16:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BEA8AEFB
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 13:18:27 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 15:18:11 +0200
Message-Id: <20200804131811.26515-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200804131811.26515-1-mdoucha@suse.cz>
References: <20200804131811.26515-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Add test for CVE 2017-2636
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

Fixes #498

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v2:
- LAPI changes split off to separate patch
- added forgotten .gitignore entry

Sorry about resubmitting so quickly.

 runtest/cve                     |   1 +
 runtest/pty                     |   1 +
 testcases/kernel/pty/.gitignore |   1 +
 testcases/kernel/pty/Makefile   |   4 +-
 testcases/kernel/pty/pty05.c    | 107 ++++++++++++++++++++++++++++++++
 5 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/pty/pty05.c

diff --git a/runtest/cve b/runtest/cve
index fdb455af1..fa37ed38e 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -17,6 +17,7 @@ cve-2016-9604 keyctl08
 cve-2016-9793 setsockopt04
 cve-2016-10044 cve-2016-10044
 cve-2017-2618 cve-2017-2618
+cve-2017-2636 pty05
 cve-2017-2671 cve-2017-2671
 cve-2017-6951 request_key05
 cve-2017-7308 setsockopt02
diff --git a/runtest/pty b/runtest/pty
index 5587312d3..a43b18f2d 100644
--- a/runtest/pty
+++ b/runtest/pty
@@ -3,6 +3,7 @@ pty01 pty01
 pty02 pty02
 pty03 pty03
 pty04 pty04
+pty05 pty05
 ptem01 ptem01
 hangup01 hangup01
 
diff --git a/testcases/kernel/pty/.gitignore b/testcases/kernel/pty/.gitignore
index c67d723d2..7f1048483 100644
--- a/testcases/kernel/pty/.gitignore
+++ b/testcases/kernel/pty/.gitignore
@@ -4,3 +4,4 @@
 /pty02
 /pty03
 /pty04
+/pty05
diff --git a/testcases/kernel/pty/Makefile b/testcases/kernel/pty/Makefile
index 4469775aa..87d70ac1d 100644
--- a/testcases/kernel/pty/Makefile
+++ b/testcases/kernel/pty/Makefile
@@ -24,7 +24,7 @@ top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-pty03: CFLAGS += -pthread
-pty03: LDLIBS += -lrt
+pty03 pty05: CFLAGS += -pthread
+pty03 pty05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/pty/pty05.c b/testcases/kernel/pty/pty05.c
new file mode 100644
index 000000000..6e1d7972a
--- /dev/null
+++ b/testcases/kernel/pty/pty05.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2017-2636
+ *
+ * Check for race between flush_tx_queue() and n_hdlc_send_frames(). Kernel
+ * crash fixed in:
+ *
+ *  commit 82f2341c94d270421f383641b7cd670e474db56b
+ *  Author: Alexander Popov <alex.popov@linux.com>
+ *  Date:   Tue Feb 28 19:54:40 2017 +0300
+ *
+ *  tty: n_hdlc: get rid of racy n_hdlc.tbuf
+ */
+
+#define _GNU_SOURCE
+#include <termios.h>
+#include "lapi/ioctl.h"
+#include "lapi/tty.h"
+
+#include "tst_test.h"
+#include "tst_taint.h"
+#include "tst_fuzzy_sync.h"
+
+#define BUF_SIZE 1
+
+static struct tst_fzsync_pair fzsync_pair;
+static volatile int ptmx = -1;
+static char buf[BUF_SIZE];
+
+static void setup(void)
+{
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	fzsync_pair.exec_loops = 100000;
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		ioctl(ptmx, TCFLSH, TCIOFLUSH);
+		tst_fzsync_end_race_b(&fzsync_pair);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	int ldisc = N_HDLC;
+
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		ptmx = SAFE_OPEN("/dev/ptmx", O_RDWR);
+		TEST(ioctl(ptmx, TIOCSETD, &ldisc));
+
+		if (TST_RET == -1 && TST_ERR == EINVAL) {
+			tst_brk(TCONF, "HDLC line discipline not available");
+		} else if (TST_RET == -1) {
+			tst_brk(TBROK | TTERRNO, "Cannot set line discipline");
+		} else if (TST_RET != 0) {
+			tst_brk(TBROK | TTERRNO,
+				"Invalid ioctl() return value %ld", TST_RET);
+		}
+
+		SAFE_IOCTL(ptmx, TCXONC, TCOOFF);
+		SAFE_WRITE(1, ptmx, buf, BUF_SIZE);
+
+		tst_fzsync_start_race_a(&fzsync_pair);
+		ioctl(ptmx, TCXONC, TCOON);
+		tst_fzsync_end_race_a(&fzsync_pair);
+
+		SAFE_CLOSE(ptmx);
+
+		if (tst_taint_check()) {
+			tst_res(TFAIL, "Kernel is vulnerable");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "Nothing bad happened, probably");
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+
+	if (ptmx >= 0)
+		SAFE_CLOSE(ptmx);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "82f2341c94d27"},
+		{"CVE", "2017-2636"},
+		{}
+	}
+};
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
