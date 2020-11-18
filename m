Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA82B7E94
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 14:51:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88AC43C5A14
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 14:51:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5C5EE3C25DB
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 14:51:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DD40610005A4
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 14:51:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5578EAC90;
 Wed, 18 Nov 2020 13:51:17 +0000 (UTC)
Date: Wed, 18 Nov 2020 14:52:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201118135206.GA5216@yuki.lan>
References: <4b831a20278083623bce96f9c4171b6cff9c4e46.1605698312.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b831a20278083623bce96f9c4171b6cff9c4e46.1605698312.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: select: Add test to verify clearing of
 fd sets
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with minor changes, thanks.

- moved the code that enables the bits to the run() function
  so that the test actually checks the condition on -i 2

- shortened the timeout so that the test runs fast enough

- formatted the top level comment properly, since we merged the docparse
  patchset special comments are exported into the generated documentation


Full diff:

diff --git a/testcases/kernel/syscalls/select/select04.c b/testcases/kernel/syscalls/select/select04.c
index 8106dea8b..dd042562d 100644
--- a/testcases/kernel/syscalls/select/select04.c
+++ b/testcases/kernel/syscalls/select/select04.c
@@ -2,10 +2,18 @@
 /*
  * Copyright (c) 2020 Linaro Limited. All rights reserved.
  * Author: Viresh Kumar <viresh.kumar@linaro.org>
- *
- * Test to check if fd sets are cleared by select() or not.
  */
 
+/*\
+ * [DESCRIPTION]
+ *
+ * Test to check if fd set bits are cleared by select().
+ *
+ * [ALGORITHM]
+ *  - Check that writefds flag is cleared on full pipe
+ *  - Check that readfds flag is cleared on empty pipe
+\*/
+
 #include <unistd.h>
 #include <errno.h>
 #include <sys/time.h>
@@ -29,12 +37,12 @@ static struct tcases {
 static void run(unsigned int n)
 {
 	struct tcases *tc = &tests[n];
-	struct timeval timeout;
+	struct timeval timeout = {.tv_sec = 0, .tv_usec = 1000};
 
-	timeout.tv_sec = 0;
-	timeout.tv_usec = 100000;
+	FD_SET(fd_empty[0], &readfds_pipe);
+	FD_SET(fd_full[1], &writefds_pipe);
 
-	TEST(do_select(*tc->fd + 1, tc->readfds, tc->writefds, 0, &timeout));
+	TEST(do_select(*tc->fd + 1, tc->readfds, tc->writefds, NULL, &timeout));
 
 	if (TST_RET) {
 		tst_res(TFAIL, "%s: select() should have timed out", tc->desc);
@@ -58,11 +66,9 @@ static void setup(void)
 
 	SAFE_PIPE(fd_empty);
 	FD_ZERO(&readfds_pipe);
-	FD_SET(fd_empty[0], &readfds_pipe);
 
 	SAFE_PIPE2(fd_full, O_NONBLOCK);
 	FD_ZERO(&writefds_pipe);
-	FD_SET(fd_full[1], &writefds_pipe);
 
 	/* Make the write buffer full for fd_full */
 	do {

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
