Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4DE1D6F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:56:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 646763C1CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:56:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0E8113C1C86
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:56:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6FCF1601DBE
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571838979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sGA49jCoCGgk2iZK03OMSvBncTyYTzMbbF4k5LBXouw=;
 b=bJwpzSEqu1b69aEnT5yamUBZtOWgcU3QOne7eKgC8XoqJjaXb+DkHSCIi8gOd3Tm/LS6jy
 kcyLlmdthWXlkjKdaPuzHVQ92PanvP/shNMaPwFo7uZEqhGT7ISFaHKTA6NM7qmIWiqGUb
 9ArFnZAyC7rIoZ2ouuf0uzDvFuEjQws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-TgGkGXWNMAORr4FkZJKuQg-1; Wed, 23 Oct 2019 09:56:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111F9107AD33
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 13:56:16 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8903260BE1
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 13:56:15 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 23 Oct 2019 15:56:04 +0200
Message-Id: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TgGkGXWNMAORr4FkZJKuQg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] timer_create01: accept kernel ENOTSUPP
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

ENOTSUP in userspace is alias for EOPNOTSUPP, so the test still fails.
Add definition of kernel's ENOTSUPP and use that.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/lapi/errno.h                                    | 11 +++++++++++
 testcases/kernel/syscalls/timer_create/timer_create01.c |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/errno.h

diff --git a/include/lapi/errno.h b/include/lapi/errno.h
new file mode 100644
index 000000000000..22c2d4d279d8
--- /dev/null
+++ b/include/lapi/errno.h
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Linux Test Project
+ */
+
+#ifndef _LAPI_ERRNO_H_
+#define _LAPI_ERRNO_H_
+
+#define K_ENOTSUPP	524	/* Operation is not supported */
+
+#endif
diff --git a/testcases/kernel/syscalls/timer_create/timer_create01.c b/testcases/kernel/syscalls/timer_create/timer_create01.c
index 1d0e400d3260..968f917e7876 100644
--- a/testcases/kernel/syscalls/timer_create/timer_create01.c
+++ b/testcases/kernel/syscalls/timer_create/timer_create01.c
@@ -27,6 +27,7 @@
 #include <time.h>
 #include "tst_test.h"
 #include "tst_safe_macros.h"
+#include "lapi/errno.h"
 #include "lapi/common_timers.h"
 
 static struct notif_type {
@@ -81,7 +82,7 @@ static void run(unsigned int n)
 
 		if (TST_RET != 0) {
 			if (possibly_unsupported(clock) &&
-			    (TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
+			    (TST_ERR == EINVAL || TST_ERR == K_ENOTSUPP)) {
 				tst_res(TPASS | TTERRNO,
 					"%s unsupported, failed as expected",
 					get_clock_str(clock));
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
