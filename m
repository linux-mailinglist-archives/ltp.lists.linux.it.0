Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F811068F0
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:40:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A8953C2380
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 10:40:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 218713C224B
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:40:08 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 676101028300
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 10:40:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC1E6AC84
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 09:40:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Nov 2019 10:40:00 +0100
Message-Id: <20191122094000.8799-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Fix TBROK usage in timer tests
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

timer_delete01, timer_settime01 and timer_settime02 incorrectly use
tst_res(TBROK, ...). Change it to tst_res(TFAIL, ...)

Also check errno for ENOTSUP and use tst_res(TCONF, ...) when the tested
functionality is not supported by kernel, including in timer_create01.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/syscalls/timer_create/timer_create01.c      |  3 +--
 .../kernel/syscalls/timer_delete/timer_delete01.c      |  8 ++++----
 .../kernel/syscalls/timer_settime/timer_settime01.c    | 10 +++++-----
 .../kernel/syscalls/timer_settime/timer_settime02.c    |  8 ++++----
 4 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_create/timer_create01.c b/testcases/kernel/syscalls/timer_create/timer_create01.c
index b03d184dd..1cb9a9fdc 100644
--- a/testcases/kernel/syscalls/timer_create/timer_create01.c
+++ b/testcases/kernel/syscalls/timer_create/timer_create01.c
@@ -82,8 +82,7 @@ static void run(unsigned int n)
 		if (TST_RET != 0) {
 			if (possibly_unsupported(clock) &&
 			    (TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
-				tst_res(TPASS | TTERRNO,
-					"%s unsupported, failed as expected",
+				tst_res(TCONF | TTERRNO, "%s unsupported",
 					get_clock_str(clock));
 			} else {
 				tst_res(TFAIL | TTERRNO,
diff --git a/testcases/kernel/syscalls/timer_delete/timer_delete01.c b/testcases/kernel/syscalls/timer_delete/timer_delete01.c
index 16e50ccec..962eb5670 100644
--- a/testcases/kernel/syscalls/timer_delete/timer_delete01.c
+++ b/testcases/kernel/syscalls/timer_delete/timer_delete01.c
@@ -37,12 +37,12 @@ static void run(void)
 
 		TEST(tst_syscall(__NR_timer_create, clock, NULL, &timer_id));
 		if (TST_RET != 0) {
-			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
-				tst_res(TPASS | TTERRNO,
-					"%s unsupported, failed as expected",
+			if (possibly_unsupported(clock) &&
+				(TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
+				tst_res(TCONF | TTERRNO, "%s unsupported",
 					get_clock_str(clock));
 			} else {
-				tst_res(TBROK | TTERRNO,
+				tst_res(TFAIL | TTERRNO,
 					"Aborting test - timer_create(%s) failed",
 					get_clock_str(clock));
 			}
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index fc1cf86a6..7bf00f527 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -60,12 +60,12 @@ static void run(unsigned int n)
 
 		TEST(tst_syscall(__NR_timer_create, clock, NULL, &timer));
 		if (TST_RET != 0) {
-			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
-				tst_res(TPASS | TTERRNO,
-					"%s unsupported, failed as expected",
+			if (possibly_unsupported(clock) &&
+				(TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
+				tst_res(TCONF | TTERRNO, "%s unsupported",
 					get_clock_str(clock));
 			} else {
-				tst_res(TBROK | TTERRNO,
+				tst_res(TFAIL | TTERRNO,
 					"timer_create(%s) failed",
 					get_clock_str(clock));
 			}
@@ -80,7 +80,7 @@ static void run(unsigned int n)
 
 		if (tc->flag & TIMER_ABSTIME) {
 			if (clock_gettime(clock, &timenow) < 0) {
-				tst_res(TBROK,
+				tst_res(TFAIL,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
 				continue;
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index 9b410a399..74cb33d73 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -73,12 +73,12 @@ static void run(unsigned int n)
 		/* Init temporary timer */
 		TEST(tst_syscall(__NR_timer_create, clock, NULL, &timer));
 		if (TST_RET != 0) {
-			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
-				tst_res(TPASS | TTERRNO,
-					"%s unsupported, failed as expected",
+			if (possibly_unsupported(clock) &&
+				(TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
+				tst_res(TCONF | TTERRNO, "%s unsupported",
 					get_clock_str(clock));
 			} else {
-				tst_res(TBROK | TTERRNO,
+				tst_res(TFAIL | TTERRNO,
 					"timer_create(%s) failed",
 					get_clock_str(clock));
 			}
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
