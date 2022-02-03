Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D54A8033
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Feb 2022 09:19:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C0973C98DF
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Feb 2022 09:19:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 71AD83C8F8A
 for <ltp@lists.linux.it>; Thu,  3 Feb 2022 09:19:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF237200906
 for <ltp@lists.linux.it>; Thu,  3 Feb 2022 09:19:13 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 259FC21111;
 Thu,  3 Feb 2022 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1643876353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CU37hbo2o5J4fj6vIv/MqGp+YElKsr4wEuMIDGj4Lu4=;
 b=uhL+IwTWkF4MzN+DpswAy9+ol31r+R7rbh0NJCCO6aCXH80Gef+4zo6q7uo8t7y5VGSxiK
 x09Z5UMY3lhCJhllnpST1cjFjCJ7FESq3olq9xqHcLxA8Oe+Ak91kGZ1f8WUH79QTzlFhv
 R7w8se45WY9Y3goazUYOJAPqYZ4xvgE=
Received: from g78.suse.de (unknown [10.163.24.138])
 by relay2.suse.de (Postfix) with ESMTP id E95E9A3B81;
 Thu,  3 Feb 2022 08:19:12 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu,  3 Feb 2022 08:18:15 +0000
Message-Id: <20220203081820.29521-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203081820.29521-1-rpalethorpe@suse.com>
References: <20220203081820.29521-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] memcontrol: Lift out some common definitions
 into a shared header
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

Some simple functions can be shared between tests. The original
selftests share a bit more. However this doesn't make as much sense in
LTP due to library differences.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 .../kernel/controllers/memcg/memcontrol02.c   | 32 +------------
 .../controllers/memcg/memcontrol_common.h     | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+), 31 deletions(-)
 create mode 100644 testcases/kernel/controllers/memcg/memcontrol_common.h

diff --git a/testcases/kernel/controllers/memcg/memcontrol02.c b/testcases/kernel/controllers/memcg/memcontrol02.c
index 548f36829..d5a24cc0a 100644
--- a/testcases/kernel/controllers/memcg/memcontrol02.c
+++ b/testcases/kernel/controllers/memcg/memcontrol02.c
@@ -23,14 +23,7 @@
  */
 #define _GNU_SOURCE
 
-#include <stdlib.h>
-#include <stdio.h>
-
-#include "tst_test.h"
-#include "tst_cgroup.h"
-
-#define TMPDIR "mntdir"
-#define MB(x) (x << 20)
+#include "memcontrol_common.h"
 
 static size_t page_size;
 static const struct tst_cgroup_group *cg_test;
@@ -38,20 +31,6 @@ static struct tst_cgroup_group *cg_child;
 static int fd;
 static int file_to_all_error = 10;
 
-/*
- * Checks if two given values differ by less than err% of their
- * sum. An extra percent is added for every doubling of the page size
- * to compensate for wastage in page sized allocations.
- */
-static inline int values_close(const ssize_t a,
-			       const ssize_t b,
-			       const ssize_t err)
-{
-	const ssize_t page_adjusted_err = ffs(page_size >> 13) + err;
-
-	return 100 * labs(a - b) <= (a + b) * page_adjusted_err;
-}
-
 static void alloc_anon_50M_check(void)
 {
 	const ssize_t size = MB(50);
@@ -78,15 +57,6 @@ static void alloc_anon_50M_check(void)
 		     current, anon);
 }
 
-static void alloc_pagecache(const int fd, size_t size)
-{
-	char buf[BUFSIZ];
-	size_t i;
-
-	for (i = 0; i < size; i += sizeof(buf))
-		SAFE_WRITE(1, fd, buf, sizeof(buf));
-}
-
 static void alloc_pagecache_50M_check(void)
 {
 	const size_t size = MB(50);
diff --git a/testcases/kernel/controllers/memcg/memcontrol_common.h b/testcases/kernel/controllers/memcg/memcontrol_common.h
new file mode 100644
index 000000000..67f3ca318
--- /dev/null
+++ b/testcases/kernel/controllers/memcg/memcontrol_common.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdlib.h>
+#include <stdio.h>
+
+#include "tst_test.h"
+#include "tst_cgroup.h"
+
+#define TMPDIR "mntdir"
+#define MB(x) (x << 20)
+
+/*
+ * Checks if two given values differ by less than err% of their
+ * sum. An extra percent is added for every doubling of the page size
+ * to compensate for wastage in page sized allocations.
+ */
+static inline int values_close(const ssize_t a,
+			       const ssize_t b,
+			       const ssize_t err)
+{
+	const size_t page_size = SAFE_SYSCONF(_SC_PAGESIZE);
+	const ssize_t page_adjusted_err = ffs(page_size >> 13) + err;
+
+	return 100 * labs(a - b) <= (a + b) * page_adjusted_err;
+}
+
+static inline void alloc_pagecache(const int fd, size_t size)
+{
+	char buf[BUFSIZ];
+	size_t i;
+
+	SAFE_LSEEK(fd, 0, SEEK_END);
+
+	for (i = 0; i < size; i += sizeof(buf))
+		SAFE_WRITE(1, fd, buf, sizeof(buf));
+}
+
+static inline void alloc_anon(const size_t size)
+{
+	const size_t page_size = SAFE_SYSCONF(_SC_PAGESIZE);
+	char *const buf = SAFE_MALLOC(size);
+	size_t i;
+
+	for (i = 0; i < size; i += page_size)
+		buf[i] = 0;
+
+	free(buf);
+}
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
