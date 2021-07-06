Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAC63BD831
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 16:23:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ADFA3C94E2
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 16:23:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 19FCC3C181C
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 16:23:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A2E7600C4A
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 16:23:28 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 719E42240B;
 Tue,  6 Jul 2021 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625581408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bEQJqhh058MN4/iiOkbiZBnBMtrloUp5dROFjObbbk8=;
 b=ftDNPAcDLy1Iazy6meJ9v1gwzcKRhWdqpMjF5P0NB/hachyOnd/CPjaZox5Upt7MvXy82v
 qlYrn8zs3Sq2OdujHTN+EKMftO5ehrCL+ifrLJ+fBoi8+0q/yc0N5Qm/au1hrUkcTxK3e+
 OjC0hSZBRnGJxVwTSqYI7y3p3lqy530=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 42B6FA3BA7;
 Tue,  6 Jul 2021 14:23:28 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  6 Jul 2021 15:23:25 +0100
Message-Id: <20210706142325.11347-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] wait403: Reproduce undefined INT_MIN negation
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/syscalls                           |  1 +
 testcases/kernel/syscalls/wait4/.gitignore |  1 +
 testcases/kernel/syscalls/wait4/wait403.c  | 40 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 testcases/kernel/syscalls/wait4/wait403.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 98fe3c02e..128eaadd2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1663,6 +1663,7 @@ wait02 wait02
 
 wait401 wait401
 wait402 wait402
+wait403 wait403
 
 waitpid01 waitpid01
 waitpid02 waitpid02
diff --git a/testcases/kernel/syscalls/wait4/.gitignore b/testcases/kernel/syscalls/wait4/.gitignore
index 9313eb72c..577f73479 100644
--- a/testcases/kernel/syscalls/wait4/.gitignore
+++ b/testcases/kernel/syscalls/wait4/.gitignore
@@ -1,2 +1,3 @@
 /wait401
 /wait402
+/wait403
diff --git a/testcases/kernel/syscalls/wait4/wait403.c b/testcases/kernel/syscalls/wait4/wait403.c
new file mode 100644
index 000000000..262351b7c
--- /dev/null
+++ b/testcases/kernel/syscalls/wait4/wait403.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+/*
+ * [Description]
+ *
+ * Check wait4(INT_MIN, ...) is not allowed. The pid is negated before
+ * searching for a group with that pid. Negating INT_MIN is not
+ * defined so UBSAN will be triggered if enabled.
+ *
+ * If the bug is present, but UBSAN is not enabled, then it should
+ * result in ECHILD.
+ */
+
+#include <stdlib.h>
+#include <errno.h>
+#define _USE_BSD
+#include <sys/types.h>
+#include <sys/resource.h>
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	int status = 1;
+	struct rusage rusage;
+
+	TST_EXP_FAIL2(wait4(-2147483648, &status, 0, &rusage), ESRCH,
+		      "wait4 fails with ESRCH");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "dd83c161fbcc"},
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
