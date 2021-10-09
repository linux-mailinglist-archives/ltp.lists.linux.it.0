Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E042777D
	for <lists+linux-ltp@lfdr.de>; Sat,  9 Oct 2021 07:14:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9FD53C4DD6
	for <lists+linux-ltp@lfdr.de>; Sat,  9 Oct 2021 07:14:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 369873C3329
 for <ltp@lists.linux.it>; Sat,  9 Oct 2021 07:14:28 +0200 (CEST)
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E0AA600A37
 for <ltp@lists.linux.it>; Sat,  9 Oct 2021 07:14:23 +0200 (CEST)
X-QQ-mid: bizesmtp38t1633756457t5v3u4n4
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 09 Oct 2021 13:13:54 +0800 (CST)
X-QQ-SSF: 0140000000200040D000B00A0000000
X-QQ-FEAT: hOPADF7UwX5UDWvY18PZoqvH289Wlmk7CXC39i/p4JX9iDCliARp+F4RtxsRW
 PSVI/82CyH5Niu6qsCXFRzMZRPO+QsJr+DOl+Yh0C7M0dYmoa/4MoxLXlPqvOSlYfEh4qV7
 mbmto7zpVeXUfjTZFw2gI1gB0CG/anSpREDrIO3wmVJRfDdDOVjcryB7Tb47C+GAz76jkEO
 rfUoDKD2dbkHYbCGK2EsidPEGlk1sMBeXLTh7orIrRDxwyR+DkpE+TQxTb+6oait62Cs/AA
 WJ/wpu+8FqvmAz7Juul//2rhRM+PNHu4wdSeLeEoFvZU1fgCQcvgqcQquwX1PGPhkSU7+j5
 LNBO+b3nnZYRTEtHyx57UbYuOlX0Q==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Sat,  9 Oct 2021 13:13:52 +0800
Message-Id: <20211009051353.16686-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/readdir01: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/readdir/readdir01.c b/testcases/kernel/syscalls/readdir/readdir01.c
index 15d575b80..f6f7d2d2e 100644
--- a/testcases/kernel/syscalls/readdir/readdir01.c
+++ b/testcases/kernel/syscalls/readdir/readdir01.c
@@ -1,25 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *
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
  * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
  * Mountain View, CA  94043, or:
  *
@@ -30,287 +12,57 @@
  * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
  *
  */
-/* $Id: readdir01.c,v 1.7 2009/03/23 13:36:01 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: readdir01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: write multiple files and try to find them with readdir
- *
- *    TEST CASE TOTAL	:
- *
- *    WALL CLOCK TIME	:
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: Nate Straz
- *
- *    CO-PILOT		:
- *
- *    DATE STARTED	: 02/16/2001
- *
- *    INITIAL RELEASE	: Linux 2.4.x
- *
- *    TEST CASES
- *
- * 	1.) Create n files and check that readdir() finds n files
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *$
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
- *	This is a Phase I test for the readdir(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	readdir(2).
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
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <unistd.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-
- /* The setup and cleanup functions are basic parts of a test case.  These
-  * steps are usually put in separate functions for clarity.  The help function
-  * is only needed when you are adding new command line options.
-  */
-void setup();
-void help();
-void cleanup();
-
-char *TCID = "readdir01";
-int TST_TOTAL = 2;
-
-#define BASENAME	"readdirfile"

-char Basename[255];
-char Fname[255];
-int Nfiles = 0;
-
-char *Nfilearg;
-int Nflag = 0;
+/*\
+ * [Description]
+ *
+ * The test for the readdir(2) system call.
+ * Create n files and check that readdir() finds n files
+ */
+#include <stdio.h>
+#include "tst_test.h"

-option_t options[] = {
-	{"N:", &Nflag, &Nfilearg},	/* -N #files */
-	{NULL, NULL, NULL}
-};
+char prefix[] = "readdirfile";
+char fname[255];
+int nfiles = 10;

-/***********************************************************************
- * Main
- ***********************************************************************/
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-	int cnt;
-	int nfiles, fd;
-	char fname[255];
-	DIR *test_dir;
-	struct dirent *dptr;
-
-	tst_parse_opts(ac, av, options, &help);
-
-	if (Nflag) {
-		if (sscanf(Nfilearg, "%i", &Nfiles) != 1) {
-			tst_brkm(TBROK, NULL, "--N option arg is not a number");
-		}
-	}
-
-    /***************************************************************
-     * perform global setup for test
-     ***************************************************************/
-	/* Next you should run a setup routine to make sure your environment is
-	 * sane.
-	 */
-	setup();
-
-    /***************************************************************
-     * check looping state
-     ***************************************************************/
-	/* TEST_LOOPING() is a macro that will make sure the test continues
-	 * looping according to the standard command line args.
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		if (Nfiles)
-			nfiles = Nfiles;
-		else
-			/* min of 10 links and max of a 100 links */
-			nfiles = (lc % 90) + 10;
-
-		/* create a bunch of files to look at */
-		for (cnt = 0; cnt < nfiles; cnt++) {
-
-			sprintf(fname, "%s%d", Basename, cnt);
-			if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1) {
-				tst_brkm(TBROK, cleanup,
-					 "open(%s, O_RDWR|O_CREAT,0700) Failed, errno=%d : %s",
-					 fname, errno, strerror(errno));
-			} else if (write(fd, "hello\n", 6) < 0) {
-				tst_brkm(TBROK, cleanup,
-					 "write(%s, \"hello\\n\", 6) Failed, errno=%d : %s",
-					 fname, errno, strerror(errno));
-			} else if (close(fd) < 0) {
-				tst_resm(TWARN,
-					"close(%s) Failed, errno=%d : %s",
-					fname, errno, strerror(errno));
-			}
-		}
-
-		if ((test_dir = opendir(".")) == NULL) {
-			tst_resm(TFAIL, "opendir(\".\") Failed, errno=%d : %s",
-				 errno, strerror(errno));
-		} else {
-			/* count the entries we find to see if any are missing */
-			cnt = 0;
-			errno = 0;
-			while ((dptr = readdir(test_dir)) != 0) {
-				if (strcmp(dptr->d_name, ".")
-				    && strcmp(dptr->d_name, ".."))
-					cnt++;
-			}
-
-			if (errno != 0) {
-				tst_resm(TFAIL,
-					 "readir(test_dir) Failed on try %d, errno=%d : %s",
-					 cnt + 1, errno, strerror(errno));
-			}
-			if (cnt == nfiles) {
-				tst_resm(TPASS,
-					 "found all %d that were created",
-					 nfiles);
-			} else if (cnt > nfiles) {
-				tst_resm(TFAIL,
-					 "found more files than were created");
-				tst_resm(TINFO, "created: %d, found: %d",
-					 nfiles, cnt);
-			} else {
-				tst_resm(TFAIL,
-					 "found less files than were created");
-				tst_resm(TINFO, "created: %d, found: %d",
-					 nfiles, cnt);
-			}
-		}
-
-		/* Here we clean up after the test case so we can do another iteration.
-		 */
-		for (cnt = 0; cnt < nfiles; cnt++) {
-
-			sprintf(fname, "%s%d", Basename, cnt);
-
-			if (unlink(fname) == -1) {
-				tst_resm(TWARN,
-					"unlink(%s) Failed, errno=%d : %s",
-					Fname, errno, strerror(errno));
-			}
-		}
-
+	int i;
+	int fd;
+
+	for (i = 0; i < nfiles; i++) {
+		sprintf(fname, "%s_%d", prefix, i);
+		fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700);
+		SAFE_WRITE(1, fd, "hello\n", 6);
+		SAFE_CLOSE(fd);
 	}
-
-    /***************************************************************
-     * cleanup and exit
-     ***************************************************************/
-	cleanup();
-
-	tst_exit();
 }

-/***************************************************************
- * help
- ***************************************************************/
-/* The custom help() function is really simple.  Just write your help message to
- * standard out.  Your help function will be called after the standard options
- * have been printed
- */
-void help(void)
+static void verify_readdir(void)
 {
-	printf("  -N #files : create #files files every iteration\n");
-}
-
-/***************************************************************
- * setup() - performs all ONE TIME setup for this test.
- ***************************************************************/
-void setup(void)
-{
-	/* You will want to enable some signal handling so you can capture
-	 * unexpected signals like SIGSEGV.
-	 */
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* One cavet that hasn't been fixed yet.  TEST_PAUSE contains the code to
-	 * fork the test with the -c option.  You want to make sure you do this
-	 * before you create your temporary directory.
-	 */
-	TEST_PAUSE;
-
-	/* If you are doing any file work, you should use a temporary directory.  We
-	 * provide tst_tmpdir() which will create a uniquely named temporary
-	 * directory and cd into it.  You can now create files in the current
-	 * directory without worrying.
-	 */
-	tst_tmpdir();
+	int cnt = 0;
+	DIR *test_dir;
+	struct dirent *ent;
+
+	test_dir = SAFE_OPENDIR(".");
+	while ((ent = SAFE_READDIR(test_dir))) {
+		if (!strcmp(ent->d_name, ".") || !strcmp(ent->d_name, ".."))
+			continue;
+		if (!strncmp(ent->d_name, prefix, strlen(prefix)))
+			cnt++;
+	}

-	sprintf(Basename, "%s_%d.", BASENAME, getpid());
+	if (cnt == nfiles) {
+		tst_res(TPASS, "found all %d that were created", nfiles);
+	} else {
+		tst_res(TFAIL, "found %s files than were created, created: %d, found: %d",
+					cnt > nfiles ? "more" : "less", nfiles, cnt);
+	}
 }

-/***************************************************************
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- ***************************************************************/
-void cleanup(void)
-{
-
-	/* If you use a temporary directory, you need to be sure you remove it. Use
-	 * tst_rmdir() to do it automatically.$
-	 */
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_readdir,
+	.needs_tmpdir = 1,
+};
\ No newline at end of file
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
