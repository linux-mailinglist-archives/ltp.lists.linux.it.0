Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFE349964
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58D8A3C538E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 72BB73C8E43
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:20:04 +0100 (CET)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ACC2A1401219
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:20:03 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id m11so2888251pfc.11
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 11:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Fjfi0pv+sX6jWvAE/18yjH4e1BiDhX5lK5XPHx7rPM=;
 b=cvN1KXRDk3JzfY2NcR/3dUgXGv2IeKSlrG4ewAQfXaFNMTep2YAJn8TEH2wVEsQeQd
 lC3XzF0uTANq3gZPDdB6gVgFkHKw56lSPpB4/71foBkQHrMc2oxCusf6LAI2/hPqalYZ
 rLyLgEh+YUK2lckK8b80QwtrHXqxnZexqZl6G0ZmAOmxe4I+HnQwxbH3glH7CL/6tFis
 a80rx7vr5Tn/6MuriQZrLIqVsMDyD+GEXFXd4U/P3bJkKlWTGzrWUncK85D2tUNJlxdq
 hR1Y0MK36FVd0n0bQHvzew/duYAvn7YsRdlSGCvvVOHz9SdDXp1qn8S0X5m+sd/sik88
 oUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Fjfi0pv+sX6jWvAE/18yjH4e1BiDhX5lK5XPHx7rPM=;
 b=p6ncYS0S9mw9GncqdqgOHROwuC6Ewiw3O0tsACF2DsRYfAgiWxp7rSqZ8if/3VGObX
 PLxrXdcmIsr9eyXrDFMtZY9ic1PqjsM/2jqapL1EDASfWqN9Ga8YJxYhGWm+gMu0ERvV
 wnh3a1UMy15VE66nxcvbjmZAtQYUTMQmfK77mNq5J/r8/2RBNR6eyI6sWW/KFE8ql2TI
 jqC76rO1Eb+wtsqYY9xxFa86CJrDxmKKkHkGTEhGhBabDtoXZMVdRY388Ek+9/ebMvIs
 lQqJyyC/H+9R++TYE/9TDP8mLhPCAWOHcnRa5HywKhtqokD8E6wNBZ1LogXaWsJ0ca8S
 dLEw==
X-Gm-Message-State: AOAM531Ha293K/xCF2ELiGnUfVI7K9GtQmL3KE1DlCUSQ5aJc+Ica1wJ
 yy2oYeIguOHQ+zspXYHHecV55hHc6/o=
X-Google-Smtp-Source: ABdhPJwxAmmzMw2raACBHlpIB7X08WKfxfak5NLcL1z8Kl9HMUaO9qZgt9wXpw2KyY1jIU7lYB+32Q==
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id
 n13-20020aa78a4d0000b029021192f2658cmr9466446pfa.29.1616696401962; 
 Thu, 25 Mar 2021 11:20:01 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id i20sm5977597pgg.65.2021.03.25.11.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 11:20:01 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 03:19:06 +0900
Message-Id: <20210325181906.40688-5-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325181906.40688-1-qi.fuli@fujitsu.com>
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] syscalls/swapon/swapon03: Convert swapon03 to the
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/swapon/swapon03.c | 227 ++++++++------------
 1 file changed, 85 insertions(+), 142 deletions(-)

diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
index 2de635278..2429c05f9 100644
--- a/testcases/kernel/syscalls/swapon/swapon03.c
+++ b/testcases/kernel/syscalls/swapon/swapon03.c
@@ -1,23 +1,10 @@
-/******************************************************************************
- *
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
  * Copyright (c) International Business Machines  Corp., 2007
  *  Created by <rsalveti@linux.vnet.ibm.com>
  *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- *
- ******************************************************************************/
+ */

 /*
  * This test case checks whether swapon(2) system call returns:
@@ -25,31 +12,20 @@
  *
  */

-#include <sys/types.h>
-#include <unistd.h>
+#include <stdio.h>
 #include <errno.h>
 #include <stdlib.h>
 #include <sys/wait.h>
-#include <sys/stat.h>
-#include <sys/utsname.h>
-#include <fcntl.h>
-#include <pwd.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
+
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 #include "swaponoff.h"
-#include "libswapon.h"
+#include "libswap.h"

-static void setup(void);
-static void cleanup(void);
 static int setup_swap(void);
 static int clean_swap(void);
 static int check_and_swapoff(const char *filename);

-char *TCID = "swapon03";
-int TST_TOTAL = 1;
-
 static int swapfiles;

 int testfiles = 3;
@@ -63,82 +39,60 @@ static struct swap_testfile_t {

 int expected_errno = EPERM;

-int main(int ac, char **av)
+static void verify_swapon(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	if (setup_swap() < 0) {
+		clean_swap();
+		tst_brk(TBROK, "Setup failed, quitting the test");
+	}

-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
+	TEST(tst_syscall(__NR_swapon, swap_testfiles[0].filename, 0));

-		if (setup_swap() < 0) {
-			clean_swap();
-			tst_brkm(TBROK, cleanup,
-				 "Setup failed, quitting the test");
-		}
+	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
+		tst_res(TPASS, "swapon(2) got expected failure (%d),",
+			expected_errno);
+	} else if (TST_RET < 0) {
+		tst_res(TFAIL | TTERRNO,
+			"swapon(2) failed to produce expected error "
+			"(%d). System reboot recommended.",
+			expected_errno);
+	} else {
+		/* Probably the system supports MAX_SWAPFILES > 30,
+		 * let's try with MAX_SWAPFILES == 32 */

-		TEST(ltp_syscall(__NR_swapon, swap_testfiles[0].filename, 0));
+		/* Call swapon sys call once again for 32
+		 * now we can't receive an error */
+		TEST(tst_syscall(__NR_swapon, swap_testfiles[1].filename, 0));

-		if ((TEST_RETURN == -1) && (TEST_ERRNO == expected_errno)) {
-			tst_resm(TPASS, "swapon(2) got expected failure (%d),",
-				 expected_errno);
-		} else if (TEST_RETURN < 0) {
-			tst_resm(TFAIL | TTERRNO,
-				 "swapon(2) failed to produce expected error "
-				 "(%d). System reboot recommended.",
-				 expected_errno);
+		/* Check return code (now we're expecting success) */
+		if (TST_RET < 0) {
+			tst_res(TFAIL | TTERRNO,
+				"swapon(2) got an unexpected failure");
 		} else {
-			/* Probably the system supports MAX_SWAPFILES > 30,
-			 * let's try with MAX_SWAPFILES == 32 */
-
-			/* Call swapon sys call once again for 32
-			 * now we can't receive an error */
-			TEST(ltp_syscall
-			     (__NR_swapon, swap_testfiles[1].filename, 0));
-
-			/* Check return code (now we're expecting success) */
-			if (TEST_RETURN < 0) {
-				tst_resm(TFAIL | TTERRNO,
-					 "swapon(2) got an unexpected failure");
+			/* Call swapon sys call once again for 33
+			 * now we have to receive an error */
+			TEST(tst_syscall(__NR_swapon, swap_testfiles[2].filename, 0));
+
+			/* Check return code (should be an error) */
+			if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
+				tst_res(TPASS,
+					"swapon(2) got expected failure;"
+					" Got errno = %d, probably your"
+					" MAX_SWAPFILES is 32",
+					expected_errno);
 			} else {
-				/* Call swapon sys call once again for 33
-				 * now we have to receive an error */
-				TEST(ltp_syscall
-				     (__NR_swapon, swap_testfiles[2].filename,
-				      0));
-
-				/* Check return code (should be an error) */
-				if ((TEST_RETURN == -1)
-				    && (TEST_ERRNO == expected_errno)) {
-					tst_resm(TPASS,
-						 "swapon(2) got expected failure;"
-						 " Got errno = %d, probably your"
-						 " MAX_SWAPFILES is 32",
-						 expected_errno);
-				} else {
-					tst_resm(TFAIL,
-						 "swapon(2) failed to produce"
-						 " expected error: %d, got %s."
-						 " System reboot after execution of LTP"
-						 " test suite is recommended.",
-						 expected_errno,
-						 strerror(TEST_ERRNO));
-				}
-
+				tst_res(TFAIL,
+					"swapon(2) failed to produce"
+					" expected error: %d, got %s."
+					" System reboot after execution of LTP"
+					" test suite is recommended.",
+					expected_errno, strerror(TST_ERR));
 			}
 		}
-
-		if (clean_swap() < 0)
-			tst_brkm(TBROK, cleanup,
-				 "Cleanup failed, quitting the test");
-
 	}

-	cleanup();
-	tst_exit();
+	if (clean_swap() < 0)
+		tst_brk(TBROK, "Cleanup failed, quitting the test");

 }

@@ -157,22 +111,20 @@ static int setup_swap(void)
 	/* Find out how many swapfiles (1 line per entry) already exist */
 	swapfiles = 0;

-	if (seteuid(0) < 0) {
-		tst_brkm(TFAIL | TERRNO, cleanup, "Failed to call seteuid");
-	}
+	if (seteuid(0) < 0)
+		tst_brk(TFAIL | TERRNO, "Failed to call seteuid");

 	/* This includes the first (header) line */
 	if ((fd = open("/proc/swaps", O_RDONLY)) == -1) {
-		tst_brkm(TFAIL | TERRNO, cleanup,
-			 "Failed to find out existing number of swap files");
+		tst_brk(TFAIL | TERRNO,
+			"Failed to find out existing number of swap files");
 	}
 	do {
 		char *p = buf;
 		res = read(fd, buf, BUFSIZ);
 		if (res < 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "Failed to find out existing number of swap "
-				 "files");
+			tst_brk(TFAIL | TERRNO,
+				 "Failed to find out existing number of swap files");
 		}
 		buf[res] = '\0';
 		while ((p = strchr(p, '\n'))) {
@@ -184,18 +136,14 @@ static int setup_swap(void)
 	if (swapfiles)
 		swapfiles--;	/* don't count the /proc/swaps header */

-	if (swapfiles < 0) {
-		tst_brkm(TFAIL, cleanup,
-			 "Failed to find existing number of swapfiles");
-	}
+	if (swapfiles < 0)
+		tst_brk(TFAIL, "Failed to find existing number of swapfiles");

 	/* Determine how many more files are to be created */
 	swapfiles = MAX_SWAPFILES - swapfiles;
-	if (swapfiles > MAX_SWAPFILES) {
+	if (swapfiles > MAX_SWAPFILES)
 		swapfiles = MAX_SWAPFILES;
-	}
-
-	pid = FORK_OR_VFORK();
+	pid = SAFE_FORK();
 	if (pid == 0) {
 		/*create and turn on remaining swapfiles */
 		for (j = 0; j < swapfiles; j++) {
@@ -208,18 +156,16 @@ static int setup_swap(void)
 			}

 			/* Create the swapfile */
-			make_swapfile(cleanup, filename, 0);
+			make_swapfile(filename, 0);

 			/* turn on the swap file */
-			res = ltp_syscall(__NR_swapon, filename, 0);
+			res = tst_syscall(__NR_swapon, filename, 0);
 			if (res != 0) {
 				if (errno == EPERM) {
-					printf("Successfully created %d "
-					       "swapfiles\n", j);
+					printf("Successfully created %d swapfiles\n", j);
 					break;
 				} else {
-					printf("Failed to create "
-					       "swapfile: %s\n", filename);
+					printf("Failed to create swapfile: %s\n", filename);
 					exit(1);
 				}
 			}
@@ -229,11 +175,11 @@ static int setup_swap(void)
 		waitpid(pid, &status, 0);

 	if (WEXITSTATUS(status))
-		tst_brkm(TFAIL, cleanup, "Failed to setup swaps");
+		tst_brk(TFAIL, "Failed to setup swaps");

 	/* Create all needed extra swapfiles for testing */
 	for (j = 0; j < testfiles; j++)
-		make_swapfile(cleanup, swap_testfiles[j].filename, 0);
+		make_swapfile(swap_testfiles[j].filename, 0);

 	return 0;

@@ -250,22 +196,21 @@ static int clean_swap(void)
 	for (j = 0; j < swapfiles; j++) {
 		if (snprintf(filename, sizeof(filename),
 			     "swapfile%02d", j + 2) < 0) {
-			tst_resm(TWARN, "sprintf() failed to create filename");
-			tst_resm(TWARN, "Failed to turn off swap files. System"
+			tst_res(TWARN, "sprintf() failed to create filename");
+			tst_res(TWARN, "Failed to turn off swap files. System"
 				 " reboot after execution of LTP test"
 				 " suite is recommended");
 			return -1;
 		}
 		if (check_and_swapoff(filename) != 0) {
-			tst_resm(TWARN, "Failed to turn off swap file %s.",
-				 filename);
+			tst_res(TWARN, "Failed to turn off swap file %s.", filename);
 			return -1;
 		}
 	}

 	for (j = 0; j < testfiles; j++) {
 		if (check_and_swapoff(swap_testfiles[j].filename) != 0) {
-			tst_resm(TWARN, "Failed to turn off swap file %s.",
+			tst_res(TWARN, "Failed to turn off swap file %s.",
 				 swap_testfiles[j].filename);
 			return -1;
 		}
@@ -284,8 +229,7 @@ static int check_and_swapoff(const char *filename)

 	if (snprintf(cmd_buffer, sizeof(cmd_buffer),
 		     "grep -q '%s.*file' /proc/swaps", filename) < 0) {
-		tst_resm(TWARN,
-			 "sprintf() failed to create the command string");
+		tst_res(TWARN, "sprintf() failed to create the command string");
 	} else {

 		rc = 0;
@@ -293,9 +237,9 @@ static int check_and_swapoff(const char *filename)
 		if (system(cmd_buffer) == 0) {

 			/* now we need to swapoff the file */
-			if (ltp_syscall(__NR_swapoff, filename) != 0) {
+			if (tst_syscall(__NR_swapoff, filename) != 0) {

-				tst_resm(TWARN, "Failed to turn off swap "
+				tst_res(TWARN, "Failed to turn off swap "
 					 "file. system reboot after "
 					 "execution of LTP test suite "
 					 "is recommended");
@@ -311,23 +255,22 @@ static int check_and_swapoff(const char *filename)

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
 	if (access("/proc/swaps", F_OK))
-		tst_brkm(TCONF, NULL, "swap not supported by kernel");
-
-	tst_tmpdir();
-
-	is_swap_supported(cleanup, "./tstswap");
+		tst_brk(TCONF, "swap not supported by kernel");

-	TEST_PAUSE;
+	is_swap_supported("./tstswap");
 }

 static void cleanup(void)
 {
 	clean_swap();
-
-	tst_rmdir();
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+	.test_all = verify_swapon,
+	.setup = setup,
+	.cleanup = cleanup
+};
--
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
