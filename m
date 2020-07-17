Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD22240A9
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:34:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDDA43C4E8A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 18:34:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E462F3C2922
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 68A631001167
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 18:34:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CCDBB1C8
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 16:34:39 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jul 2020 18:34:46 +0200
Message-Id: <20200717163453.9587-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
References: <20200717163453.9587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/9] syscalls/ipc: shmctl03: Remove.
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

All these cases are now covered by shmctl02.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 runtest/syscalls                              |   1 -
 runtest/syscalls-ipc                          |   1 -
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 -
 testcases/kernel/syscalls/ipc/shmctl/Makefile |   2 +-
 .../kernel/syscalls/ipc/shmctl/shmctl03.c     | 204 ------------------
 5 files changed, 1 insertion(+), 208 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 819e8d8ee..5ce482dc7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1355,7 +1355,6 @@ shmat03 shmat03
 
 shmctl01 shmctl01
 shmctl02 shmctl02
-shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index c3a35896c..10cb92c7d 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -53,7 +53,6 @@ shmat02 shmat02
 
 shmctl01 shmctl01
 shmctl02 shmctl02
-shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
 shmctl06 shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index 46b107344..08aa83c19 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -1,6 +1,5 @@
 /shmctl01
 /shmctl02
-/shmctl03
 /shmctl04
 /shmctl05
 /shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index bc5bd7c2e..33e102797 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -10,7 +10,7 @@ shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-shmctl01 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
+shmctl01 shmctl04 shmctl05: LDLIBS += -lltpipc
 shmctl02 shmctl06: LDLIBS += -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
deleted file mode 100644
index 798eadad6..000000000
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
+++ /dev/null
@@ -1,204 +0,0 @@
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
- *	shmctl03.c
- *
- * DESCRIPTION
- *	shmctl03 - check for EACCES, and EPERM errors
- *
- * ALGORITHM
- *	create a shared memory segment with root only read & write permissions
- *	fork a child process
- *	if child
- *	  set the ID of the child process to that of "ltpuser1"
- *	  call do_child()
- *	  loop if that option was specified
- *	    call shmctl() using three different invalid cases
- *	    check the errno value
- *	      issue a PASS message if we get EACCES or EPERM
- *	    otherwise, the tests fails
- *	      issue a FAIL message
- *	  call cleanup
- *	if parent
- *	  wait for child to exit
- *	  remove the shared memory segment
- *
- * USAGE:  <for command-line>
- *  shmctl03 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
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
- *	test must be run as root
- */
-
-#include "ipcshm.h"
-#include <sys/types.h>
-#include <sys/wait.h>
-#include "safe_macros.h"
-
-char *TCID = "shmctl03";
-int shm_id_1 = -1;
-
-uid_t ltp_uid;
-char *ltp_user = "nobody";
-
-struct shmid_ds buf;
-
-struct test_case_t {
-	int *shmid;
-	int cmd;
-	struct shmid_ds *sbuf;
-	int error;
-} TC[] = {
-	/* EACCES - child has no read permission for segment */
-	{
-	&shm_id_1, IPC_STAT, &buf, EACCES},
-	    /* EPERM - IPC_SET - child doesn't have permission to change segment */
-	{
-	&shm_id_1, IPC_SET, &buf, EPERM},
-	    /* EPERM - IPC_RMID - child can not remove the segment */
-	{
-&shm_id_1, IPC_RMID, &buf, EPERM},};
-
-int TST_TOTAL = ARRAY_SIZE(TC);
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
-		/* set  the user ID of the child to the non root user */
-		if (setuid(ltp_uid) == -1) {
-			tst_resm(TBROK, "setuid() failed");
-			exit(1);
-		}
-
-		do_child();
-	} else {
-		/* wait for the child to return */
-		SAFE_WAITPID(cleanup, pid, NULL, 0);
-
-		/* if it exists, remove the shared memory resource */
-		rm_shm(shm_id_1);
-
-		tst_rmdir();
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * do_child - make the call as the child process
- */
-void do_child(void)
-{
-	int i, lc;
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
-			 * use the TEST() macro to make the call
-			 */
-
-			TEST(shmctl(*(TC[i].shmid), TC[i].cmd, TC[i].sbuf));
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
-	if ((shm_id_1 = shmget(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL |
-			       SHM_RW)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create shared memory "
-			 "segment in setup()");
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
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
