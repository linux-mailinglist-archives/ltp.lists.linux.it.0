Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D414BCBF
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 16:23:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DAC23C2469
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 16:23:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C48E33C2458
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 16:23:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 40683140026E
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 16:23:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 984B7ADE3
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 15:23:52 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 16:23:51 +0100
Message-Id: <20200128152351.31779-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] pty03: Add fallback definition for
 TIOCVHANGUP
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

Introduce lapi/ioctl.h with fallback definition for TIOCVHANGUP and make
use of that in pty03 test.

This fixes build on Centos 6.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/lapi/ioctl.h         | 15 +++++++++++++++
 testcases/kernel/pty/pty03.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/ioctl.h

diff --git a/include/lapi/ioctl.h b/include/lapi/ioctl.h
new file mode 100644
index 000000000..a6ef811cd
--- /dev/null
+++ b/include/lapi/ioctl.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#ifndef IOCTL_H__
+#define IOCTL_H__
+
+#include <sys/ioctl.h>
+
+#ifndef TIOCVHANGUP
+# define TIOCVHANGUP 0x5437
+#endif
+
+#endif /* IOCTL_H__ */
diff --git a/testcases/kernel/pty/pty03.c b/testcases/kernel/pty/pty03.c
index 8514aa43d..757d0bf2a 100644
--- a/testcases/kernel/pty/pty03.c
+++ b/testcases/kernel/pty/pty03.c
@@ -28,7 +28,7 @@
 #include <stdio.h>
 #include <errno.h>
 #include <termios.h>
-#include <sys/ioctl.h>
+#include "lapi/ioctl.h"
 
 #include "tst_test.h"
 #include "tst_safe_stdio.h"
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
