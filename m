Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9210C561
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:45:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 007573C23F3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:45:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1D7173C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:45:15 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 33467100EFA2
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574930713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+EQwaAeJtCQ7eQPX/X8LoREunn8PpWiO7j2ilaXT1cU=;
 b=W7ZcVogWjsONoi7crCSc0q/oSHsPTeXZcZHYSB49yIEd3T/7lOgSeMQqolFO28h3HLJrSq
 Uv9uvnAPLJJvGQPWUJ1pIbEpwsF6O3O5pHBu85HOeqtQZN88Wr8Jy7b6PM0k0oof8qFLAA
 7F8ag6GxyKRK3Tz1P3WFsfD3SefgFlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Uay3jTZ_OE2eZlp_hWVbOw-1; Thu, 28 Nov 2019 03:45:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE3110509AD
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:45:11 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5551979AC
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:45:10 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 16:45:05 +0800
Message-Id: <20191128084506.7587-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Uay3jTZ_OE2eZlp_hWVbOw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: add tst_request_hugepages
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

Note: more and more tests need to configure hugepage before testing, so
this is a start to add some useful hugetlb functions in global library
for the whole LTP.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_hugepage.h | 19 +++++++++++++++++++
 include/tst_test.h     |  1 +
 lib/tst_hugepage.c     | 43 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 include/tst_hugepage.h
 create mode 100644 lib/tst_hugepage.c

diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
new file mode 100644
index 000000000..e06705bd0
--- /dev/null
+++ b/include/tst_hugepage.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Red Hat, Inc.
+ */
+
+#ifndef TST_HUGEPAGE__
+#define TST_HUGEPAGE__
+
+/*
+ * Try to request the specified number of huge pages from system.
+ *
+ * Note: this depend on the status of system memory fragmentation.
+ *       0 - reserve fail
+ *       1 - reserve success
+ */
+int tst_request_hugepages(long hpages);
+
+#endif /* TST_HUGEPAGE_H */
+
diff --git a/include/tst_test.h b/include/tst_test.h
index 21c7dfbdb..7ec1ab865 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -37,6 +37,7 @@
 #include "tst_coredump.h"
 #include "tst_buffers.h"
 #include "tst_capability.h"
+#include "tst_hugepage.h"
 
 /*
  * Reports testcase result.
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
new file mode 100644
index 000000000..00cf90843
--- /dev/null
+++ b/lib/tst_hugepage.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Red Hat, Inc.
+ */
+
+#define TST_NO_DEFAULT_MAIN
+
+#include "tst_test.h"
+#include "tst_hugepage.h"
+
+int tst_request_hugepages(long hpages)
+{
+	int val;
+	long mem_avail, max_hpages;
+
+	if (FILE_LINES_SCANF("/proc/meminfo",
+				"MemAvailable: %ld", &mem_avail)) {
+		/*
+		 * Dropping caches and using "MemFree:" on kernel
+		 * that doesn't have "MemAvailable:" in Meminfo
+		 */
+		tst_res(TINFO, "MemAvailable: not found in /proc/meminfo");
+
+		SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
+		mem_avail = SAFE_READ_MEMINFO("MemFree:");
+	}
+
+	max_hpages = mem_avail / SAFE_READ_MEMINFO("Hugepagesize:");
+
+	if (hpages > max_hpages) {
+		tst_res(TINFO, "Request %ld hugepages failed, memory too fragmented? "
+				"The max hugepage available count %ld",
+				hpages, max_hpages);
+		return 0;
+	}
+
+	SAFE_FILE_PRINTF("/proc/sys/vm/nr_hugepages", "%ld", hpages);
+	SAFE_FILE_SCANF("/proc/sys/vm/nr_hugepages", "%d", &val);
+	if (val != hpages)
+		tst_brk(TBROK, "nr_hugepages = %d, but expect %ld", val, hpages);
+
+	return 1;
+}
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
