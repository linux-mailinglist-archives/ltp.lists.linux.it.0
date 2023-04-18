Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699F6E657E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Apr 2023 15:10:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16EE53CE69C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Apr 2023 15:10:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A4F1E3C8663
 for <ltp@lists.linux.it>; Tue, 18 Apr 2023 15:10:35 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 02639200770
 for <ltp@lists.linux.it>; Tue, 18 Apr 2023 15:10:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AAC1168F
 for <ltp@lists.linux.it>; Tue, 18 Apr 2023 06:11:15 -0700 (PDT)
Received: from e126380.cambridge.arm.com (e126380.cambridge.arm.com
 [10.1.37.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11EE83F5A1
 for <ltp@lists.linux.it>; Tue, 18 Apr 2023 06:10:30 -0700 (PDT)
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
To: ltp@lists.linux.it
Date: Tue, 18 Apr 2023 14:09:46 +0100
Message-Id: <20230418130944.181716-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] setpgid02: Use pid_max as PGID for EPERM
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

In some simple systems (like Busybox), the login shell might be run
as init (PID 1).
This leads to a case where LTP is run in the same session as init,
thus setpgid is allowed to the PGID of init which results in a test fail.
Indeed, the test retrieves the PGID of init to try and generate EPERM.

Instead, get the PGID we use to generate EPERM from the kernel pid_max.
It should not be used by any process, guaranteeing a different session
and generating an EPERM error.

Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
---
See discussion on the origin of this patch (end of thread):
https://lists.linux.it/pipermail/ltp/2023-April/033505.html

Apologies for the time it took to send this.

CI Build:
https://github.com/Teo-CD/ltp/actions/runs/4732620255

 testcases/kernel/syscalls/setpgid/setpgid02.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/setpgid/setpgid02.c b/testcases/kernel/syscalls/setpgid/setpgid02.c
index 4b63afee8..5341774e1 100644
--- a/testcases/kernel/syscalls/setpgid/setpgid02.c
+++ b/testcases/kernel/syscalls/setpgid/setpgid02.c
@@ -21,7 +21,7 @@
 #include <unistd.h>
 #include "tst_test.h"
 
-static pid_t pgid, pid, ppid, init_pgid;
+static pid_t pgid, pid, ppid, inval_pgid;
 static pid_t negative_pid = -1;
 
 static struct tcase {
@@ -31,7 +31,7 @@ static struct tcase {
 } tcases[] = {
 	{&pid, &negative_pid, EINVAL},
 	{&ppid, &pgid, ESRCH},
-	{&pid, &init_pgid, EPERM}
+	{&pid, &inval_pgid, EPERM}
 };
 
 static void setup(void)
@@ -41,10 +41,10 @@ static void setup(void)
 	pgid = getpgrp();
 
 	/*
-	 * Getting pgid of init/systemd process to use it as a
-	 * process group from a different session for EPERM test
+	 * pid_max would not be in use by another process and guarantees that
+	 * it corresponds to "another session", generating EPERM.
 	 */
-	init_pgid = SAFE_GETPGID(1);
+	SAFE_FILE_SCANF("/proc/sys/kernel/pid_max", "%d\n", &inval_pgid);
 }
 
 static void run(unsigned int n)
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
