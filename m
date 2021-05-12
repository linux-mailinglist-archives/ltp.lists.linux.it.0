Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E037B89A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4AF93C644A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 361763C4E46
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:12 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0FB821400549
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620809530; i=@fujitsu.com;
 bh=hCt6f5yqrigyN+0Dzw37V1d5CnxHRVtGK+JDY0Zm7hA=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=mCj3eZHL7U6K5KPB2NhCocg5Mm3/NClzTzN8m0xYoE6YwOR52WslzuMuu3Tcvix3i
 rps0aAMS0C+QhAlH6+ugkGkN9Ot01olPS6KZ28MkTMYvXX0CbUE9Lps1N9N0iCrYXc
 8CdGE3+VuxDT6wle2tfFpxlcrCbOaC+9Jc/AAOuvfYkauynIJmmGv4r5KFWKHhupMK
 HYXUh0XEKYRzc//k1WKzr7D8pso9UlvZvM9Oi09u+2Q9uEvRJ0ZLJwK/b3L3iMPwei
 7A+yQF0WGPfcQldIR065EJe76FqMzhfEgV9zwIryvJ9AM/vGABkZViDWiS1iHynek+
 W+cJFTQ10Xyuw==
Received: from [100.112.193.211] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id D0/31-27560-A379B906;
 Wed, 12 May 2021 08:52:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqms5fXa
 CwYX/mhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa0bL2Sb2glV6FYdaPjE1MC5Q6WLk4hASaGGS
 eLr+BDOEs5tR4svi6UxdjJwcbAKaEs86FzCD2CICEhIdDW/ZQWxmAXWJ5ZN+AdVwcAgLmEjc/
 ekEEmYRUJX4fvQiC4jNK+Ah8Wv5JDBbQkBBYsrD98wQcUGJkzOfsECMkZA4+OIFM0SNosSljm
 +MEHaFxIwZ29gmMPLOQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWxrpGxiZ6iVW
 6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHhlVJw8NUOxpVvPugdYpTkYFIS5T3pOTtB
 iC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv2VSgnGBRanpqRVpmDjDUYdISHDxKIrw3JwOleYsLE
 nOLM9MhUqcYdTk2z126iFmIJS8/L1VKnHfNFKAiAZCijNI8uBGwuLvEKCslzMvIwMAgxFOQWp
 SbWYIq/4pRnINRSZj3E8gUnsy8ErhNr4COYAI64sb0WSBHlCQipKQamHoiGGprJGtXfTJoCX7
 L8Vj8gvivU+Gr7WeaRq8vurPW6bxabe1Z08gTKjZTZZyVnJWVmRIPbn2b9PwFt0T2hsNMiwqy
 lk8S5vffa+FWmGf7/8b+3NZ0sz8Fprqyj7vtGnX/X00+o5YeuddV5JrG7Kmf9aSfanGqZn9bP
 Sv57pUl62ri7wWYGbn7lmVYz/JIkhK7tufZxOIjD35/i+14q7+hwdGds8S6/nLOqqsH7tjqsK
 7Qb7TJTe/8toz975Qj6z6fW/P9avpv3811DluCte18dm7e/iXo4vaXSw8dk7o1c5KN1YpVzBZ
 L1RQe197XbLz+c6Go0N7XV5tfTQxd8SCvjoG9K6r96Ia6tqonU5VYijMSDbWYi4oTAXKeEOg2
 AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-267.messagelabs.com!1620809529!5216!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10356 invoked from network); 12 May 2021 08:52:09 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-4.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2021 08:52:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14C8q2F2009086
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 12 May 2021 09:52:09 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 12 May 2021 09:52:00 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 May 2021 16:52:18 +0800
Message-ID: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/4] syscalls/shmget01: Remove it
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

Since shmct01.c and shmctl08.c has covered this case, we don't need this any more.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |   1 -
 runtest/syscalls-ipc                          |   1 -
 .../kernel/syscalls/ipc/shmget/.gitignore     |   1 -
 .../kernel/syscalls/ipc/shmget/shmget01.c     | 171 ------------------
 4 files changed, 174 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index aa7fa24dd..63d821e53 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1399,7 +1399,6 @@ shmctl08 shmctl08
 shmdt01 shmdt01
 shmdt02 shmdt02
 
-shmget01 shmget01
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 68fff4038..ff0364704 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -64,7 +64,6 @@ shmctl08 shmctl08
 shmdt01 shmdt01
 shmdt02 shmdt02
 
-shmget01 shmget01
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
index 728e4344f..6f08529f8 100644
--- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
@@ -1,4 +1,3 @@
-/shmget01
 /shmget02
 /shmget03
 /shmget04
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget01.c b/testcases/kernel/syscalls/ipc/shmget/shmget01.c
deleted file mode 100644
index 586f4c263..000000000
--- a/testcases/kernel/syscalls/ipc/shmget/shmget01.c
+++ /dev/null
@@ -1,171 +0,0 @@
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
- *	shmget01.c
- *
- * DESCRIPTION
- *	shmget01 - test that shmget() correctly creates a shared memory segment
- *
- * ALGORITHM
- *	loop if that option was specified
- *	use the TEST() macro to call shmget()
- *	check the return code
- *	  if failure, issue a FAIL message.
- *	otherwise,
- *	  if doing functionality testing
- *		stat the shared memory resource
- *		check the size, creator pid and mode
- *	  	if correct,
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	  else issue a PASS message
- *	call cleanup
- *
- * USAGE:  <for command-line>
- *  shmget01 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
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
-char *TCID = "shmget01";
-int TST_TOTAL = 1;
-
-int shm_id_1 = -1;
-
-int main(int ac, char **av)
-{
-	int lc;
-	struct shmid_ds buf;
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
-		 * Use TEST macro to make the call
-		 */
-
-		TEST(shmget(shmkey, SHM_SIZE, (IPC_CREAT | IPC_EXCL | SHM_RW)));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "%s call failed - errno = %d : %s",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			shm_id_1 = TEST_RETURN;
-			/* do a STAT and check some info */
-			if (shmctl(shm_id_1, IPC_STAT, &buf) == -1) {
-				tst_resm(TBROK, "shmctl failed in "
-					 "functional test");
-				continue;
-			}
-			/* check the seqment size */
-			if (buf.shm_segsz != SHM_SIZE) {
-				tst_resm(TFAIL, "seqment size is not "
-					 "correct");
-				continue;
-			}
-			/* check the pid of the creator */
-			if (buf.shm_cpid != getpid()) {
-				tst_resm(TFAIL, "creator pid is not "
-					 "correct");
-				continue;
-			}
-			/*
-			 * check the mode of the seqment
-			 * mask out all but the lower 9 bits
-			 */
-			if ((buf.shm_perm.mode & MODE_MASK) !=
-			    ((SHM_RW) & MODE_MASK)) {
-				tst_resm(TFAIL, "segment mode is not "
-					 "correct");
-				continue;
-			}
-			/* if we get here, everything looks good */
-			tst_resm(TPASS, "size, pid & mode are correct");
-		}
-
-		/*
-		 * clean up things in case we are looping
-		 */
-		if (shmctl(shm_id_1, IPC_RMID, NULL) == -1) {
-			tst_resm(TBROK, "couldn't remove shared memory");
-		} else {
-			shm_id_1 = -1;
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
-}
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
-
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
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-	/* if it exists, remove the shared memory resource */
-	rm_shm(shm_id_1);
-
-	tst_rmdir();
-
-}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
