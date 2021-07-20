Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F16143CFAB3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 901093C9843
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:35:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D2163C981A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 29E0B1A00CA3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id r16so31070418ljk.9
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4ZsajDHjosqWgJmpXSvQ67041FpaVQeb0v/na85pJw=;
 b=2IrdyKzyaq6S0wrebMilZ/DaKlqKRYmNYYHlMRTb1/uu95WJPS6qb18I+0riY6Dtj8
 cDND8fUXLDT6xMFZO3YLuOqc/QhHMjMBfsjCxbBBwd2xzLQh719+73QtiniScGOjjts3
 KDZ2BohIwR1RNSL3sxaDyEk65a2fsHkTWUrJYZHqBFNiCkBduZFwjojJipGR9k4aqgtC
 wirDwOLfDsORklzDGSPjoWJEIKKh1Df5i0tFRGO+To+AYKJVYpksB/fp9ujW8lfJVd9k
 soSFyC+9V7mLgXCV6GYiBNLdhty+RZlZo/3VTM8ZxQTFnyGvppQOF7AkF4f+crDtOvts
 /0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4ZsajDHjosqWgJmpXSvQ67041FpaVQeb0v/na85pJw=;
 b=dEKPnzLQjWND1MX4pmOEK7p/mHDotlLlhxsvJwwcFfNZp7HiC+qdo920yk52lDqvYl
 +yQ/czgMMhrtD7MiEItPUAhm8xBGcn3ivueMvb5ytp9onIVeshzHRMYGiSYj6sK7lW6N
 up8Kd+8Ziz3KIVe19Zu6iFoAeC/G8mXUBHlpjKbeX8LG7hhBrem76xYcC2VZXly2m36d
 xz89ewVq7mSGCoY6U4fs9FF2lV6WV57OBfibmYSSwAjA65PTzMBQhU0HuVCea277S1VA
 m84cDF+3Tc1t6odtxrFEXJjzaUucm6nRaZvusyhXl1f/Ta+lfk9/LX7HbM151RONgGh9
 FGGw==
X-Gm-Message-State: AOAM533h7aphuhB3ZQi00RmNBL22VzpHRitqrWNidY6rHB14co0MXW3j
 fKlcx/rpsZ6m+4UwCyB9YULc2mb8Enfx
X-Google-Smtp-Source: ABdhPJynz4Sh7i5Kgpv922rOZPJ+OG7HEnkSOcR5e4hhSwB+weH3T6WbFT9VaOsjALcSKdANG7Ux1A==
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr27362615lji.111.1626788051432; 
 Tue, 20 Jul 2021 06:34:11 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:11 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:16 +0300
Message-Id: <20210720133324.21752-9-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 08/16] syscalls/sched_setparam05: convert to new API
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
 .../sched_setparam/sched_setparam05.c         | 186 +++---------------
 1 file changed, 26 insertions(+), 160 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
index 53db641d7..36d7c4123 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam05.c
@@ -1,176 +1,42 @@
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
-
-char *TCID = "sched_setparam05";
-int TST_TOTAL = 1;
-
-static struct sched_param param = { 0 };
 
-static char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+#include "tst_test.h"
+#include "tst_sched.h"
 
-int main(int ac, char **av)
+static void run(void)
 {
+	pid_t child_pid = SAFE_FORK();
 
-	int lc;
-	int status;
-	pid_t child_pid;
+	if (!child_pid) {
+		struct sched_param p = { .sched_priority = 0 };
+		struct passwd *pw = SAFE_GETPWNAM("nobody");
 
-	tst_parse_opts(ac, av, NULL, NULL);
+		SAFE_SETEUID(pw->pw_uid);
+		TST_EXP_FAIL(tst_sched_setparam(getppid(), &p), EPERM);
 
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
-
-			if ((TEST_RETURN == -1) && (TEST_ERRNO == EPERM)) {
-				exit(0);
-			}
-
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
-{
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
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
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
