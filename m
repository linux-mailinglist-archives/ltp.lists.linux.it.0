Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334F30BEFC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:04:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F12513C7443
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:04:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 770A13C2EE1
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:04:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1DE241A00E1C
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:04:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7275B000;
 Tue,  2 Feb 2021 13:04:48 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 14:04:40 +0100
Message-Id: <20210202130441.17861-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: Add function to detect FIPS mode
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_fips.h | 17 +++++++++++++++++
 include/tst_test.h |  1 +
 lib/tst_fips.c     | 22 ++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 include/tst_fips.h
 create mode 100644 lib/tst_fips.c

diff --git a/include/tst_fips.h b/include/tst_fips.h
new file mode 100644
index 000000000..2bc90e8e8
--- /dev/null
+++ b/include/tst_fips.h
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+ */
+
+#ifndef TST_FIPS_H__
+#define TST_FIPS_H__
+
+#define PATH_FIPS	"/proc/sys/crypto/fips_enabled"
+
+/*
+ * Detect whether FIPS enabled
+ * @return 0: FIPS not enabled, 1: FIPS enabled
+ */
+int tst_fips_enabled(void);
+
+#endif /* TST_FIPS_H__ */
diff --git a/include/tst_test.h b/include/tst_test.h
index c87251870..84cbcbb0c 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -42,6 +42,7 @@
 #include "tst_assert.h"
 #include "tst_cgroup.h"
 #include "tst_lockdown.h"
+#include "tst_fips.h"
 #include "tst_taint.h"
 
 /*
diff --git a/lib/tst_fips.c b/lib/tst_fips.c
new file mode 100644
index 000000000..c1d3e284c
--- /dev/null
+++ b/lib/tst_fips.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "tst_fips.h"
+
+int tst_fips_enabled(void)
+{
+	int fips = 0;
+
+	if (access(PATH_FIPS, R_OK) == 0) {
+		SAFE_FILE_SCANF(PATH_FIPS, "%d", &fips);
+	}
+
+	tst_res(TINFO, "FIPS: %s", fips ? "on" : "off");
+	return fips;
+}
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
