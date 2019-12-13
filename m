Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C811E4C2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 14:37:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FDC23C22BE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 14:37:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B63943C089D
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 14:37:12 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 44924602517
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 14:37:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54F0BB1F6
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 13:37:10 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Dec 2019 14:37:09 +0100
Message-Id: <20191213133709.11845-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] Make crash02 verbose in standard runfile
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

Verbose output from crash02 will be useful for actually reporting bugs
triggered by the test. With default verbosity level, it's difficult to figure
out which syscall arguments crashed the system even if you know the random seed
and can easily re-run `crash02 -xv 2` on a system that uses the same rand()
implementation.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/crashme                |  2 +-
 testcases/misc/crash/crash02.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/runtest/crashme b/runtest/crashme
index a4c5b41cc..14750749d 100644
--- a/runtest/crashme
+++ b/runtest/crashme
@@ -7,7 +7,7 @@ f00f f00f
 crash01 crash01
 # Generate random code and execute it. Read f00f comment,
 # this test lockup SunOS,WindowsNT,etc. in seconds..
-crash02 crash02
+crash02 crash02 -v 2
 # Generate random syscalls and execute them, less probability
 # to hose your system, but still.
 mem01 mem01 -r
diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
index 00fee3493..29d05f82e 100644
--- a/testcases/misc/crash/crash02.c
+++ b/testcases/misc/crash/crash02.c
@@ -430,13 +430,12 @@ void try_one_crash(int try_num)
 	arg6 = rand_long();
 	arg7 = rand_long();
 
-	if (x_opt) {
-		if (verbose_level >= 1)
-			printf("%04d: syscall(%ld, %#lx, %#lx, %#lx, %#lx, "
-			       "%#lx, %#lx, %#lx)\n",
-			       try_num, sysno, arg1, arg2, arg3, arg4, arg5,
-			       arg6, arg7);
-	} else {
+	if (verbose_level >= 1)
+		printf("%04d: syscall(%ld, %#lx, %#lx, %#lx, %#lx, %#lx, "
+		       "%#lx, %#lx)\n", try_num, sysno, arg1, arg2, arg3,
+		       arg4, arg5, arg6, arg7);
+
+	if (!x_opt) {
 		syscall(sysno, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
 		record_errno(errno);
 	}
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
