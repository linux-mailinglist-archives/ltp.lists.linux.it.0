Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67D230F1C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:22:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 613683C5DB0
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 18:22:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5D5DD3C176D
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:42 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 831B91400F28
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 18:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595953359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TCY+P0QHkO7+pfoxkD7WHwjRtX7kVZx7LZiZNZJbwhI=;
 b=INXzTO77VlAEztVyfELoTjsBmqDGFjUURnQdV9is3VITf1ziiVYDIGgQPw2ik9UvmATTtr
 qWFlKkmMgyM8IQMoxVi+vU5TKUDh+H7H9i7RfcxhyHR7NfuhiWe9Xqe2f+fYC6QDUlsZcD
 V3vSlt8kg1rzJqSDLl9DEq6xr0wpIdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-Yqez3zVeO3GwW4NooX5Qjw-1; Tue, 28 Jul 2020 12:22:37 -0400
X-MC-Unique: Yqez3zVeO3GwW4NooX5Qjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 584421902EA0
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 16:22:36 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B135712E8;
 Tue, 28 Jul 2020 16:22:35 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 18:22:05 +0200
Message-Id: <20200728162207.332109-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lib: add function to check for kernel lockdown
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

Some syscalls are not available if the kernel is booted using the
'lockdown' feature. That can cause some tests to report fail, showing
a message like:

  Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7

This patch adds a function that can be used by tests to check for this
case, so it can be handled accordingly.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
v2:
- just return the lockdown status so tests can handle as needed, instead
  of just always skipping the test.
- handle fgets return value to avoid compiler warning (can't return any
  sensible value so I just ported what I have seen in other similar
  cases).
---
 include/tst_lockdown.h |  8 ++++++++
 include/tst_test.h     |  1 +
 lib/tst_lockdown.c     | 31 +++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 include/tst_lockdown.h
 create mode 100644 lib/tst_lockdown.c

diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
new file mode 100644
index 000000000..383026b1e
--- /dev/null
+++ b/include/tst_lockdown.h
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef TST_LOCKDOWN_H
+#define TST_LOCKDOWN_H
+
+int tst_lockdown_enabled(void);
+
+#endif /* TST_LOCKDOWN_H */
diff --git a/include/tst_test.h b/include/tst_test.h
index b84f7b9dd..b02de4597 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -40,6 +40,7 @@
 #include "tst_hugepage.h"
 #include "tst_assert.h"
 #include "tst_cgroup.h"
+#include "tst_lockdown.h"
 
 /*
  * Reports testcase result.
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
new file mode 100644
index 000000000..024047aae
--- /dev/null
+++ b/lib/tst_lockdown.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define TST_NO_DEFAULT_MAIN
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mount.h>
+
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "tst_safe_stdio.h"
+#include "tst_lockdown.h"
+
+int tst_lockdown_enabled(void)
+{
+	char line[BUFSIZ];
+	const char *lockdown_path = "/sys/kernel/security/lockdown";
+	FILE *file;
+
+	if (access("/sys/kernel/security/lockdown", F_OK) != 0) {
+		tst_res(TINFO, "Unable to determine system lockdown state\n");
+		return 0;
+	}
+
+	file = SAFE_FOPEN(lockdown_path, "r");
+	if (!fgets(line, sizeof(line), file))
+		tst_brk(TBROK | TERRNO, "fgets %s", lockdown_path);
+	SAFE_FCLOSE(file);
+
+	return (strstr(line, "[none]") == NULL);
+}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
