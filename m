Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D2A7C9E
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 09:19:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EBA03C2149
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 09:19:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8204D3C20A5
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 09:19:53 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C911114012C5
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 09:19:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="74814304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 15:19:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 242194CE14E4
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 15:19:43 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Sep 2019 15:19:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 4 Sep 2019 15:19:31 +0800
Message-ID: <1567581571-2303-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 242194CE14E4.ADEB1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/move_pages: Remove obsolete move_pages08.c
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

E2BIG was removed in 2.6.29, no one will test it with such an old
kernel. So I think we can remove this error tests.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/numa                                  |   1 -
 runtest/syscalls                              |   1 -
 .../kernel/syscalls/move_pages/.gitignore     |   1 -
 .../kernel/syscalls/move_pages/move_pages08.c | 157 ------------------
 4 files changed, 160 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/move_pages/move_pages08.c

diff --git a/runtest/numa b/runtest/numa
index 97ab5f076..7b9c2ae9d 100644
--- a/runtest/numa
+++ b/runtest/numa
@@ -9,7 +9,6 @@ move_pages04 move_pages04
 move_pages05 move_pages05
 move_pages06 move_pages06
 move_pages07 move_pages07
-move_pages08 move_pages08
 move_pages09 move_pages09
 move_pages10 move_pages10
 move_pages11 move_pages11
diff --git a/runtest/syscalls b/runtest/syscalls
index d2547b045..eb3295b9e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -718,7 +718,6 @@ move_pages04 move_pages04
 move_pages05 move_pages05
 move_pages06 move_pages06
 move_pages07 move_pages07
-move_pages08 move_pages08
 move_pages09 move_pages09
 move_pages10 move_pages10
 move_pages11 move_pages11
diff --git a/testcases/kernel/syscalls/move_pages/.gitignore b/testcases/kernel/syscalls/move_pages/.gitignore
index 419829d5f..2d1785e62 100644
--- a/testcases/kernel/syscalls/move_pages/.gitignore
+++ b/testcases/kernel/syscalls/move_pages/.gitignore
@@ -5,7 +5,6 @@
 /move_pages05
 /move_pages06
 /move_pages07
-/move_pages08
 /move_pages09
 /move_pages10
 /move_pages11
diff --git a/testcases/kernel/syscalls/move_pages/move_pages08.c b/testcases/kernel/syscalls/move_pages/move_pages08.c
deleted file mode 100644
index e1bf64b77..000000000
--- a/testcases/kernel/syscalls/move_pages/move_pages08.c
+++ /dev/null
@@ -1,157 +0,0 @@
-/*
- *   Copyright (c) 2008 Vijay Kumar B. <vijaykumar@bravegnu.org>
- *
- *   Based on testcases/kernel/syscalls/waitpid/waitpid01.c
- *   Original copyright message:
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
- *	move_pages08.c
- *
- * DESCRIPTION
- *      Failure when the no. of pages is ULONG_MAX.
- *
- * ALGORITHM
- *
- *      1. Pass ULONG_MAX pages to move_pages().
- *      2. Check if errno is set to E2BIG.
- *
- * USAGE:  <for command-line>
- *      move_pages08 [-c n] [-i n] [-I x] [-P x] [-t]
- *      where,  -c n : Run n copies concurrently.
- *              -i n : Execute test n times.
- *              -I x : Execute test for x seconds.
- *              -P x : Pause for x seconds between iterations.
- *              -t   : Turn on syscall timing.
- *
- * History
- *	05/2008 Vijay Kumar
- *		Initial Version.
- *
- * Restrictions
- *	kernel < 2.6.29
- */
-
-#include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <unistd.h>
-#include <errno.h>
-#include <limits.h>
-#include "test.h"
-#include "move_pages_support.h"
-
-#define TEST_PAGES 2
-#define TEST_NODES 2
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "move_pages08";
-int TST_TOTAL = 1;
-
-int main(int argc, char **argv)
-{
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-#ifdef HAVE_NUMA_V2
-	unsigned int i;
-	int lc;
-	unsigned int from_node;
-	unsigned int to_node;
-	int ret;
-
-	ret = get_allowed_nodes(NH_MEMS, 2, &from_node, &to_node);
-	if (ret < 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "get_allowed_nodes: %d", ret);
-
-	/* check for looping state if -i option is given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		void *pages[TEST_PAGES] = { 0 };
-		int nodes[TEST_PAGES];
-		int status[TEST_PAGES];
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		ret = alloc_pages_on_node(pages, TEST_PAGES, from_node);
-		if (ret == -1)
-			continue;
-
-		for (i = 0; i < TEST_PAGES; i++)
-			nodes[i] = to_node;
-
-		ret = numa_move_pages(0, ULONG_MAX, pages, nodes,
-				      status, MPOL_MF_MOVE);
-		if (ret == -1 && errno == E2BIG)
-			tst_resm(TPASS, "move_pages failed with "
-				 "E2BIG as expected");
-		else
-			tst_resm(TFAIL|TERRNO, "move pages did not fail "
-				 "with E2BIG ret: %d", ret);
-
-		free_pages(pages, TEST_PAGES);
-	}
-#else
-	tst_resm(TCONF, NUMA_ERROR_MSG);
-#endif
-
-	cleanup();
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-static void setup(void)
-{
-	/*
-	 * commit 3140a2273009c01c27d316f35ab76a37e105fdd8
-	 * Author: Brice Goglin <Brice.Goglin@inria.fr>
-	 * Date:   Tue Jan 6 14:38:57 2009 -0800
-	 *     mm: rework do_pages_move() to work on page_sized chunks
-	 *
-	 * reworked do_pages_move() to work by page-sized chunks and removed E2BIG
-	 */
-	if ((tst_kvercmp(2, 6, 29)) >= 0)
-		tst_brkm(TCONF, NULL, "move_pages: E2BIG was removed in "
-			 "commit 3140a227");
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	check_config(TEST_NODES);
-
-	/* Pause if that option was specified
-	 * TEST_PAUSE contains the code to fork the test with the -c option.
-	 */
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at completion
- */
-static void cleanup(void)
-{
-
-}
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
