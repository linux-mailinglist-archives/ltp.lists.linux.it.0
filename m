Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B845A226F41
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:49:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 793643C4E15
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:49:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4252E3C072E
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:49:55 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D53432009F4
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595274593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KWG8Fp3veKAV2YINLQMro/M7ocrQnzY5wjCnPmyyO7E=;
 b=jGyt22RytcwNnsy7afprvJy0eu0HdWCRSHHvxyYS70ltPx+FUmHalBcYl+Pg/pQnFmfuZA
 IFKvtxd32jDWWMRAneaWJqqm55S+gQViLXKwcaudscjse80XDq7V3a9oWQ6EgSXS/L/sSI
 ASukr188uAHJcWgt7OT2bi7sxdp1TPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-w8nV9yTvNuiKwKYzSBLTQw-1; Mon, 20 Jul 2020 15:49:48 -0400
X-MC-Unique: w8nV9yTvNuiKwKYzSBLTQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC35100AA30
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:49:47 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8B510021B3;
 Mon, 20 Jul 2020 19:49:46 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 20 Jul 2020 21:49:18 +0200
Message-Id: <20200720194920.22784-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
case, so tests can be skipped rather than reporting a test failure.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 include/tst_lockdown.h |  8 ++++++++
 include/tst_test.h     |  1 +
 lib/tst_lockdown.c     | 28 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 include/tst_lockdown.h
 create mode 100644 lib/tst_lockdown.c

diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
new file mode 100644
index 000000000..8db26d943
--- /dev/null
+++ b/include/tst_lockdown.h
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef TST_LOCKDOWN_H
+#define TST_LOCKDOWN_H
+
+void tst_lockdown_skip(void);
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
index 000000000..d57a6bdf3
--- /dev/null
+++ b/lib/tst_lockdown.c
@@ -0,0 +1,28 @@
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
+void tst_lockdown_skip(void)
+{
+	char line[BUFSIZ];
+	FILE *file;
+
+	if (access("/sys/kernel/security/lockdown", F_OK) != 0)
+		return;
+
+	file = SAFE_FOPEN("/sys/kernel/security/lockdown", "r");
+	fgets(line, sizeof(line), file);
+	SAFE_FCLOSE(file);
+
+	if (strstr(line, "[none]") == NULL)
+		tst_brk(TCONF, "Kernel is locked down, skip this test.");
+}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
