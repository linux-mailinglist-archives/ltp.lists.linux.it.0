Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6EF2AFCB6
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 02:46:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 753D83C5358
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 02:46:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D09E83C2628
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 02:46:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0E7E56008E5
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 02:46:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="101256543"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2020 09:46:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4B4B248990EB;
 Thu, 12 Nov 2020 09:46:26 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 12 Nov 2020 09:46:25 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 12 Nov 2020 09:46:24 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 12 Nov 2020 09:26:13 +0800
Message-ID: <20201112012613.1426897-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111145733.GC16874@yuki.lan>
References: <20201111145733.GC16874@yuki.lan>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4B4B248990EB.AA396
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/uname02: Convert to new API and
 cleanup
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

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/uname/uname02.c | 121 ++++------------------
 1 file changed, 21 insertions(+), 100 deletions(-)

diff --git a/testcases/kernel/syscalls/uname/uname02.c b/testcases/kernel/syscalls/uname/uname02.c
index 8b45a763d..09c26939e 100644
--- a/testcases/kernel/syscalls/uname/uname02.c
+++ b/testcases/kernel/syscalls/uname/uname02.c
@@ -1,119 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
- *   Copyright (c) International Business Machines  Corp., 2001
+ * Copyright (c) International Business Machines  Corp., 2001
  *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
+ * Basic test for uname():
+ * Calling uname() with invalid buf got EFAULT.
  *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
-/*
- * NAME
- *	uname02.c
- *
- * DESCRIPTION
- *	uname02 - call uname() with an invalid address to produce a failure
- *
- * ALGORITHM
- *	loop if that option was specified
- *	issue the system call
- *	check the errno value
- *	  issue a PASS message if we get EFAULT - errno 14
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	  break any remaining tests
- *	  call cleanup
- *
- * USAGE:  <for command-line>
- *  uname02 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
- *		where,  -c n : Run n copies concurrently.
- *			-e   : Turn on errno logging.
- *			-i n : Execute test n times.
- *			-I x : Execute test for x seconds.
- *			-P x : Pause for x seconds between iterations.
- *			-t   : Turn on syscall timing.
- *
- * History
- *	07/2001 John George
- *		-Ported
- *
- * Restrictions
- *	none
- */
-
-#include "test.h"
-
 #include <errno.h>
 #include <sys/utsname.h>
+#include "tst_test.h"
 
-void cleanup(void);
-void setup(void);
+static void *bad_addr;
 
-char *TCID = "uname02";
-int TST_TOTAL = 1;
-
-#if !defined(UCLINUX)
-
-int main(int ac, char **av)
+static void verify_uname(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		/*
-		 * call the system call with the TEST() macro
-		 * send -1 for an illegal address
-		 */
-
-		TEST(uname((struct utsname *)-1));
-
-		if (TEST_RETURN == 0)
-			tst_resm(TFAIL, "call succeed when failure expected");
-
-		switch (TEST_ERRNO) {
-		case EFAULT:
-			tst_resm(TPASS | TTERRNO, "uname failed as expected");
-			break;
-		default:
-			tst_resm(TFAIL | TTERRNO, "uname failed unexpectedly");
-		}
+	TEST(uname((struct utsname *)bad_addr));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "uname() succeed when failure expected");
+		return;
 	}
 
-	cleanup();
-
-	tst_exit();
+	if (TST_ERR == EFAULT)
+		tst_res(TPASS, "uname() got EFAULT as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "uname() failed unexpectedly");
 
 }
 
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	bad_addr = tst_get_bad_addr(NULL);
 }
 
-void cleanup(void)
-{
-}
-#else
-int main(void)
-{
-	tst_resm(TCONF, NULL, "test is not available on uClinux");
-}
-#endif /* if !defined(UCLINUX) */
+static struct tst_test test = {
+	.test_all = verify_uname,
+	.setup = setup,
+};
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
