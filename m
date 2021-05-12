Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0080D37B89C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CAFF3C647F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C9B4D3C4E46
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:12 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7717D1000F1B
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620809530; i=@fujitsu.com;
 bh=k9ul3OEgjdpkvCXrlZdsFtwFeDub2nEHbIZhtf/+u0U=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=IZ3p17p/vYA912n8tjbl6v6Bk1XN3xH0+Y6z2YgKopEyaRFOnKn+CR82alf1yZ186
 aS0jDrDyMEgxpUz3/KNRzUeR1XyNWTz4GzXPFZGP216vlXW22H0sxe7FQeDz/MQcC5
 TueFbYTFas/5hN1lLSQsWPxCFBX7ZTLVnIBL6x/0rVrHxgt417Cq+AQy4GjR1MdD9C
 n5T157QX/XMAjGOJkT9rAcysDDJFKZIoapZkX0FavC5AEZdSAuyahZudS/n2+scdzK
 JaiQ4HFwu3ezQxj+5M8sB9gnFLAODKXhJ0Fmw07jQDPiVZ1ooXvzwY0UTuCxyQwGk+
 gUx8boSqxTSwA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 4F/0D-38619-A379B906;
 Wed, 12 May 2021 08:52:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MRqms1fXa
 Cwec2ZosV33cwOjB67Pu9jjWAMYo1My8pvyKBNePIkcqClVcYK67tOsvcwPh7BWMXIxeHkEAL
 k8TWu91Qzm5Gif+rtrN0MXJysAloSjzrXMAMYosISEh0NLxlB7GZBdQllk/6xQRiCwvYSbTeP
 cgGYrMIqEosvHWFEcTmFfCQOPJyI1hcQkBBYsrD92BzOAU8JY48mAdUwwG0zENi635uiHJBiZ
 Mzn7BAjJeQOPjiBTNEq6LEpY5vjBB2hcSMGdvYJjDyz0LSMgtJywJGplWMlklFmekZJbmJmTm
 6hgYGuoaGxrqmukYmhnqJVbpJeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzAkEwpZP24
 g/HQ6w96hxglOZiURHlPes5OEOJLyk+pzEgszogvKs1JLT7EKMPBoSTBWzYVKCdYlJqeWpGWm
 QOMD5i0BAePkghvwzSgNG9xQWJucWY6ROoUoy7H5rlLFzELseTl56VKifPeBJkhAFKUUZoHNw
 IWq5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM6g6ziycwrgdv0CugIJqAjbkyfBXJESSJ
 CSqqByeSYlYt3Uvsua5eIT6Ydtz/lRd3kjOT7WnJVomjiojtBa1/lGJzIilpydf/XgLKwjGLf
 jeZsh7enqWwS8tqrktRz+ovunYmrZzzaxPFh5bRDZS43PfaGXmQJzPufu3mJ/asqt+sZr7mnW
 q5zPCjZbnZzTjfrwrv7Nyk89mSQ81kp8JrxMeNUd1cFNbaouv0X9VOyHCZpfDn6Y1WuiQkfF8
 P7GHlBY1+7+7Gbjd6UcujHsBf9e5nkvFjiZ8gNbcHtvQlyfw7lrvg75+7bnsMdB9OqNv0N/lk
 7M0bt++0dX5jPPfNbPtVuS6Hul/CN1z7fig7RSfnHJsLTo7PaXHGuB4f19je2sqmNoSdVJzJ9
 VWIpzkg01GIuKk4EALocvvBQAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-248.messagelabs.com!1620809529!807703!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4994 invoked from network); 12 May 2021 08:52:09 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-6.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2021 08:52:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14C8q2F3009086
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 12 May 2021 09:52:09 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 12 May 2021 09:52:05 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 May 2021 16:52:19 +0800
Message-ID: <1620809541-6891-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/4] syscalls/shmget*: Convert into new api
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

1) merge shmget05.c into shmget02.c
2) Use SHMMIN -1 and SHMMAX + 1 to trigger EINVAL error
3) Use SHM_RD, SHM_WR, SHM_RW to trigger EACCES error under unpriviledged user

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 include/lapi/shm.h                            |  14 +
 runtest/syscalls                              |   1 -
 runtest/syscalls-ipc                          |   1 -
 .../kernel/syscalls/ipc/shmget/.gitignore     |   1 -
 testcases/kernel/syscalls/ipc/shmget/Makefile |   4 +-
 .../kernel/syscalls/ipc/shmget/shmget02.c     | 243 +++++++-----------
 .../kernel/syscalls/ipc/shmget/shmget03.c     | 199 ++++----------
 .../kernel/syscalls/ipc/shmget/shmget04.c     | 193 +++++---------
 .../kernel/syscalls/ipc/shmget/shmget05.c     | 185 -------------
 9 files changed, 209 insertions(+), 632 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c

diff --git a/include/lapi/shm.h b/include/lapi/shm.h
index 61c4e37bf..bb280fc44 100644
--- a/include/lapi/shm.h
+++ b/include/lapi/shm.h
@@ -6,8 +6,22 @@
 #ifndef LAPI_SHM_H__
 #define LAPI_SHM_H__
 
+#include <limits.h>
+
 #ifndef SHM_STAT_ANY
 # define SHM_STAT_ANY 15
 #endif
 
+#ifndef SHMMIN
+# define SHMMIN 1
+#endif
+
+#ifndef SHMMAX
+# define SHMMAX (ULONG_MAX - (1UL << 24))
+#endif
+
+#ifndef SHMMNI
+# define SHMMNI 4096
+#endif
+
 #endif /* LAPI_SHM_H__ */
diff --git a/runtest/syscalls b/runtest/syscalls
index 63d821e53..2dff25984 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1402,7 +1402,6 @@ shmdt02 shmdt02
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
-shmget05 shmget05
 
 sigaction01 sigaction01
 sigaction02 sigaction02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index ff0364704..b3bd37923 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -67,4 +67,3 @@ shmdt02 shmdt02
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
-shmget05 shmget05
diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
index 6f08529f8..c57df68f5 100644
--- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
@@ -1,4 +1,3 @@
 /shmget02
 /shmget03
 /shmget04
-/shmget05
diff --git a/testcases/kernel/syscalls/ipc/shmget/Makefile b/testcases/kernel/syscalls/ipc/shmget/Makefile
index 26b9f264d..b1201281d 100644
--- a/testcases/kernel/syscalls/ipc/shmget/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmget/Makefile
@@ -3,10 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LTPLDLIBS  = -lltpipc
+LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index 4436ca7f8..a57904ce9 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -1,184 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2001
+ *  03/2001 - Written by Wayne Boyer
  *
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
+ * Copyright (c) 2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
  */
 
-/*
- * NAME
- *	shmget02.c
- *
- * DESCRIPTION
- *	shmget02 - check for ENOENT, EEXIST and EINVAL errors
+/*\
+ * [Description]
  *
- * ALGORITHM
- *	create a shared memory segment with read & write permissions
- *	loop if that option was specified
- *	  call shmget() using five different invalid cases
- *	  check the errno value
- *	    issue a PASS message if we get ENOENT, EEXIST or EINVAL
- *	  otherwise, the tests fails
- *	    issue a FAIL message
- *	call cleanup
+ * Test for ENOENT, EEXIST, EINVAL, EACCES errors.
  *
- * USAGE:  <for command-line>
- *  shmget02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- *      06/03/2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
- *      - Fix concurrency issue. The second key used for this test could
- *        conflict with the key from another task.
- *
- * RESTRICTIONS
- *	none
+ * ENOENT - No segment exists for the given key and IPC_CREAT was not specified.
+ * EEXIST - the segment exists and IPC_CREAT | IPC_EXCL is given.
+ * EINVAL - A new segment was to be created and size is less than SHMMIN or
+ * greater than SHMMAX. Or a segment for the given key exists, but size is
+ * greater than the size of that segment.
+ * EACCES - The user does not have permission to access the shared memory segment.
  */
-
-#include "ipcshm.h"
-
-char *TCID = "shmget02";
-int TST_TOTAL = 4;
-
-int shm_id_1 = -1;
-int shm_nonexisting_key = -1;
-key_t shmkey2;
-
-struct test_case_t {
-	int *skey;
-	int size;
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <stdlib.h>
+#include <pwd.h>
+#include <sys/shm.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/shm.h"
+
+static int shm_id = -1;
+static key_t shmkey, shmkey1;
+static struct passwd *pw;
+
+static struct tcase {
+	int *shmkey;
+	size_t size;
 	int flags;
-	int error;
-} TC[] = {
-	/* EINVAL - size is 0 */
-	{
-	&shmkey2, 0, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
-	    /* EINVAL - size is negative */
-//      {&shmkey2, -1, IPC_CREAT | IPC_EXCL | SHM_RW, EINVAL},
-	    /* EINVAL - size is larger than created segment */
-	{
-	&shmkey, SHM_SIZE * 2, SHM_RW, EINVAL},
-	    /* EEXIST - the segment exists and IPC_CREAT | IPC_EXCL is given */
-	{
-	&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW, EEXIST},
-	    /* ENOENT - no segment exists for the key and IPC_CREAT is not given */
-	    /* use shm_id_2 (-1) as the key */
-	{
-	&shm_nonexisting_key, SHM_SIZE, SHM_RW, ENOENT}
+	/*1: nobody expected  0: root expected */
+	int exp_user;
+	int exp_err;
+} tcases[] = {
+	{&shmkey1, SHM_SIZE, IPC_EXCL, 0, ENOENT},
+	{&shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL, 0, EEXIST},
+	{&shmkey1, SHMMIN - 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
+	{&shmkey1, SHMMAX + 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
+	{&shmkey, SHM_SIZE * 2, IPC_EXCL, 0, EINVAL},
+	{&shmkey, SHM_SIZE, SHM_RD, 1, EACCES},
 };
 
-int main(int ac, char **av)
+static void verify_shmget(struct tcase *tc)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-			/*
-			 * Look for a failure ...
-			 */
-
-			TEST(shmget(*(TC[i].skey), TC[i].size, TC[i].flags));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS, "expected failure - errno = "
-					 "%d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TFAIL, "call failed with an "
-					 "unexpected error - %d : %s",
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			}
-		}
+	TEST(shmget(*tc->shmkey, tc->size, tc->flags));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "shmget() returned %li", TST_RET);
+		return;
 	}
 
-	cleanup();
+	if (TST_ERR == tc->exp_err) {
+		tst_res(TPASS | TTERRNO, "shmget(%i, %lu, %i)",
+			*tc->shmkey, tc->size, tc->flags);
+		return;
+	}
 
-	tst_exit();
+	tst_res(TFAIL | TTERRNO, "shmget(%i, %lu, %i) expected %s",
+		*tc->shmkey, tc->size, tc->flags, tst_strerrno(tc->exp_err));
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void do_test(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
+	pid_t pid;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	shmkey = getipckey();
-
-	/* Get an new IPC resource key. */
-	shmkey2 = getipckey();
-
-	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL |
-			       SHM_RW)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create shared memory "
-			 "segment in setup()");
+	if (tc->exp_user == 0) {
+		verify_shmget(tc);
+		return;
 	}
 
-	/* Make sure shm_nonexisting_key is a nonexisting key */
-	while (1) {
-		while (-1 != shmget(shm_nonexisting_key, 1, SHM_RD)) {
-			shm_nonexisting_key--;
-		}
-		if (errno == ENOENT)
-			break;
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		SAFE_SETUID(pw->pw_uid);
+		verify_shmget(tc);
+		exit(0);
 	}
+	tst_reap_children();
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void setup(void)
 {
-	/* if it exists, remove the shared memory resource */
-	rm_shm(shm_id_1);
+	shmkey = GETIPCKEY();
+	shmkey1 = GETIPCKEY();
 
-	tst_rmdir();
+	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
+	pw = SAFE_GETPWNAM("nobody");
+	tst_res(TINFO, "%d %d", shmkey, shmkey1);
+}
 
+static void cleanup(void)
+{
+	if (shm_id >= 0)
+		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.forks_child = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(tcases),
+};
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index 96ebf3608..c74fe241d 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -1,171 +1,68 @@
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
+ *  03/2001 - Written by Wayne Boyer
  */
 
-/*
- * NAME
- *	shmget03.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	shmget03 - test for ENOSPC error
+ * Test for ENOSPC error.
  *
- * ALGORITHM
- *	create shared memory segments in a loop until reaching the system limit
- *	loop if that option was specified
- *	  attempt to create yet another shared memory segment
- *	  check the errno value
- *	    issue a PASS message if we get ENOSPC
- *	  otherwise, the tests fails
- *	    issue a FAIL message
- *	call cleanup
- *
- * USAGE:  <for command-line>
- *  shmget03 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	none
- */
-
-#include "ipcshm.h"
-
-char *TCID = "shmget03";
-int TST_TOTAL = 1;
-
-/*
- * The MAXIDS value is somewhat arbitrary and may need to be increased
- * depending on the system being tested.
+ * ENOSPC -  All possible shared memory IDs have been taken (SHMMNI).
  */
-#define MAXIDS	8192
-
-int shm_id_1 = -1;
-int num_shms = 0;
-
-int shm_id_arr[MAXIDS];
-
-int main(int ac, char **av)
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <stdlib.h>
+#include <pwd.h>
+#include <sys/shm.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/shm.h"
+
+static int shm_id_arr[SHMMNI] = {-1};
+
+static void verify_shmget(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/*
-		 * use the TEST() macro to make the call
-		 */
-
-		TEST(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL
-			    | SHM_RW));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "call succeeded when error expected");
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case ENOSPC:
-			tst_resm(TPASS, "expected failure - errno = "
-				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed with an "
-				 "unexpected error - %d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		}
+	TEST(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "shmget() returned %li", TST_RET);
+		return;
 	}
-
-	cleanup();
-
-	tst_exit();
+	if (TST_ERR == ENOSPC)
+		tst_res(TPASS | TTERRNO, "shmget() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "shmget() failed unexpectedly, expected ENOSPC, bug got");
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
+	int res, num;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	shmkey = getipckey();
-
-	/*
-	 * Use a while loop to create the maximum number of memory segments.
-	 * If the loop exceeds MAXIDS, then break the test and cleanup.
-	 */
-	while ((shm_id_1 = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT |
-				  IPC_EXCL | SHM_RW)) != -1) {
-		shm_id_arr[num_shms++] = shm_id_1;
-		if (num_shms == MAXIDS) {
-			tst_brkm(TBROK, cleanup, "The maximum number of shared "
-				 "memory ID's has been\n\t reached.  Please "
-				 "increase the MAXIDS value in the test.");
-		}
-	}
-
-	/*
-	 * If the errno is other than ENOSPC, then something else is wrong.
-	 */
-	if (errno != ENOSPC) {
-		tst_resm(TINFO, "errno = %d : %s", errno, strerror(errno));
-		tst_brkm(TBROK, cleanup, "Didn't get ENOSPC in test setup");
+	for (num = 0; num < SHMMNI; num++) {
+		res = shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
+		if (res != -1)
+			shm_id_arr[num] = res;
 	}
+	tst_res(TINFO, "The maximum number(%d) of memory ID's has been reached",
+		SHMMNI);
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+
+static void cleanup(void)
 {
 	int i;
 
-	/* remove the shared memory resources that were created */
-	for (i = 0; i < num_shms; i++) {
-		rm_shm(shm_id_arr[i]);
+	for (i = 0; i < SHMMNI; i++) {
+		if (shm_id_arr[i] >= 0)
+			SAFE_SHMCTL(shm_id_arr[i], IPC_RMID, NULL);
 	}
-
-	tst_rmdir();
-
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_shmget,
+};
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget04.c b/testcases/kernel/syscalls/ipc/shmget/shmget04.c
index 60a263c77..fe611b306 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget04.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget04.c
@@ -1,153 +1,78 @@
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
+ *  03/2001 - Written by Wayne Boyer
  */
 
-/*
- * NAME
- *	shmget04.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	shmget04 - test for EACCES error
+ * Test for EACCES error.
  *
- * ALGORITHM
- *	create a shared memory segment without read or write permissions
- *	loop if that option was specified
- *	  call shmget() with SHM_RW flag using TEST() macro
- *	  check the errno value
- *	    issue a PASS message if we get EACCES
- *	  otherwise, the tests fails
- *	    issue a FAIL message
- *	call cleanup
- *
- * USAGE:  <for command-line>
- *  shmget04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	none
+ * Create a shared memory segment without read or write permissions under
+ * unpriviledged user and call shmget() with SHM_RD/SHM_WR/SHM_RW flag to
+ * trigger EACCES error.
  */
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <stdlib.h>
 #include <pwd.h>
-#include "ipcshm.h"
-
-char *TCID = "shmget04";
-int TST_TOTAL = 1;
-
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-int shm_id_1 = -1;
-
-int main(int ac, char **av)
+#include <sys/shm.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/shm.h"
+
+static int shm_id = -1;
+static key_t shmkey;
+static struct tcase {
+	char *message;
+	int flag;
+} tcases[] = {
+	{"Testing SHM_RD flag", SHM_RD},
+	{"Testing SHM_WR flag", SHM_WR},
+	{"Testing SHM_RW flag", SHM_RW},
+};
+
+static void verify_shmget(unsigned int n)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/*
-		 * use the TEST() macro to make the call
-		 */
+	struct tcase *tc = &tcases[n];
 
-		TEST(shmget(shmkey, SHM_SIZE, SHM_RW));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "call succeeded when error expected");
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EACCES:
-			tst_resm(TPASS, "expected failure - errno = "
-				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed with an "
-				 "unexpected error - %d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		}
+	tst_res(TINFO, "%s", tc->message);
+	TEST(shmget(shmkey, SHM_SIZE, tc->flag));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "shmget() returned %li", TST_RET);
+		return;
 	}
-
-	cleanup();
-
-	tst_exit();
+	if (TST_ERR == EACCES)
+		tst_res(TPASS | TTERRNO, "shmget() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "shmget() failed unexpectedly, expected EACCES, bug got");
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	struct passwd *pw;
 
-	TEST_PAUSE;
-
-	/* Switch to nobody user for correct error code collection */
-	ltpuser = getpwnam(nobody_uid);
-	if (setuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TINFO, "setuid failed to "
-			 "to set the effective uid to %d", ltpuser->pw_uid);
-		perror("setuid");
-	}
+	pw = SAFE_GETPWNAM("nobody");
+	SAFE_SETUID(pw->pw_uid);
+	shmkey = GETIPCKEY();
 
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	shmkey = getipckey();
-
-	/* create a shared memory segment without read or access permissions */
-	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL)) == -1) {
-		tst_brkm(TBROK, cleanup, "Failed to create shared memory "
-			 "segment in setup");
-	}
+	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	/* if it exists, remove the shared memory resource */
-	rm_shm(shm_id_1);
-
-	tst_rmdir();
-
+	if (shm_id >= 0)
+		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_shmget,
+	.tcnt = ARRAY_SIZE(tcases),
+};
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
deleted file mode 100644
index de9544591..000000000
--- a/testcases/kernel/syscalls/ipc/shmget/shmget05.c
+++ /dev/null
@@ -1,185 +0,0 @@
-/*
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
- */
-
-/*
- * NAME
- *	shmget05.c
- *
- * DESCRIPTION
- *	shmget05 - test for EACCES error
- *
- * ALGORITHM
- *	create a shared memory segment with root only read & write permissions
- *	fork a child process
- *	if child
- *	  set the ID of the child process to that of "nobody"
- *	  loop if that option was specified
- *	    call shmget() using the TEST() macro
- *	    check the errno value
- *	      issue a PASS message if we get EACCES
- *	    otherwise, the tests fails
- *	      issue a FAIL message
- *	  call cleanup
- *	if parent
- *	  wait for child to exit
- *	  remove the shared memory segment
- *
- * USAGE:  <for command-line>
- *  shmget05 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	test must be run at root
- */
-
-#include "ipcshm.h"
-#include <sys/types.h>
-#include <sys/wait.h>
-#include "safe_macros.h"
-
-char *TCID = "shmget05";
-int TST_TOTAL = 1;
-
-int shm_id_1 = -1;
-
-uid_t ltp_uid;
-char *ltp_user = "nobody";
-
-int main(int ac, char **av)
-{
-	int pid;
-	void do_child(void);
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	if ((pid = FORK_OR_VFORK()) == -1) {
-		tst_brkm(TBROK, cleanup, "could not fork");
-	}
-
-	if (pid == 0) {		/* child */
-		/* set the user ID of the child to the non root user */
-		if (setuid(ltp_uid) == -1) {
-			tst_resm(TBROK, "setuid() failed");
-			exit(1);
-		}
-
-		do_child();
-
-		cleanup();
-
-	} else {		/* parent */
-		/* wait for the child to return */
-		SAFE_WAITPID(cleanup, pid, NULL, 0);
-
-		/* if it exists, remove the shared memory resource */
-		rm_shm(shm_id_1);
-
-		tst_rmdir();
-	}
-	tst_exit();
-}
-
-/*
- * do_child - make the TEST call as the child process
- */
-void do_child(void)
-{
-	int lc;
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/*
-		 * Look for a failure ...
-		 */
-
-		TEST(shmget(shmkey, SHM_SIZE, SHM_RW));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "call succeeded when error expected");
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EACCES:
-			tst_resm(TPASS, "expected failure - errno = "
-				 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed with an "
-				 "unexpected error - %d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		}
-	}
-}
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	shmkey = getipckey();
-
-	/* create a shared memory segment with read and write permissions */
-	if ((shm_id_1 = shmget(shmkey, SHM_SIZE,
-			       SHM_RW | IPC_CREAT | IPC_EXCL)) == -1) {
-		tst_brkm(TBROK, cleanup, "Failed to create shared memory "
-			 "segment in setup");
-	}
-
-	/* get the userid for a non root user */
-	ltp_uid = getuserid(ltp_user);
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-
-}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
