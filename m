Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADE360B21
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:56:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EE113C7030
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:56:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3FAE3C608A
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:56:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A87841000B52
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:56:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C63E2AFAB;
 Thu, 15 Apr 2021 13:56:37 +0000 (UTC)
Date: Thu, 15 Apr 2021 15:46:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YHhDurTlljhXAKL9@yuki>
References: <20210413043844.5612-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413043844.5612-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> ---
> changes v2->v3:
> * fix bugs found by Cyril (use !num_writes, !SAFE_FORK(), break if !TST_RET)
> 
> BTW I'm still not sure if break on !TST_RET is needed, but it does not
> harm. If you really like it, I can use while (!TST_RET).

I meant that we could simplify the test with:

diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
index fd71f2995..1b566a2f4 100644
--- a/testcases/kernel/syscalls/splice/splice02.c
+++ b/testcases/kernel/syscalls/splice/splice02.c
@@ -54,18 +54,13 @@ static void do_child(void)
 
 	fd = SAFE_OPEN(TEST_FILENAME, O_WRONLY | O_CREAT | O_TRUNC, 0644);
 
-	while (to_write > 0) {
+	do {
 		TEST(splice(STDIN_FILENO, NULL, fd, NULL, WRITE_SIZE, 0));
-		tst_res(TINFO, "splice() wrote %ld, remaining %d", TST_RET, to_write);
 		if (TST_RET < 0) {
 			tst_res(TFAIL | TTERRNO, "splice failed");
 			goto cleanup;
-		} else if (!TST_RET) {
-			break;
-		} else {
-			to_write -= TST_RET;
 		}
-	}
+	} while (TST_RET > 0);
 
 	stat(TEST_FILENAME, &st);
 	if (st.st_size != num_writes) {
@@ -100,10 +95,10 @@ static void run(void)
 	for (i = 0; i < num_writes; i++)
 		SAFE_WRITE(1, pipe_fd[1], "x", 1);
 
-	tst_reap_children();
-
 	SAFE_CLOSE(pipe_fd[0]);
 	SAFE_CLOSE(pipe_fd[1]);
+
+	tst_reap_children();
 }
 
 static struct tst_test test = {


If you close the pipe in the parent before reaping children the last
splice() will return 0 and exit the loop. No need to count anything.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
