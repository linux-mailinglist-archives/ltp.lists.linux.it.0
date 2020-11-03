Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3022A4613
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:17:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD6AD3C3026
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:17:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E6EA83C301A
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:17:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 67EF7601091
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:17:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C96C4ADCF
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 13:17:30 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 14:18:13 +0100
Message-Id: <20201103131813.9098-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] openposix: Fix another three failures
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

This is a continuation of:

commit 38cc030092a54067a9f08dea0173a0d032a15820
Author: Cyril Hrubis <chrubis@suse.cz>
Date:   Thu Oct 29 15:16:30 2020 +0100

    openposix: Fix two test failures

Where I missed three more testcases that depended on variable being
changed from a different thread or signal handler.

Fixes: 8c22a59107dc (openposix: add "static" to all global variables and functions)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../conformance/interfaces/pthread_setschedparam/5-1.c          | 2 +-
 .../conformance/interfaces/pthread_sigmask/18-1.c               | 2 +-
 .../conformance/interfaces/sem_unlink/9-1.c                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam/5-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam/5-1.c
index 52b7ff629..db155d033 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam/5-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam/5-1.c
@@ -76,7 +76,7 @@
 /*****************************    Test case   *********************************/
 /******************************************************************************/
 
-static char do_it = 1;
+static volatile char do_it = 1;
 static unsigned long count_ope = 0;
 #ifdef WITH_SYNCHRO
 static sem_t semsig1;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask/18-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask/18-1.c
index 0617210bf..7e2906c7d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask/18-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask/18-1.c
@@ -75,7 +75,7 @@
 /***********************************    Test cases  *****************************************/
 /********************************************************************************************/
 
-static char do_it = 1;
+static volatile char do_it = 1;
 static unsigned long count_ope = 0;
 #ifdef WITH_SYNCHRO
 static sem_t semsig1;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/9-1.c
index 288f1224f..24a575ff9 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/9-1.c
@@ -82,7 +82,7 @@
 /******************************************************************************/
 /***************************    Test case   ***********************************/
 /******************************************************************************/
-static int thread_state = 0;
+static int volatile thread_state = 0;
 
 static void *threaded(void *arg)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
