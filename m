Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3141FBEC4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 21:09:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6E253C2D00
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 21:09:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0A6A93C0731
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:09:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3FBB51001124
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:09:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 481B3AE64;
 Tue, 16 Jun 2020 19:09:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 21:09:18 +0200
Message-Id: <20200616190918.24761-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] lapi: Add posix_types.h
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
Cc: Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

To fix undefined __kernel_ulong_t, which was defined in v3.4-rc1
in afead38d011a ("posix_types: Introduce __kernel_[u]long_t").

This fixed build error:

In file included from /usr/src/ltp/include/lapi/msgbuf.h:13,
                 from /usr/src/ltp/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c:9:
/usr/src/ltp/include/lapi/ipcbuf.h: At top level:
/usr/src/ltp/include/lapi/ipcbuf.h:187: error: expected specifier-qualifier-list before '__kernel_ulong_t'

Fixes: 3e1fc0644 ("include: Add declaration of struct ipc64_perm")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

or is it a time to drop that support?
If I remember we were talking about 3.0, this is 3.4.

Is this correct?
+#ifndef __kernel_long_t
+# if defined(__x86_64__) && defined(__ILP32__)
+typedef long long		__kernel_long_t;
+typedef unsigned long long	__kernel_ulong_t;
+# else
+typedef long			__kernel_long_t;
+typedef unsigned long		__kernel_ulong_t;
+# endif
+#endif

Kind regards,
Petr

 include/lapi/ipcbuf.h      |  2 +-
 include/lapi/msgbuf.h      |  2 +-
 include/lapi/posix_types.h | 21 +++++++++++++++++++++
 include/lapi/sembuf.h      |  2 +-
 include/lapi/shmbuf.h      |  2 +-
 include/tst_timer.h        |  7 +------
 6 files changed, 26 insertions(+), 10 deletions(-)
 create mode 100644 include/lapi/posix_types.h

diff --git a/include/lapi/ipcbuf.h b/include/lapi/ipcbuf.h
index 609b2a346..a0b8e3ce3 100644
--- a/include/lapi/ipcbuf.h
+++ b/include/lapi/ipcbuf.h
@@ -8,7 +8,7 @@
 #define IPCBUF_H
 
 #include "config.h"
-#include <linux/posix_types.h>
+#include "lapi/posix_types.h"
 
 #ifndef HAVE_IPC64_PERM
 
diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
index 1e44997c1..f3277270d 100644
--- a/include/lapi/msgbuf.h
+++ b/include/lapi/msgbuf.h
@@ -7,7 +7,7 @@
 #ifndef IPC_MSGBUF_H
 #define IPC_MSGBUF_H
 
-#include <linux/posix_types.h>
+#include "lapi/posix_types.h"
 #include <sys/sem.h>
 #include "tst_timer.h"
 #include "ipcbuf.h"
diff --git a/include/lapi/posix_types.h b/include/lapi/posix_types.h
new file mode 100644
index 000000000..9c0947cca
--- /dev/null
+++ b/include/lapi/posix_types.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2014-2019
+ */
+
+#ifndef POSIX_TYPES_H__
+#define POSIX_TYPES_H__
+
+#include <linux/posix_types.h>
+
+#ifndef __kernel_long_t
+# if defined(__x86_64__) && defined(__ILP32__)
+typedef long long		__kernel_long_t;
+typedef unsigned long long	__kernel_ulong_t;
+# else
+typedef long			__kernel_long_t;
+typedef unsigned long		__kernel_ulong_t;
+# endif
+#endif
+
+#endif /* POSIX_TYPES_H__ */
diff --git a/include/lapi/sembuf.h b/include/lapi/sembuf.h
index 00263abca..4ef0483a0 100644
--- a/include/lapi/sembuf.h
+++ b/include/lapi/sembuf.h
@@ -7,7 +7,7 @@
 #ifndef IPC_SEMBUF_H
 #define IPC_SEMBUF_H
 
-#include <linux/posix_types.h>
+#include "lapi/posix_types.h"
 #include <sys/sem.h>
 #include "tst_timer.h"
 #include "ipcbuf.h"
diff --git a/include/lapi/shmbuf.h b/include/lapi/shmbuf.h
index f8c1294c6..28ee33620 100644
--- a/include/lapi/shmbuf.h
+++ b/include/lapi/shmbuf.h
@@ -7,7 +7,7 @@
 #ifndef IPC_SHMBUF_H
 #define IPC_SHMBUF_H
 
-#include <linux/posix_types.h>
+#include "lapi/posix_types.h"
 #include <sys/sem.h>
 #include "tst_timer.h"
 #include "ipcbuf.h"
diff --git a/include/tst_timer.h b/include/tst_timer.h
index 256e1d71e..cdfddb69a 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -15,6 +15,7 @@
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
+#include "lapi/posix_types.h"
 #include "lapi/syscalls.h"
 
 /*
@@ -93,12 +94,6 @@ static inline long long tst_timeval_diff_ms(struct timeval t1,
 
 #ifndef __kernel_timespec
 
-#if defined(__x86_64__) && defined(__ILP32__)
-typedef long long __kernel_long_t;
-#else
-typedef long __kernel_long_t;
-#endif
-
 typedef __kernel_long_t	__kernel_old_time_t;
 
 struct __kernel_old_timespec {
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
