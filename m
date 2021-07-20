Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6C3CFABF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 181CA3C6EED
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3770F3C81AA
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:16 +0200 (CEST)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B79681A0071E
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:15 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id h4so29825858ljo.6
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibeGvSrLn7XPYRiXN7+68fcFqG9+CcHOcdJZkI1WCQA=;
 b=n2bpDZNHQUgmpqTUUiHxuV5W958GatVCMlG5wVf9jJE9LtamgMUlc3EP7J5xF/oStQ
 GDUx/hLU2gmi0ANM0iSqdIwfXZkjNBi8N02uTOrJiX9HWL9oNPIao3aZ4gymnkeFIRS2
 mlO6+qQGk0ulUKcTxEhFCMUy6v5Vda+jiCeUFiyW54SREVgfjb9u8obscm0Qx/F1lzXG
 YM6jjY/ygepHb/krKhucCMqD8cNbDPSxLKm4WbM59l5I6rsqow1A30RKzxGgSXXcOcZ5
 gzd+gn7LTqy2oemns318+TFoT6jx7a0YnOz7Sbmwcu0Ig1r/Rv8cMsjk9gVv0ZECKLlB
 hQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibeGvSrLn7XPYRiXN7+68fcFqG9+CcHOcdJZkI1WCQA=;
 b=bA9xVci5AwDNhDBEMMdsXITh/l2y4yKqLpn9sQiBlKQ5Io1NGq2D+7IohEUg2Z9Te/
 ER+8skNcy5eRzR8cVIyH6j/qetSV5bexKatWRSRtI7E4ASPyk78m1K00GWLo4rqGV2eh
 u9LHqFiShPcmASin5Nr2hCZmuHgQ5QokBcBK88WMToZwqdIUQ2tdGUB3bjP2QvafWYpT
 ROmtPMjtxA6dD4WiCjhqcuE5DH7AxgJoZM1iJ8TtsQRpzaMtNRFapknSmNOVr8QwJL4h
 s+lqw8Al/vGI1XVIFMIfJc//O/cCqwFtm3BrGLs3puVcQAWXzEiBCziihtK17S2QVs+q
 Qg0w==
X-Gm-Message-State: AOAM531wKW/SdsSmwb52mOKfb59/57ZAANCnLu6MaSF+sppxTtW7FmJw
 zkBjLIVoF1lWMjXwq/WorYDx6L95jGfU
X-Google-Smtp-Source: ABdhPJz8ndYwzSShXoOyDxAlP5xcgMh6qBH1NX23fV1qpeHIjmusVd4pKSkJRVpLB6Pkajcs4ASDKg==
X-Received: by 2002:a2e:a809:: with SMTP id l9mr26032511ljq.302.1626788055006; 
 Tue, 20 Jul 2021 06:34:15 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:14 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:21 +0300
Message-Id: <20210720133324.21752-14-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 13/16] syscalls/sched_setscheduler02: convert to new
 API
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
 .../sched_setscheduler/sched_setscheduler02.c | 154 ++++--------------
 1 file changed, 33 insertions(+), 121 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
index 36952d9cb..68afb05c9 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
@@ -1,148 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
+ * Copyright (c) International Business Machines  Corp., 2001
  */
 
-/*
- * NAME
- *	sched_setscheduler01.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	Testcase to test whether sched_setscheduler(2) sets the errnos
- *	correctly.
+ * Testcase to test whether sched_setscheduler(2) sets the errnos
+ * correctly.
  *
- * ALGORITHM
- *	1.	Call sched_setscheduler as a non-root uid, and expect EPERM
- *	to be returned.
+ * [Algorithm]
  *
- * USAGE:  <for command-line>
- *  sched_setscheduler02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Call sched_setscheduler as a non-root uid, and expect EPERM
+ * to be returned.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	Must run test as root.
  */
-#include <stdio.h>
+
+#include <stdlib.h>
 #include <errno.h>
-#include <sched.h>
 #include <pwd.h>
 #include <sys/types.h>
-#include <sys/wait.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "tst_sched.h"
 
 #define SCHED_INVALID	99
 #define INVALID_PID	999999
 
-char *TCID = "sched_setscheduler02";
-int TST_TOTAL = 1;
-
-void setup(void);
-void cleanup(void);
-
 static uid_t nobody_uid;
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-	pid_t pid;
-	struct sched_param param;
-	int status;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		if ((pid = FORK_OR_VFORK()) == -1) {
-			tst_brkm(TBROK, cleanup, "fork failed");
-		}
-
-		if (pid == 0) {	/* child */
-			param.sched_priority = 1;
-
-			SAFE_SETEUID(cleanup, nobody_uid);
-
-			TEST(sched_setscheduler(pid, SCHED_FIFO, &param));
-
-			if (TEST_ERRNO) {
-			}
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "sched_setscheduler(2) passed "
-					 "with non root priveledges");
-			} else if (TEST_ERRNO != EPERM) {
-				tst_resm(TFAIL, "Expected EPERM, got %d",
-					 TEST_ERRNO);
-			} else {
-				tst_resm(TPASS, "got EPERM");
-			}
-		} else {	/* parent */
-			/* let the child carry on */
-			wait(&status);
-			if (WIFEXITED(status) != 0) {	/* Exit with errors */
-				exit(WEXITSTATUS(status));
-			} else {
-				exit(0);
-			}
-		}
-
-		SAFE_SETEUID(cleanup, 0);
-	}
-	cleanup();
-	tst_exit();
+	struct passwd *pw = SAFE_GETPWNAM("nobody");
 
+	nobody_uid = pw->pw_uid;
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void run(void)
 {
-	struct passwd *pw;
-
-	tst_require_root();
+	pid_t pid = SAFE_FORK();
 
-	pw = SAFE_GETPWNAM(NULL, "nobody");
-	nobody_uid = pw->pw_uid;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	if (!pid) {
+		struct sched_param p = { .sched_priority = 1 };
 
-	TEST_PAUSE;
+		SAFE_SETEUID(nobody_uid);
+		TST_EXP_FAIL(tst_sched_setscheduler(0, SCHED_FIFO, &p), EPERM);
+		SAFE_SETEUID(0);
+		exit(0);
+	}
+	tst_reap_children();
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.forks_child = 1,
+	.needs_root = 1,
+	.setup = setup,
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
