Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A423CB81
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 16:32:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72F973C3266
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 16:32:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3F5C13C1CFB
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 16:32:11 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6EAC7201463
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 16:32:08 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id r11so14902083pfl.11
 for <ltp@lists.linux.it>; Wed, 05 Aug 2020 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=GuITk75pqnvlySX+qOY4vUZce18UNUgoJUmXabMntPE=;
 b=G4m5Pe2iGlv+667EaZ0QSDEy5o27v6i9YulSzDoCl77ZfAfRpnmDHeWgqZCPIZ8MKR
 Zm43Et6b7swkaK2tAhAdOHeYf8832II4wCh6QLniJzzmQjbWcMAHP8Xck92h5yyQwmtC
 kXPPNMRU4Dp7C6QKPvNEijUvTauizToKMGSZWl6AcDXLWTTYnIAInZd35WdpiHRiWFqn
 W396MdG4IoIQRPcZYeAaLX5Dr9km7dvaEBDjpX0BlZmWDRgZPBibgsupmflfbGtjY6ah
 9TVHULoaGOTosK3oUzDXf6eMk4zRiTLxE75O7zg/8hJ59IYXwUY+e7AMkcoQZjCWJGQG
 wWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GuITk75pqnvlySX+qOY4vUZce18UNUgoJUmXabMntPE=;
 b=KGF2kTl2X369FxhZon6oJrlwOX5HXgGy7JGlWmAFrkfJfCimX+6rBohHuQKjg2oEFL
 aAspkbPFltN4swHpJ5usLumjTOnwJ49vVmoEEG4vJlHeTDSlB1zeNq5N+dXJmYTauUxR
 RCrOdKXlbtDCgXWREUvaA//9VaCf7ZeC7tfrqxmQyG767n+H7+Ek4YcjAveh1J5gVXJW
 s0O0Ge5YJ+ak+sanPzinAm3izWenY6JLPoJK29gm8/X3O3SKgfK1Lnxz785+UNV1BAK0
 zBf2IC7RxhMp5OOHgFrcsXs4tMCsJ/A9f9exM35oEgfQqXtChd2B0oL3mv8RErphfFZu
 0quA==
X-Gm-Message-State: AOAM532i/DX7YiR0mNqF9NtRIVjQw17dq0/AyESsncIrVhLn/FWZXmzP
 ydIGXmL/hCH/t+5iI+KNFBoYYQDb5mY=
X-Google-Smtp-Source: ABdhPJwSBWdJJ+LIQW2KRMeu0MpF6H35QTzSa/CMuGld5dKCI/k6D1+6VtaT3hjsLRa3Ie7gMW29Xg==
X-Received: by 2002:a62:d149:: with SMTP id t9mr3642967pfl.59.1596637922566;
 Wed, 05 Aug 2020 07:32:02 -0700 (PDT)
Received: from localhost ([223.190.59.99])
 by smtp.gmail.com with ESMTPSA id f6sm4148573pfa.23.2020.08.05.07.32.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 07:32:01 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  5 Aug 2020 20:01:52 +0530
Message-Id: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V8 1/2] syscalls/utimensat: Migrate to new test
 framework
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This gets rid of the test script and updates the utimensat01.c file to
handle most of the tests covered earlier (apart from testing the same
for files owned by root, as the test is run as root right now).

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V8:
- Added verification of atime and mtime
- Moved Makefile and syscalls changes here from 2/2
- No double indirection of mtime required
- Add directory in setup instead of run().
- update_error() can't be moved to setup() as that is dependent on each
  testcase.

 runtest/syscalls                                   |   2 +-
 testcases/kernel/syscalls/utimensat/Makefile       |   4 -
 testcases/kernel/syscalls/utimensat/utimensat01.c  | 449 +++++++++---------
 .../kernel/syscalls/utimensat/utimensat_tests.sh   | 517 ---------------------
 4 files changed, 208 insertions(+), 764 deletions(-)
 delete mode 100755 testcases/kernel/syscalls/utimensat/utimensat_tests.sh

diff --git a/runtest/syscalls b/runtest/syscalls
index a0f67e85c363..3c6e78a4c6d0 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1606,7 +1606,7 @@ utime06 utime06
 utimes01 utimes01
 
 # Introduced from Kernel 2.6.22 onwards
-utimensat01 utimensat_tests.sh
+utimensat01 utimensat01
 
 vfork01 vfork01
 vfork02 vfork02
diff --git a/testcases/kernel/syscalls/utimensat/Makefile b/testcases/kernel/syscalls/utimensat/Makefile
index 69cab8dbc057..044619fb8724 100644
--- a/testcases/kernel/syscalls/utimensat/Makefile
+++ b/testcases/kernel/syscalls/utimensat/Makefile
@@ -5,8 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-vpath %.c $(srcdir):$(top_srcdir)/lib
-
-INSTALL_TARGETS		:= utimensat_tests.sh
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 264ca1e15120..6e14e1f150db 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -1,282 +1,247 @@
-/*************************************************************************************/
-/*                                                                                   */
-/* Copyright (C) 2008, Michael Kerrisk <mtk.manpages@gmail.com>,                     */
-/* Copyright (C) 2008, Linux Foundation                                              */
-/*                                                                                   */
-/* This program is free software;  you can redistribute it and/or modify             */
-/* it under the terms of the GNU General Public License as published by              */
-/* the Free Software Foundation; either version 2 of the License, or                 */
-/* (at your option) any later version.                                               */
-/*                                                                                   */
-/* This program is distributed in the hope that it will be useful,                   */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of                   */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                         */
-/* the GNU General Public License for more details.                                  */
-/*                                                                                   */
-/* You should have received a copy of the GNU General Public License                 */
-/* along with this program;  if not, write to the Free Software                      */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA           */
-/*************************************************************************************/
-/*                                                                                   */
-/* File: utimnsat01.c                                                                */
-/* Description: A command-line interface for testing the utimensat() system call.    */
-/* Author: Michael Kerrisk <mtk.manpages@gmail.com>                                  */
-/* History:                                                                          */
-/*	17 Mar  2008  Initial creation,                                              */
-/*	31 May  2008  Reworked for easier test automation,                           */
-/*	2  June 2008  Renamed from t_utimensat.c to test_utimensat.c,                */
-/*	05 June 2008  Submitted to LTP by Subrata Modak <subrata@linux.vnet.ibm.com> */
-/*************************************************************************************/
-
-#define _GNU_SOURCE
-#define _ATFILE_SOURCE
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2008 Michael Kerrisk <mtk.manpages@gmail.com>
+ * Copyright (c) 2008 Subrata Modak <subrata@linux.vnet.ibm.com>
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Basic utimnsat() test.
+ */
+
 #include <stdio.h>
 #include <time.h>
 #include <errno.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include <sys/syscall.h>
 #include <fcntl.h>
 #include <string.h>
 #include <sys/stat.h>
-#include "test.h"
+#include "lapi/fs.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
-char *TCID = "utimensat01";
-int TST_TOTAL = 0;
-
-#define cleanup tst_exit
-
-/* We use EXIT_FAILURE for an expected failure from utimensat()
-   (e.g., EACCES and EPERM), and one of the following for unexpected
-   failures (i.e., something broke in our test setup). */
-
-#ifndef AT_FDCWD
-#define AT_FDCWD -100
-#endif
-#ifndef AT_SYMLINK_NOFOLLOW
-#define AT_SYMLINK_NOFOLLOW 0x100
-#endif
-
-#define EXIT_bad_usage 3
-#define EXIT_failed_syscall 3
-
-#define errExit(msg)    do { perror(msg); exit(EXIT_failed_syscall); \
-                        } while (0)
-
-#define UTIME_NOW      ((1l << 30) - 1l)
-#define UTIME_OMIT     ((1l << 30) - 2l)
+#define UTIME_NOW	((1l << 30) - 1l)
+#define UTIME_OMIT	((1l << 30) - 2l)
+
+#define TEST_FILE	"test_file"
+#define TEST_DIR	"test_dir"
+
+static void *bad_addr;
+
+struct mytime {
+	long access_tv_sec;
+	long access_tv_nsec;
+	long mod_tv_sec;
+	long mod_tv_nsec;
+	int atime_change;
+	int mtime_change;
+};
+
+static struct mytime tnn = {0, UTIME_NOW, 0, UTIME_NOW, 1, 1};
+static struct mytime too = {0, UTIME_OMIT, 0, UTIME_OMIT, 0, 0};
+static struct mytime tno = {0, UTIME_NOW, 0, UTIME_OMIT, 1, 0};
+static struct mytime ton = {0, UTIME_OMIT, 0, UTIME_NOW, 0, 1};
+static struct mytime t11 = {1, 1, 1, 1, 1, 1};
+
+struct test_case {
+	int dirfd;
+	char *pathname;
+	struct mytime *mytime;
+	int flags;
+	int oflags;
+	int attr;
+	int mode;
+	int exp_err;
+} tcase[] = {
+	/* Testing read-only file */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, 0, 0400, 0},
+	{AT_FDCWD, TEST_FILE, &tnn, 0, O_RDONLY, 0, 0400, 0},
+	{AT_FDCWD, TEST_FILE, &too, 0, O_RDONLY, 0, 0400, 0},
+	{AT_FDCWD, TEST_FILE, &tno, 0, O_RDONLY, 0, 0400, 0},
+	{AT_FDCWD, TEST_FILE, &ton, 0, O_RDONLY, 0, 0400, 0},
+	{AT_FDCWD, TEST_FILE, &t11, 0, O_RDONLY, 0, 0400, 0},
+
+	/* Testing writable file */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, 0, 0666, 0},
+	{AT_FDCWD, TEST_FILE, &tnn, 0, O_RDONLY, 0, 0666, 0},
+	{AT_FDCWD, TEST_FILE, &too, 0, O_RDONLY, 0, 0666, 0},
+	{AT_FDCWD, TEST_FILE, &tno, 0, O_RDONLY, 0, 0666, 0},
+	{AT_FDCWD, TEST_FILE, &ton, 0, O_RDONLY, 0, 0666, 0},
+	{AT_FDCWD, TEST_FILE, &t11, 0, O_RDONLY, 0, 0666, 0},
+
+	/* Testing append-only file */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, FS_APPEND_FL, 0600, 0},
+	{AT_FDCWD, TEST_FILE, &tnn, 0, O_RDONLY, FS_APPEND_FL, 0600, 0},
+	{AT_FDCWD, TEST_FILE, &too, 0, O_RDONLY, FS_APPEND_FL, 0600, 0},
+	{AT_FDCWD, TEST_FILE, &tno, 0, O_RDONLY, FS_APPEND_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &ton, 0, O_RDONLY, FS_APPEND_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &t11, 0, O_RDONLY, FS_APPEND_FL, 0600, EPERM},
+
+	/* Testing immutable file */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, -1},
+	{AT_FDCWD, TEST_FILE, &tnn, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, -1},
+	{AT_FDCWD, TEST_FILE, &too, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, 0},
+	{AT_FDCWD, TEST_FILE, &tno, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &ton, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &t11, 0, O_RDONLY, FS_IMMUTABLE_FL, 0600, EPERM},
+
+	/* Testing immutable-append-only file */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, -1},
+	{AT_FDCWD, TEST_FILE, &tnn, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, -1},
+	{AT_FDCWD, TEST_FILE, &too, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, 0},
+	{AT_FDCWD, TEST_FILE, &tno, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &ton, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, EPERM},
+	{AT_FDCWD, TEST_FILE, &t11, 0, O_RDONLY, FS_APPEND_FL|FS_IMMUTABLE_FL, 0600, EPERM},
+
+	/* Other failure tests */
+	{AT_FDCWD, TEST_FILE, NULL, 0, O_RDONLY, 0, 0400, EFAULT},
+	{AT_FDCWD, NULL, &tnn, 0, O_RDONLY, 0, 0400, EFAULT},
+	{-1, NULL, &tnn, AT_SYMLINK_NOFOLLOW, O_RDONLY, 0, 0400, EINVAL},
+	{-1, TEST_FILE, &tnn, 0, O_RDONLY, 0, 0400, ENOENT},
+};
+
+static inline int sys_utimensat(int dirfd, const char *pathname,
+				const struct timespec times[2], int flags)
+{
+	return tst_syscall(__NR_utimensat, dirfd, pathname, times, flags);
+}
 
-static inline int
-utimensat_sc(int dirfd, const char *pathname,
-	     const struct timespec times[2], int flags)
+static void setup(void)
 {
-	return ltp_syscall(__NR_utimensat, dirfd, pathname, times, flags);
+	bad_addr = tst_get_bad_addr(NULL);
+	SAFE_MKDIR(TEST_DIR, 0700);
 }
 
-static void usageError(char *progName)
+static void update_error(struct test_case *tc)
 {
-	fprintf(stderr, "Usage: %s pathname [atime-sec "
-		"atime-nsec mtime-sec mtime-nsec]\n\n", progName);
-	fprintf(stderr, "Permitted options are:\n");
-	fprintf(stderr, "    [-d path] "
-		"open a directory file descriptor"
-		" (instead of using AT_FDCWD)\n");
-	fprintf(stderr, "    -q        Quiet\n");
-	fprintf(stderr, "    -w        Open directory file "
-		"descriptor with O_RDWR|O_APPEND\n"
-		"              (instead of O_RDONLY)\n");
-	fprintf(stderr, "    -n        Use AT_SYMLINK_NOFOLLOW\n");
-	fprintf(stderr, "\n");
-
-	fprintf(stderr, "pathname can be \"NULL\" to use NULL "
-		"argument in call\n");
-	fprintf(stderr, "\n");
-
-	fprintf(stderr, "Either nsec field can be\n");
-	fprintf(stderr, "    'n' for UTIME_NOW\n");
-	fprintf(stderr, "    'o' for UTIME_OMIT\n");
-	fprintf(stderr, "\n");
-
-	fprintf(stderr, "If the time fields are omitted, "
-		"then a NULL 'times' argument is used\n");
-	fprintf(stderr, "\n");
-
-	exit(EXIT_bad_usage);
+	if (tc->exp_err != -1)
+		return;
+
+	/*
+	 * Starting with 4.8.0 operations on immutable files return EPERM
+	 * instead of EACCES.
+	 * This patch has also been merged to stable 4.4 with
+	 * b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
+	 */
+	if (tst_kvercmp(4, 4, 27) < 0)
+		tc->exp_err = EACCES;
+	else
+		tc->exp_err = EPERM;
 }
 
-int main(int argc, char *argv[])
+static void change_attr(struct test_case *tc, int fd, int set)
 {
-	int flags, dirfd, opt, oflag;
-	struct timespec ts[2];
-	struct timespec *tsp;
-	char *pathname, *dirfdPath;
-	struct stat sb;
-	int verbose;
-
-	/* Command-line argument parsing */
-
-	flags = 0;
-	verbose = 1;
-	dirfd = AT_FDCWD;
-	dirfdPath = NULL;
-	oflag = O_RDONLY;
-
-	while ((opt = getopt(argc, argv, "d:nqw")) != -1) {
-		switch (opt) {
-		case 'd':
-			dirfdPath = optarg;
-			break;
-
-		case 'n':
-			flags |= AT_SYMLINK_NOFOLLOW;
-			if (verbose)
-				printf("Not following symbolic links\n");
-			break;
-
-		case 'q':
-			verbose = 0;
-			break;
-
-		case 'w':
-			oflag = O_RDWR | O_APPEND;
-			break;
-
-		default:
-			usageError(argv[0]);
-		}
-	}
+	int attr;
 
-	if ((optind + 5 != argc) && (optind + 1 != argc))
-		usageError(argv[0]);
-
-	if (dirfdPath != NULL) {
-		dirfd = open(dirfdPath, oflag);
-		if (dirfd == -1)
-			errExit("open");
-
-		if (verbose) {
-			printf("Opened dirfd %d", oflag);
-			if ((oflag & O_ACCMODE) == O_RDWR)
-				printf(" O_RDWR");
-			if (oflag & O_APPEND)
-				printf(" O_APPEND");
-			printf(": %s\n", dirfdPath);
-		}
-	}
+	if (!tc->attr)
+		return;
 
-	pathname = (strcmp(argv[optind], "NULL") == 0) ? NULL : argv[optind];
+	SAFE_IOCTL(fd, FS_IOC_GETFLAGS, &attr);
 
-	/* Either, we get no values for 'times' fields, in which case
-	   we give a NULL pointer to utimensat(), or we get four values,
-	   for secs+nsecs for each of atime and mtime.  The special
-	   values 'n' and 'o' can be used for tv_nsec settings of
-	   UTIME_NOW and UTIME_OMIT, respectively. */
+	if (set)
+		attr |= tc->attr;
+	else
+		attr &= ~tc->attr;
 
-	if (argc == optind + 1) {
-		tsp = NULL;
+	SAFE_IOCTL(fd, FS_IOC_SETFLAGS, &attr);
+}
 
-	} else {
-		ts[0].tv_sec = atoi(argv[optind + 1]);
-		if (argv[optind + 2][0] == 'n') {
-			ts[0].tv_nsec = UTIME_NOW;
-		} else if (argv[optind + 2][0] == 'o') {
-			ts[0].tv_nsec = UTIME_OMIT;
-		} else {
-			ts[0].tv_nsec = atoi(argv[optind + 2]);
-		}
+static void reset_time(char *pathname, int dfd, int flags)
+{
+	struct timespec ts[2];
+	struct stat sb;
 
-		ts[1].tv_sec = atoi(argv[optind + 3]);
-		if (argv[optind + 4][0] == 'n') {
-			ts[1].tv_nsec = UTIME_NOW;
-		} else if (argv[optind + 4][0] == 'o') {
-			ts[1].tv_nsec = UTIME_OMIT;
-		} else {
-			ts[1].tv_nsec = atoi(argv[optind + 4]);
-		}
+	ts[0].tv_sec = 0;
+	ts[0].tv_nsec = 0;
+	ts[1].tv_sec = 0;
+	ts[1].tv_nsec = 0;
 
-		tsp = ts;
+	TEST(sys_utimensat(dfd, pathname, ts, flags));
+	TEST(stat(pathname, &sb));
+	if (sb.st_atime || sb.st_mtime) {
+		tst_res(TFAIL, "Failed to reset access and modification time (%lu: %lu)",
+			sb.st_atime, sb.st_mtime);
 	}
+}
 
-	/* For testing purposes, it may have been useful to run this program
-	   as set-user-ID-root so that a directory file descriptor could be
-	   opened as root.  (This allows us to obtain a file descriptor even
-	   if normal user doesn't have permissions on the file.)  Now we
-	   reset to the real UID before making the utimensat() call, so that
-	   the permission checking for the utimensat() call is performed
-	   under that UID. */
+static void run(unsigned int i)
+{
+	struct test_case *tc = &tcase[i];
+	struct timespec ts[2];
+	void *tsp = NULL;
+	char *pathname = NULL;
+	int dfd = AT_FDCWD, fd = 0, atime_change, mtime_change;
+	struct mytime *mytime = tc->mytime;
+	struct stat sb;
 
-	if (geteuid() == 0) {
-		uid_t u;
+	update_error(tc);
 
-		u = getuid();
+	if (tc->dirfd != AT_FDCWD)
+		dfd = SAFE_OPEN(TEST_DIR, tc->oflags);
 
-		if (verbose)
-			printf("Resetting UIDs to %ld\n", (long)u);
+	if (mytime) {
+		ts[0].tv_sec = mytime->access_tv_sec;
+		ts[0].tv_nsec = mytime->access_tv_nsec;
+		ts[1].tv_sec = mytime->mod_tv_sec;
+		ts[1].tv_nsec = mytime->mod_tv_nsec;
+		tsp = ts;
+	} else if (tc->exp_err == EFAULT) {
+		tsp = bad_addr;
+	}
 
-		if (setresuid(u, u, u) == -1)
-			errExit("setresuid");
+	if (tc->pathname) {
+		fd = SAFE_OPEN(tc->pathname, O_WRONLY | O_CREAT);
+		pathname = tc->pathname;
+		SAFE_CHMOD(tc->pathname, tc->mode);
+		reset_time(pathname, dfd, tc->flags);
+		change_attr(tc, fd, 1);
+	} else if (tc->exp_err == EFAULT) {
+		pathname = bad_addr;
 	}
 
-	/* Display information allowing user to verify arguments for call */
+	TEST(sys_utimensat(dfd, pathname, tsp, tc->flags));
+	if (tc->pathname)
+		change_attr(tc, fd, 0);
 
-	if (verbose) {
-		printf("dirfd is %d\n", dirfd);
-		printf("pathname is %s\n", pathname);
-		printf("tsp is %p", tsp);
-		if (tsp != NULL) {
-			printf("; struct  = { %ld, %ld } { %ld, %ld }",
-			       (long)tsp[0].tv_sec, (long)tsp[0].tv_nsec,
-			       (long)tsp[1].tv_sec, (long)tsp[1].tv_nsec);
+	if (TST_RET) {
+		if (!tc->exp_err) {
+			tst_res(TFAIL | TTERRNO, "%2d: utimensat() failed", i);
+		} else if (tc->exp_err == TST_ERR) {
+			tst_res(TPASS | TTERRNO, "%2d: utimensat() failed expectedly", i);
+		} else {
+			tst_res(TFAIL | TTERRNO, "%2d: utimensat() failed with incorrect error, expected %s",
+				i, tst_strerrno(tc->exp_err));
 		}
-		printf("\n");
-		printf("flags is %d\n", flags);
-	}
-
-	/* Make the call and see what happened */
-
-	if (utimensat_sc(dirfd, pathname, tsp, flags) == -1) {
-		if (errno == EPERM) {
-			if (verbose)
-				printf("utimensat() failed with EPERM\n");
-			else
-				printf("EPERM\n");
-			exit(EXIT_FAILURE);
-
-		} else if (errno == EACCES) {
-			if (verbose)
-				printf("utimensat() failed with EACCES\n");
-			else
-				printf("EACCES\n");
-			exit(EXIT_FAILURE);
-
-		} else if (errno == EINVAL) {
-			if (verbose)
-				printf("utimensat() failed with EINVAL\n");
-			else
-				printf("EINVAL\n");
-			exit(EXIT_FAILURE);
-
-		} else {	/* Unexpected failure case from utimensat() */
-			errExit("utimensat");
+	} else if (tc->exp_err) {
+		tst_res(TFAIL, "%2d: utimensat() passed unexpectedly", i);
+	} else {
+		atime_change = mytime ? mytime->atime_change : 1;
+		mtime_change = mytime ? mytime->mtime_change : 1;
+
+		TEST(stat(tc->pathname ? tc->pathname : TEST_DIR, &sb));
+		if (!!sb.st_atime != atime_change) {
+			tst_res(TFAIL, "%2d: atime %s have changed but %s",
+				i, atime_change ? "should" : "shouldn't",
+				sb.st_atime ? "did" : "didn't");
+		} else if (!!sb.st_mtime != mtime_change) {
+			tst_res(TFAIL, "%2d: mtime %s have changed but %s",
+				i, mtime_change ? "should" : "shouldn't",
+				sb.st_mtime ? "did" : "didn't");
+		} else {
+			tst_res(TPASS, "%2d: utimensat() passed", i);
 		}
 	}
 
-	if (verbose)
-		printf("utimensat() succeeded\n");
-
-	if (stat((pathname != NULL) ? pathname : dirfdPath, &sb) == -1)
-		errExit("stat");
+	if (dfd != AT_FDCWD)
+		SAFE_CLOSE(dfd);
 
-	if (verbose) {
-		printf("Last file access:         %s", ctime(&sb.st_atime));
-		printf("Last file modification:   %s", ctime(&sb.st_mtime));
-		printf("Last status change:       %s", ctime(&sb.st_ctime));
-
-	} else {
-		printf("SUCCESS %ld %ld\n", (long)sb.st_atime,
-		       (long)sb.st_mtime);
-	}
-
-	exit(EXIT_SUCCESS);
+	if (tc->pathname)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcase),
+	.setup = setup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/utimensat/utimensat_tests.sh b/testcases/kernel/syscalls/utimensat/utimensat_tests.sh
deleted file mode 100755
index 46a0cc64bf90..000000000000
--- a/testcases/kernel/syscalls/utimensat/utimensat_tests.sh
+++ /dev/null
@@ -1,517 +0,0 @@
-#!/bin/sh
-#
-# Automated tests for utimensat()
-#
-# Copyright (C) 2008, Linux Foundation
-# Written by Michael Kerrisk <mtk.manpages@gmail.com>
-# Licensed under GPLv2 or later
-#
-# Not (yet) included in this automated test set:
-# * AT_SYMLINK_NOFOLLOW in flags: If pathname specifies a symbolic link,
-#   then update the timestamps of the link, rather than the file to which
-#   it refers.
-# * Setting of nanosecond components of timestamps (support for
-#   nanosecond timestamps is file-system-dependent)
-# * "Updated file timestamps are set to the greatest value supported
-#   by the file system that is not greater than the specified time."
-#   (i.e., if we set timestamp to {0, 999999999}, then the setting
-#   is rounded down, rather than up, to unit of timestamp resolution.
-# * Privileged processes should be able to bypass permission checks.
-#   (except when file is marked with the "Immutable" EFA).
-
-#=====================================================================
-
-export TCID=utimensat01
-export TST_TOTAL=99
-export TST_COUNT=0
-. test.sh
-
-if tst_kvcmp -lt "2.6.22"; then
-	tst_brkm TCONF "System kernel version is less than 2.6.22,cannot execute test"
-fi
-
-# Starting with 4.8.0 operations on immutable files return EPERM instead of
-# EACCES.
-# This patch has also been merged to stable 4.4 with
-# b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
-if tst_kvcmp -ge "4.4.27" -a -lt "4.5.0"; then
-	imaccess=EPERM
-elif tst_kvcmp -lt "4.4.27"; then
-	imaccess=EACCES
-else
-	imaccess=EPERM
-fi
-
-
-RESULT_FILE=$TMPDIR/utimensat.result
-
-TEST_DIR=$TMPDIR/utimensat_tests
-FILE=$TEST_DIR/utimensat.test_file
-
-TEST_PROG=utimensat01
-
-if [ ! -f $LTPROOT/testcases/bin/$TEST_PROG ]; then
-	tst_brkm TBROK "$LTPROOT/testcases/bin/$TEST_PROG is missing (please check install)"
-fi
-
-# Summary counters of all test results
-
-test_num=0
-failed_cnt=0
-passed_cnt=0
-failed_list=""
-
-#=====================================================================
-
-setup_file()
-{
-# $1 is test file pathname
-# $2 is owner for test file (chown(1))
-# $3 is permissions for test file (chmod(1))
-# $4 is "ext2" extended file attributes for test file (chattr(1))
-
-    FILE=$1
-
-    # Make sure any old version of file is deleted
-
-    if test -e $FILE; then
-        sudo $s_arg chattr -ai $FILE || return $?
-        sudo $s_arg rm -f $FILE || return $?
-    fi
-
-    # Create file and make atime and mtime zero.
-
-    sudo $s_arg -u $test_user touch $FILE || return $?
-    if ! $TEST_PROG -q $FILE 0 0 0 0 > $RESULT_FILE; then
-        echo "Failed to set up test file $FILE" 1>&2
-        exit 1
-    fi
-
-    read res atime mtime < $RESULT_FILE
-    if test "X$res" != "XSUCCESS" ||
-                test $atime -ne 0 || test $mtime != 0; then
-        echo "Failed to set correct times on test file $FILE" 1>&2
-        exit 1
-    fi
-
-    # Set owner, permissions, and EFAs for file.
-
-    if test -n "$2"; then
-        sudo $s_arg chown $2 $FILE || return $?
-    fi
-
-    sudo $s_arg chmod $3 $FILE || return $?
-
-    if test -n "$4"; then
-        sudo $s_arg chattr $4 $FILE || return $?
-    fi
-
-    # Display file setup, for visual verification
-
-    ls -l $FILE | awk '{ printf "Owner=%s; perms=%s; ", $3, $1}'
-    if ! sudo $s_arg lsattr -l $FILE | sed 's/, /,/g' | awk '{print "EFAs=" $2}'
-    then
-        return $?
-    fi
-
-}
-
-test_failed()
-{
-    tst_resm TFAIL "FAILED test $test_num"
-
-    failed_cnt=$(expr $failed_cnt + 1)
-    failed_list="$failed_list $test_num"
-}
-
-check_result()
-{
-    STATUS=$1                   # Exit status from test program
-    EXPECTED_RESULT=$2          # SUCCESS / EACCES / EPERM / EINVAL
-    EXPECT_ATIME_CHANGED=$3     # Should be 'y' or 'n' (only for SUCCESS)
-    EXPECT_MTIME_CHANGED=$4     # Should be 'y' or 'n' (only for SUCCESS)
-
-    test_num=$(expr $test_num + 1)
-
-    # If our test setup failed, stop immediately
-
-    if test $STATUS -gt 1; then
-        echo "FAILED (bad test setup)"
-        exit 1
-    fi
-
-    read res atime mtime < $RESULT_FILE
-
-    echo "EXPECTED: $EXPECTED_RESULT $EXPECT_ATIME_CHANGED "\
-         "$EXPECT_MTIME_CHANGED"
-    echo "RESULT:   $res $atime $mtime"
-
-    if test "$res" != "$EXPECTED_RESULT"; then
-        test_failed
-        return
-    fi
-
-    passed=1
-
-    # If the test program exited successfully, then check that atime and
-    # and mtime were updated / not updated, as expected.
-
-    if test $EXPECTED_RESULT = "SUCCESS"; then
-        if test $EXPECT_ATIME_CHANGED = "y"; then
-            if test $atime -eq 0; then
-                echo "atime should have changed, but did not"
-                passed=0
-            fi
-        else
-            if test $atime -ne 0; then
-                echo "atime should not have changed, but did"
-                passed=0
-            fi
-        fi
-
-        if test $EXPECT_MTIME_CHANGED = "y"; then
-            if test $mtime -eq 0; then
-                echo "mtime should have changed, but did not"
-                passed=0
-            fi
-        else
-            if test $mtime -ne 0; then
-                echo "mtime should not have changed, but did"
-                passed=0
-            fi
-        fi
-
-        if test $passed -eq 0; then
-            test_failed
-            return
-        fi
-    fi
-
-    passed_cnt=$(expr $passed_cnt + 1)
-    tst_resm TPASS "PASSED test $test_num"
-}
-
-run_test()
-{
-    # By default, we do three types of test:
-    # a) pathname (pathname != NULL)
-    # b) readable file descriptor (pathname == NULL, dirfd opened O_RDONLY)
-    # c) writable file descriptor (pathname == NULL, dirfd opened O_RDWR).
-    #    For this case we also include O_APPEND in open flags, since that
-    #    is needed if testing with a file that has the Append-only
-    #    attribute enabled.
-
-    # -R says don't do tests with readable file descriptor
-    # -W says don't do tests with writable file descriptor
-
-    OPTIND=1
-
-    do_read_fd_test=1
-    do_write_fd_test=1
-    while getopts "RW" opt; do
-        case "$opt" in
-        R) do_read_fd_test=0
-           ;;
-        W) do_write_fd_test=0
-           ;;
-        *) echo "run_test: bad usage"
-           exit 1
-           ;;
-        esac
-    done
-    shift `expr $OPTIND - 1`
-
-    echo "Pathname test"
-    setup_file $FILE "$1" "$2" "$3"
-    cp $LTPROOT/testcases/bin/$TEST_PROG ./
-    CMD="./$TEST_PROG -q $FILE $4"
-    echo "$CMD"
-    sudo $s_arg -u $test_user $CMD > $RESULT_FILE
-    check_result $? $5 $6 $7
-    echo
-
-    if test $do_read_fd_test -ne 0; then
-        echo "Readable file descriptor (futimens(3)) test"
-        setup_file $FILE "$1" "$2" "$3"
-        CMD="./$TEST_PROG -q -d $FILE NULL $4"
-        echo "$CMD"
-        sudo $s_arg -u $test_user $CMD > $RESULT_FILE
-        check_result $? $5 $6 $7
-        echo
-    fi
-
-    # Can't do the writable file descriptor test for immutable files
-    # (even root can't open an immutable file for writing)
-
-    if test $do_write_fd_test -ne 0; then
-        echo "Writable file descriptor (futimens(3)) test"
-        setup_file $FILE "$1" "$2" "$3"
-        CMD="./$TEST_PROG -q -w -d $FILE NULL $4"
-        echo "$CMD"
-        sudo $s_arg -u $test_user $CMD > $RESULT_FILE
-        check_result $? $5 $6 $7
-        echo
-    fi
-
-    sudo $s_arg chattr -ai $FILE
-    sudo $s_arg rm -f $FILE
-}
-
-#=====================================================================
-
-# Since some automated testing systems have no tty while testing,
-# comment this line in /etc/sudoers to avoid the error message:
-# `sudo: sorry, you must have a tty to run sudo'
-# Use trap to restore this line after program terminates.
-sudoers=/etc/sudoers
-if [ ! -r $sudoers ]; then
-	tst_brkm TBROK "can't read $sudoers"
-fi
-pattern="[[:space:]]*Defaults[[:space:]]*requiretty.*"
-if grep -q "^${pattern}" $sudoers; then
-	tst_resm TINFO "Comment requiretty in $sudoers for automated testing systems"
-	if ! sed -r -i.$$ -e "s/^($pattern)/#\1/" $sudoers; then
-		tst_brkm TBROK "failed to mangle $sudoers properly"
-	fi
-	trap 'trap "" EXIT; restore_sudoers' EXIT
-fi
-
-restore_sudoers()
-{
-	tst_resm TINFO "Restore requiretty in $sudoers"
-	mv /etc/sudoers.$$ /etc/sudoers
-}
-
-test_user=nobody
-echo "test sudo for -n option, non-interactive"
-if sudo -h | grep -q -- -n; then
-	s_arg="-n"
-	echo "sudo supports -n"
-else
-	s_arg=
-	echo "sudo does not support -n"
-fi
-
-if ! sudo $s_arg true; then
-	tst_brkm TBROK "sudo cannot be run by user non-interactively"
-fi
-if test ! -f $sudoers
-then
-	echo "root    ALL=(ALL)    ALL" > $sudoers || exit
-	chmod 440 $sudoers
-	trap 'trap "" EXIT; nuke_sudoers' EXIT
-fi
-
-nuke_sudoers()
-{
-	sudo rm -f $sudoers
-}
-
-sudo $s_arg -u $test_user mkdir -p $TEST_DIR
-
-# Make sure chattr command is supported
-touch $TEST_DIR/tmp_file
-chattr +a $TEST_DIR/tmp_file
-if [ $? -ne 0 ] ; then
-	rm -rf $TEST_DIR
-	tst_brkm TCONF "chattr not supported"
-fi
-chattr -a $TEST_DIR/tmp_file
-
-cd $TEST_DIR
-chown root $LTPROOT/testcases/bin/$TEST_PROG
-chmod ugo+x,u+s $LTPROOT/testcases/bin/$TEST_PROG
-
-#=====================================================================
-
-
-echo "============================================================"
-
-echo
-echo "Testing read-only file, owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test -W "" 400 "" "" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test -W "" 400 "" "0 n 0 n" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test -W "" 400 "" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test -W "" 400 "" "0 n 0 o" SUCCESS y n
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test -W "" 400 "" "0 o 0 n" SUCCESS n y
-
-echo "***** Testing times=={ x, y } case *****"
-run_test -W "" 400 "" "1 1 1 1" SUCCESS y y
-
-echo "============================================================"
-
-echo
-echo "Testing read-only file, not owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test -RW root 400 "" "" EACCES
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test -RW root 400 "" "0 n 0 n" EACCES
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test -RW root 400 "" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test -RW root 400 "" "0 n 0 o" EPERM
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test -RW root 400 "" "0 o 0 n" EPERM
-
-echo "***** Testing times=={ x, y } case *****"
-run_test -RW root 400 "" "1 1 1 1" EPERM
-
-echo "============================================================"
-
-echo
-echo "Testing writable file, not owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test root 666 "" "" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test root 666 "" "0 n 0 n" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test root 666 "" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test root 666 "" "0 n 0 o" EPERM
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test root 666 "" "0 o 0 n" EPERM
-
-echo "***** Testing times=={ x, y } case *****"
-run_test root 666 "" "1 1 1 1" EPERM
-
-echo "============================================================"
-
-echo
-echo "Testing append-only file, owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test "" 600 "+a" "" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test "" 600 "+a" "0 n 0 n" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test "" 600 "+a" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test "" 600 "+a" "0 n 0 o" EPERM
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test "" 600 "+a" "0 o 0 n" EPERM
-
-echo "***** Testing times=={ x, y } case *****"
-run_test "" 600 "+a" "1 1 1 1" EPERM
-
-echo "============================================================"
-
-echo
-echo "Testing immutable file, owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test -W "" 600 "+i" "" $imaccess
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test -W "" 600 "+i" "0 n 0 n" $imaccess
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test -W "" 600 "+i" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test -W "" 600 "+i" "0 n 0 o" EPERM
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test -W "" 600 "+i" "0 o 0 n" EPERM
-
-echo "***** Testing times=={ x, y } case *****"
-run_test -W "" 600 "+i" "1 1 1 1" EPERM
-
-echo "============================================================"
-
-# Immutable+append-only should have same results as immutable
-
-echo
-echo "Testing immutable append-only file, owned by self"
-echo
-
-echo "***** Testing times==NULL case *****"
-run_test -W "" 600 "+ai" "" $imaccess
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test -W "" 600 "+ai" "0 n 0 n" $imaccess
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test -W "" 600 "+ai" "0 o 0 o" SUCCESS n n
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_OMIT } case *****"
-run_test -W "" 600 "+ai" "0 n 0 o" EPERM
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_NOW } case *****"
-run_test -W "" 600 "+ai" "0 o 0 n" EPERM
-
-echo "***** Testing times=={ x, y } case *****"
-run_test -W "" 600 "+ai" "1 1 1 1" EPERM
-
-echo "============================================================"
-
-echo
-
-# EINVAL should result, if pathname is NULL, dirfd is not
-# AT_FDCWD, and flags contains AT_SYMLINK_NOFOLLOW.
-
-echo "***** Testing pathname==NULL, dirfd!=AT_FDCWD, flags has" \
-     "AT_SYMLINK_NOFOLLOW *****"
-setup_file $FILE "" 600 ""
-CMD="$TEST_PROG -q -n -d $FILE NULL $4"
-echo "$CMD"
-$CMD > $RESULT_FILE
-check_result $? EINVAL
-echo
-
-echo "============================================================"
-
-echo
-
-# If UTIME_NOW / UTIME_OMIT in tv_nsec field, the tv_sec should
-# be ignored.
-
-echo "tv_sec should be ignored if tv_nsec is UTIME_OMIT or UTIME_NOW"
-
-echo "***** Testing times=={ UTIME_NOW, UTIME_NOW } case *****"
-run_test -RW "" 600 "" "1 n 1 n" SUCCESS y y
-
-echo "***** Testing times=={ UTIME_OMIT, UTIME_OMIT } case *****"
-run_test -RW "" 600 "" "1 o 1 o" SUCCESS n n
-
-echo "============================================================"
-
-echo
-
-rm -rf "$TEST_DIR"
-uname -a
-date
-echo "Total tests: $test_num; passed: $passed_cnt; failed: $failed_cnt"
-if test $failed_cnt -gt 0; then
-    echo "Failed tests: $failed_list"
-fi
-
-tst_exit
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
