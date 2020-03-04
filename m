Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B3179304
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:12:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BA0E3C6614
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:12:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EFE783C6603
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:12:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A7CB602205
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:12:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 414BCB2E0
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 15:12:07 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2020 16:12:01 +0100
Message-Id: <20200304151201.19117-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304151201.19117-1-pvorel@suse.cz>
References: <20200304151201.19117-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] timerfd: Use safe macros
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

SAFE_TIMERFD_CREATE() and SAFE_TIMERFD_SETTIME()

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Safe functions will be used also in other timerfd related tests once
they're migrated to new C API.

Kind regards,
Petr

 testcases/kernel/syscalls/timerfd/timerfd01.c        |  9 +++------
 .../kernel/syscalls/timerfd/timerfd_settime02.c      | 12 ++----------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/timerfd/timerfd01.c b/testcases/kernel/syscalls/timerfd/timerfd01.c
index af19b4399..7bbde7283 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd01.c
@@ -19,7 +19,7 @@
 #include <poll.h>
 #include "tst_test.h"
 #include "tst_timer.h"
-#include "lapi/timerfd.h"
+#include "tst_safe_timerfd.h"
 
 static struct tcase {
 	int id;
@@ -47,8 +47,7 @@ static void settime(int tfd, struct itimerspec *tmr, int tflags,
 	tmr->it_value = tst_us_to_timespec(tvalue);
 	tmr->it_interval = tst_us_to_timespec(tinterval);
 
-	if (timerfd_settime(tfd, tflags, tmr, NULL))
-		tst_brk(TBROK | TERRNO, "timerfd_settime() failed");
+	SAFE_TIMERFD_SETTIME(tfd, tflags, tmr, NULL);
 }
 
 static void waittmr(int tfd, unsigned int exp_ticks)
@@ -87,9 +86,7 @@ static void run(unsigned int n)
 
 	tst_res(TINFO, "testing %s", clks->name);
 
-	tfd = timerfd_create(clks->id, 0);
-	if (tfd == -1)
-		tst_brk(TFAIL | TERRNO, "timerfd_create() failed");
+	tfd = SAFE_TIMERFD_CREATE(clks->id, 0);
 
 	tst_res(TINFO, "relative timer (100 ms)");
 	settime(tfd, &tmr, 0, 100 * 1000, 0);
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
index 7fa26de62..0565802f4 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
@@ -15,7 +15,7 @@
  *  timerfd: Protect the might cancel mechanism proper
  */
 #include <unistd.h>
-#include <lapi/timerfd.h>
+#include "tst_safe_timerfd.h"
 #include "tst_test.h"
 #include "tst_fuzzy_sync.h"
 #include "tst_taint.h"
@@ -32,16 +32,8 @@ static struct tst_fzsync_pair fzsync_pair;
 
 static void setup(void)
 {
-	int ttype;
-
 	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
-	errno = 0;
-	fd = timerfd_create(CLOCK_REALTIME, 0);
-
-	if (fd < 0) {
-		ttype = (errno == ENOTSUP ? TCONF : TBROK);
-		tst_brk(ttype | TERRNO, "Cannot create timer");
-	}
+	fd = SAFE_TIMERFD_CREATE(CLOCK_REALTIME, 0);
 
 	fzsync_pair.exec_loops = 1000000;
 	tst_fzsync_pair_init(&fzsync_pair);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
