Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 724BE22B6F6
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 21:51:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15F983C2655
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 21:51:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 443043C1CB6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 21:51:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B42D1A00F43
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 21:51:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 153C4AB89
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 19:52:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Jul 2020 21:52:15 +0200
Message-Id: <20200723195215.6351-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] syscalls/futex_wait03: Fix synchronization
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

When I was reviewing changes in the test I noticed that the
synchronization was never working as the getppid() returns the test
library pid and not the thread that we should wait for.

So this fixes the test by passing the correct pid casted to a void* as
a parameter to the threaded function.

It seems that in practice this cannot be triggered easily, but the
test without this fix fails easily when you insert bussy loop
such as "for (volatile int i = 0; i < 1000000000; i++);" between
the SAFE_PTHRED() and the futex_wait() call.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/futex/futex_wait03.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/futex/futex_wait03.c b/testcases/kernel/syscalls/futex/futex_wait03.c
index e6e94055b..3e3a7ce23 100644
--- a/testcases/kernel/syscalls/futex/futex_wait03.c
+++ b/testcases/kernel/syscalls/futex/futex_wait03.c
@@ -26,12 +26,12 @@ static struct test_variants {
 #endif
 };
 
-static void *threaded(void *arg LTP_ATTRIBUTE_UNUSED)
+static void *threaded(void *arg)
 {
 	struct test_variants *tv = &variants[tst_variant];
-	long ret;
+	long ret, pid = (long)arg;
 
-	TST_PROCESS_STATE_WAIT(getppid(), 'S', 0);
+	TST_PROCESS_STATE_WAIT(pid, 'S', 0);
 
 	ret = futex_wake(tv->fntype, &futex, 1, FUTEX_PRIVATE_FLAG);
 	if (ret != 1)
@@ -43,10 +43,10 @@ static void *threaded(void *arg LTP_ATTRIBUTE_UNUSED)
 static void run(void)
 {
 	struct test_variants *tv = &variants[tst_variant];
-	long res;
+	long res, pid = getpid();
 	pthread_t t;
 
-	SAFE_PTHREAD_CREATE(&t, NULL, threaded, NULL);
+	SAFE_PTHREAD_CREATE(&t, NULL, threaded, (void*)pid);
 
 	res = futex_wait(tv->fntype, &futex, futex, NULL, FUTEX_PRIVATE_FLAG);
 	if (res) {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
