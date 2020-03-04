Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F49179814
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 19:38:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 369C23C664F
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 19:38:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B953A3C6626
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 19:38:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D7C9E10028AB
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 19:38:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 189D3AC79
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 18:38:12 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2020 19:38:05 +0100
Message-Id: <20200304183806.17672-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Changes v1->v2:
* patch based on 1st and 2nd patch from Cyril's patchset "[01/12] lib:
* Move tst_clock_name() to tst_clock.c" (now posted only these 2)
https://patchwork.ozlabs.org/project/ltp/list/?series=162390&state=*
* Move implementation code to C file
* drop version check. BTW I was wrong, timerfd_create() requires flags
  to be zero (I had code in timerfd_settime()). And this is correctly
  handled in old tests (old tests which use non-zero flag already
  require correctly 2.6.27 instead of 2.6.25).
* check return for == -1 (instead of < 0)

NOTE: I decided ignore errno reset (and not use TEST()), as I agree with
Cyril ("Generally the syscalls in libc have single macro definition that
is used everywhere to copy the error from the errno variable. If that
piece of code is buggy half of the test in LTP would fail anyway.")

Kind regards,
Petr

 include/tst_safe_timerfd.h | 32 +++++++++++++++++++++
 lib/tst_safe_timerfd.c     | 59 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 include/tst_safe_timerfd.h
 create mode 100644 lib/tst_safe_timerfd.c

diff --git a/include/tst_safe_timerfd.h b/include/tst_safe_timerfd.h
new file mode 100644
index 000000000..526f12838
--- /dev/null
+++ b/include/tst_safe_timerfd.h
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ */
+
+#ifndef TST_SAFE_TIMERFD_H__
+#define TST_SAFE_TIMERFD_H__
+
+#include "lapi/timerfd.h"
+
+int safe_timerfd_create(const char *file, const int lineno,
+				      int clockid, int flags);
+
+#define SAFE_TIMERFD_CREATE(clockid, flags)\
+	safe_timerfd_create(__FILE__, __LINE__, (clockid), (flags))
+
+int safe_timerfd_gettime(const char *file, const int lineno,
+				int fd, struct itimerspec *curr_value);
+
+#define SAFE_TIMERFD_GETTIME(fd, curr_value)\
+	safe_timerfd_gettime(__FILE__, __LINE__, (fd), (curr_value))
+
+int safe_timerfd_settime(const char *file, const int lineno,
+				int fd, int flags,
+				const struct itimerspec *new_value,
+				struct itimerspec *old_value);
+
+#define SAFE_TIMERFD_SETTIME(fd, flags, new_value, old_value)\
+	safe_timerfd_settime(__FILE__, __LINE__, (fd), (flags), (new_value), \
+						 (old_value))
+
+#endif /* SAFE_TIMERFD_H__ */
diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
new file mode 100644
index 000000000..80de87ad3
--- /dev/null
+++ b/lib/tst_safe_timerfd.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ */
+
+#include <errno.h>
+
+#include "tst_safe_timerfd.h"
+#include "lapi/timerfd.h"
+#include "tst_clocks.h"
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
+
+int safe_timerfd_create(const char *file, const int lineno,
+				      int clockid, int flags)
+{
+	int fd;
+
+	fd = timerfd_create(clockid, flags);
+
+	if (fd == -1) {
+		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
+			file, lineno, tst_clock_name(clockid));
+	}
+
+	return fd;
+}
+
+int safe_timerfd_gettime(const char *file, const int lineno,
+				int fd, struct itimerspec *curr_value)
+{
+	int rval;
+
+	rval = timerfd_gettime(fd, curr_value);
+	if (rval == -1) {
+		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
+			file, lineno);
+	}
+
+	return rval;
+}
+
+int safe_timerfd_settime(const char *file, const int lineno,
+				int fd, int flags,
+				const struct itimerspec *new_value,
+				struct itimerspec *old_value)
+{
+	int rval;
+
+	rval = timerfd_settime(fd, flags, new_value, old_value);
+	if (rval == -1) {
+		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_settime() failed",
+			file, lineno);
+	}
+
+	return rval;
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
