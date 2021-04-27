Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26E36C534
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 13:37:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39B163C657A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 13:37:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF1CA3C1948
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 13:37:37 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3E8F614010EB
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 13:37:34 +0200 (CEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FV06v1tNyzBsqR
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 19:35:03 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 27 Apr 2021 19:37:23 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 27 Apr 2021 19:37:39 +0800
Message-ID: <20210427113739.245250-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/io_getevents: Convert io_getevents01 to the
 new API
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

1. Cleanup and convert io_getevents01 to the new API;
2. Instead of using the libaio wrapper function, the system call is
changed to be invoked via syscall(2).

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../syscalls/io_getevents/io_getevents01.c    | 121 +++---------------
 1 file changed, 21 insertions(+), 100 deletions(-)

diff --git a/testcases/kernel/syscalls/io_getevents/io_getevents01.c b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
index b34f17907..820d7fd5b 100644
--- a/testcases/kernel/syscalls/io_getevents/io_getevents01.c
+++ b/testcases/kernel/syscalls/io_getevents/io_getevents01.c
@@ -1,113 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
+ * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*\
+ * [Description]
  *
- *   Copyright (c) Crackerjack Project., 2007
- *   Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
+ * Basic tests for the io_getevents syscall.
  *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
+ * [Algorithm]
  *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Calls io_getevents when ctx_id is invalid or min_nr/nr is out of range
+ * and expects it to return EINVAL.
  */

-/* Porting from Crackerjack to LTP is done
-   by Masatake YAMATO <yamato@redhat.com> */
-
-#include <errno.h>
-#include <string.h>
+#include <linux/aio_abi.h>

 #include "config.h"
-#include "test.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"

-char *TCID = "io_getevents01";
-int TST_TOTAL = 1;
-
-#ifdef HAVE_LIBAIO
-#include <libaio.h>
-
-static void cleanup(void)
+static void run(void)
 {
-}
-
-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
-   DESCRIPTION
-   io_getevents  attempts  to  read  at  least min_nr events and up to nr
-   events from the completion queue  of  the  AIO  context  specified  by
-   ctx_id.   timeout  specifies  the  amount  of time to wait for events,
-   where a NULL timeout waits until at  least  min_nr  events  have  been
-   seen.   Note  that timeout is relative and will be updated if not NULL
-   and the operation blocks.
-
-   RETURN VALUE
-   io_getevents returns the number of events read: 0  if  no  events  are
-   available or < min_nr if the timeout has elapsed.
-
-   ERRORS
-   EINVAL ctx_id  is  invalid.  min_nr  is  out  of range or nr is out of
-   range.
- */
-
-#define EXP_RET (-EINVAL)
-
-int main(int argc, char *argv[])
-{
-	int lc;
-
-	io_context_t ctx;
-
+	aio_context_t ctx;
 	memset(&ctx, 0, sizeof(ctx));
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(io_getevents(ctx, 0, 0, NULL, NULL));
-
-		switch (TEST_RETURN) {
-		case 0:
-			tst_resm(TFAIL, "call succeeded unexpectedly");
-			break;
-		case EXP_RET:
-			tst_resm(TPASS, "expected failure - "
-				 "returned value = %ld : %s", TEST_RETURN,
-				 strerror(-TEST_RETURN));
-			break;
-		case -ENOSYS:
-			tst_resm(TCONF, "io_cancel returned ENOSYS");
-			break;
-		default:
-			tst_resm(TFAIL, "unexpected returned value - %s (%i) - "
-				 "expected %s (%i)", strerror(-TEST_RETURN),
-				 (int)TEST_RETURN, strerror(-EXP_RET), EXP_RET);
-			break;
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	TST_EXP_FAIL(tst_syscall(__NR_io_getevents, ctx, 0, 0, NULL, NULL), EINVAL);
 }

-#else
-int main(void)
-{
-	tst_brkm(TCONF, NULL, "test requires libaio and it's development packages");
-}
-#endif
+static struct tst_test test = {
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
