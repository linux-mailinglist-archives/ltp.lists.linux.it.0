Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396725BB25
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F32B03C54F0
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 08:40:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E65FA3C2D16
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:27 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 12BE910005A1
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 08:40:26 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id 31so1291052pgy.13
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 23:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnC7oIiJYtWxwuzjuJ+w8pC0aBEKqPm6V6fqwVeqi4A=;
 b=nZKwMRr++dEdcAYnN+5GjlWm6m7bAi/VXBqpefnfdbJJKzy5maKFnk7AZDeyDcfvs3
 u0UmbXlcdkD/YgqZLj/b6Jxz+9pbB1EtGYk4ZckripcQAwVeg7aBusWW75eDvO3i10ki
 PA9PpCrjyqhH1a73liA5VywDvZEQYeODyb4Z5C3p3QqgZTaHvNHj2kPjvxrpP/8KET4x
 kCKVX68KTlMrZWMgWCcN/tscY+WaoIiskHlP5DnukDOo5vYW23I/pmStJxcppHZwlB2Y
 azclA9EWFV/Zb5X9w/Zrt45xFQ7MlMyGVmRt5djejQBBjaLZRwgEvJhZ4ZWj762E1gos
 EyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnC7oIiJYtWxwuzjuJ+w8pC0aBEKqPm6V6fqwVeqi4A=;
 b=UYaYI2TH9FpbBJ27rpZvkTbSwdXU/MDMldw2+e31D0viOjeWjJg3Lj7arc2BYN2uuV
 pJ+8KGPYafQTiPDmN9g60g86YXghSPusnhhhnqWmqf0cnSnede/J2DXPhZJUlKJXwuhn
 0htk+3k0O2fKaR7mU+n7cwtcUGN0CUd69naNDIWrJQX99w96T5qJCpGDG6dWUCpFfLbO
 Z5YbJtkLS644TWVjPWFGoE5vbE8bIeqdTj9KXCS/059W6MtHDr3o6VEdC1crFPJnMY1C
 ATHLsv7ko0mnPMZGVL7psQUTLVQGla7JhoLvIb8m8ogr+zjYEy08VbkDohDqvNxStFLu
 d+6A==
X-Gm-Message-State: AOAM531K9wSZdh2E9k1UTIiCoBTHZ3bFOQDTAcH35wCxrtYn21241tfZ
 qSn89rnF+ss/eYbLFEZK0Y5ylIxYr7V1zQ==
X-Google-Smtp-Source: ABdhPJw7ISyfv3C4PBydY8igew49LrhSyNChAJA93IbFSRaI4lAumECqJCkP7EFq5WLJTVJk+4AzmQ==
X-Received: by 2002:a63:ef4e:: with SMTP id c14mr1722459pgk.33.1599115224776; 
 Wed, 02 Sep 2020 23:40:24 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id q127sm1713795pfb.61.2020.09.02.23.40.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 23:40:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu,  3 Sep 2020 12:10:11 +0530
Message-Id: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls: select: Merge few tests and migrate to
 new format
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
Cyril: Here is series of cleanup as you asked during reviews.

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
index 398145f6564a..105ca29dd29b 100644
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
index e9100c78e9b5..4367e7f3af3f 100644
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
+	int nfds;
+	fd_set *readfds;
+	fd_set *writefds;
+} tests[] = {
+	{4, &readfds_reg, NULL},
+	{5, &readfds_pipe, &writefds_pipe},
+	{5, &readfds_npipe, &writefds_npipe},
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
+	TEST(do_select(tc->nfds, tc->readfds, tc->writefds, 0, &timeout));
 
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
