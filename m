Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87F11A508
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 08:25:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 556673C1B17
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 08:25:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9B1B93C17C4
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 08:25:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D56561A03FC7
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 08:25:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; d="scan'208";a="80011847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 15:25:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id EE1F04CE1A0C
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 15:17:10 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 15:25:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 11 Dec 2019 15:25:58 +0800
Message-ID: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EE1F04CE1A0C.A0B60
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/capget01: Cleanup & convert to new
 library
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

Test capget() syscall on three versions and check the result buf.
I don't want to use ".need_root", so we only can test Effective
set by using ltp capability  library code.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/capget/capget01.c | 161 ++++++--------------
 1 file changed, 49 insertions(+), 112 deletions(-)

diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
index 8a2a8921a..743e307c5 100644
--- a/testcases/kernel/syscalls/capget/capget01.c
+++ b/testcases/kernel/syscalls/capget/capget01.c
@@ -1,127 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
+ *  Author: Saji Kumar.V.R <saji.kumar@wipro.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * Description:
+ * This case tests capget() syscall whether works well on three versions.
+ * Also, it checks the results buffer.
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: capget01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for capget(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the capget(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  call capget()
- *	  if return value == 0
- *		Test passed
- *	  Otherwise
- *		Test failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * capget01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
- ****************************************************************/
-
-#include <errno.h>
-#include <unistd.h>
-#include "test.h"
+#include <sys/types.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-
 #include <linux/capability.h>
 
-static void setup();
-static void cleanup();
-
-char *TCID = "capget01";
-int TST_TOTAL = 1;
+static pid_t pid;
 
-static struct __user_cap_header_struct header;	/* cap_user_header_t is a pointer
-						   to __user_cap_header_struct */
+static struct tcase {
+	int version;
+	char *message;
+} tcases[] = {
+	{0x19980330, "Test on LINUX_CAPABILITY_VERSION_1"},
+	{0x20071026, "Test on LINUX_CAPABILITY_VERSION_2"},
+	{0x20080522, "Test on LINUX_CAPABILITY_VERSION_3"},
+};
 
-static struct __user_cap_data_struct data;	/* cap_user_data_t is a pointer to
-						   __user_cap_data_struct */
-
-int main(int ac, char **av)
+static void verify_capget(unsigned int n)
 {
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* header.version must be _LINUX_CAPABILITY_VERSION */
-	header.version = _LINUX_CAPABILITY_VERSION;
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(ltp_syscall(__NR_capget, &header, &data));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "capget() returned %ld", TEST_RETURN);
-		} else {
-			tst_resm(TFAIL | TTERRNO,
-				 "Test Failed, capget() returned %ld",
-				 TEST_RETURN);
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
+	struct tcase *tc = &tcases[n];
+	struct __user_cap_header_struct hdr = {
+		.version = tc->version,
+		.pid = pid,
+	};
+
+	struct __user_cap_data_struct data;
+
+	tst_res(TINFO, "%s", tc->message);
+
+	TEST(tst_syscall(__NR_capget, &hdr, &data));
+	if (TST_RET == 0)
+		tst_res(TPASS, "capget() returned %ld", TST_RET);
+	else
+		tst_res(TFAIL | TTERRNO, "Test Failed, capget() returned %ld",
+				TST_RET);
+
+	if (data.effective & 1 << CAP_NET_RAW)
+		tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");
+	else
+		tst_res(TPASS, "capget() doesn't get CAP_NET_RAW as expected in PE");
 }
 
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
+	pid = getpid();
 }
 
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_capget,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_NET_RAW),
+		{}
+	},
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
