Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C56523E2E89
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77D723CAA88
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:49:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 032B23CA400
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2B8DF601491
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id bq29so19176585lfb.5
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11MbPF0y2a4SqSvxym5sKtrrm/kvXCwABhZBA6ggg9A=;
 b=nxwjVhVWaaZYNXuUGeOFW3l+zl+zRtihAuu9tKBAf4Ml95sECYAduqzuRj6/lAc0aT
 j3YwjbGdE7TdECUXGawfMmjm2XOglsKRud9h53+uosmFI31UdmEpOIakljNLo8+zP0Y8
 kSS1+nRhQyxhOYLw4On7US7EhjyocSUgDgEvJw6FSWJqIeAMPxETAo1Rmx0UJ9RdE+DL
 CefdU/JxjwhioF9tM5ZZGlJjI+IXD2gwX4q1On9Xu8TyfidCl897a+Wcy9KGHwZOgq+p
 oDhVehuSW+Pyp48j6j1jBl4I947au1AeTgksPllIj9n8KPuGDUaytk/BrRyF2x8ODgbv
 D90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11MbPF0y2a4SqSvxym5sKtrrm/kvXCwABhZBA6ggg9A=;
 b=A27HP2E4Mcrhie2CAL8TPBQgD/yCwuK3YUeM4v7Lzbkp0lSHRTtHJ7cQ1et11rsGKl
 HAhd7/Gy5teQwKNeH7Z9AD3gqEJw4kQEpQmIr0uAIWqcINTssiORgjhQh7n3QmELSMMo
 qrKGdd42KyEIfrFZnqBYqpliTOFzRSZuM+rbc7FVEqlHOiO5NdfjH3PX8qRcpwNtRA8a
 4nvGLrFPjrBu8pjknsr+a/7OwFSN8SyG8yxNeUtM5ccgJV91XbOjwqufJSHU6S+nuiFW
 6ip7xoGKDZ9rhUV7TlEDtr/vO0ITLQpmGqoWRTs0AhklvvGCg68pWW89Q1BioKE9P0Dm
 zwIQ==
X-Gm-Message-State: AOAM533G2fQ082xuFxsjqRLFzxHH5HmY0Bq1Pawi3Rtx8D4PNPv4iHC6
 VFAVnbMT4HncjaZy75kX/a4f9CGUF8/A
X-Google-Smtp-Source: ABdhPJyK9ingFwP8Olor/BkZAUx7gsofH0FFaogBnBLH6NHnGi15Emqm0Gu9asgTF7E9TfQKzv9YuQ==
X-Received: by 2002:a19:6b06:: with SMTP id d6mr8253172lfa.183.1628268485421; 
 Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:05 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:22 +0300
Message-Id: <20210806164730.51040-9-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 08/16] syscalls/sched_setparam05: convert to new API
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

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 .../sched_setparam/sched_setparam05.c         | 192 ++++--------------
 1 file changed, 36 insertions(+), 156 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
index 53db641d7..c6c9d9bdd 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
@@ -1,176 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * AUTHOR: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_setparam05
- *
- *    EXECUTED BY	: root/superuser
- *
- *    TEST TITLE	: verify that sched_setparam() fails if the user does
- *			  not have proper privilages
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that sched_setparam() fails if the user does
- *	not have proper privilages
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 Fork a child
- *
- *	 CHILD:
- *	  Changes euid to "nobody" user.
- *	  Try to Change scheduling priority for parent
- *	  If call failed with errno = EPERM,
- *		Test passed
- *	  else
- *		Test failed
- *
- *	 PARENT:
- *		wait for child to finish
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  sched_setparam05 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+
+/*\
+ * [Description]
  *
- ****************************************************************/
+ * Verify that sched_setparam() fails if the user does not have proper
+ * privileges.
+ */
 
-#include <errno.h>
-#include <sched.h>
+#include <stdlib.h>
 #include <pwd.h>
-#include <sys/wait.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
 
-char *TCID = "sched_setparam05";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "tst_sched.h"
 
-static struct sched_param param = { 0 };
+static struct sched_variants variants[] = {
+	{ .sched_setparam = libc_sched_setparam, .desc = "libc" },
+	{ .sched_setparam = sys_sched_setparam,  .desc = "syscall" },
+};
 
-static char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-int main(int ac, char **av)
+static void run(void)
 {
+	struct sched_variants *tv = &variants[tst_variant];
+	pid_t child_pid = SAFE_FORK();
 
-	int lc;
-	int status;
-	pid_t child_pid;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		switch (child_pid = FORK_OR_VFORK()) {
-
-		case -1:
-			/* fork() failed */
-			tst_resm(TFAIL, "fork() failed");
-			continue;
-
-		case 0:
-			/* Child */
-
-			/* Switch to nobody user */
-			if ((ltpuser = getpwnam(nobody_uid)) == NULL) {
-				tst_brkm(TBROK, NULL, "'%s' user not present", nobody_uid);
-			}
-			if (seteuid(ltpuser->pw_uid) == -1) {
-				tst_resm(TWARN, "seteuid failed to to set the effective uid to %d",
-					 ltpuser->pw_uid);
-				exit(1);
-			}
-
-			/*
-			 * Call sched_setparam(2) with pid = getppid()
-			 */
-			TEST(sched_setparam(getppid(), &param));
+	if (!child_pid) {
+		struct sched_param p = { .sched_priority = 0 };
+		struct passwd *pw = SAFE_GETPWNAM("nobody");
 
-			if ((TEST_RETURN == -1) && (TEST_ERRNO == EPERM)) {
-				exit(0);
-			}
+		SAFE_SETEUID(pw->pw_uid);
+		TST_EXP_FAIL(tv->sched_setparam(getppid(), &p), EPERM,
+			     "sched_setparam(%d, 0)", getppid());
 
-			tst_resm(TWARN | TTERRNO,
-				 "Test failed, sched_setparam()"
-				 " returned : %ld", TEST_RETURN);
-			exit(1);
-
-		default:
-			/* Parent */
-			if ((waitpid(child_pid, &status, 0)) < 0) {
-				tst_resm(TFAIL, "wait() failed");
-				continue;
-			}
-			if ((WIFEXITED(status)) && (WEXITSTATUS(status) == 0)) {
-				tst_resm(TPASS, "Test passed, Got EPERM");
-			} else {
-				tst_resm(TFAIL, "Test Failed");
-			}
-		}
+		exit(0);
 	}
 
-	cleanup();
-	tst_exit();
+	tst_reap_children();
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.forks_child = 1,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
