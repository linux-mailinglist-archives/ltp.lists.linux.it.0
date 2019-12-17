Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A21229F7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 12:28:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B51853C1D76
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 12:28:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D6B713C038C
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 12:28:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58134201154
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 12:28:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0BDC3B01E
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:28:32 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Tue, 17 Dec 2019 12:28:32 +0100
Message-Id: <20191217112832.12478-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213164847.GA18822@dell5510>
References: <20191213164847.GA18822@dell5510>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Make crash02 verbose in standard runfile
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
Changes in v2: Bring -x implementation in line with usage description.

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
index 00fee3493..cddedc102 100644
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
+	if (x_opt || verbose_level >= 1)
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
