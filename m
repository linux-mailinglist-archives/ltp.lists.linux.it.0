Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034F179305
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:12:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 164D43C6621
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:12:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 220413C6603
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:12:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66C5E60220A
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:12:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DF74B2D2
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 15:12:07 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2020 16:12:00 +0100
Message-Id: <20200304151201.19117-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: Add safe timerfd macros
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

SAFE_TIMERFD_CREATE(), SAFE_TIMERFD_GETTIME() and SAFE_TIMERFD_SETTIME()

Added only to new C API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

NOTE: ENOSYS is handled by ltp_syscall in lapi/timerfd.h.
+ I wonder include/tst_safe_timerfd.h and lapi/timerfd.h shouldn't be
merged into single file.

Kind regards,
Petr

 include/tst_safe_timerfd.h | 73 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 include/tst_safe_timerfd.h

diff --git a/include/tst_safe_timerfd.h b/include/tst_safe_timerfd.h
new file mode 100644
index 000000000..4019527d6
--- /dev/null
+++ b/include/tst_safe_timerfd.h
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ */
+
+#ifndef TST_SAFE_TIMERFD_H__
+#define TST_SAFE_TIMERFD_H__
+
+#include <errno.h>
+#include "lapi/timerfd.h"
+#include "tst_test.h"
+
+#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
+
+static inline int safe_timerfd_create(const char *file, const int lineno,
+				      int clockid, int flags)
+{
+	int fd;
+
+	fd = timerfd_create(clockid, flags);
+
+	if (fd < 0) {
+		tst_brk(TTYPE | TERRNO, "%s:%d: timerfd_create() failed",
+			file, lineno);
+	}
+
+	return fd;
+}
+
+static inline int safe_timerfd_gettime(const char *file, const int lineno,
+				int fd, struct itimerspec *curr_value)
+{
+	int rval;
+
+	rval = timerfd_gettime(fd, curr_value);
+	if (rval < 0) {
+		tst_brk(TTYPE | TERRNO, "%s:%d: timerfd_gettime() failed",
+			file, lineno);
+	}
+
+	return rval;
+}
+
+static inline int safe_timerfd_settime(const char *file, const int lineno,
+				int fd, int flags,
+				const struct itimerspec *new_value,
+				struct itimerspec *old_value)
+{
+	int rval;
+
+	if (tst_kvercmp(2, 6, 26) <= 0)
+		flags = 0;
+
+	rval = timerfd_settime(fd, flags, new_value, old_value);
+	if (rval < 0) {
+		tst_brk(TTYPE | TERRNO, "%s:%d: timerfd_settime() failed",
+			file, lineno);
+	}
+
+	return rval;
+}
+
+#define SAFE_TIMERFD_CREATE(clockid, flags)\
+	safe_timerfd_create(__FILE__, __LINE__, (clockid), (flags))
+
+#define SAFE_TIMERFD_GETTIME(fd, curr_value)\
+	safe_timerfd_gettime(__FILE__, __LINE__, (fd), (curr_value))
+
+#define SAFE_TIMERFD_SETTIME(fd, flags, new_value, old_value)\
+	safe_timerfd_settime(__FILE__, __LINE__, (fd), (flags), (new_value), \
+						 (old_value))
+
+#endif /* SAFE_TIMERFD_H__ */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
