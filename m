Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C023753B0
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:17:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D05E3C71B6
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:17:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92C1A3C5688
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:17:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4DC48601C6B
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:17:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAE46B16C
 for <ltp@lists.linux.it>; Thu,  6 May 2021 12:17:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 May 2021 13:51:08 +0200
Message-Id: <20210506115108.16751-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls: modify_ldt02: Fix failure
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

The test was wrong to begin with, if we want to get SEGFAULT from the
waitpid() we cannot setup a handler that catches it and exits with 0.

Fixes: f5e8e6b11ce8 ("syscalls/modify_ldt: Replace TINFO with TPASS or TFAIL")
Reported-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/modify_ldt/modify_ldt02.c     | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
index e34d3d54d..f911aa5fd 100644
--- a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
+++ b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
@@ -120,6 +120,7 @@ int main(int ac, char **av)
 
 		tst_old_flush();
 		if ((pid = FORK_OR_VFORK()) == 0) {
+			signal(SIGSEGV, SIG_DFL);
 			val = read_segment(0);
 			exit(1);
 		}
@@ -168,24 +169,10 @@ int read_segment(unsigned int index)
 	return res;
 }
 
-void sigsegv_handler(int sig)
-{
-	tst_resm(TINFO, "received signal: %d", sig);
-	exit(0);
-}
-
 void setup(void)
 {
-	struct sigaction act;
-
-	memset(&act, 0, sizeof(act));
-	sigemptyset(&act.sa_mask);
-
 	tst_sig(FORK, DEF_HANDLER, cleanup);
 
-	act.sa_handler = sigsegv_handler;
-	(void)sigaction(SIGSEGV, &act, NULL);
-
 	TEST_PAUSE;
 }
 
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
