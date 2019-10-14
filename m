Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C8D62D6
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 14:42:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA1613C2363
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 14:42:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 24FE33C1443
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:42:48 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3FC272002BA
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:42:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1557307D90D
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 12:42:44 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 767925C28C
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 12:42:44 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 14 Oct 2019 14:42:37 +0200
Message-Id: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 14 Oct 2019 12:42:45 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

arm64 kernel with commit 057d3389108e ("mm: untag user pointers passed to
memory syscalls") will assume this is tagged user pointer and will
attempt to clear first byte. This leads to test hitting different error
(EINVAL instead of ENOMEM).

Add a helper function which provides invalid/unused pointer from user
address space.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../conformance/interfaces/mlock/8-1.c             | 11 ++--------
 .../conformance/interfaces/munlock/10-1.c          | 11 ++--------
 .../open_posix_testsuite/include/invalid_helpers.h | 25 ++++++++++++++++++++++
 3 files changed, 29 insertions(+), 18 deletions(-)
 create mode 100644 testcases/open_posix_testsuite/include/invalid_helpers.h

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
index d9569008b82b..5883ff8ec162 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
@@ -20,22 +20,15 @@
 #include <errno.h>
 #include <limits.h>
 #include "posixtest.h"
+#include "invalid_helpers.h"
 
 #define BUFSIZE 8
 
 int main(void)
 {
 	int result;
-	long page_size;
-	void *page_ptr;
+	void *page_ptr = get_invalid_ptr();
 
-	page_size = sysconf(_SC_PAGESIZE);
-	if (errno) {
-		perror("An error occurs when calling sysconf()");
-		return PTS_UNRESOLVED;
-	}
-
-	page_ptr = (void *)(LONG_MAX - (LONG_MAX % page_size));
 	result = mlock(page_ptr, BUFSIZE);
 
 	if (result == -1 && errno == ENOMEM) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
index cf870289b512..1bc3d8015808 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
@@ -20,22 +20,15 @@
 #include <errno.h>
 #include <limits.h>
 #include "posixtest.h"
+#include "invalid_helpers.h"
 
 #define BUFSIZE 8
 
 int main(void)
 {
 	int result;
-	long page_size;
-	void *page_ptr;
+	void *page_ptr = get_invalid_ptr();
 
-	page_size = sysconf(_SC_PAGESIZE);
-	if (errno) {
-		perror("An error occurs when calling sysconf()");
-		return PTS_UNRESOLVED;
-	}
-
-	page_ptr = (void *)(LONG_MAX - (LONG_MAX % page_size));
 	result = munlock(page_ptr, BUFSIZE);
 
 	if (result == -1 && errno == ENOMEM) {
diff --git a/testcases/open_posix_testsuite/include/invalid_helpers.h b/testcases/open_posix_testsuite/include/invalid_helpers.h
new file mode 100644
index 000000000000..7882c783abf6
--- /dev/null
+++ b/testcases/open_posix_testsuite/include/invalid_helpers.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2019 Linux Test Project
+ */
+
+#ifndef __INVALID_HELPERS_H__
+#define __INVALID_HELPERS_H__
+
+#include <stdlib.h>
+#include "safe_helpers.h"
+
+#define DISTANT_AREA_SIZE (128*1024*1024)
+
+static void *get_invalid_ptr(void)
+{
+	int page_size;
+	void *ptr;
+
+	page_size = sysconf(_SC_PAGESIZE);
+	SAFE_PFUNC(posix_memalign(&ptr, page_size, DISTANT_AREA_SIZE));
+	free(ptr);
+
+	return (char *)ptr + (DISTANT_AREA_SIZE / 2);
+}
+
+#endif
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
