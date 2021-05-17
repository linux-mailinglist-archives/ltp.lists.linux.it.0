Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B33839ED
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:30:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA7A73C5638
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:30:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A5853C19F0
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 992FB14001E6
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wa/lwiTcup8vWCMcCn/puAu/X2NswTPn/EVUiZzJB0=;
 b=aAMiMxb0lZzZiukZb8LSwK1GUJRk4cTgNaoN7TDWEILkzL1bAHxtS83EJiCkBc3DiqmbF5
 44MP98WDjx9jKFY8uq5XSDCtDZRHTB5e0H4ZzMcjtrLgOpHU29RjyHrR2VM1BcUdYocKZ3
 CikPNpP5xbskIX2HxpXYxVOr4fwe2eA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34A0FB279;
 Mon, 17 May 2021 16:30:39 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:25 +0100
Message-Id: <20210517163029.22974-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/6] API: Add tst_ to create_sig_proc
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_sig_proc.h                         |  2 +-
 lib/tst_sig_proc.c                             |  2 +-
 libs/libltpsigwait/sigwait.c                   | 18 +++++++++---------
 .../clock_nanosleep/clock_nanosleep01.c        |  2 +-
 testcases/kernel/syscalls/ppoll/ppoll01.c      |  4 ++--
 testcases/kernel/syscalls/utils/mq_timed.h     |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/tst_sig_proc.h b/include/tst_sig_proc.h
index b85981e77..39a201037 100644
--- a/include/tst_sig_proc.h
+++ b/include/tst_sig_proc.h
@@ -7,6 +7,6 @@
 
 #include <sys/types.h>
 
-pid_t create_sig_proc(int sig, int count, unsigned int usec);
+pid_t tst_create_sig_proc(int sig, int count, unsigned int usec);
 
 #endif	/* TST_SIG_PROC_H__ */
diff --git a/lib/tst_sig_proc.c b/lib/tst_sig_proc.c
index 509418af4..4826f9679 100644
--- a/lib/tst_sig_proc.c
+++ b/lib/tst_sig_proc.c
@@ -11,7 +11,7 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 
-pid_t create_sig_proc(int sig, int count, unsigned int usec)
+pid_t tst_create_sig_proc(int sig, int count, unsigned int usec)
 {
 	pid_t pid, cpid;
 
diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
index 2be949929..aa8ef226d 100644
--- a/libs/libltpsigwait/sigwait.c
+++ b/libs/libltpsigwait/sigwait.c
@@ -19,7 +19,7 @@ void test_empty_set(swi_func sigwaitinfo, int signo,
 	SAFE_SIGEMPTYSET(&sigs);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, INT_MAX, 100000);
+	child = tst_create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	if (TST_RET == -1) {
@@ -49,7 +49,7 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
 	SAFE_SIGEMPTYSET(&sigs);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, INT_MAX, 100000);
+	child = tst_create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, tst_ts_get(&ts)));
 	if (TST_RET == -1) {
@@ -79,7 +79,7 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
 	SAFE_SIGADDSET(&sigs, signo);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, INT_MAX, 100000);
+	child = tst_create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	if (TST_RET == signo) {
@@ -106,7 +106,7 @@ void test_unmasked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	SAFE_SIGADDSET(&sigs, signo);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, INT_MAX, 100000);
+	child = tst_create_sig_proc(signo, INT_MAX, 100000);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
 	if (TST_RET == signo)
@@ -139,7 +139,7 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
 	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, 1, 0);
+	child = tst_create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, &si, NULL));
 	if (TST_RET == signo) {
@@ -191,8 +191,8 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
 	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child[0] = create_sig_proc(signo, 1, 0);
-	child[1] = create_sig_proc(signo + 1, 1, 0);
+	child[0] = tst_create_sig_proc(signo, 1, 0);
+	child[1] = tst_create_sig_proc(signo + 1, 1, 0);
 
 	/* Ensure that the signals have been sent */
 	SAFE_WAITPID(child[0], &status, 0);
@@ -252,7 +252,7 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
 	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, 1, 0);
+	child = tst_create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, NULL, NULL));
 	if (TST_RET == signo)
@@ -294,7 +294,7 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
 	SAFE_SIGDELSET(&sigs, SIGCHLD);
 
 	/* Run a child that will wake us up */
-	child = create_sig_proc(signo, 1, 0);
+	child = tst_create_sig_proc(signo, 1, 0);
 
 	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
 	if (TST_RET == -1) {
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 382497918..983dfe1ad 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -139,7 +139,7 @@ static void do_test(unsigned int i)
 	tst_res(TINFO, "case %s", tc->desc);
 
 	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
-		pid = create_sig_proc(SIGINT, 40, 500000);
+		pid = tst_create_sig_proc(SIGINT, 40, 500000);
 
 	tst_ts_set_sec(rq, tc->tv_sec);
 	tst_ts_set_nsec(rq, tc->tv_nsec);
diff --git a/testcases/kernel/syscalls/ppoll/ppoll01.c b/testcases/kernel/syscalls/ppoll/ppoll01.c
index 3d2f92f2a..3ea155445 100644
--- a/testcases/kernel/syscalls/ppoll/ppoll01.c
+++ b/testcases/kernel/syscalls/ppoll/ppoll01.c
@@ -251,8 +251,8 @@ static void do_test(unsigned int i)
 			tst_brk(TBROK, "sigprocmask");
 	}
 	if (tc->sigint_count > 0) {
-		pid = create_sig_proc(SIGINT, tc->sigint_count,
-			tc->sigint_delay);
+		pid = tst_create_sig_proc(SIGINT, tc->sigint_count,
+					  tc->sigint_delay);
 	}
 
 	/* test */
diff --git a/testcases/kernel/syscalls/utils/mq_timed.h b/testcases/kernel/syscalls/utils/mq_timed.h
index adf46034b..84831b548 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -45,7 +45,7 @@ static pid_t set_sig(struct tst_ts *ts,
 	gettime(CLOCK_REALTIME, tst_ts_get(ts));
 	*ts = tst_ts_add_us(*ts, 3000000);
 
-	return create_sig_proc(SIGINT, 40, 50000);
+	return tst_create_sig_proc(SIGINT, 40, 50000);
 }
 
 static void set_timeout(struct tst_ts *ts,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
