Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24129EE27
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 15:27:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981383C3138
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 15:27:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 598CE3C23B8
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 15:27:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E07EF640487
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 15:27:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CAE8AC1F
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 14:27:06 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 29 Oct 2020 15:27:43 +0100
Message-Id: <20201029142743.11871-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] openposix: Fix two test failures
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

Two testcases started to fail after the patch that added static modifier
to all global varibles. The cause was simple in these tests a variable
is changed in a signal handler while the value is used in a conditional
in the main loop. This code was incorrect to begin with, but the global
visibility avoided compiler optimizations to assume anything about the
variable value so it wasn't optimized out. Because of that it started to
fail only as a side efect of the patch.

The fix is also simple, all variables changed asynchrounously from a
signal handler has to be volatile.

Fixes: 8c22a59107dc (openposix: add "static" to all global variables and functions)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../conformance/interfaces/pthread_atfork/3-3.c                 | 2 +-
 .../open_posix_testsuite/conformance/interfaces/sigqueue/5-1.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork/3-3.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork/3-3.c
index d34f5706f..2a3d6c47c 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork/3-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork/3-3.c
@@ -77,7 +77,7 @@
 /*****************************    Test case   *********************************/
 /******************************************************************************/
 
-static char do_it = 1;
+static volatile char do_it = 1;
 static unsigned long count_ope = 0;
 #ifdef WITH_SYNCHRO
 static sem_t semsig1;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigqueue/5-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigqueue/5-1.c
index 3ca4b663c..a38897086 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigqueue/5-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigqueue/5-1.c
@@ -29,7 +29,7 @@
 #include <errno.h>
 #include "posixtest.h"
 
-static int counter = 0;
+static volatile int counter = 0;
 
 static void myhandler(int signo LTP_ATTRIBUTE_UNUSED)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
