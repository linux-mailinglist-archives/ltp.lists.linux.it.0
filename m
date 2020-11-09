Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7642AB840
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:30:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DB603C0888
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:30:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5F9C53C0888
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:30:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B50F8600C1F
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:30:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E488DABF4
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 12:30:03 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  9 Nov 2020 13:30:49 +0100
Message-Id: <20201109123049.13421-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] openposix: Fix (hopefully) last two
 failures
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

Hopefully this is a last two, but there may be more cases where we
haven't hit compiler optimization triggering the bug yet.

Fixes: 8c22a59107dc (openposix: add "static" to all global variables and functions)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../conformance/interfaces/pthread_kill/8-1.c                   | 2 +-
 .../open_posix_testsuite/conformance/interfaces/sigwait/6-1.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill/8-1.c
index f71c02c93..bc0138bd5 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill/8-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill/8-1.c
@@ -75,7 +75,7 @@
 /***********************************    Test cases  *****************************************/
 /********************************************************************************************/
 
-static char do_it = 1;
+static volatile char do_it = 1;
 static unsigned long count_ope = 0;
 #ifdef WITH_SYNCHRO
 static sem_t semsig1;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigwait/6-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigwait/6-1.c
index 826eb2776..3b9004635 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigwait/6-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigwait/6-1.c
@@ -81,7 +81,7 @@
 /***************************    Test case   ***********************************/
 /******************************************************************************/
 
-static int n_awaken = 0;
+static volatile int n_awaken = 0;
 static sigset_t setusr;
 
 /* Thread function */
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
