Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45344241B58
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4C573C313D
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9ACA33C1CB2
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 01411601101
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C80EB040
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 13:05:25 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 15:05:02 +0200
Message-Id: <20200811130502.12010-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200811130502.12010-1-mdoucha@suse.cz>
References: <20200811130502.12010-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] Add taint check to syscalls/ptrace08
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

The test may pass on some kernels despite triggering a kernel segfault. Check
for kernel taint just in case.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/ptrace/ptrace08.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace08.c b/testcases/kernel/syscalls/ptrace/ptrace08.c
index 448bc72e3..591aa0dd2 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace08.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace08.c
@@ -48,7 +48,8 @@ static void setup(void)
 
 		if (fcount < 2) {
 			fclose(fr);
-			tst_brk(TBROK, "Unexpected data in /proc/kallsyms %d", fcount);
+			tst_brk(TBROK, "Unexpected data in /proc/kallsyms %d",
+				fcount);
 		}
 
 		if (fcount >= 3 && endl != '\n')
@@ -89,9 +90,8 @@ static void run(void)
 
 	child = child_pid = SAFE_FORK();
 
-	if (!child_pid) {
+	if (!child_pid)
 		child_main();
-	}
 
 	if (SAFE_WAITPID(child_pid, &status, WUNTRACED) != child_pid)
 		tst_brk(TBROK, "Received event from unexpected PID");
@@ -133,6 +133,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.forks_child = 1,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f67b15037a7a"},
 		{"CVE", "2018-1000199"},
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
