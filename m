Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59E41064D
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:12:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F21883C9074
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:12:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92CBF3C8855
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:46 +0200 (CEST)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8127020022B
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:45 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id e16so11765820pfc.6
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAwb4riBlBRkrz+zQGhjFtxl4Mu9o6p02J+lpiHO5lU=;
 b=CpQxctKOu9ugAugOOYFwgpqI+QBxCvZU2tkSgvWUB5GhtK7CgKsYNrIRuQIAlWERSi
 7eEbM/1RDXHqhfgecJESIhhuk5hE3OpwNpWmfD7rsLSxTa9evSS5hilZk6WCXnXcvqNL
 TdxQ52cljZJ7oI14Ygoav6Q2ONzqRClLevxYXVdB5bP334hTnMA8x4/nekeP7oek55qu
 JByYCdGnZmqKYlm4iKZ4bYKuXD4W4T1Hr7SMgPrZa18KBrsHYY8I1auagEtKxIxiRC4z
 5qizb1eJISs+j2KhM4xdYqjkUZsZlU04F5UT82x17TW/2DmNbr+Xu3F569SftP1G3rsa
 zQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAwb4riBlBRkrz+zQGhjFtxl4Mu9o6p02J+lpiHO5lU=;
 b=jCrw4KPCr/UQb+TkjrO9R7Cdi1jhMl4dbxCtXa6Yrntvyd0XFIkLjR2gThbFvX7Yz5
 e91s+6wHXfY32X11CFzcocZF3oEfKt/1x/k8HWrR4PxXrSbVHcQLEWjKNzdGmz8Mg2k/
 an67AiaJQSWzJMuFz8sU92dKb7NJmblHpezudVRhDeISbciSfgEqvEh3RzYs5uCMKCBt
 LXGcvvCbWls0OMljktXrMPWN+UwnYHH0D0ta3tJM4Kpi+L+52WbeAG1kFAT/CRt7zRTn
 bjkcaLn56Ur0G4FMG3uX2ZtSpAmhQWcYwo4ottzOEDGKJohFFleajHP8vvKe/9zh7OzT
 Izpw==
X-Gm-Message-State: AOAM532biDqPdjZ1ny2GozfFTF/z7TKU5/WVXH44Xi1CyCItLn/rGv5e
 bcsbDCnylhGUbUgoz6WYh6EEG/5Cv/CbNlUy
X-Google-Smtp-Source: ABdhPJzNEALrywfn77hCOS7qtEo2guhreO2qPv3mIbRYN7F3uliXPGRGCVgvNkc0wHznMtNKBRP7eg==
X-Received: by 2002:a63:4303:: with SMTP id q3mr14309139pga.375.1631967103816; 
 Sat, 18 Sep 2021 05:11:43 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id g13sm9255556pfi.176.2021.09.18.05.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 05:11:43 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 18 Sep 2021 21:11:12 +0900
Message-Id: <20210918121114.10694-4-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918121114.10694-1-qi.fuli@fujitsu.com>
References: <20210918121114.10694-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/5] syscalls/dup2/dup203: Convert to new API
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

 - divide original testcase into two
 - check the content of file and FD_CLOEXEC flag on both open and close
   file descriptors

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/dup2/dup203.c | 266 ++++++++----------------
 1 file changed, 84 insertions(+), 182 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup203.c b/testcases/kernel/syscalls/dup2/dup203.c
index e6f281adf..71240c0bf 100644
--- a/testcases/kernel/syscalls/dup2/dup203.c
+++ b/testcases/kernel/syscalls/dup2/dup203.c
@@ -1,208 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
  */
 
-/*
- * NAME
- *	dup203.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	Testcase to check the basic functionality of dup2().
+ * Testcase to check the basic functionality of dup2().
  *
- * ALGORITHM
- *	1.	Attempt to dup2() on an open file descriptor.
- *	2.	Attempt to dup2() on a close file descriptor.
- *
- * USAGE:  <for command-line>
- *  dup203 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	NONE
+ * - Attempt to dup2() on an open file descriptor.
+ * - Attempt to dup2() on a close file descriptor.
  */
 
-#include <fcntl.h>
-#include <sys/param.h>
 #include <errno.h>
-#include <string.h>
-#include "test.h"
-#include "safe_macros.h"
-
-void setup(void);
-void cleanup(void);
-
-char *TCID = "dup203";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+#include <stdio.h>
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+static char filename0[40], filename1[40];
+static int fd0, fd1;
+
+static struct tcase {
+	char *desc;
+	int is_close;
+} tcases[] = {
+	{"Test duping over an open fd", 0},
+	{"Test duping over a close fd", 1},
+};
+
+static void run(unsigned int i)
 {
-	int fd0, fd1, fd2, rval;
-	char filename0[40], filename1[40];
+	int fd2, rval;
 	char buf[40];
 
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-//block1:
-		tst_resm(TINFO, "Enter block 1");
-		tst_resm(TINFO, "Test duping over an open fd");
-
-		sprintf(filename0, "dup202.file0.%d\n", getpid());
-		sprintf(filename1, "dup202.file1.%d\n", getpid());
-		unlink(filename0);
-		unlink(filename1);
-
-		if ((fd0 = creat(filename0, 0666)) == -1)
-			tst_brkm(TBROK, cleanup, "cannot create first file");
-		if (write(fd0, filename0, strlen(filename0)) == -1)
-			tst_brkm(TBROK, cleanup, "filename0: write(2) failed");
-
-		if ((fd1 = creat(filename1, 0666)) == -1)
-			tst_brkm(TBROK, cleanup, "Cannot create second file");
-		if (write(fd1, filename1, strlen(filename1)) == -1)
-			tst_brkm(TBROK, cleanup, "filename1: write(2) failed");
+	struct tcase *tc = tcases + i;
 
-		SAFE_CLOSE(cleanup, fd0);
-		if ((fd0 = open(filename0, O_RDONLY)) == -1)
-			tst_brkm(TBROK, cleanup, "open(2) on filename0 failed");
+	tst_res(TINFO, tc->desc);
 
-		SAFE_CLOSE(cleanup, fd1);
-		if ((fd1 = open(filename1, O_RDONLY)) == -1)
-			tst_brkm(TBROK, cleanup, "open(2) on filename1 failed");
+	fd0 = SAFE_CREAT(filename0, 0666);
+	SAFE_WRITE(1, fd0, filename0, strlen(filename0));
+	SAFE_CLOSE(fd0);
 
-		TEST(dup2(fd0, fd1));
-
-		if ((fd2 = TEST_RETURN) == -1) {
-			tst_resm(TFAIL, "call failed unexpectedly");
-		} else {
-			if (fd1 != fd2) {
-				tst_resm(TFAIL, "file descriptors don't match");
-				break;
-			}
-
-			memset(buf, 0, sizeof(buf));
-			if (read(fd2, buf, sizeof(buf)) == -1)
-				tst_brkm(TBROK, cleanup, "read(2) failed");
-			if (strcmp(buf, filename0) != 0)
-				tst_resm(TFAIL, "read from file got bad data");
-			tst_resm(TPASS, "dup2 test 1 functionality is correct");
-		}
-
-		close(fd0);
-		close(fd1);
-		close(fd2);
-		unlink(filename0);
-		unlink(filename1);
-
-		tst_resm(TINFO, "Exit block 1");
-
-//block2:
-		tst_resm(TINFO, "Enter block 2");
-		tst_resm(TINFO, "Test close on exec flag");
-
-		sprintf(filename0, "dup02.%d\n", getpid());
-		unlink(filename0);
-
-		if ((fd0 = creat(filename0, 0666)) == -1) {
-			tst_brkm(TBROK, cleanup, "Cannot create first file");
-		}
-		if (fcntl(fd0, F_SETFD, 1) == -1) {
-			tst_brkm(TBROK, cleanup, "setting close on exec flag "
-				 "on fd0 failed");
-		}
-
-		if ((fd2 = creat(filename1, 0666)) == -1) {
-			tst_brkm(TBROK, cleanup, "Cannot create second file");
-		}
+	fd1 = SAFE_CREAT(filename1, 0666);
+	SAFE_WRITE(1, fd1, filename1, strlen(filename1));
+	fd0 = SAFE_OPEN(filename0, O_RDONLY);
+	SAFE_FCNTL(fd0, F_SETFD, 1);
 
+	if (tc->is_close) {
 		/* SAFE_CLOSE() sets the fd to -1 avoid it here */
-		rval = fd2;
-		SAFE_CLOSE(cleanup, rval);
-
-		TEST(dup2(fd0, fd2));
-
-		if ((fd1 = TEST_RETURN) == -1) {
-			tst_resm(TFAIL, "call failed unexpectedly");
-		} else {
-			if (fd1 != fd2) {
-				tst_resm(TFAIL, "bad dup2 descriptor %d", fd1);
-				break;
-			}
-
-			if ((rval = fcntl(fd1, F_GETFD, 0)) != 0) {
-				tst_resm(TBROK | TERRNO,
-					 "fcntl F_GETFD on fd1 failed; expected a "
-					 "return value of 0x0, got %#x", rval);
-				break;
-			}
-			if ((rval = (fcntl(fd0, F_GETFL, 0) & O_ACCMODE)) !=
-			    O_WRONLY) {
-				tst_resm(TFAIL, "fctnl F_GETFL bad rval on fd0 "
-					 "Expected %#x got %#x", O_WRONLY,
-					 rval);
-			}
-			tst_resm(TPASS, "dup2 test 2 functionality is correct");
-		}
-
-		close(fd0);
-		close(fd1);
-
-		unlink(filename0);
-		unlink(filename1);
-		tst_resm(TINFO, "Exit block 2");
+		rval = fd1;
+		SAFE_CLOSE(rval);
+	}
+
+	TEST(dup2(fd0, fd1));
+	fd2 = TST_RET;
+	if (TST_RET == -1) {
+		tst_res(TFAIL, "call failed unexpectedly");
+		goto free;
+	}
+	if (fd1 != fd2) {
+		tst_res(TFAIL, "file descriptors don't match");
+		goto free;
 	}
 
-	cleanup();
-	tst_exit();
+	memset(buf, 0, sizeof(buf));
+	SAFE_READ(0, fd2, buf, sizeof(buf));
+	if (strcmp(buf, filename0) != 0)
+		tst_res(TFAIL, "read from file got bad data");
+	else
+		tst_res(TPASS, "test the content of file is correct");
+
+	rval = SAFE_FCNTL(fd2, F_GETFD);
+	if (rval != 0)
+		tst_res(TFAIL, "fcntl F_GETFD on fd2 failed; expected a "
+			"return value of 0x0, got %#x", rval);
+	else
+		tst_res(TPASS, "test the FD_CLOEXEC flag is correct");
+free:
+	SAFE_CLOSE(fd0);
+	SAFE_CLOSE(fd1);
+	SAFE_UNLINK(filename0);
+	SAFE_UNLINK(filename1);
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
+	int pid;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	pid = getpid();
+	sprintf(filename0, "dup203.file0.%d\n", pid);
+	sprintf(filename1, "dup203.file1.%d\n", pid);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	tst_rmdir();
+	if (fd0 > 0)
+		SAFE_CLOSE(fd0);
+	if (fd1 > 0)
+		SAFE_CLOSE(fd1);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.needs_tmpdir = 1,
+	.test = run,
+	.cleanup = cleanup,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
