Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D558660C
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:38:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01FE63C1D97
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:38:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 68D7A3C1C90
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:38:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9F369601E77
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:38:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99546ADD9
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 15:38:43 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu,  8 Aug 2019 17:38:25 +0200
Message-Id: <20190808153825.18363-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808153825.18363-1-rpalethorpe@suse.com>
References: <20190808153825.18363-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Cc: mmoese@suse.com, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

---
 include/tst_capability.h | 56 +++++++++++++++++++++++++++++
 include/tst_test.h       |  6 ++++
 lib/tst_capability.c     | 78 ++++++++++++++++++++++++++++++++++++++++
 lib/tst_test.c           |  3 ++
 4 files changed, 143 insertions(+)
 create mode 100644 include/tst_capability.h
 create mode 100644 lib/tst_capability.c

diff --git a/include/tst_capability.h b/include/tst_capability.h
new file mode 100644
index 000000000..6342b667e
--- /dev/null
+++ b/include/tst_capability.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+/**
+ * @file tst_capability.h
+ *
+ * Limited capability operations without libcap.
+ */
+
+#include <stdint.h>
+
+#include "lapi/syscalls.h"
+
+#ifndef TST_CAPABILITY_H
+#define TST_CAPABILITY_H
+
+#ifndef CAP_SYS_ADMIN
+# define CAP_SYS_ADMIN        21
+#endif
+
+#ifndef CAP_TO_MASK
+# define CAP_TO_MASK(x)      (1 << ((x) & 31))
+#endif
+
+#define TST_DROP 1
+#define TST_REQUIRE 1 << 1
+
+#define TST_CAP(action, capability) {action, capability, #capability}
+
+struct tst_cap_user_header {
+	uint32_t version;
+	int pid;
+};
+
+struct tst_cap_user_data {
+	uint32_t effective;
+	uint32_t permitted;
+	uint32_t inheritable;
+};
+
+struct tst_cap {
+	uint32_t action;
+	uint32_t id;
+	char *name;
+};
+
+int tst_capget(struct tst_cap_user_header *hdr,
+	       struct tst_cap_user_data *data);
+int tst_capset(struct tst_cap_user_header *hdr,
+	       const struct tst_cap_user_data *data);
+
+void tst_cap_action(struct tst_cap *cap);
+void tst_cap_setup(struct tst_cap *cap);
+
+#endif
diff --git a/include/tst_test.h b/include/tst_test.h
index cdeaf6ad0..84acf2c59 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -36,6 +36,7 @@
 #include "tst_sys_conf.h"
 #include "tst_coredump.h"
 #include "tst_buffers.h"
+#include "tst_capability.h"
 
 /*
  * Reports testcase result.
@@ -206,6 +207,11 @@ struct tst_test {
 	 * NULL-terminated array to be allocated buffers.
 	 */
 	struct tst_buffers *bufs;
+
+	/*
+	 * NULL-terminated array of capability settings
+	 */
+	struct tst_cap *caps;
 };
 
 /*
diff --git a/lib/tst_capability.c b/lib/tst_capability.c
new file mode 100644
index 000000000..d229491ae
--- /dev/null
+++ b/lib/tst_capability.c
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_capability.h"
+
+int tst_capget(struct tst_cap_user_header *hdr,
+	       struct tst_cap_user_data *data)
+{
+	return tst_syscall(__NR_capget, hdr, data);
+}
+
+int tst_capset(struct tst_cap_user_header *hdr,
+	       const struct tst_cap_user_data *data)
+{
+	return tst_syscall(__NR_capset, hdr, data);
+}
+
+void tst_cap_action(struct tst_cap *cap)
+{
+	struct tst_cap_user_header hdr = {
+		.version = 0x20080522,
+		.pid = tst_syscall(__NR_gettid),
+	};
+	struct tst_cap_user_data cur = { 0 };
+	struct tst_cap_user_data new = { 0 };
+	uint32_t mask = CAP_TO_MASK(cap->id);
+	uint32_t act = cap->action;
+
+	if (tst_capget(&hdr, &cur))
+		tst_brk(TBROK | TTERRNO, "tst_capget()");
+
+	new = cur;
+
+	switch (act) {
+	case TST_DROP:
+		if (cur.effective & mask) {
+			tst_res(TINFO, "Dropping %s(%d)",
+				cap->name, cap->id);
+			new.effective &= ~mask;
+			new.permitted &= ~mask;
+			new.inheritable &= ~mask;
+		}
+		break;
+	case TST_REQUIRE:
+		if (cur.permitted ^ mask) {
+			tst_brk(TCONF, "Need %s(%d)",
+				cap->name, cap->id);
+		} else if (cur.effective ^ mask) {
+			tst_res(TINFO, "Permitting %s(%d)",
+				cap->name, cap->id);
+			new.effective |= mask;
+			new.inheritable |= mask;
+		}
+		break;
+	default:
+		tst_brk(TBROK, "Unrecognised action %d", cap->action);
+	}
+
+	if (cur.effective != new.effective) {
+		if (tst_capset(&hdr, &new))
+			tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);
+	} else {
+		tst_res(TINFO, "No capability changes needed");
+	}
+}
+
+void tst_cap_setup(struct tst_cap *caps)
+{
+	struct tst_cap *cap;
+
+	for (cap = caps; cap->action; cap++) {
+		tst_cap_action(cap);
+	}
+}
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8dc71dbb3..62e54d071 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -893,6 +893,9 @@ static void do_test_setup(void)
 
 	if (main_pid != getpid())
 		tst_brk(TBROK, "Runaway child in setup()!");
+
+	if (tst_test->caps)
+		tst_cap_setup(tst_test->caps);
 }
 
 static void do_cleanup(void)
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
