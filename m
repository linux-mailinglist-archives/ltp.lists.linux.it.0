Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0C2956FE
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 05:57:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E13F3C56B9
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 05:57:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2E2713C25B3
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 05:57:10 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id CAA85200AFC
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 05:57:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,403,1596470400"; d="scan'208";a="100394606"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Oct 2020 11:57:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3A86848990FC;
 Thu, 22 Oct 2020 11:57:04 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Oct 2020 11:57:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>, <liwang@redhat.com>
Date: Thu, 22 Oct 2020 11:57:13 +0800
Message-ID: <1603339033-8451-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3A86848990FC.ABC90
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Remove ftime and sys/timeb.h
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The two case use ftime to get the current milliseconds and it was
used to generate random value. Use gettimeofday() to get the microseconds
can reach the same aim.

This also fixes the travis build error[1] on Fedora:Rawhide because the <sys/timeb.h>
has been deprecated[2].

[1] https://travis-ci.org/github/linux-test-project/ltp/jobs/737698948
[2] https://www.spinics.net/lists/fedora-devel/msg279545.html

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/mem/hugetlb/lib/hugetlb.c | 12 ++++++------
 testcases/kernel/sched/tool/trace_sched.c  |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/lib/hugetlb.c b/testcases/kernel/mem/hugetlb/lib/hugetlb.c
index 4bb2d500e..1204f21d2 100644
--- a/testcases/kernel/mem/hugetlb/lib/hugetlb.c
+++ b/testcases/kernel/mem/hugetlb/lib/hugetlb.c
@@ -35,7 +35,7 @@
 #include <sys/types.h>
 #include <sys/ipc.h>
 #include <sys/shm.h>
-#include <sys/timeb.h>
+#include <sys/time.h>
 #include <pwd.h>
 #include "hugetlb.h"
 
@@ -52,7 +52,7 @@ int getipckey(void)
 	char *curdir = NULL;
 	size_t size = 0;
 	key_t ipc_key;
-	struct timeb time_info;
+	struct timeval time_info;
 
 	curdir = getcwd(curdir, size);
 	if (curdir == NULL)
@@ -67,11 +67,11 @@ int getipckey(void)
 	 * project identifier is a "random character" produced by
 	 * generating a random number between 0 and 25 and then adding
 	 * that to the ascii value of 'a'.  The "seed" for the random
-	 * number is the millisecond value that is set in the timeb
-	 * structure after calling ftime().
+	 * number is the microseconds value that is set in the timeval
+	 * structure after calling gettimeofday().
 	 */
-	ftime(&time_info);
-	srandom((unsigned int)time_info.millitm);
+	gettimeofday(&time_info, NULL);
+	srandom((unsigned int)time_info.tv_usec);
 
 	ipc_key = ftok(curdir, ascii_a + random() % 26);
 	if (ipc_key == -1)
diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
index 71caf239a..e23fc7399 100644
--- a/testcases/kernel/sched/tool/trace_sched.c
+++ b/testcases/kernel/sched/tool/trace_sched.c
@@ -52,7 +52,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/wait.h>
-#include <sys/timeb.h>
+#include <sys/time.h>
 #include <unistd.h>
 #include <string.h>
 
@@ -199,7 +199,7 @@ void *thread_func(void *args)
 	static int sched_policy;	/* scheduling policy as set by user/default   */
 	struct sched_param ssp;	/* set schedule priority.                     */
 	struct sched_param gsp;	/* gsp schedule priority.                     */
-	struct timeb tptr;	/* tptr.millitm will be used to seed srand.   */
+	struct timeval tptr;	/* tv_usec will be used to seed srand.   */
 	thread_sched_t *locargptr =	/* local ptr to the arguments.                */
 	    (thread_sched_t *) args;
 
@@ -215,8 +215,8 @@ void *thread_func(void *args)
 		ssp.sched_priority = 0;
 	else {
 		/* Set a random value between max_priority and min_priority */
-		ftime(&tptr);
-		srand((tptr.millitm) % 1000);
+		gettimeofday(&tptr, NULL);
+		srand((tptr.tv_usec) % 1000000);
 		set_priority = (min_priority + (int)((float)max_priority
 						     * rand() / (RAND_MAX +
 								 1.0)));
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
