Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E417A6AC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:48:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 222B93C6542
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:48:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 02B103C650A
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 84196600BC8
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C15DB125
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 13:48:37 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 14:48:28 +0100
Message-Id: <20200305134834.16736-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200305134834.16736-1-chrubis@suse.cz>
References: <20200305134834.16736-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/8] lapi: Add a configure check and fallback for setns
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 configure.ac         |  1 +
 include/lapi/setns.h | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/lapi/setns.h

diff --git a/configure.ac b/configure.ac
index c9ec39fce..cd52806de 100644
--- a/configure.ac
+++ b/configure.ac
@@ -110,6 +110,7 @@ AC_CHECK_FUNCS([ \
     renameat2 \
     sched_getcpu \
     sendmmsg \
+    setns \
     sigpending \
     splice \
     statx \
diff --git a/include/lapi/setns.h b/include/lapi/setns.h
new file mode 100644
index 000000000..7b0a7afc4
--- /dev/null
+++ b/include/lapi/setns.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#ifndef LAPI_SETNS_H__
+#define LAPI_SETNS_H__
+
+#include "config.h"
+#include "lapi/syscalls.h"
+#include <sched.h>
+
+#ifndef HAVE_SETNS
+int setns(int fd, int nstype)
+{
+	return tst_syscall(__NR_setns, fd, nstype);
+}
+#endif
+
+#endif /* LAPI_SETNS_H__ */
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
