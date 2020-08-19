Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55188249B54
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 13:04:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECD5B3C584C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 13:04:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CB7113C0515
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 13:04:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2D432200753
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 13:04:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C04D0AC65
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 11:04:34 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Aug 2020 13:04:06 +0200
Message-Id: <20200819110406.25099-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Taint check: Use TFAIL instead of TBROK in
 fork_testrun()
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 doc/test-writing-guidelines.txt | 6 +++---
 lib/tst_test.c                  | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index b2265a778..252e91ffc 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1567,9 +1567,9 @@ the test.
 
 LTP library will then automatically check kernel taint at the end of testing.
 If '.all_filesystems' is set in struct tst_test, taint check will be performed
-after each file system and testing may be aborted early by 'TBROK'. You can
-optionally also call 'tst_taint_check()' during 'run()', which returns 0 or
-the tainted flags set in '/proc/sys/kernel/tainted' as specified earlier.
+after each file system and taint will abort testing early with 'TFAIL'. You
+can optionally also call 'tst_taint_check()' during 'run()', which returns 0
+or the tainted flags set in '/proc/sys/kernel/tainted' as specified earlier.
 
 Depending on your kernel version, not all tainted-flags will be supported.
 
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 3a37f61ca..28f8843cf 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1282,8 +1282,10 @@ static int fork_testrun(void)
 	alarm(0);
 	SAFE_SIGNAL(SIGINT, SIG_DFL);
 
-	if (tst_test->taint_check && tst_taint_check())
-		tst_brk(TBROK, "Kernel is now tainted.");
+	if (tst_test->taint_check && tst_taint_check()) {
+		tst_res(TFAIL, "Kernel is now tainted.");
+		return TFAIL;
+	}
 
 	if (WIFEXITED(status) && WEXITSTATUS(status))
 		return WEXITSTATUS(status);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
