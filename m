Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F325F5DE
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 318603C543D
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 11:00:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0137D3C25A5
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:21 +0200 (CEST)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 447441A00A3A
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 11:00:20 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id s2so6177780pjr.4
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mSp4k5xv2Ho0AGStqZEXvWXEnRAX3tK9umC7zMPv98=;
 b=Bafw6vvlWIqDIcTJJAco2p7wP9zM/tODDg0KMp+wFAqw0gLVmM52QVg/GAMS3qgdbd
 QGSvC2FBpT0NDFlKe5/P3Wl4QDbPwechTJRc66n8ypcBO4+b/7+NxO0mXGZZ2lNu0253
 pH5F8BNgW7PcEWe+pCyhtnVVHtsO60UYZ78lavFeA0m2xtXSCDNexKZabeo3l217me7s
 sMyoCurfGbp4gE+Xzm96fawpwGPtaXx7y+tVGxpwljkV3pabVQTRpE4BXhLiqfdREf2R
 BL1e4WdL4OCk/T1+T65fZ1fcrVZuwMNdghrdOtwCG3Uk7XfyG382CN6sFtSn7eITiOP6
 XmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mSp4k5xv2Ho0AGStqZEXvWXEnRAX3tK9umC7zMPv98=;
 b=Au9jzknxnu79x6IM6w6DduHeIPBYDi7qaSnDT0w2ZgCF1t5oVZeJFsK6iO74MMmYIj
 NEjGd2xbnF+t77hXyUuvGHv14KbLSqEDnb+3kJ/PVyBnaPry3VgP3nyqO1Wjxa8IxXoF
 Asu70wzCGfhc1T+L9ov/vZYHkAVmBpKKb/lVj68q3HghKyCyblT6jQ36tATHh8CE206c
 tR9JWMv+qPoOJ1PjDg6yay2e4C756kg3eIIi4gGQHcdb+7rcHiopr5BR+jWjOxP+0mbc
 QPabtr9e+9oU2GXhso/1ixUdCtj6GboJKJU7YkvJjH9RFS+6PkInvRmvrnAPtu3TxyHL
 V+Eg==
X-Gm-Message-State: AOAM532dKgxqnXThqMfM8s/rHwjXpx2B/5SNEMgd0KYtb9uNgKLKokWa
 00TXQ78Ix+aqRimaJUnd3s90BH5suPaIhg==
X-Google-Smtp-Source: ABdhPJxeAa/J1e71+YphBfjAYCY3oVbWTYilRrWvui68b7kH86B1yAPKlcBdfEzjLkahY3QU7XRf0g==
X-Received: by 2002:a17:902:28:: with SMTP id 37mr11700952pla.85.1599469217667; 
 Mon, 07 Sep 2020 02:00:17 -0700 (PDT)
Received: from localhost ([122.181.47.55])
 by smtp.gmail.com with ESMTPSA id i17sm635335pfa.2.2020.09.07.02.00.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 02:00:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 14:30:04 +0530
Message-Id: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/3] syscalls: select: Merge few tests and migrate
 to new format
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This merges the first three tests and updates them to new test format.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Fixed nfds values.

 runtest/quickhit                            |   8 +-
 runtest/syscalls                            |   2 -
 testcases/kernel/syscalls/select/.gitignore |   2 -
 testcases/kernel/syscalls/select/select01.c | 167 ++++++++------------
 testcases/kernel/syscalls/select/select02.c | 114 -------------
 testcases/kernel/syscalls/select/select03.c | 134 ----------------
 6 files changed, 65 insertions(+), 362 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/select/select02.c
 delete mode 100644 testcases/kernel/syscalls/select/select03.c

diff --git a/runtest/quickhit b/runtest/quickhit
index b17318b655fa..c01dc4f30b9f 100644
--- a/runtest/quickhit
+++ b/runtest/quickhit
@@ -179,14 +179,8 @@ rename02 rename02
 sbrk01 sbrk01
 # Basic test for sbrk(2)
 select01 select01
-# select to a file
-#    TEST CASES
-#      1.) select(2) to a fd of regular file with no I/O and small timeout
-select02 select02
-# select of system pipe fds
-select03 select03
+# Basic select tests
 select04 select04
-# select of fd of a named-pipe (FIFO)
 setgid01 setgid01
 # Basic test for setgid(2)
 setpgid01 setpgid01
diff --git a/runtest/syscalls b/runtest/syscalls
index 35770e6db4a5..cf8e989969e5 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1150,8 +1150,6 @@ sched_getattr01 sched_getattr01
 sched_getattr02 sched_getattr02
 
 select01 select01
-select02 select02
-select03 select03
 select04 select04
 
 semctl01 semctl01
diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
index 9d64cb8b8a1b..243a092ac6ca 100644
--- a/testcases/kernel/syscalls/select/.gitignore
+++ b/testcases/kernel/syscalls/select/.gitignore
@@ -1,4 +1,2 @@
 /select01
-/select02
-/select03
 /select04
diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
index e9100c78e9b5..4f8afb4e6bd6 100644
--- a/testcases/kernel/syscalls/select/select01.c
+++ b/testcases/kernel/syscalls/select/select01.c
@@ -1,126 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
  * http://www.sgi.com
  *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- */
-/*
- *    AUTHOR            : Richard Logan
- *    CO-PILOT          : William Roske
- *    DATE STARTED      : 02/24/93
+ * AUTHOR            : Richard Logan
+ * CO-PILOT          : William Roske
  *
- *      1.) select(2) to a fd of regular file with no I/O and small timeout
+ * 1.) select(2) to fd of regular file with no I/O and small timeout
+ * 2.) select(2) to fd of system pipe with no I/O and small timeout
+ * 2.) select(2) of fd of a named-pipe (FIFO) with no I/O and small timeout value
  */
 
+#include <unistd.h>
 #include <errno.h>
-#include <signal.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <string.h>
-#include <sys/param.h>
-#include <sys/types.h>
 #include <sys/time.h>
-
-#include "test.h"
-
-#define FILENAME	"select01"
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "select01";
-int TST_TOTAL = 1;
-
-int Fd = -1;
-fd_set Readfds;
-
-int main(int ac, char **av)
+#include <sys/types.h>
+#include <fcntl.h>
+#include "select_var.h"
+
+static fd_set readfds_reg, readfds_pipe, writefds_pipe, readfds_npipe, writefds_npipe;
+static int fd_reg, fds_pipe[2], fd_npipe;
+
+static struct select_info {
+	int *nfds;
+	fd_set *readfds;
+	fd_set *writefds;
+} tests[] = {
+	{&fd_reg, &readfds_reg, NULL},
+	{&fds_pipe[1], &readfds_pipe, &writefds_pipe},
+	{&fd_npipe, &readfds_npipe, &writefds_npipe},
+};
+
+static void run(unsigned int n)
 {
-	int lc;
+	struct select_info *tc = &tests[n];
 	struct timeval timeout;
-	long test_time = 0;	/* in usecs */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		test_time = ((lc % 2000) * 100000);	/* 100 milli-seconds */
-
-		if (test_time > 1000000 * 60)
-			test_time = test_time % (1000000 * 60);
-
-		timeout.tv_sec = test_time / 1000000;
-		timeout.tv_usec = test_time - (timeout.tv_sec * 1000000);
 
-		TEST(select(4, &Readfds, 0, 0, &timeout));
+	timeout.tv_sec = 0;
+	timeout.tv_usec = 100000;
 
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL,
-				 "%d select(4, &Readfds, 0, 0, &timeout), timeout = %ld usecs, errno=%d",
-				 lc, test_time, errno);
-		}
+	TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
 
-		tst_resm(TPASS,
-			 "select(4, &Readfds, 0, 0, &timeout) timeout = %ld usecs",
-			 test_time);
-
-	}
-
-	cleanup();
-	tst_exit();
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "select() failed");
+	else
+		tst_res(TPASS, "select() passed");
 }
 
 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	if ((Fd = open(FILENAME, O_CREAT | O_RDWR, 0777)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_CREAT | O_RDWR) failed", FILENAME);
-
-	FD_ZERO(&Readfds);
-	FD_SET(Fd, &Readfds);
+	select_info();
+
+	/* Regular file */
+	fd_reg = SAFE_OPEN("tmpfile1", O_CREAT | O_RDWR, 0777);
+	FD_ZERO(&readfds_reg);
+	FD_SET(fd_reg, &readfds_reg);
+
+	/* System pipe*/
+	SAFE_PIPE(fds_pipe);
+	FD_ZERO(&readfds_pipe);
+	FD_ZERO(&writefds_pipe);
+	FD_SET(fds_pipe[0], &readfds_pipe);
+	FD_SET(fds_pipe[1], &writefds_pipe);
+
+	/* Named pipe (FIFO) */
+	SAFE_MKFIFO("tmpfile2", 0666);
+	fd_npipe = SAFE_OPEN("tmpfile2", O_RDWR);
+	FD_ZERO(&readfds_npipe);
+	FD_ZERO(&writefds_npipe);
+	FD_SET(fd_npipe, &readfds_npipe);
+	FD_SET(fd_npipe, &writefds_npipe);
 }
 
 static void cleanup(void)
 {
-	if (Fd >= 0) {
-		if (close(Fd) == -1)
-			tst_resm(TWARN | TERRNO, "close(%s) failed", FILENAME);
-		Fd = -1;
-	}
-
-	tst_rmdir();
+	SAFE_UNLINK("tmpfile2");
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = TEST_VARIANTS,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/select/select02.c b/testcases/kernel/syscalls/select/select02.c
deleted file mode 100644
index 7aa0107c0ce1..000000000000
--- a/testcases/kernel/syscalls/select/select02.c
+++ /dev/null
@@ -1,114 +0,0 @@
-/*
- * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
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
- */
-/*
- *    AUTHOR            : Richard Logan
- *    CO-PILOT          : Glen Overby
- *    DATE STARTED      : 02/24/93
- *
- *    TEST CASES
- *      1.) select(2) to fd of system pipe with no I/O and small timeout
- */
-#include <errno.h>
-#include <signal.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <sys/param.h>
-#include <sys/types.h>
-#include <sys/time.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-static void setup(void);
-
-char *TCID = "select02";
-int TST_TOTAL = 1;
-
-int Fd[2];
-fd_set saved_Readfds, saved_Writefds;
-fd_set Readfds, Writefds;
-
-int main(int ac, char **av)
-{
-	int lc;
-	struct timeval timeout;
-	long test_time = 0;	/* in usecs */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		test_time = ((lc % 2000) * 100000);	/* 100 milli-seconds */
-
-		if (test_time > 1000000 * 60)
-			test_time = test_time % (1000000 * 60);
-
-		timeout.tv_sec = test_time / 1000000;
-		timeout.tv_usec = test_time - (timeout.tv_sec * 1000000);
-
-		Readfds = saved_Readfds;
-		Writefds = saved_Writefds;
-
-		TEST(select(5, &Readfds, &Writefds, 0, &timeout));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL,
-				 "%d select(5, &Readfds, &Writefds, 0, &timeout) failed, errno=%d\n",
-				 lc, errno);
-		} else {
-			tst_resm(TPASS,
-				 "select(5, &Readfds, &Writefds, 0, &timeout) timeout = %ld usecs",
-				 test_time);
-		}
-
-	}
-
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, NULL);
-
-	TEST_PAUSE;
-
-	SAFE_PIPE(NULL, Fd);
-
-	FD_ZERO(&saved_Readfds);
-	FD_ZERO(&saved_Writefds);
-	FD_SET(Fd[0], &saved_Readfds);
-	FD_SET(Fd[1], &saved_Writefds);
-}
diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
deleted file mode 100644
index da7fdb094173..000000000000
--- a/testcases/kernel/syscalls/select/select03.c
+++ /dev/null
@@ -1,134 +0,0 @@
-/*
- * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
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
- */
-/*
- *    AUTHOR            : Richard Logan
- *    CO-PILOT          : Glen Overby
- *    DATE STARTED      : 02/24/93
- *
- *      1.) select(2) of fd of a named-pipe (FIFO) with no I/O and small timeout value
- */
-
-#include <errno.h>
-#include <signal.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <sys/param.h>
-#include <sys/types.h>
-#include <sys/time.h>
-#include <sys/stat.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define FILENAME	"select03"
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "select03";
-int TST_TOTAL = 1;
-
-int Fd;
-fd_set saved_Readfds, saved_Writefds;
-fd_set Readfds, Writefds;
-
-int main(int ac, char **av)
-{
-	int lc;
-	struct timeval timeout;
-	long test_time = 0;	/* in usecs */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		test_time = ((lc % 2000) * 100000);	/* 100 milli-seconds */
-
-		if (test_time > 1000000 * 60)
-			test_time = test_time % (1000000 * 60);
-
-		timeout.tv_sec = test_time / 1000000;
-		timeout.tv_usec = test_time - (timeout.tv_sec * 1000000);
-
-		Readfds = saved_Readfds;
-		Writefds = saved_Writefds;
-
-		TEST(select(5, &Readfds, &Writefds, 0, &timeout));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL,
-				 "%d select(5, &Readfds, &Writefds, 0, &timeout) failed errno=%d\n",
-				 lc, errno);
-		} else {
-			tst_resm(TPASS,
-				 "select(5, &Readfds, &Writefds, 0, &timeout) timeout = %ld usecs",
-				 test_time);
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	SAFE_MKFIFO(cleanup, FILENAME, 0777);
-
-	if ((Fd = open(FILENAME, O_RDWR)) == -1) {
-		tst_brkm(TBROK, cleanup, "open(%s, O_RDWR) failed, errno=%d",
-			 FILENAME, errno);
-	}
-
-	FD_ZERO(&saved_Readfds);
-	FD_ZERO(&saved_Writefds);
-	FD_SET(Fd, &saved_Readfds);
-	FD_SET(Fd, &saved_Writefds);
-}
-
-static void cleanup(void)
-{
-	close(Fd);
-	tst_rmdir();
-}
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
