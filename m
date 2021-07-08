Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF713BF6B5
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:07:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7301A3C6824
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 10:07:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E23933C2A8B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:06:59 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8F8B2200DBA
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 10:06:22 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GL7yQ3N65z1CGbw
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 16:00:46 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 16:06:16 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 16:06:16 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 8 Jul 2021 16:07:20 +0800
Message-ID: <20210708080720.18997-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] gethostid: Rewrite with newlib and use/test sethostid
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

1. Rewrite gethostid01 with newlib.
2. Use and test sethostid syscall which helps increase coverage and remove the need for configuration.

Fixes: #743
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/gethostid/gethostid01.c   | 279 +++---------------
 1 file changed, 41 insertions(+), 238 deletions(-)

diff --git a/testcases/kernel/syscalls/gethostid/gethostid01.c b/testcases/kernel/syscalls/gethostid/gethostid01.c
index 241335af7..9758e19aa 100644
--- a/testcases/kernel/syscalls/gethostid/gethostid01.c
+++ b/testcases/kernel/syscalls/gethostid/gethostid01.c
@@ -1,258 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- *
+ * AUTHOR: William Roske
+ * CO-PILOT: Dave Fenner
+ * 12/2002 Paul Larson: Add functional test to compare output from hostid
+ * command and gethostid().
+ * 01/2003 Robbie Williamson: Add code to handle distros that add "0x" to
+ * beginning of `hostid` output.
+ * 01/2006  Marty Ridgeway: Correct 64 bit check so the second 64 bit check
+ * doesn't clobber the first 64 bit check.
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
+ * 07/2021 Xie Ziyao: Rewrite with newlib and use/test sethostid.
  */
-/* $Id: gethostid01.c,v 1.23 2009/03/23 13:35:42 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: gethostid01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for gethostid(2)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 1
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: William Roske
- *
- *    CO-PILOT		: Dave Fenner
- *
- *    DATE STARTED	: 03/30/92
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- * 	1.) gethostid(2) returns...(See Description)
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    DURATION
- * 	Terminates - with frequency and infinite modes.
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    RESOURCES
- * 	None
- *
- *    ENVIRONMENTAL NEEDS
- *      No run-time environmental needs.
- *
- *    SPECIAL PROCEDURAL REQUIREMENTS
- * 	None
- *
- *    INTERCASE DEPENDENCIES
- * 	None
- *
- *    DETAILED DESCRIPTION
- *	This is a Phase I test for the gethostid(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	gethostid(2).
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * 	History:
- * 	  12/2002 Paul Larson - Added functional test to compare
- * 	  	output from hostid command and gethostid()
- *
- *        01/2003 Robbie Williamson - Added code to handle
- *              distros that add "0x" to beginning of `hostid`
- *              output.
- *
- *   01/31/2006  Marty Ridgeway - Corrected 64 bit check so
- *              the second 64 bit check doesn't clobber the first 64 bit
- *              check
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
-
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <unistd.h>
-
-#include "test.h"

-#define HOSTIDLEN 40
-/* Bitmasks for the 64 bit operating system checks */
-#define FIRST_64_CHKBIT  0x01
-#define SECOND_64_CHKBIT 0x02
+/*\
+ * [Description]
+ *
+ * Test the basic functionality of the sethostid() and gethostid() system call.
+ */

-void setup();
-void cleanup();
+#include "tst_test.h"

-char *TCID = "gethostid01";
-int TST_TOTAL = 1;
+static long origin;
+static long tc[] = {0x00000000, 0x0000ffff};

-int main(int ac, char **av)
+static void run(unsigned int i)
 {
-	int lc, i, j;		/* loop counters */
-	int bit_64 = 0;
-	char *result;
-	char name[HOSTIDLEN], name2[HOSTIDLEN], hostid[HOSTIDLEN],
-	    hostid2[HOSTIDLEN], *hostid3, hex[2] = "0x";
-	char hex_64[8] = "ffffffff";
-	FILE *fp;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(gethostid());
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "gethostid failed");
-			continue;	/* next loop for MTKERNEL */
-		}
-		sprintf(hostid, "%08lx", TEST_RETURN);
+	TST_EXP_PASS(sethostid(tc[i]), "set hostid to %ld", tc[i]);
+	TEST(gethostid());

-		if (system("hostid > hostid.x") == -1)
-			tst_brkm(TFAIL, cleanup,
-				 "system() returned errno %d", errno);
-		if ((fp = fopen("hostid.x", "r")) == NULL)
-			tst_brkm(TFAIL, cleanup, "fopen failed");
-		if (fgets(name, HOSTIDLEN, fp) == NULL)
-			tst_brkm(TFAIL, cleanup, "fgets failed");
-		fclose(fp);
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "gethostid failed");

-		name[strlen(name) - 1] = 0;
-
-		if (strstr(hostid, "000000"))
-			tst_resm(TCONF, "Host ID has not been set.");
-
-		if (strcmp(name, hostid) == 0) {
-			tst_resm(TPASS,
-				 "Hostid command and gethostid both report "
-				 "hostid is %s", hostid);
-		} else {
-
-			/*
-			 * Some distros add an "0x" to the front of the
-			 * `hostid` output. We compare the first 2
-			 * characters of the `hostid` output with "0x",
-			 * if it's equal, remove these first 2
-			 * characters & re-test. -RW
-			 */
-			if (name[0] == hex[0] && name[1] == hex[1])
-				for (i = 0; i < 38; i++)
-					name2[i] = name[i + 2];
-			else
-				strncpy(name2, name, HOSTIDLEN);
-
-			/*
-			 * This code handles situations where ffffffff
-			 * is appended. Fixed to not clobber the first
-			 * check with the 2nd check MR
-			 */
-
-			if (0 == strncmp(hostid, hex_64, 8))
-				bit_64 |= FIRST_64_CHKBIT;
-
-			if (0 == strncmp(name2, hex_64, 8))
-				bit_64 |= SECOND_64_CHKBIT;
-
-			if (bit_64 & FIRST_64_CHKBIT)
-				for (j = 0; j < 8; j++)
-					hostid2[j] = hostid[j + 8];
-			else
-				strncpy(hostid2, hostid,
-					strlen(hostid) + 1);
-
-			if (bit_64 & SECOND_64_CHKBIT)
-				for (j = 0; j < 9; j++)
-					name2[j] = name2[j + 8];
-
-			if ((result = strstr(hostid2, name2)) != NULL) {
-				hostid3 = strdup(name2);
-
-				tst_resm(TPASS,
-					 "Hostid command reports "
-					 "hostid is %s, and gethostid "
-					 "reports %s", name2, hostid3);
-			} else
-				tst_resm(TFAIL,
-					 "Hostid command reports "
-					 "hostid is %s, but gethostid "
-					 "reports %s", name2, hostid2);
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	if (tc[i] == TST_RET)
+		tst_res(TPASS, "hostid is %ld, expected %ld", TST_RET, tc[i]);
+	else
+		tst_res(TFAIL, "hostid is %ld, expected %ld", TST_RET, tc[i]);
 }

 void setup(void)
 {
-	char path[2048];
-
-	if (tst_get_path("hostid", path, sizeof(path)))
-		tst_brkm(TCONF, NULL, "Couldn't find hostid in $PATH");
+	TEST(gethostid());

-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "gethostid failed");
+	tst_res(TINFO, "get original hostid: %ld", origin = TST_RET);
 }

 void cleanup(void)
 {
-	tst_rmdir();
-
+	TST_EXP_PASS(sethostid(origin), "set hostid to %ld", origin);
 }
+
+static struct tst_test test = {
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.tcnt = ARRAY_SIZE(tc),
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
