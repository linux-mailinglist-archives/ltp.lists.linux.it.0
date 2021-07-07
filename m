Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3C3BE677
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:42:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B66783C89D4
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 12:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 742E73C1822
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:42:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DAB19600074
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 12:42:54 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4F4222266A;
 Wed,  7 Jul 2021 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625654574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NoVK+puzBAJ/SdVOS0OAnaSkC2Jz3HPJWcohPwoMFNQ=;
 b=lmpOgst5r32GisQeCtzEySQ8KWiNPDocIUNLF5zsKVAjxqxefjxFs8akhUVy/ePIMLBK5t
 gRlWR/sCltyZaNs4215L5xL0GhfC7UhiJjj/7cOvzpyZpN+k2VCRyj/KiFyluNLqOgqc4c
 yGUbbVu8iMrD7yAul93cJIBiJr3bnWo=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 25181A3B98;
 Wed,  7 Jul 2021 10:42:50 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  7 Jul 2021 11:42:38 +0100
Message-Id: <20210707104238.16251-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] wait403: Reproduce undefined INT_MIN negation
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Acked-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---

V2:
* Use INT_MIN
* Add {} as tags sentinel

 runtest/syscalls                           |  1 +
 testcases/kernel/syscalls/wait4/.gitignore |  1 +
 testcases/kernel/syscalls/wait4/wait403.c  | 42 ++++++++++++++++++++++
 3 files changed, 44 insertions(+)
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
index 000000000..bbd240770
--- /dev/null
+++ b/testcases/kernel/syscalls/wait4/wait403.c
@@ -0,0 +1,42 @@
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
+ * defined so UBSAN will be triggered if enabled. Also see kill13.
+ *
+ * If the bug is present, but UBSAN is not enabled, then it should
+ * result in ECHILD.
+ */
+
+#include <stdlib.h>
+#include <errno.h>
+#include <limits.h>
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
+	TST_EXP_FAIL2(wait4(INT_MIN, &status, 0, &rusage), ESRCH,
+		      "wait4 fails with ESRCH");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "dd83c161fbcc"},
+		{}
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
